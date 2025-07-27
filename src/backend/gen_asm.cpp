#include "backend/gen_asm.hpp"
#include "IR/BasicBlock.hpp"
#include "IR/Function.hpp"
#include "IR/GlobalValue.hpp"
#include "IR/Instructions.hpp"
#include "common/regarch.hpp"
#include "common/type.hpp"
#include "common/utils.hpp"
#include <cinttypes>
#include <iostream>

namespace backend {

void ASMGen::translate_func(IR::Function* func) {
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
        this->mctx->get_function()->add_symbol(ai->get_name(), -16-sum_lss);
        // std::cout << ai->to_str() << ";  Size : " << size << std::endl;
    }
    this->mctx->get_function()->set_stack_size(16+sum_lss);
    // std::cout << "LA use " << sum_lss << std::endl;
    // std::cout << "==========================================================\n";

    // dfs to translate the basic block 
    int entry_idx = func->get_entry_bb()->get_bb_idx();
    std::stack<int> next_bb_idx;
    // set the logical entry 
    auto ebb = this->mctx->get_function()->get_mbb(entry_idx);
    this->mctx->get_function()->entry_bb = ebb;
    next_bb_idx.push(entry_idx);
    while(!next_bb_idx.empty()) {
        int bi = next_bb_idx.top();
        next_bb_idx.pop();
        for(auto next_idx : func->get_cfg()->succ_bb[bi]) {
            next_bb_idx.push(next_idx);
        }
        // translate the bb
        translate_bb(func->get_cfg()->idx2bb[bi]);
    }

    // TODO reg alloca 
    
    // gen prologue and epilogue
    this->gen_prolo_epil();
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
            continue;  // Already handled in function translation
        } else if(auto load = dynamic_cast<IR::LoadInst*>(instr)) {
            // is gv ? is alloca ? is getelementptr
            auto isrc = load->get_src();
            if(auto gv = dynamic_cast<IR::GlobalValue*>(isrc)) {
                // 是全局符号，是 gp fp OR ARRAY?
                RiscvReg::Reg dst = new RiscvReg::Reg(get_new_vreg_idx());
                abuilder->create_LA(dst, gv->get_symbol());
                this->mctx->get_function()->add_reg_mp(load, dst);
            } else if(auto lv = dynamic_cast<IR::AllocaInst*>(isrc)) {
                // alloca 分配局部变量 包括常量和数组， 如果是常量
                auto src_addr = lv->get_name();
                // alloca type 
                auto aty = lv->get_type();
                RiscvReg::Reg dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                if(aty->is_array()) {

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

//            else if(auto cv = dynamic_cast<IR::ConstantValue*>(isrc)) {
//                // cv 
//                RiscvReg::Reg dst;
//                if(cv->get_type()->base_type == Int) {
//                    dst = new RiscvReg::Reg(this->get_new_vreg_idx());
//                    int iv = cv->get_value().iv;
//                    abuilder->create_LI(dst, iv);
//                } else {
//                }
//                this->mctx->get_function()->add_reg_mp(load, dst);
//            }

        } else if(auto binary = dynamic_cast<IR::BinaryInst*>(instr)) {
            auto bop = binary->get_instr_type();
            if (bop == IR::BinaryInstType::add) {
                // handle add
            } else if (bop == IR::BinaryInstType::sub) {
                // handle sub
            } else if (bop == IR::BinaryInstType::mul) {
                // handle mul
            } else if (bop == IR::BinaryInstType::sdiv) {
                // handle sdiv
            } else if (bop == IR::BinaryInstType::udiv) {
                // handle udiv
            } else if (bop == IR::BinaryInstType::srem) {
                // handle srem
            } else if (bop == IR::BinaryInstType::urem) {
                // handle urem
            } else if (bop == IR::BinaryInstType::iand) {
                // handle iand
            } else if (bop == IR::BinaryInstType::ior) {
                // handle ior
            } else if (bop == IR::BinaryInstType::ixor) {
                // handle ixor
            } else if (bop == IR::BinaryInstType::shl) {
                // handle shl
            } else if (bop == IR::BinaryInstType::lshr) {
                // handle lshr
            } else if (bop == IR::BinaryInstType::ashr) {
                // handle ashr
            } else if (bop == IR::BinaryInstType::fadd) {
                // handle fadd
            } else if (bop == IR::BinaryInstType::fsub) {
                // handle fsub
            } else if (bop == IR::BinaryInstType::fmul) {
                // handle fmul
            } else if (bop == IR::BinaryInstType::fdiv) {
                // handle fdiv
            } else if (bop == IR::BinaryInstType::frem) {
                // handle frem
            } else if (bop == IR::BinaryInstType::eq) {
                // handle eq
            } else if (bop == IR::BinaryInstType::oeq) {
                // handle oeq
            } else if (bop == IR::BinaryInstType::ne) {
                // handle ne
            } else if (bop == IR::BinaryInstType::one) {
                // handle one
            } else if (bop == IR::BinaryInstType::lt) {
                // handle lt
            } else if (bop == IR::BinaryInstType::olt) {
                // handle olt
            } else if (bop == IR::BinaryInstType::gt) {
                // handle gt
            } else if (bop == IR::BinaryInstType::ogt) {
                // handle ogt
            } else if (bop == IR::BinaryInstType::le) {
                // handle le
            } else if (bop == IR::BinaryInstType::ole) {
                // handle ole
            } else if (bop == IR::BinaryInstType::ge) {
                // handle ge
            } else if (bop == IR::BinaryInstType::oge) {
                // handle oge
            }
        } else if(auto convert = dynamic_cast<IR::ConvertInst*>(instr)) {

        } else if(auto call = dynamic_cast<IR::CallInst*>(instr)) {
            // 返回值不管怎么样先放到一个虚拟寄存器中 a0 or fa0
        } else if(auto gep = dynamic_cast<IR::GetElementPtrInst*>(instr)) {
            // 翻译成 add 指令
            // 
            Value* src = gep->get_indices()[0];
            std::string sym = gep->get_src()->get_name();
            // the base 
            int stack_offset = this->mctx->get_function()->get_symbol_bias(sym);
            // RiscvReg::Reg base_addr_reg = this->mctx->get_function()->get_reg(src);
    
            RiscvReg::Reg dst;
            if(gep->get_type()->base_type == Int) {
                dst = new RiscvReg::Reg(this->get_new_vreg_idx());
                // check is imm 
                if(auto imm = dynamic_cast<IR::ConstantValue*>(src)) {
                    // the bias
                    int bias = stack_offset + imm->get_value().iv * 4;
                        if( bias > 2047 || bias < -2048 ) {
                            RiscvReg::Reg offset_dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, true);
                            abuilder->create_LI(offset_dst, bias);
                            abuilder->create_ADD(dst, RiscvReg::FP, offset_dst);
                        } else {
                            abuilder->create_ADDI(dst, RiscvReg::FP, bias);
                        }
                } else {
                    // the bias 
                    // auto srge = this->mctx->get_function()->get_reg(src);
                    // the base 
                    
                    // abuilder->create_ADD(dst, );
                }
            } else {

            }
        } else if(auto ret = dynamic_cast<IR::ReturnInst*>(instr)) {
            // get the epil_bb and jump 
            // is gp or fp 
            // bool rt_gp = this->mctx->get_function()->get_return_type()->base_type == Int;
            if(this->mctx->get_function()->get_return_type()->base_type == Void) {
                auto jump = this->abuilder->create_J(this->mctx->get_function()->epilogue_bb);
            } else {
                // TODO store to a0 or f0
            }
        } else if(auto branch = dynamic_cast<IR::BranchInst*>(instr)) {
            auto idbb = branch->get_dst_bb(); 
            auto dst_bb = this->mctx->get_function()->get_mbb(idbb->get_bb_idx());
            auto jump = this->abuilder->create_J(dst_bb);
        } else if(auto cond_br = dynamic_cast<IR::CondBranchInst*>(instr)) {

        } else if(auto phi = dynamic_cast<IR::PhiInst*>(instr)) {
            // 在 ir中消除
            continue;
        } else {
            // Handle unknown instruction type
            std::cerr << error << "Warning: Unknown instruction type in basic block" << std::endl;
        }
    }
}

void ASMGen::gen_prolo_epil() {
}



}
