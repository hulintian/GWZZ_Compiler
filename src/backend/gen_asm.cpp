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
#include <string>

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
            translate_binary(binary);
        } else if(auto convert = dynamic_cast<IR::ConvertInst*>(instr)) {

        } else if(auto call = dynamic_cast<IR::CallInst*>(instr)) {
            // 返回值不管怎么样先放到一个虚拟寄存器中 a0 or fa0
        } else if(auto gep = dynamic_cast<IR::GetElementPtrInst*>(instr)) {
            // 翻译成 add 指令
            // 还要考虑全局的
            auto base_addr = gep->get_src();
            Value* src = gep->get_indices()[0];
            std::string sym = gep->get_src()->get_name();
            // the base 
            if(auto ga = dynamic_cast<IR::GlobalValue*>(base_addr)) {
                // from gv
            } else {
                // from local
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
                        //  auto srge = this->mctx->get_function()->get_reg(src);
                        // the base 
                        
                        // abuilder->create_ADD(dst, );
                    }
                    this->mctx->get_function()->add_reg_mp(gep, dst);
                } else {

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
            }
        } else if(auto branch = dynamic_cast<IR::BranchInst*>(instr)) {
            auto idbb = branch->get_dst_bb(); 
            auto dst_bb = this->mctx->get_function()->get_mbb(idbb->get_bb_idx());
            auto jump = this->abuilder->create_J(dst_bb);
        } else if(auto cond_br = dynamic_cast<IR::CondBranchInst*>(instr)) {
            auto cond = cond_br->get_cond();
            auto cond_res_reg = this->mctx->get_function()->get_reg(cond);
            auto true_bb_idx = cond_br->get_true_bb()->get_bb_idx();
            auto true_mbb = this->mctx->get_function()->get_mbb(true_bb_idx);
            abuilder->create_BNEZ(cond_res_reg, true_mbb);
        } else if(auto phi = dynamic_cast<IR::PhiInst*>(instr)) {
            // 在 ir中消除
            continue;
        } else {
            // Handle unknown instruction type
            std::cerr << error << "Warning: Unknown instruction type in basic block" << std::endl;
        }
    }
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
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
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
                abuilder->create_SUBI(dst, lhs_reg, constv);
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
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
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
                abuilder->create_SEQZ(dst, lhs_reg);
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
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
        if(can_imm) {
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(irhs_reg, constv);
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        } 
        abuilder->create_FEQ_S(dst, lhs_reg, rhs_reg);
        abuilder->create_SNEZ(dst, dst);
    } else if (bop == IR::BinaryInstType::lt) {
        // handle lt
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
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
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
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
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
        if(can_imm) {
            if(constv == 0) {
                abuilder->create_SGTZ(dst, lhs_reg);
            } else {
                abuilder->create_SGTI(dst, lhs_reg, constv);
            }
        }else {
            abuilder->create_SLT(dst, rhs_reg, lhs_reg);
        }
    } else if (bop == IR::BinaryInstType::ogt) {
        // handle ogt
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);

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
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
        if(can_imm) {
            if(constv == 0) {
                abuilder->create_SGTZ(dst, lhs_reg);
                abuilder->create_XORI(dst, dst, 1);
            } else {
                abuilder->create_SGTI(dst, lhs_reg, constv);
                abuilder->create_XORI(dst, dst, 1);
            }
        } else {
            abuilder->create_SLT(dst, rhs_reg, lhs_reg);
            abuilder->create_XORI(dst, dst, 1);
        }
    } else if (bop == IR::BinaryInstType::ole) {
        // handle ole
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
        if(can_imm) {
            auto irhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx());
            abuilder->create_LI(irhs_reg, constv);
            rhs_reg = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
            abuilder->create_FMV_W_X(rhs_reg, irhs_reg);
        } 
        abuilder->create_FLE_S(dst, lhs_reg, rhs_reg);
    } else if (bop == IR::BinaryInstType::ge) {
        // handle ge , not lt is gt
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
        if(can_imm) {
            if(constv == 0) {
                abuilder->create_SGTZ(dst, lhs_reg);
            } else {
                abuilder->create_SGTI(dst, lhs_reg, constv);
            }
        } else {
            abuilder->create_SLT(dst, rhs_reg, lhs_reg); // 
            abuilder->create_XORI(dst, dst, 1);
        }
    } else if (bop == IR::BinaryInstType::oge) {
        // handle oge
        dst = new RiscvReg::Reg(this->get_new_vreg_idx(), false, false);
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

void ASMGen::gen_prolo_epil() {
}



}
