#include "gen_asm.hpp"
#include "BasicBlock.hpp"
#include "Function.hpp"
#include "GlobalValue.hpp"
#include "Instructions.hpp"
#include "LinearRegAllocator.hpp"
#include "MFunction.hpp"
#include "defines.hpp"
#include "regarch.hpp"
#include "type.hpp"
#include "utils.hpp"
#include <cinttypes>
#include <filesystem>
#include <iostream>
#include <string>

namespace backend {

void ASMGen::translate_func(IR::Function* func) {

#ifdef DEBUG
        std::cerr << info << "Translating function: " << func->get_name() << "\n" ;
#endif
    auto fname = func->get_func_name();
    auto frt = func->get_return_type();
    auto fptys = func->get_params_type();
    auto fpns = func->get_func_p_names();
    auto mfunc = this->abuilder->create_m_func(fname, frt, fptys, fpns);

    this->mctx->set_function(mfunc);
    // this->mctx->get_module()->addfuncs(mfunc);
    // 先把基本块翻译过去，跳转指令要用到地址， 后面逐个翻译基本块不用创建了，直接从map中找地址
    int max_bb_idx = 0;
    for(auto ibb : func->get_bbs()) {
        max_bb_idx = std::max(max_bb_idx, ibb->get_bb_idx());
        this->abuilder->create_m_basicblock(ibb->get_bb_idx()) ;
    }
    // after created normal bbs , then create 2 special bb prologue_bb epilogue_bb
    auto prolo_bb = new MachineBasicBlock(this->get_new_bb_idx());
    auto epil_bb = new MachineBasicBlock(this->get_new_bb_idx());
    this->mctx->get_function()->set_prologue_bb(prolo_bb);
    this->mctx->get_function()->set_epilogue_bb(epil_bb);

    // 分析参数、收集局部变量的 alloca，函数参数 也是alloca的，对于一个右n个参数的函数，前n个alloca instr就算形参数
    // 在没有分配寄存器之前，无法确定的是spill的寄存器的个数，
    // 哪些用保存寄存器（生命跨过函数的），哪些用临时寄存器
   // std::cout << "==========================================================\n";
    // std::cout << "In Func " << fname << std::endl; 
    // 计算函数内部声明所需要的空间
    int sum_lss = 0;
    for(auto ai : func->get_allocas()) {
        int size;
        auto aty = ai->get_type();
        if(!aty->is_ptr()) {
            if(aty->is_array()) {
                size = aty->nr_elems() * 4;
            } else {
                size = 4;
            }
        } else {
            size = 8;
        }
        sum_lss += size;
        // add the bias 
#ifdef DEBUG
        std::cerr << info << "Add symbol : " << ai->get_name() << "\n" ;
#endif
        this->mctx->get_function()->add_symbol(ai->get_name(), -16-sum_lss);
        // std::cout << ai->to_str() << ";  Size : " << size << std::endl;
    }
    if(sum_lss % 8 != 0) {
#ifdef DEBUG
        std::cerr << warn << "sum_lss is " << sum_lss; 
#endif
        sum_lss = ((sum_lss/8)+1)*8;
#ifdef DEBUG
        std::cerr << " exist not 8 byte align fixed it to" << sum_lss <<  "\n";
#endif
    }
    this->mctx->get_function()->local_variable_size = sum_lss;
    this->mctx->get_function()->set_stack_size(16+sum_lss);
    // std::cout << "LA use " << sum_lss << std::endl;
    // std::cout << "==========================================================\n";

    // dfs to translate the basic block 
    // regenerate the cfg 
    func->get_cfg()->regen_cfg();
    int entry_idx = func->get_entry_bb()->get_bb_idx();

    mfunc->next_bb[prolo_bb->_bb_idx].insert(entry_idx);
    mfunc->prev_bb[entry_idx].insert(prolo_bb->_bb_idx);

    std::stack<int> next_bb_idx;
    // set the logical entry 
    auto ebb = this->mctx->get_function()->get_mbb(entry_idx);
    this->mctx->get_function()->entry_bb = ebb;
    next_bb_idx.push(entry_idx);
    std::map<int, bool> visited;
    while(!next_bb_idx.empty()) {
        int bi = next_bb_idx.top();
        next_bb_idx.pop();
        for(auto next_idx : func->get_cfg()->succ_bb[bi]) {
            if(!visited[next_idx]) next_bb_idx.push(next_idx);
        }
        // translate the bb
        if(!visited[bi]) {
            translate_bb(func->get_cfg()->idx2bb[bi]);
            visited[bi] = true;
        }
        // std::cerr << "Translate bb " << bi << std::endl; 
    }
    // after translate, the immerged params are know 
    // TODO reg alloca 
    RegAllocator *regallo = new RegAllocator(mfunc);
    mfunc->allocator = regallo;

    regallo->live_interval_analysis();
#ifdef SHOW_INST_TIME
    regallo->plot_reg_interval();
#endif
    regallo->alloca_regs();
    
    // after reg allocas 
    int ssz = this->mctx->get_function()->get_stack_size();
#ifdef DEBUG
    std::cerr << info << "In function : " << fname << "\n";
    std::cerr << info << "Stack size : " << ssz << "\n";
    std::cerr << info << "For used sx size : " << this->mctx->get_function()->allocator->used_S_x.size() * 8 << "\n";
    std::cerr << info << "For used fx size : " << this->mctx->get_function()->allocator->used_FS_x.size() * 8 << "\n";
    std::cerr << info << "For spill regs size : " << this->mctx->get_function()->allocator->max_spill_size_cnt << "\n";
#endif
    ssz += regallo->used_S_x.size() * 8;
    ssz += regallo->used_FS_x.size() * 8;
    ssz += this->mctx->get_function()->overflow_arguments * 8;
    ssz += this->mctx->get_function()->allocator->max_spill_size_cnt;
    this->mctx->get_function()->set_stack_size(ssz + 8);      // 多的这个8个是0(sp)
    int sz = this->mctx->get_function()->get_stack_size();
    if(sz % 16 != 0) {
#ifdef DEBUG
        std::cerr << warn << "stack size is : " << sz << ", Not 16 align, ";
#endif
        sz = ((sz / 16) + 1) * 16;
#ifdef DEBUG
        std::cerr << "Change it to " << sz << "\n";
#endif
    }
    this->mctx->get_function()->set_stack_size(sz);      // 多的这个8个是0(sp)
#ifdef DEBUG
    std::cerr << info << "The sum is : " << this->mctx->get_function()->get_stack_size() << "\n";
#endif
    
    // gen prologue and epilogue
    this->gen_prolo_epil(this->mctx->get_function(), func);
    this->mctx->set_function(nullptr);
}

void ASMGen::translate_bb(IR::BasicBlock* bb) {
    // get the basic block that 
    int bb_idx = bb->get_bb_idx();
    auto mbb = this->mctx->get_function()->get_mbb(bb_idx);
    this->mctx->set_basic_block(mbb);

    // translate the ir instr to asm 
    //
    for(auto instr : bb->get_intrs()) {
        if(auto alloca = dynamic_cast<IR::AllocaInst*>(instr)) {
            continue;  // handled in function translation
        } else if(auto load = dynamic_cast<IR::LoadInst*>(instr)) {
            // is gv ? is alloca ? is getelementptr
            auto isrc = load->get_src();
            if(auto gv = dynamic_cast<IR::GlobalValue*>(isrc)) {
                // 是全局符号，是 gp fp OR ARRAY?
                RiscvReg::Reg dst_addr = new RiscvReg::Reg(get_new_vreg_idx());
                RiscvReg::Reg dst ;
                abuilder->create_LA(dst_addr, gv->get_symbol());
                if(gv->get_type().base_type == Int) {
                    dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                    abuilder->create_LW(dst, dst_addr, 0);
                } else {
                    dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
                    abuilder->create_FLW(dst, dst_addr, 0);
                }
                this->mctx->get_function()->add_reg_mp(load, dst);
            } else if(auto lv = dynamic_cast<IR::AllocaInst*>(isrc)) {
                // alloca 分配局部变量 包括常量和数组， 如果是常量
                auto src_addr = lv->get_name();
                // alloca type 
                auto aty = lv->get_type();
                RiscvReg::Reg dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                if(aty->is_array()) {
                    // 数组的取值读得经过gep , 不用管
                } else {
                    // this is saclar type 
                    if(aty->base_type == Int) {
                        RiscvReg::Reg dst = new RiscvReg::Reg(get_new_vreg_idx(), false, true);
                        int32_t of = this->mctx->get_function()->get_symbol_bias(src_addr);
                        // need to check of is out of range 
                        if( of > 2047 || of < -2048 ) {
                            RiscvReg::Reg offset_dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
                            abuilder->create_LI(offset_dst, of);
                            RiscvReg::Reg true_src = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
                            abuilder->create_ADD(true_src, RiscvReg::FP, offset_dst);
                            abuilder->create_LW(dst, true_src, 0);
                        } else {
                            abuilder->create_LW(dst, RiscvReg::FP, of);
                        }
                        this->mctx->get_function()->add_reg_mp(load, dst);
                    } else {
                        RiscvReg::Reg dst = new RiscvReg::Reg(get_new_vreg_idx(), false, false);
                        // get offset 
                        int32_t of = this->mctx->get_function()->get_symbol_bias(src_addr);
                        // abuilder->create_FLW(dst, RiscvReg::FP, of);
                        if( of > 2047 || of < -2048 ) {
                            RiscvReg::Reg offset_dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
                            abuilder->create_LI(offset_dst, of);
                            RiscvReg::Reg true_src = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
                            abuilder->create_ADD(true_src, RiscvReg::FP, offset_dst);
                            abuilder->create_FLW(dst, true_src, 0);
                        } else {
                            abuilder->create_FLW(dst, RiscvReg::FP, of);
                        }
                        this->mctx->get_function()->add_reg_mp(load, dst);
                    }
                    
                }
            } else if(auto fgep = dynamic_cast<IR::GetElementPtrInst*>(isrc)) {
                // 已经知道了 base AND bias
                auto gep_ty = fgep->get_type()->base_type;
                auto addr_reg = this->mctx->get_function()->get_reg(fgep);
                // new reg according to the base type of fgep
                RiscvReg::Reg dst;
                if(gep_ty == Int) {
                    dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                    abuilder->create_LW(dst, addr_reg, 0);
                } else {
                    dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
                    abuilder->create_FLW(dst, addr_reg, 0);
                }
                
                this->mctx->get_function()->add_reg_mp(load, dst);
            }             
        } else if(auto store = dynamic_cast<IR::StoreInst*>(instr)) {

//          store 的来源有哪些？ stroe的目的的有哪些？（注：这里的store指的是ir的store指令）
//              源：
//                  1. 常量
//                  2. 寄存器
//              目的的：
//                  1. 局部变量
//                  2. 全局变量
//                  3. gep来的地址
            auto src = store->get_src();
            auto src_ty = src->get_type();
            auto dst = store->get_dst();

            RiscvReg::Reg src_reg, dst_reg;

            // 处理源
            if(auto cv = dynamic_cast<IR::ConstantValue*>(src)) {
                int const_v = cv->get_value().iv;
                src_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                abuilder->create_LI(src_reg, const_v);
            } else {
                src_reg = this->mctx->get_function()->get_reg(src);
            }

            if(auto alloca_addr = dynamic_cast<IR::AllocaInst*>(dst)) {
                auto sym = alloca_addr->get_name();
                auto stack_offset = this->mctx->get_function()->get_symbol_bias(sym);
                if(stack_offset > 2047 || stack_offset < -2048) {
                    dst_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                    abuilder->create_LI(dst_reg, stack_offset);
                    abuilder->create_ADD(dst_reg, RiscvReg::FP, dst_reg);
                    // store 不用管类型，拿出来的时候要注意
                    if(src_reg.is_gp()) {
                        abuilder->create_SW(src_reg, dst_reg, 0);
                    } else {
                        abuilder->create_FSW(src_reg, dst_reg, 0);
                    }
                } else {
                    if(src_reg.is_gp()) {
                        abuilder->create_SW(src_reg, RiscvReg::FP, stack_offset);
                    } else {
                        abuilder->create_FSW(src_reg, RiscvReg::FP, stack_offset);
                    }
                }
            } else if(auto gep_addr = dynamic_cast<IR::GetElementPtrInst*>(dst)) {
                dst_reg = this->mctx->get_function()->get_reg(gep_addr);
                // abuilder->create_SW(src_reg, dst_reg, 0);
                if(src_reg.is_gp()) {
                    abuilder->create_SW(src_reg, dst_reg, 0);
                } else {
                    abuilder->create_FSW(src_reg, dst_reg, 0);
                }
            } else if(auto gv_addr = dynamic_cast<IR::GlobalValue*>(dst)) {
                auto sym = gv_addr->get_symbol();
                dst_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                abuilder->create_LA(dst_reg, sym);
                if(src_reg.is_gp()) {
                    abuilder->create_SW(src_reg, dst_reg, 0);
                } else {
                    abuilder->create_FSW(src_reg, dst_reg, 0);
                }
            }
        } else if(auto binary = dynamic_cast<IR::BinaryInst*>(instr)) {
            translate_binary(binary);
        } else if(auto convert = dynamic_cast<IR::ConvertInst*>(instr)) {
            auto from_ty = convert->getsrc_type();
            auto to_ty = convert->getdst_type();
            auto src = convert->getsrc();
            // what src can from val or const
            RiscvReg::Reg src_reg;
            if(auto iscv = dynamic_cast<IR::ConstantValue*>(src)) {
                int cv = iscv->get_value().iv;
                if(iscv->get_type()->base_type == Float) {
                    src_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);         // the fp reg 
                    auto  t_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
                    abuilder->create_LI(t_reg, cv);
                    abuilder->create_FMV_W_X(src_reg, t_reg);
                } else {
                    src_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                    abuilder->create_LI(src_reg, cv);
                }
            } else {
                src_reg = this->mctx->get_function()->get_reg(src);
            }
            RiscvReg::Reg dst_reg;
            if(from_ty->base_type == to_ty->base_type) {
                // 保险，不可能到这
                dst_reg = src_reg; 
            } else {
                if(from_ty->base_type == Int) {
                    dst_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
                    abuilder->create_FCVT_S_W(dst_reg, src_reg);
                } else if(from_ty->base_type == Float) {
                    dst_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
                    abuilder->create_FCVT_W_S(dst_reg, src_reg);
                }
            }
            this->mctx->get_function()->add_reg_mp(convert, dst_reg);
        } else if(auto call = dynamic_cast<IR::CallInst*>(instr)) {
            // 返回值不管怎么样先放到一个虚拟寄存器中 a0 or fa0
            // TODO tone of things
            // gp cnt, fp cnt, 前8个放，超出的不管是啥都放的8位，多的根据sp向上偏移8位8位的加
            // count the overflow arguments , and maintain the maximun
            //
            // func call 的实参可能来自哪里？
            //      1. 常数
            //      2. load -> reg  
            //      3. gep --> 是个指针
            //      4. Alloca   
            //          4.1 base type
            //          4.2 array type --> 也是个指针
            //      4. reg 
            auto called_func = call->get_func();
            auto ret_ty = called_func->get_return_type();
            auto args_value = call->get_args();
            
            auto func_name = called_func->get_func_name();

            MachineFunction* mfunc;
            if(!this->mctx->get_module()->has_func(func_name)) {
                // maybe lib 
                if(this->mctx->get_module()->_name2lib_m_func.find(func_name) != this->mctx->get_module()->_name2lib_m_func.end())  {
                    mfunc = this->mctx->get_module()->_name2lib_m_func[func_name];
                }
                if(this->mctx->get_module()->_name2lib_func.find(func_name) != this->mctx->get_module()->_name2lib_func.end()) {
                    auto lib_func = this->mctx->get_module()->_name2lib_func[func_name];
                    auto args_type = lib_func->get_params_type();
                    auto pnames = lib_func->get_func_p_names();
                    mfunc = new MachineFunction(this->mctx->get_module(), func_name, ret_ty, args_type , pnames);
                    this->mctx->get_module()->_name2lib_m_func[func_name] = mfunc;
                }
            } else {
                mfunc = this->get_cur_module()->get_func(func_name);
            }
            int nr_args = args_value.size();

            int gp_cnt = 0;
            int fp_cnt = 0;
            int ovfl_arg_regs = 1;

            for(int i=0; i<nr_args; i++) {
                auto val_i = args_value[i];
                auto ty_val_i = args_value[i]->get_type();

                // 从alloca来的， 必定是数组指针
                if(auto arr_ptr = dynamic_cast<IR::AllocaInst*>(val_i)){
                    // from alloca 
                    // calculate the address 
                    auto sym = arr_ptr->get_name();
                    int stack_offset = this->mctx->get_function()->get_symbol_bias(sym);
                    RiscvReg::Reg dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                    if(stack_offset > 2047 || stack_offset < -2048) {
                        abuilder->create_LI(dst, stack_offset);
                        abuilder->create_ADD(dst, dst, RiscvReg::FP);
                    } else {
                        abuilder->create_ADDI(dst, RiscvReg::FP, stack_offset);
                    }
                    // TODO 还得看源头是不是存的指针
                    //      是指针的话，拿地址，不是，就是地址
                    if(arr_ptr->get_type()->is_ptr()) {
                        abuilder->create_LD(dst, dst, 0);
                    }

                    if(gp_cnt < 8) {
                        abuilder->create_MV(RiscvReg::regs_arg[gp_cnt], dst);
                    } else {
                        int sp_bias = ovfl_arg_regs * 8;
                        // RiscvReg::Reg dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                        if(sp_bias > 2047 || sp_bias < -2048) {
                            // abuilder->create_ADDI(dst, RiscvReg::SP, fp_bias);
                            RiscvReg::Reg sp_bias_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                            abuilder->create_LI(sp_bias_reg, sp_bias);
                            abuilder->create_ADD(sp_bias_reg, sp_bias_reg, RiscvReg::SP);
                            abuilder->create_SD(dst, sp_bias_reg, 0);
                        } else {
                            abuilder->create_SD(dst,RiscvReg::SP, sp_bias);
                        }
                        ovfl_arg_regs++;
                    }

                    gp_cnt++;
                } else if(auto rgep = dynamic_cast<IR::GetElementPtrInst*>(val_i)) {
                    // from gep
                    RiscvReg::Reg dst = this->mctx->get_function()->get_reg(rgep);

                    if(gp_cnt < 8) {
                        abuilder->create_MV(RiscvReg::regs_arg[gp_cnt], dst);
                    } else {
                        int sp_bias = ovfl_arg_regs * 8;
                        // RiscvReg::Reg dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                        if(sp_bias > 2047 || sp_bias < -2048) {
                            // abuilder->create_ADDI(dst, RiscvReg::SP, fp_bias);
                            RiscvReg::Reg sp_bias_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                            abuilder->create_LI(sp_bias_reg, sp_bias);
                            abuilder->create_ADD(sp_bias_reg, sp_bias_reg, RiscvReg::SP);
                            abuilder->create_SD(dst, sp_bias_reg, 0);
                        } else {
                            abuilder->create_SD(dst,RiscvReg::SP, sp_bias);
                        }
                        ovfl_arg_regs++;
                    }

                    gp_cnt++;
                }else if(auto global_addr = dynamic_cast<IR::GlobalValue*>(val_i)) { 
                    // 来自全局的数组的地址
                    RiscvReg::Reg dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                    abuilder->create_LA(dst, global_addr->get_symbol());
                    

                    if(gp_cnt < 8) {
                        abuilder->create_MV(RiscvReg::regs_arg[gp_cnt], dst);
                    } else {
                        int sp_bias = ovfl_arg_regs * 8;
                        // RiscvReg::Reg dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                        if(sp_bias > 2047 || sp_bias < -2048) {
                            // abuilder->create_ADDI(dst, RiscvReg::SP, fp_bias);
                            RiscvReg::Reg sp_bias_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                            abuilder->create_LI(sp_bias_reg, sp_bias);
                            abuilder->create_ADD(sp_bias_reg, sp_bias_reg, RiscvReg::SP);
                            abuilder->create_SD(dst, sp_bias_reg, 0);
                        } else {
                            abuilder->create_SD(dst,RiscvReg::SP, sp_bias);
                        }
                        ovfl_arg_regs++;
                    }


                    gp_cnt++;
                } else {
                    // is base type
                    // TODO for const value
                    RiscvReg::Reg dst;
                    if(auto const_val_i = dynamic_cast<IR::ConstantValue*>(val_i) ) {
                        int const_v_i = const_val_i->get_value().iv;
                        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                        abuilder->create_LI(dst, const_v_i);
                    } else {
                        dst = this->mctx->get_function()->get_reg(val_i);
                    }
                    if(ty_val_i->base_type == Int) {
                        if(gp_cnt < 8) {
                            abuilder->create_MV(RiscvReg::regs_arg[gp_cnt], dst);
                        } else {
                            int sp_bias = ovfl_arg_regs * 8;
                            // RiscvReg::Reg dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                            if(sp_bias > 2047 || sp_bias < -2048) {
                                // abuilder->create_ADDI(dst, RiscvReg::SP, fp_bias);
                                RiscvReg::Reg sp_bias_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                                abuilder->create_LI(sp_bias_reg, sp_bias);
                                abuilder->create_ADD(sp_bias_reg, sp_bias_reg, RiscvReg::SP);
                                abuilder->create_SW(dst, sp_bias_reg, 0);
                            } else {
                                abuilder->create_SW(dst,RiscvReg::SP, sp_bias);
                            }
                            ovfl_arg_regs++;
                        }
                        gp_cnt++;
                    }else {
                        if(fp_cnt < 8) {
                            if(dst.is_gp()) {
                                abuilder->create_FMV_W_X(RiscvReg::fp_regs_arg[fp_cnt], dst);
                            } else {
                                abuilder->create_FMV_S(RiscvReg::fp_regs_arg[fp_cnt], dst);
                            }
                        } else {
                            int sp_bias = ovfl_arg_regs * 8;
                            // RiscvReg::Reg dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                            if(sp_bias > 2047 || sp_bias < -2048) {
                                // abuilder->create_ADDI(dst, RiscvReg::SP, fp_bias);

                                if(dst.is_gp()) {
                                    abuilder->create_SW(dst,RiscvReg::SP, sp_bias);
                                } else {
                                    abuilder->create_FSW(dst,RiscvReg::SP, sp_bias);
                                }
                            } else {
                                RiscvReg::Reg sp_bias_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                                abuilder->create_LI(sp_bias_reg, sp_bias);
                                abuilder->create_ADD(sp_bias_reg, sp_bias_reg, RiscvReg::SP);
                                // 避免
                                if(dst.is_gp()) {
                                    abuilder->create_SW(dst, sp_bias_reg, 0);
                                } else {
                                    abuilder->create_FSW(dst, sp_bias_reg, 0);
                                }

                            }
                            ovfl_arg_regs++;
                        }
                        fp_cnt++;
                    }
                }
            }
            // 统计需要给超出的参数预留的栈空间
            this->mctx->get_function()->overflow_arguments = std::max(this->mctx->get_function()->overflow_arguments, ovfl_arg_regs);

            abuilder->create_CALL(mfunc);
            if(ret_ty->base_type != Void) {
                RiscvReg::Reg func_rv;
                if(ret_ty->base_type == Int) {
                    func_rv = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
                    abuilder->create_MV(func_rv, RiscvReg::A0);
                } else {
                    func_rv = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
                    abuilder->create_FMV_S(func_rv, RiscvReg::FP10);
                }
                this->mctx->get_function()->add_reg_mp(call, func_rv);
            }

        } else if(auto gep = dynamic_cast<IR::GetElementPtrInst*>(instr)) {
            // 翻译成 add 指令
            // 还要考虑全局的
            auto base_addr = gep->get_src();
            Value* src = gep->get_indices()[0];
            std::string sym = gep->get_src()->get_name();
            // the base 
            RiscvReg::Reg dst;
            if(auto ga = dynamic_cast<IR::GlobalValue*>(base_addr)) {
                // from gv
                std::string gv_sym = ga->get_symbol();
                RiscvReg::Reg gv_addr = new RiscvReg::Reg(this->get_new_vreg_idx());
                abuilder->create_LLA(gv_addr, gv_sym);

                dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                // the bias imm or reg 
                if(auto imm = dynamic_cast<IR::ConstantValue*>(src)) {
                    // the bias
                    int bias = imm->get_value().iv * 4;
                    if( bias > 2047 || bias < -2048 ) {
                        RiscvReg::Reg offset_dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
                        abuilder->create_LI(offset_dst, bias);
                        abuilder->create_ADD(dst, gv_addr, offset_dst);
                    } else {
                        abuilder->create_ADDI(dst, gv_addr, bias);
                    }
                    this->mctx->get_function()->add_reg_mp(gep, dst);
                } else {
                    // idx 不是立即数
                    // get the bais from reg 
                    auto bias_reg = this->mctx->get_function()->get_reg(src);
                    // bias * 4 bias << 2
                    abuilder->create_SLLI(bias_reg, bias_reg, 2);
                    abuilder->create_ADD(dst, gv_addr, bias_reg);
                    this->mctx->get_function()->add_reg_mp(gep, dst);
                }

            } else if(auto laddr = dynamic_cast<IR::AllocaInst*>(base_addr)) {
                // from local
                // TODO 还要看src是不是ptr type
                int stack_offset = this->mctx->get_function()->get_symbol_bias(sym);
                // RiscvReg::Reg base_addr_reg = this->mctx->get_function()->get_reg(src);

                dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                if(!laddr->get_type()->is_ptr()) {
                    // check is imm 
                    if(auto imm = dynamic_cast<IR::ConstantValue*>(src)) {
                        // the bias
                        int bias = stack_offset + (imm->get_value().iv << 2);
                        // 计算指针存的地方，然后再把指针取出来
                        if( bias > 2047 || bias < -2048 ) {
                            RiscvReg::Reg offset_dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
                            abuilder->create_LI(offset_dst, bias);
                            abuilder->create_ADD(dst, RiscvReg::FP, offset_dst);
                            // abuilder->create_LD(dst, dst, 0);
                        } else {
                            abuilder->create_ADDI(dst, RiscvReg::FP, bias);
                            // abuilder->create_LD(dst, dst, 0);
                        }
                        this->mctx->get_function()->add_reg_mp(gep, dst);
                    } else {
                        // idx is not const
                        auto bias_reg = this->mctx->get_function()->get_reg(src);
                        abuilder->create_SLLI(bias_reg, bias_reg, 2);
                        if(stack_offset > 2047 || stack_offset  < -2048) {
                            auto base_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                            abuilder->create_LI(base_reg, stack_offset);
                            abuilder->create_ADD(dst, bias_reg, base_reg);
                            abuilder->create_ADD(dst, RiscvReg::FP, dst);
                        } else {
                            abuilder->create_ADDI(dst, RiscvReg::FP, stack_offset);
                            abuilder->create_ADD(dst, dst, bias_reg);
                        }
                        this->mctx->get_function()->add_reg_mp(gep, dst);
                    }
                } else {
                    // TODO the case of ptr src type
                    // load double and then get the bias
                    auto ptr_addr = new RiscvReg::Reg(this->get_new_vreg_idx());
                    if(stack_offset > 2047 || stack_offset  < -2048) {
                        abuilder->create_LI(ptr_addr, stack_offset);
                        abuilder->create_ADD(ptr_addr, ptr_addr, RiscvReg::FP);
                        abuilder->create_LD(ptr_addr, ptr_addr, 0);
                    } else {
                        abuilder->create_LD(ptr_addr, RiscvReg::FP, stack_offset);
                    }
                    // check bias is const
                    if(auto imm = dynamic_cast<IR::ConstantValue*>(src)) {
                        // the bias
                        int bias = imm->get_value().iv << 2;
                        if( bias > 2047 || bias < -2048 ) {
                            RiscvReg::Reg offset_dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
                            abuilder->create_LI(offset_dst, bias);
                            abuilder->create_ADD(dst, ptr_addr, offset_dst);
                        } else {
                            abuilder->create_ADDI(dst, ptr_addr, bias);
                        }
                        this->mctx->get_function()->add_reg_mp(gep, dst);
                    } else {
                        // idx is not const
                        auto bias_reg = this->mctx->get_function()->get_reg(src);
                        // auto base_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                        abuilder->create_SLLI(bias_reg, bias_reg, 2);
                        // base is ptr addr 
                        abuilder->create_ADD(dst, ptr_addr, bias_reg);
                        this->mctx->get_function()->add_reg_mp(gep, dst);
                    }
                }
            }

        } else if(auto ret = dynamic_cast<IR::ReturnInst*>(instr)) {
            // get the epil_bb and jump 
            // is gp or fp 
            // bool rt_gp = this->mctx->get_function()->get_return_type()->base_type == Int;
            if(this->mctx->get_function()->get_return_type()->base_type == Void) {
                auto jump = this->abuilder->create_J(this->mctx->get_function()->epilogue_bb);
            } else {
                // TODO store to a0 or f0
                if(this->mctx->get_function()->get_return_type()->base_type == Int) {
                    auto ret_v = ret->get_ret_val();
                    RiscvReg::Reg ret_reg;
                    if(auto ret_cv = dynamic_cast<IR::ConstantValue*>(ret_v)) {
                        ret_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                        abuilder->create_LI(ret_reg, ret_cv->get_value().iv);
                    } else {
                        if(ret_v) {
                            ret_reg = this->mctx->get_function()->get_reg(ret_v);
                        } else {
                            ret_reg = RiscvReg::ZERO;
                        }
                    }
                    if(ret_reg.is_gp()) {
                        abuilder->create_MV(RiscvReg::A0, ret_reg);
                    } else {
                        abuilder->create_FCVT_W_S(RiscvReg::A0, ret_reg);
                    }
                } else if( this->mctx->get_function()->get_return_type()->base_type == Float ) {
                    auto ret_v = ret->get_ret_val();
                    RiscvReg::Reg ret_reg;
                    if(auto cv = dynamic_cast<IR::ConstantValue*>(ret_v)) {
                        ret_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
                        int c_v = cv->get_value().iv;
                        if(cv->get_type()->base_type == Float) {
                            auto ireg = new RiscvReg::Reg(this->get_new_vreg_idx());
                            abuilder->create_LI(ireg, c_v);
                            abuilder->create_FMV_W_X(ret_reg, ireg);
                        } else {
                            auto ireg = new RiscvReg::Reg(this->get_new_vreg_idx());
                            abuilder->create_LI(ireg, c_v);
                            abuilder->create_FCVT_S_W(ret_reg, ireg);
                        }
                    } else {
                        ret_reg = this->mctx->get_function()->get_reg(ret_v);
                    }
                    if(!ret_reg.is_gp()) {
                        abuilder->create_FMV_S(RiscvReg::FP10, ret_reg);
                    } else {
                        abuilder->create_FCVT_S_W(RiscvReg::FP10, ret_reg);
                    }
                }
                abuilder->create_J(this->mctx->get_function()->epilogue_bb);
            }
        } else if(auto branch = dynamic_cast<IR::BranchInst*>(instr)) {
            auto idbb = branch->get_dst_bb(); 
            auto dst_bb = this->mctx->get_function()->get_mbb(idbb->get_bb_idx());
            auto jump = this->abuilder->create_J(dst_bb);
            
            // contruct the cfg for machine bb
            auto dst_bb_idx = dst_bb->_bb_idx;
            this->mctx->get_function()->next_bb[this->mctx->get_basic_block()->_bb_idx].insert(dst_bb_idx);
            this->mctx->get_function()->prev_bb[dst_bb_idx].insert(this->mctx->get_basic_block()->_bb_idx);
        } else if(auto cond_br = dynamic_cast<IR::CondBranchInst*>(instr)) {
            auto cond = cond_br->get_cond();
            auto cond_res_reg = this->mctx->get_function()->get_reg(cond);
            auto true_bb_idx = cond_br->get_true_bb()->get_bb_idx();
            auto true_mbb = this->mctx->get_function()->get_mbb(true_bb_idx);
            if(cond_res_reg.is_gp()) {
                abuilder->create_BNEZ(cond_res_reg, true_mbb);
            } else {
                // mv fp to gp 
                auto cond_gp = new RiscvReg::Reg(this->get_new_vreg_idx());
                abuilder->create_FMV_X_W(cond_gp, cond_res_reg);
                abuilder->create_BNEZ(cond_gp, true_mbb);
            }
            auto false_bb_idx = cond_br->get_false_bb()->get_bb_idx();
            auto false_mbb = this->mctx->get_function()->get_mbb(false_bb_idx);
            abuilder->create_J(false_mbb);
            // get cur idx, true bb idx, false bb idx 
            int cur_bb_idx = this->mctx->get_basic_block()->_bb_idx;
            this->mctx->get_function()->next_bb[cur_bb_idx].insert(true_bb_idx);
            this->mctx->get_function()->next_bb[cur_bb_idx].insert(false_bb_idx);

            this->mctx->get_function()->prev_bb[true_bb_idx].insert(cur_bb_idx);
            this->mctx->get_function()->prev_bb[false_bb_idx].insert(cur_bb_idx);
        } else if(auto phi = dynamic_cast<IR::PhiInst*>(instr)) {
            // 在 ir中消除，后端不管
            continue;
        } else {
            // Handle unknown instruction type
            std::cerr << error << "Warning: Unknown instruction type in basic block" << std::endl;
        }
    }

    this->mctx->set_basic_block(nullptr);
}

void ASMGen::translate_binary(IR::BinaryInst* binary) {
    auto bop = binary->get_instr_type();
    auto lhs = binary->get_lhs();
    auto rhs = binary->get_rhs();

    // rs1 可能是cv 
    RiscvReg::Reg lhs_reg;
    if(auto cv = dynamic_cast<IR::ConstantValue*>(lhs)) {
        if(cv->get_type()->base_type == Int) {
            lhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            int constv = cv->get_value().iv; 
            abuilder->create_LI(lhs_reg, constv);
        } else {
            // is fp
            auto ilhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            lhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            int const_fv = cv->get_value().iv;
            abuilder->create_LI(ilhs_reg, const_fv);
            abuilder->create_FMV_W_X(lhs_reg, ilhs_reg);
        } 
    } else {
        if(auto isgv = dynamic_cast<IR::GlobalValue*>(lhs)) {
        // if is gv 
            std::string sym = isgv->get_symbol();
            if(isgv->get_type().base_type == Int) {
                lhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            } else {
                lhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            }
            auto gv_addr = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LA(gv_addr, sym);
            if(isgv->get_type().base_type == Int) {
                abuilder->create_LW(lhs_reg, gv_addr, 0);
            } else {
                abuilder->create_FLW(lhs_reg, gv_addr, 0);
            }
        } else {
        // is lv
            lhs_reg = this->mctx->get_function()->get_reg(lhs);
        }
    }

    // bop : cmp or compute
    RiscvReg::Reg dst, rhs_reg;
    bool can_imm = false;       // just for i-type
    int constv;

    // 处理rhs and instr
    if(auto ircv = dynamic_cast<IR::ConstantValue*>(rhs)) {
        // lhs_reg = this->mctx->get_function()->get_reg(rhs);
        constv = ircv->get_value().iv; 
        if(ircv->get_type()->base_type == Int && (constv > 2047 || constv < -2048) ) {
            can_imm = false;
            // auto imm_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
            abuilder->create_LI(rhs_reg, constv);
            // // auto rs1 = this->mctx->get_function()->get_reg(lhs);
            // abuilder->create_ADD(rhs_reg, lhs_reg, imm_reg);
        } else if ( ircv->get_type()->base_type == Float ) {
            can_imm = false;
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
            abuilder->create_LI(irhs_reg, constv);
            abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        } else {
            can_imm = true;
            // abuilder->create_ADDI(dst, lhs_reg, ircv->get_value().iv);
        }
    } else {
        // is not cv
        if(auto isgv = dynamic_cast<IR::GlobalValue*>(rhs)) {
        // if is gv 
            std::string sym = isgv->get_symbol();
            if(isgv->get_type().base_type == Int) {
                rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            } else {
                rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            }
            auto gv_addr = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LA(gv_addr, sym);
            if(isgv->get_type().base_type == Int) {
                abuilder->create_LW(lhs_reg, gv_addr, 0);
            } else {
                abuilder->create_FLW(lhs_reg, gv_addr, 0);
            }
        } else {
        // is lv
            rhs_reg = this->mctx->get_function()->get_reg(rhs);
        }
    }

    if (bop == IR::BinaryInstType::add) {
        // handle add
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if(can_imm) {
            if(constv == 0) {
                dst = lhs_reg;
            } else {
                abuilder->create_ADDI(dst, lhs_reg, constv);
            }
        } else {
            abuilder->create_ADD(dst, lhs_reg, rhs_reg);
        }
    } else if (bop == IR::BinaryInstType::sub) {
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if(can_imm) {
            if(constv == 0) {
                dst = lhs_reg;
            } else {
                abuilder->create_ADDI(dst, lhs_reg, -constv);
            }
        } else {
            abuilder->create_SUB(dst, lhs_reg, rhs_reg);
        }
    } else if (bop == IR::BinaryInstType::mul) {
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if (can_imm) {
            if(constv == 0) {
                dst = RiscvReg::ZERO;
            } else {
                rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                abuilder->create_LI(rhs_reg, constv);
            }
        }
        abuilder->create_MUL(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::sdiv) {
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if (can_imm) {
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(rhs_reg, constv);
        }
        abuilder->create_DIV(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::udiv) {
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if (can_imm) {
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(rhs_reg, constv);
        }
        abuilder->create_DIVU(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::srem) {
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if (can_imm) {
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(rhs_reg, constv);
        }
        abuilder->create_REM(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::urem) {
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if (can_imm) {
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(rhs_reg, constv);
        }
        abuilder->create_REMU(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::iand) {
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if(can_imm) {
            abuilder->create_ANDI(dst, lhs_reg, constv);
        } else {
            abuilder->create_AND(dst, lhs_reg, rhs_reg);
        }
    } else if (bop == IR::BinaryInstType::ior) {
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if(can_imm) {
            abuilder->create_ORI(dst, lhs_reg, constv);
        } else {
            abuilder->create_OR(dst, lhs_reg, rhs_reg);
        }
    } else if (bop == IR::BinaryInstType::ixor) {
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if(can_imm) {
            abuilder->create_XORI(dst, lhs_reg, constv);
        } else {
            abuilder->create_XOR(dst, lhs_reg, rhs_reg);
        }
    } else if (bop == IR::BinaryInstType::shl) {
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if(can_imm) {
            abuilder->create_SLLI(dst, lhs_reg, constv);
        } else {
            abuilder->create_SLL(dst, lhs_reg, rhs_reg);
        }
    } else if (bop == IR::BinaryInstType::lshr) {
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if(can_imm) {
            abuilder->create_SRLI(dst, lhs_reg, constv);
        } else {
            abuilder->create_SRL(dst, lhs_reg, rhs_reg);
        }
    } else if (bop == IR::BinaryInstType::ashr) {
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if(can_imm) {
            abuilder->create_SRAI(dst, lhs_reg, constv);
        } else {
            abuilder->create_SRA(dst, lhs_reg, rhs_reg);
        }
    } else if (bop == IR::BinaryInstType::fadd) {
        // handle fadd
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
        if(can_imm) {
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(irhs_reg, constv);
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        }
        abuilder->create_FADD_S(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::fsub) {
        // handle fsub
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
        if(can_imm) {
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(irhs_reg, constv);
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        }
        abuilder->create_FSUB_S(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::fmul) {
    // handle fmul
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
        if(can_imm) {
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(irhs_reg, constv);
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        }
        abuilder->create_FMUL_S(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::fdiv) {
    // handle fdiv
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
        if(can_imm) {
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(irhs_reg, constv);
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        }
        abuilder->create_FDIV_S(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::frem) {
    // handle frem
    // CAN FLOAT rem ?
        // dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
        // if(can_imm) {
        //     auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
        //     abuilder->create_LI(irhs_reg, constv);
        //     abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        // }
        // abuilder->create_F(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::eq) {
        // cmp instrs
        // handle eq
        // rhs == lhs ==> !(lhs ^ rhs)
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if(can_imm) {
            if(constv == 0) {
                abuilder->create_SEQZ(dst, lhs_reg);
            } else {
                rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                abuilder->create_XORI(dst, lhs_reg, constv);
                abuilder->create_SEQZ(dst, dst);
            }
        } else {
            abuilder->create_XOR(dst, lhs_reg, rhs_reg);
            abuilder->create_SEQZ(dst, dst);
        }
    } else if (bop == IR::BinaryInstType::oeq) {
        // handle oeq
        // the res is in x reg
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
        if(can_imm) {
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(irhs_reg, constv);
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        } 
        abuilder->create_FEQ_S(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::ne) {
        // handle ne
        // rhs != lhs ==> (lhs ^ rhs)
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if(can_imm) {
            if(constv == 0) {
                // abuilder->create_SEQZ(dst, lhs_reg);
                // not eq 0
                abuilder->create_SNEZ(dst, lhs_reg);
                // abuilder->create_XORI(dst, lhs_reg, 1);
            } else {
                rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                abuilder->create_XORI(dst, lhs_reg, constv);
                abuilder->create_SNEZ(dst, dst);
            }
        } else {
            abuilder->create_XOR(dst, lhs_reg, rhs_reg);
            abuilder->create_SNEZ(dst, dst);
        }
    } else if (bop == IR::BinaryInstType::one) {
        // handle one
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
        if(can_imm) {
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(irhs_reg, constv);
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        } 
        abuilder->create_FEQ_S(dst, lhs_reg, rhs_reg);
        abuilder->create_XORI(dst, dst, 1);
    } else if (bop == IR::BinaryInstType::lt) {
        // handle lt
        dst = new RiscvReg::Reg(this->get_new_vreg_idx());
        if(can_imm) {
            if(constv == 0) {
                abuilder->create_SLTZ(dst, lhs_reg);
            } else {
                abuilder->create_SLTI(dst, lhs_reg, constv);
            }
        }else {
            abuilder->create_SLT(dst, lhs_reg, rhs_reg);
        }
    } else if (bop == IR::BinaryInstType::olt) {
        // handle olt
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
        if(can_imm) {
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(irhs_reg, constv);
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        } 
        abuilder->create_FLT_S(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::gt) {
        // handle gt
        // lhs > rhs ==> rhs < lhs
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
        if(can_imm) {
            if(constv == 0) {
                abuilder->create_SGTZ(dst, lhs_reg);
            } else {
                rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                abuilder->create_LI(rhs_reg, constv);
                abuilder->create_SLT(dst, rhs_reg, lhs_reg);
            }
        }else {
            abuilder->create_SLT(dst, rhs_reg, lhs_reg);
        }
    } else if (bop == IR::BinaryInstType::ogt) {
        // handle ogt
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);

        if(can_imm) {
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(irhs_reg, constv);
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        } else {
            abuilder->create_FLT_S(dst, rhs_reg, lhs_reg);
        }
    } else if (bop == IR::BinaryInstType::le) {
        // handle le
        // lhs <= rhs ==> ~(lhs > rhs) ==> ~( rhs < lhs )
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
        if(can_imm) {
            if(constv == 0) {
                abuilder->create_SGTZ(dst, lhs_reg);
                abuilder->create_XORI(dst, dst, 1);
            } else {
                rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
                abuilder->create_LI(rhs_reg, constv);
                abuilder->create_SLT(dst, rhs_reg, lhs_reg);
                abuilder->create_XORI(dst, dst, 1);
            }
        } else {
            abuilder->create_SLT(dst, rhs_reg, lhs_reg);
            abuilder->create_XORI(dst, dst, 1);
        }
    } else if (bop == IR::BinaryInstType::ole) {
        // handle ole
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
        if(can_imm) {
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(irhs_reg, constv);
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        } 
        abuilder->create_FLE_S(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::ge) {
        // handle ge , not lt is gt
        // lhs >= rhs ==> !(lhs < rhs)
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
        if(can_imm) {
            if(constv == 0) {
                // lhs >= 0 ==> !(lhs < 0)
                abuilder->create_SLTZ(dst, lhs_reg);
                // abuilder->create_SNEZ(dst, lhs_reg);
                abuilder->create_XORI(dst, dst, 1);
            } else {
                abuilder->create_SLTI(dst, lhs_reg, constv);
                // abuilder->create_SNEZ(dst, lhs_reg);
                abuilder->create_XORI(dst, dst, 1);
            }
        } else {
            abuilder->create_SLT(dst, lhs_reg, rhs_reg); // 
            abuilder->create_XORI(dst, dst, 1);
        }
    } else if (bop == IR::BinaryInstType::oge) {
        // handle oge
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
        if(can_imm) {
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(irhs_reg, constv);
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        }
        abuilder->create_FLE_S(dst, rhs_reg, lhs_reg);
    }
    this->mctx->get_function()->add_reg_mp(binary, dst);
}

void ASMGen::gen_prolo_epil(MachineFunction* mfunc, IR::Function* src_func) {
// need to calculate the stack size then mv the sp
// 这里留下几个临时寄存器般砖, 用T0搬
// 1. write prologue bb
    auto prologue = mfunc->prologue_bb;
    this->mctx->set_basic_block(prologue);


    // save fp 
    int fp_bias = - 8;
    if(fp_bias > 2047 || fp_bias < -2048) {
        RiscvReg::Reg fp_size_reg = RiscvReg::T0;
        abuilder->create_LI(fp_size_reg, fp_bias);
        abuilder->create_ADD(fp_size_reg, RiscvReg::SP, fp_size_reg);
        abuilder->create_SD(RiscvReg::FP, fp_size_reg, 0);
    } else {
        abuilder->create_SD(RiscvReg::FP, RiscvReg::SP, fp_bias);
    }
    // save ra
    int ra_bias = - 16;
    if(ra_bias > 2047 || ra_bias < -2048) {
        RiscvReg::Reg ra_size_reg = RiscvReg::T0;
        abuilder->create_LI(ra_size_reg, ra_bias);
        abuilder->create_ADD(ra_size_reg, RiscvReg::SP, ra_size_reg);
        abuilder->create_SD(RiscvReg::RA, ra_size_reg, 0);
    } else {
        abuilder->create_SD(RiscvReg::RA, RiscvReg::SP, ra_bias);
    }

    int stack_size = -mfunc->get_stack_size() ; 
    if(stack_size > 2047 || stack_size < -2048) {
        // RiscvReg::Reg stack_size_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
        abuilder->create_LI(RiscvReg::T0, stack_size);
        abuilder->create_ADD(RiscvReg::SP, RiscvReg::SP, RiscvReg::T0);
    } else {
        abuilder->create_ADDI(RiscvReg::SP, RiscvReg::SP, stack_size);
    }


    // save old sp to fp
    int rev_stack_size = mfunc->get_stack_size();
    if(rev_stack_size > 2047 || rev_stack_size < -2048) {
        RiscvReg::Reg rev_stack_size_reg = RiscvReg::T0;
        abuilder->create_LI(rev_stack_size_reg, rev_stack_size);
        abuilder->create_ADD(RiscvReg::FP, RiscvReg::SP, rev_stack_size_reg);
    } else {
        abuilder->create_ADDI(RiscvReg::FP, RiscvReg::SP, rev_stack_size);
    }



    // TODO 
    //      1. move arg to stack memeory
    //      2. save spill regs 
    //      3. save use save regs

    // d_s => double or single == true use lw 
    auto mv_to_mm_imm = [&](RiscvReg::Reg src, RiscvReg::Reg dst, int imm, bool d_s) {
        // fp to gp ? store word double?
        if(imm > 2047 || imm < -2048) {
            RiscvReg::Reg imm_reg = RiscvReg::T0;
            abuilder->create_LI(imm_reg, imm);
            abuilder->create_ADD(dst, dst, imm_reg);
            if(src.is_gp()) {
                if(d_s) {
                    abuilder->create_SD(src, dst, 0);
                } else {
                    abuilder->create_SW(src, dst, 0);
                }
            }else {
                // is float p
                abuilder->create_FSW(src, dst, 0);
            }
        } else {
            if(src.is_gp()) {
                if(d_s) {
                    abuilder->create_SD(src, dst, imm);
                } else {
                    abuilder->create_SW(src, dst, imm);
                }
            }else {
                // is float p
                abuilder->create_FSW(src, dst, imm);
            }
        }
    };
    
    // 1. 处理入参，有几个参数对应前几个alloca指令
    int parm_nr = mfunc->arg_types.size();
    auto arg_types = mfunc->arg_types;
    auto all_args_name= mfunc->args_name;
    int gp_parm_cnt = 0;
    int fp_parm_cnt = 0;
    int ovf_arg_cnt = 1;
    for(int i=0; i<parm_nr; i++) {
        // the bias
        int p_bias = mfunc->get_symbol_bias(all_args_name[i]);
        if(arg_types[i]->is_ptr()) {
            if(gp_parm_cnt < 8) {
                mv_to_mm_imm(RiscvReg::regs_arg[gp_parm_cnt], RiscvReg::FP, p_bias, true);
            } else {
                // get from fp mv up 
                int fpp_bias = ovf_arg_cnt * 8; 
                RiscvReg::Reg tem_reg = RiscvReg::T1;
                if(fpp_bias > 2047 || fpp_bias < -2048) {
                    abuilder->create_LI(tem_reg, fpp_bias);
                    abuilder->create_ADD(tem_reg, RiscvReg::FP, tem_reg);
                    abuilder->create_LD(tem_reg, tem_reg, 0);
                } else {
                    abuilder->create_LD(tem_reg, RiscvReg::FP, fpp_bias);
                }
                mv_to_mm_imm(tem_reg, RiscvReg::FP, p_bias, true);
                ovf_arg_cnt++;
            }
            gp_parm_cnt++;
        } else {
            if(arg_types[i]->base_type == Int) {
                // a_x
                if(gp_parm_cnt < 8) {
                    mv_to_mm_imm(RiscvReg::regs_arg[gp_parm_cnt], RiscvReg::FP, p_bias, false);
                } else {
                    int fpp_bias = ovf_arg_cnt * 8; 
                    RiscvReg::Reg tem_reg = RiscvReg::T1;
                    if(fpp_bias > 2047 || fpp_bias < -2048) {
                        abuilder->create_LI(tem_reg, fpp_bias);
                        abuilder->create_ADD(tem_reg, RiscvReg::FP, tem_reg);
                        abuilder->create_LW(tem_reg, tem_reg, 0);
                    } else {
                        abuilder->create_LW(tem_reg, RiscvReg::FP, fpp_bias);
                    }
                    mv_to_mm_imm(tem_reg, RiscvReg::FP, p_bias, false);
                    ovf_arg_cnt++;
                }
                gp_parm_cnt++;
            } else {
                // fa_x
                if(fp_parm_cnt < 8) {
                    mv_to_mm_imm(RiscvReg::fp_regs_arg[fp_parm_cnt], RiscvReg::FP, p_bias, false);
                } else {
                    int fpp_bias = ovf_arg_cnt * 8; 
                    RiscvReg::Reg tem_reg = RiscvReg::T1;
                    if(fpp_bias > 2047 || fpp_bias < -2048) {
                        abuilder->create_LI(tem_reg, fpp_bias);
                        abuilder->create_ADD(tem_reg, RiscvReg::FP, tem_reg);
                        abuilder->create_LW(tem_reg, tem_reg, 0);
                    } else {
                        abuilder->create_LW(tem_reg, RiscvReg::FP, fpp_bias);
                    }
                    mv_to_mm_imm(tem_reg, RiscvReg::FP, p_bias, false);
                    ovf_arg_cnt++;
                }
                fp_parm_cnt++;
            }
        }
    }

    // TODO if has array ( not ptr type , need memeory clear), 在不保存完参数后 a0-a7都可以用了
    //
    //
    // 1. get allocas , need to get the ir function 
    auto allocas = src_func->get_allocas();
    for(auto lv : allocas ) {
        auto ty = lv->get_type();
        if(ty->is_array() && !ty->is_ptr()) {
            auto sym = lv->get_name();
            // the start size 
            auto stack_bias = mfunc->get_symbol_bias(sym);
            if(stack_bias > 2047 || stack_size < -2048) {
                abuilder->create_LI(RiscvReg::A0, stack_bias);
                abuilder->create_ADD(RiscvReg::A0, RiscvReg::FP, RiscvReg::A0);
            } else {
                abuilder->create_ADDI(RiscvReg::A0, RiscvReg::FP, stack_bias);
            }
            auto arr_size = ty->nr_elems() << 2;
            abuilder->create_LI(RiscvReg::A1, arr_size);

            auto lib_func = this->mctx->get_module()->_name2lib_func["__clear_mem__"];
            auto args_type = lib_func->get_params_type();
            auto pnames = lib_func->get_func_p_names();
            auto mfunc = new MachineFunction(this->mctx->get_module(), "__clear_mem__", lib_func->get_return_type(), args_type , pnames);
            this->mctx->get_module()->_name2lib_m_func["__clear_mem__"] = mfunc;

            abuilder->create_CALL(mfunc);

#ifdef MEM_CLEAR
            std::cerr << info << "Clear memory for array " <<  sym <<  " from FP " << stack_bias << " to " << stack_bias+arr_size << "\n";
#endif
        }
    }

    
    
    // keep saved regs
    int save_space_start_idx = -16 - mfunc->local_variable_size;
    int sfx_cnt = 0;
    std::map<RiscvReg::Reg, int> memo_sr_offset;
    for(auto sx : mfunc->allocator->used_S_x) {
        sfx_cnt++;
        int fp_bias = save_space_start_idx - sfx_cnt * 8;
        memo_sr_offset[sx] = fp_bias;
        if(fp_bias > 2047 || fp_bias < -2048) {
            abuilder->create_LI(RiscvReg::T0, fp_bias);
            abuilder->create_ADD(RiscvReg::T0, RiscvReg::FP, RiscvReg::T0);
            abuilder->create_SD(sx, RiscvReg::T0, 0);
        } else {
            abuilder->create_SD(sx, RiscvReg::FP, fp_bias);
        }
    }

    for(auto fsx : mfunc->allocator->used_FS_x) {
        sfx_cnt++;
        int fp_bias = save_space_start_idx - sfx_cnt * 8;
        memo_sr_offset[fsx] = fp_bias;
        if(fp_bias > 2047 || fp_bias < -2048) {
            abuilder->create_LI(RiscvReg::T0, fp_bias);
            abuilder->create_ADD(RiscvReg::T0, RiscvReg::FP, RiscvReg::T0);
            abuilder->create_FSD(fsx, RiscvReg::T0, 0);
        } else {
            abuilder->create_FSD(fsx, RiscvReg::FP, fp_bias);
        }
    }


    abuilder->create_J(mfunc->get_entry_bb());


    // 
    // ======================== 尾声块 =====================================

    // TODO 处理尾声基本块
    //      1. 恢复现场

    auto epilogue_bb =  mfunc->epilogue_bb;
    this->mctx->set_basic_block(epilogue_bb);
    // 先恢复现场
    // reload saved regs
    for(auto [reg, fp_bias] : memo_sr_offset) {
        if(fp_bias > 2047 || fp_bias < -2048) {
            abuilder->create_LI(RiscvReg::T0, fp_bias);
            abuilder->create_ADD(RiscvReg::T0, RiscvReg::FP, RiscvReg::T0);
            if(reg.is_gp()) {
                abuilder->create_LD(reg, RiscvReg::T0, 0);
            } else {
                abuilder->create_FLW(reg, RiscvReg::T0, 0);
            }
        } else {
            if(reg.is_gp()) {
                abuilder->create_LD(reg, RiscvReg::FP, fp_bias);
            } else {
                abuilder->create_FLW(reg, RiscvReg::FP, fp_bias);
            }
        }
    }
    
    // 恢复fp ra sp
    abuilder->create_LD(RiscvReg::RA, RiscvReg::FP, -16);
    abuilder->create_LD(RiscvReg::FP, RiscvReg::FP, -8);
    if(rev_stack_size > 2047 || rev_stack_size < -2048) {
        RiscvReg::Reg rev_stack_size_reg = RiscvReg::T0;
        abuilder->create_LI(rev_stack_size_reg, rev_stack_size);
        abuilder->create_ADD(RiscvReg::SP, RiscvReg::SP, rev_stack_size_reg);
    } else {
        abuilder->create_ADDI(RiscvReg::SP, RiscvReg::SP, rev_stack_size);
    }
    abuilder->create_RET();
}
}
