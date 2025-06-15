#include "backend/program.hpp"
#include "backend/instr.hpp"
#include "backend/regAllocator.hpp"
#include "common/utils.hpp"
#include "common/regarch.hpp"
#include "IR/IR.hpp"
#include "IR/CFG.hpp"
#include <fstream>
#include <iostream>
#include <iomanip>
#include <stack>
#include <chrono>

std::ofstream out_log("test_log_un_arrange");
std::ofstream out_log2("test_log_arrange");
std::ofstream out_log3("test_log_un_reg_alloc");
std::ofstream out_log4("test_log_reg_alloc");

int log2(int x) {
    int res = 0;
    while (x >>= 1)
        res++;
    return res;
}

bool isPowerOfTwo(int x) {
    return x > 0 && ((x & (x-1)) == 0);
}

#include <cassert>
#include <initializer_list>
#include <iostream>

using Uint32 = unsigned int;
using Uint64 = unsigned long long;
using Int32 = int;
using Int64 = long long;

// 计算前导0的个数
inline int clz(Uint32 x) { return __builtin_clz(x); }
// 计算后导0的个数
inline int ctz(Uint32 x) { return __builtin_ctz(x); }

constexpr int N = 32;

struct Multiplier {
    Uint64 m;
    int l;
};

Multiplier chooseMultiplier(Uint32 d, int p) {
    int l = N - clz(d - 1);
    Uint64 low = (Uint64(1) << (N + l)) / d;
    Uint64 high = ((Uint64(1) << (N + l)) + (Uint64(1) << (N + l - p))) / d;
    while((low >> 1) < (high >> 1) && l > 0)
        low >>= 1, high >>= 1, --l;
    return {high, l};
}

#define getValue(x) (x.type == Int ? x.iv : x.fv)

namespace backend{
namespace riscv{

using namespace RiscvReg;

std::vector<Function *> Program::functions() { return functions_; }

void Program::gen_asm(std::ostream &out) {
    // generate asm for globals
    out << "    .option pic\n";
    out << "    .attribute unaligned_access, 0\n";
    out << "    .attribute stack_align, 16\n";
    out << "    .attribute arch, \"rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0\"\n";
    gen_global_var_asm(out);
    out << "    .align 3\n";
    out << "    .globl main\n";
    out << "    .text\n";

    // out << "__create_threads:\n";
    // out << "    li a5, 3\n";
    // out << ".Label1:\n";
    // out << "    li a0, 273\n"; // flag
    // out << "    mv a1, sp\n"; // sp
    // out << "    li a2, 0\n";
    // out << "    li a3, 0\n";
    // out << "    li a4, 0\n";
    // out << "    li a7, 220\n";  // SYS_clone 
    // out << "    ecall\n";
    // out << "    li a1, -1\n";
    // out << "    beq a0, a1, .Label1\n";
    // out << "    beqz a0, .Label2\n";  // child process
    // out << "    addi a5, a5, -1\n";
    // out << "    bnez a5, .Label1\n";  // last needed fork
    // out << ".Label2:\n";
    // out << "    mv a0, a5\n";
    // out << "    ret\n";
    // out << "\n";

    // out << "__join_threads:\n";
    // out << "    li a1, 3\n";
    // out << "    mv a5, a0\n";
    // out << "    beq a0, a1, .Label3\n"; // tid=3 exits directly
    // out << ".Label4:\n";
    // out << "    li a0, 0\n";  // P_ALL
    // out << "    li a1, 0\n";
    // out << "    li a2, 0\n";
    // out << "    li a3, 4\n"; // WEXITED
    // out << "    li a7, 95\n";  // SYS_waitid
    // out << "    ecall\n";
    // out << "    li a3, -1\n";
    // out << "    beq a3, a0, .Label4\n"; // wait failed
    // out << "    bnez a5, .Label3\n"; // tid=0 returns to normal control flow

    // out << ".sleep:\n";
    // out << "    li a0, 0\n"; // sleep for 0.5 second
    // out << "    sd a0, -16(sp)\n";
    // out << "    li a0, 1\n";
    // out << "    slli a0, a0, 29\n";
    // out << "    sd a0, -8(sp)\n";
    // out << "    addi sp, sp, -16\n";
    // out << "    mv a0, sp\n";
    // out << "    li a7, 101\n";  // sys_nanosleep
    // out << "    addi sp, sp, 16\n";
    // out << "    ecall\n";
    // out << "    bnez a0, .sleep\n";

    // out << "    ret\n";
    // out << ".Label3:\n";
    // out << "    li a0, 0\n";
    // out << "    li a7, 93\n";  // sys_exit
    // out << "    ecall\n";
    // out << "\n";

    // memset zero function
    if (use_memset_zero) {
        out << "__memset_zero__:\n";
        out << ".entry___memset_zero__:\n";
        out << "    sd fp, -8(sp)\n";
        out << "    sd ra, -16(sp)\n";
        out << "    addi sp, sp, -16\n";
        out << "    addi fp, sp, 16\n";
        out << "    mv t0, a0\n";
        out << ".Lmemzero:\n";
        out << "    li t1, 0\n";
        out << "    slt t2, t1, a1\n";
        out << "    beqz t2, .exit___memset_zero__\n";
        out << ".Lmemzero_loop:\n";
        out << "    li t3, 0\n";
        out << "    li t2, 4\n";
        out << "    mul t2, t2, t1\n";
        out << "    add t2, t2, t0\n";
        out << "    sw t3, 0(t2)\n";
        out << "    addi t1, t1, 1\n";
        out << "    slt t2, t1, a1\n";
        out << "    beqz t2, .exit___memset_zero__\n";
        out << "    j .Lmemzero_loop\n";
        out << ".exit___memset_zero__:\n";
        out << "    addi sp, sp, 16\n";
        out << "    ld fp, -8(sp)\n";
        out << "    ld ra, -16(sp)\n";
        out << "    ret\n";
    }

    // gen asm for func
    for (auto& func : functions_) {
        func->gen_asm(out);
    }
}

static inline int log2(int a){
    int b = 0;
    while(a > 1){
        b++;
        a /= 2;
    }
    return b;
}

OperationType get_type(Instr* inst) {
    TypeCase(move, RiscvInstr::Move*, inst) {
        return LiUnit;
    }
    TypeCase(loadimm, RiscvInstr::LoadImm*, inst) {
        return LiUnit;
    }
    TypeCase(unary, RiscvInstr::Unary*, inst) {
        return IntALU;
    }
    TypeCase(binaryint, RiscvInstr::BinaryInt*, inst) {
        if (!binaryint->is_gp()) {
            if (binaryint->get_op() == RvBinaryOp::MUL)
                return FloatMULALU;
            if (binaryint->get_op() == RvBinaryOp::DIV || binaryint->get_op() == RvBinaryOp::REM)
                return FloatDIVALU;
            return FloatALU;
        }
        if (binaryint->get_op() == RvBinaryOp::MUL) 
            return IntMULALU;
        if (binaryint->get_op() == RvBinaryOp::DIV || binaryint->get_op() == RvBinaryOp::REM)
            return IntDIVALU;
        return IntALU;
    }
    TypeCase(binary, RiscvInstr::Binary*, inst) {
        if (binary->get_op() == RvBinaryOp::MUL)
            return IntMULALU;
        return IntALU;
    }
    TypeCase(sltiu, RiscvInstr::SLTIU*, inst) {
        return IntALU;
    }
    TypeCase(binaryimm, RiscvInstr::BinaryImm*, inst) {
        return IntALU;
    }
    TypeCase(addimm, RiscvInstr::ADDImm*, inst) {
        return IntALU;
    }
    TypeCase(load, RiscvInstr::Load*, inst) {
        return LoadUnit;
    }
    TypeCase(loaddouble, RiscvInstr::LoadDouble*, inst) {
        return LoadUnit;
    }
    TypeCase(store, RiscvInstr::Store*, inst) {
        return StoreUnit;
    }
    TypeCase(storedouble, RiscvInstr::StoreDouble*, inst) {
        return StoreUnit;
    }
    TypeCase(call, RiscvInstr::Call*, inst) {
        return BranchUnit;
    }
    TypeCase(jump, RiscvInstr::Jump*, inst) {
        return BranchUnit;
    }
    TypeCase(branch, RiscvInstr::Branch*, inst) {
        return BranchUnit;
    }
    TypeCase(convert, RiscvInstr::Convert*, inst) {
        return FloatALU;
    }
    TypeCase(ret, RiscvInstr::Return*, inst) {
        return BranchUnit;
    }
    TypeCase(sext, RiscvInstr::Sext*, inst) {
        return FloatALU;
    }
    TypeCase(la, RiscvInstr::LoadLabelAddr*, inst) {
        return LiUnit;
    }
    assert(false);
}

int get_latency(Instr* inst) {
    TypeCase(move, RiscvInstr::Move*, inst) {
        return 1;
    }
    TypeCase(loadimm, RiscvInstr::LoadImm*, inst) {
        return 1;
    }
    TypeCase(unary, RiscvInstr::Unary*, inst) {
        return 1;
    }
    TypeCase(binaryint, RiscvInstr::BinaryInt*, inst) {
        if (!binaryint->is_gp()) {
            if (binaryint->get_op() == RvBinaryOp::MUL)
                return 5;
            if (binaryint->get_op() == RvBinaryOp::DIV || binaryint->get_op() == RvBinaryOp::REM)
                return 17;
            return 3;
        }
        if (binaryint->get_op() == RvBinaryOp::MUL) 
            return 3;
        if (binaryint->get_op() == RvBinaryOp::DIV || binaryint->get_op() == RvBinaryOp::REM)
            return 11;
        return 1;
    }
    TypeCase(binary, RiscvInstr::Binary*, inst) {
        if (binary->get_op() == RvBinaryOp::MUL)
            return 3;
        return 1;
    }
    TypeCase(sltiu, RiscvInstr::SLTIU*, inst) {
        return 1;
    }
    TypeCase(binaryimm, RiscvInstr::BinaryImm*, inst) {
        return 1;
    }
    TypeCase(addimm, RiscvInstr::ADDImm*, inst) {
        return 1;
    }
    TypeCase(load, RiscvInstr::Load*, inst) {
        return 3;
    }
    TypeCase(loaddouble, RiscvInstr::LoadDouble*, inst) {
        return 3;
    }
    TypeCase(store, RiscvInstr::Store*, inst) {
        return 3;
    }
    TypeCase(storedouble, RiscvInstr::StoreDouble*, inst) {
        return 3;
    }
    TypeCase(call, RiscvInstr::Call*, inst) {
        return 0;
    }
    TypeCase(jump, RiscvInstr::Jump*, inst) {
        return 0;
    }
    TypeCase(branch, RiscvInstr::Branch*, inst) {
        return 0;
    }
    TypeCase(convert, RiscvInstr::Convert*, inst) {
        return 1;
    }
    TypeCase(ret, RiscvInstr::Return*, inst) {
        return 1;
    }
    TypeCase(sext, RiscvInstr::Sext*, inst) {
        return 1;
    }
    TypeCase(la, RiscvInstr::LoadLabelAddr*, inst) {
        return 1;
    }
    assert(false);
}

bool BasicBlock::construct(ir::BasicBlock *ir_bb, BasicBlock *exit_bb, Function *func, Program *prog) {
    bool jump_to_another_block = false;
    midend::ir::Instruction* last_inst = nullptr;
    // 遍历指令，映射到rv的MIR（未具体分配寄存器的rv代码）
    for(auto ir_instr : *ir_bb->get_insts()){
        // std::cout << ir_instr->to_str() << "\n";
        if (auto ir_assign = dynamic_cast<ir::instruction::Assign*>(ir_instr)) {
            // std::cout << "assign" << ir_assign->getsrc()->to_str() << " to " << ir_assign->get_dst()->to_str() << "\n";
            func->assigns[ir_assign->get_dst()] = ir_assign->get_src();
            const Reg dst = Reg(ir_assign->get_dst()->get_index(), false, ir_assign->get_dst()->get_type().is_gp());
            const Reg src = Reg(ir_assign->get_src()->get_index(), false, ir_assign->get_src()->get_type().is_gp());
            instrs_.push_back(new RiscvInstr::Move(dst, src));
        } else if (auto ir_loadimm = dynamic_cast<ir::instruction::LoadImm4*>(ir_instr)) {
            if (ir_loadimm->get_dst()->get_type().is_gp()) {
                const Reg dst = Reg(ir_loadimm->get_dst()->get_index());
                const int imm = ir_loadimm->get_imm().iv;
                instrs_.push_back(new RiscvInstr::LoadImm(dst, imm));
                func->constant_regs[dst] = imm;
                func->reg_val[dst] = imm;
            } else {
                const Reg dst = Reg(func->reg_n++);
                float imm = ir_loadimm->get_imm().fv;
                unsigned char *bytePointer = reinterpret_cast<unsigned char*>(&imm);
                unsigned int intValue = *reinterpret_cast<unsigned int*>(bytePointer);
                instrs_.push_back(new RiscvInstr::LoadImm(dst, intValue));
                const Reg dst_fp = Reg(ir_loadimm->get_dst()->get_index(), false, false);
                instrs_.push_back(new RiscvInstr::Move(dst_fp, dst));
                // func->constant_regs[dst] = intValue;
            }
        } else if (auto ir_unary = dynamic_cast<ir::instruction::Unary*>(ir_instr)) {
            Reg dst = Reg(ir_unary->get_dst()->get_index(), false, ir_unary->get_dst()->get_type().is_gp());
            auto idx_src = ir_unary->get_src()->get_index();
            if (func->assigns.count(ir_unary->get_src()))
                idx_src = func->assigns[ir_unary->get_src()]->get_index();
            Reg src = Reg(idx_src, false, ir_unary->get_src()->get_type().is_gp()); 
            if (func->constant_regs.count(src)) 
                if (func->constant_regs[src] == 0) {
                    src = ZERO;
                }
            if (ir_unary->get_type() == UnaryOp::Sub) {
                if (dst.is_gp())
                    instrs_.push_back(new RiscvInstr::Unary(RiscvInstr::RvUnaryOp::NEG, dst, src));
                else
                    instrs_.push_back(new RiscvInstr::Unary(RiscvInstr::RvUnaryOp::FNEGS, dst, src));
            } else if (ir_unary->get_type() == UnaryOp::Not) {
                if(src.is_gp())
                    instrs_.push_back(new RiscvInstr::SLTIU(dst, src, 1));
                else{
                    Reg new_reg = Reg(func->reg_n++, false, false);
                    instrs_.push_back(new RiscvInstr::Move(new_reg, ZERO));
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::FEQ, dst, src, new_reg));
                }
            } else {
                throw std::runtime_error("not supported unary op");
            }
        } else if (auto ir_min = dynamic_cast<ir::instruction::Maximum*>(ir_instr)) {
            std::cout << "max\n";
            Reg dst = Reg(ir_min->getdst()->get_index(), false, ir_min->getdst()->get_type().is_gp());
            auto lhs_idx = ir_min->getsrc1()->get_index();
            if (func->assigns.count(ir_min->getsrc1()))
                lhs_idx = func->assigns[ir_min->getsrc1()]->get_index();
            auto rhs_idx = ir_min->getsrc2()->get_index();
            if (func->assigns.count(ir_min->getsrc2()))
                rhs_idx = func->assigns[ir_min->getsrc2()]->get_index();
            Reg lhs = Reg(lhs_idx, false, ir_min->getsrc1()->get_type().is_gp());
            Reg rhs = Reg(rhs_idx, false, ir_min->getsrc2()->get_type().is_gp());
            if (func->constant_regs.count(lhs)) {
                if (func->constant_regs[lhs] == 0) {
                    lhs = ZERO;
                }
            }
            if (func->constant_regs.count(rhs)) {
                if (func->constant_regs[rhs] == 0) {
                    rhs = ZERO;
                }
            }
            instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::MAX, dst, lhs, rhs));
        } else if (auto ir_max = dynamic_cast<ir::instruction::Minimum*>(ir_instr)) {
            std::cout << "min\n";
            Reg dst = Reg(ir_max->getdst()->get_index(), false, ir_max->getdst()->get_type().is_gp());
            auto lhs_idx = ir_max->getsrc1()->get_index();
            if (func->assigns.count(ir_max->getsrc1()))
                lhs_idx = func->assigns[ir_max->getsrc1()]->get_index();
            auto rhs_idx = ir_max->getsrc2()->get_index();
            if (func->assigns.count(ir_max->getsrc2()))
                rhs_idx = func->assigns[ir_max->getsrc2()]->get_index();
            Reg lhs = Reg(lhs_idx, false, ir_max->getsrc1()->get_type().is_gp());
            Reg rhs = Reg(rhs_idx, false, ir_max->getsrc2()->get_type().is_gp());
            if (func->constant_regs.count(lhs)) {
                if (func->constant_regs[lhs] == 0) {
                    lhs = ZERO;
                }
            }
            if (func->constant_regs.count(rhs)) {
                if (func->constant_regs[rhs] == 0) {
                    rhs = ZERO;
                }
            }
            instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::MIN, dst, lhs, rhs));
        } else if (auto ir_binary = dynamic_cast<ir::instruction::Binary*>(ir_instr)) {
            Reg dst = Reg(ir_binary->getdst()->get_index(), false, ir_binary->getdst()->get_type().is_gp());
            auto lhs_idx = ir_binary->getlhs()->get_index();
            if (func->assigns.count(ir_binary->getlhs()))
                lhs_idx = func->assigns[ir_binary->getlhs()]->get_index();
            auto rhs_idx = ir_binary->getrhs()->get_index();
            if (func->assigns.count(ir_binary->getrhs()))
                rhs_idx = func->assigns[ir_binary->getrhs()]->get_index();
            Reg lhs = Reg(lhs_idx, false, ir_binary->getlhs()->get_type().is_gp());
            Reg rhs = Reg(rhs_idx, false, ir_binary->getrhs()->get_type().is_gp());
            if (func->constant_regs.count(lhs)) {
                if (func->constant_regs[lhs] == 0) {
                    lhs = ZERO;
                }
            }
            if (func->constant_regs.count(rhs)) {
                if (func->constant_regs[rhs] == 0) {
                    rhs = ZERO;
                }
            }
            if (ir_binary->get_type() == BinaryOp::Add) {
                if (lhs.is_gp()) {
                    if (ir_binary->getlhs()->get_type().is_array() || ir_binary->getrhs()->get_type().is_array()) {
                        instrs_.push_back(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::ADD, dst, lhs, rhs));
                    }
                    else {
                        if (lhs == rhs)
                            instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, dst, lhs, 1));
                        else 
                            instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, dst, lhs, rhs));
                    }
                }
                else
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::FADDS, dst, lhs, rhs));
            } else if (ir_binary->get_type() == BinaryOp::Sub) {
                if (lhs.is_gp())
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SUB, dst, lhs, rhs));
                else
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::FSUBS, dst, lhs, rhs));
            } else if (ir_binary->get_type() == BinaryOp::Mul) {
                if (lhs.is_gp())
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::MUL, dst, lhs, rhs));
                else
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::FMULS, dst, lhs, rhs));
            } else if (ir_binary->get_type() == BinaryOp::Div) {
                if (dst.is_gp())
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::DIV, dst, lhs, rhs));
                else
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::FDIVS, dst, lhs, rhs));
            } else if (ir_binary->get_type() == BinaryOp::Mod) {
                if (dst.is_gp())
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::REM, dst, lhs, rhs));
                else
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::FMODS, dst, lhs, rhs));
            } else if (ir_binary->get_type() == BinaryOp::Eq) {
                if (lhs.is_gp()) {
                    Reg new_reg = Reg(func->reg_n++);
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SUB, new_reg, lhs, rhs));
                    instrs_.push_back(new RiscvInstr::Unary(RiscvInstr::RvUnaryOp::SEQZ, dst, new_reg));
                }
                else
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::FEQ, dst, lhs, rhs));
            } else if (ir_binary->get_type() == BinaryOp::Neq) {
                if (lhs.is_gp()) {
                    Reg new_reg = Reg(func->reg_n++);
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SUB, new_reg, lhs, rhs));
                    instrs_.push_back(new RiscvInstr::Unary(RiscvInstr::RvUnaryOp::SNEZ, dst, new_reg));
                }
                else {
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::FEQ, dst, lhs, rhs));
                    instrs_.push_back(new RiscvInstr::Unary(RiscvInstr::RvUnaryOp::SEQZ, dst, dst));
                }
            } else if (ir_binary->get_type() == BinaryOp::Lt) {
                if (lhs.is_gp())
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SLT, dst, lhs, rhs));
                else
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::FLT, dst, lhs, rhs));
            } else if (ir_binary->get_type() == BinaryOp::Gt) {
                if (lhs.is_gp())
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SLT, dst, rhs, lhs));
                else
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::FLT, dst, rhs, lhs));
            } else if (ir_binary->get_type() == BinaryOp::Leq) {
                if (lhs.is_gp()) {
                    Reg new_reg = Reg(func->reg_n++);
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SLT, new_reg, rhs, lhs));
                    instrs_.push_back(new RiscvInstr::Unary(RiscvInstr::RvUnaryOp::SEQZ, dst, new_reg));
                }
                else
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::FLE, dst, lhs, rhs));
            } else if (ir_binary->get_type() == BinaryOp::Geq) {
                if (lhs.is_gp()) {
                    Reg new_reg = Reg(func->reg_n++);
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SLT, new_reg, lhs, rhs));
                    instrs_.push_back(new RiscvInstr::Unary(RiscvInstr::RvUnaryOp::SEQZ, dst, new_reg));
                }
                else 
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::FLE, dst, rhs, lhs));
            } else if (ir_binary->get_type() == BinaryOp::And) {
                instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::AND, dst, lhs, rhs));
            } else if (ir_binary->get_type() == BinaryOp::Or) {
                instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::OR, dst, lhs, rhs));
            } else if (ir_binary->get_type() == BinaryOp::Shr) {
                instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SRL, dst, lhs, rhs));
            } else if (ir_binary->get_type() == BinaryOp::Shl) {
                instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SLL, dst, lhs, rhs));
            }  else if (ir_binary->get_type() == BinaryOp::Ashl) {
                instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SAL, dst, lhs, rhs));
            } else {
                throw std::runtime_error("not supported binary op");
            }
        } else if (auto ir_binary = dynamic_cast<ir::instruction::BinaryImm*>(ir_instr)) {
            const Reg dst = Reg(ir_binary->getdst()->get_index(), false, ir_binary->getdst()->get_type().is_gp());
            auto lhs_idx = ir_binary->getlhs()->get_index();
            if (func->assigns.count(ir_binary->getlhs()))
                lhs_idx = func->assigns[ir_binary->getlhs()]->get_index();
            const Reg lhs = Reg(lhs_idx, false, ir_binary->getlhs()->get_type().is_gp());
            const int32_t rhs = ir_binary->getImm();
            if (ir_binary->get_type() == BinaryOp::Add) {
                if (lhs.is_gp()) {
                    if (rhs < 2048 && rhs >= -2048) {
                        if (ir_binary->getlhs()->get_type().is_array()) {
                            instrs_.push_back(new RiscvInstr::ADDImm(dst, lhs, rhs));
                        }
                        else {
                            instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::ADD, dst, lhs, rhs));
                        }
                    }
                    else {
                        Reg new_reg = Reg(func->reg_n++);
                        instrs_.push_back(new RiscvInstr::LoadImm(new_reg, rhs));
                        if (ir_binary->getlhs()->get_type().is_array()) {
                            instrs_.push_back(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::ADD, dst, lhs, new_reg));
                        }
                        else {
                            instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, dst, lhs, new_reg));
                        }
                    }
                }
            } 
            else if (ir_binary->get_type() == BinaryOp::And) {
                if (lhs.is_gp())
                    if (rhs < 2048 && rhs >= -2048)
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::AND, dst, lhs, rhs));
                    else {
                        Reg new_reg = Reg(func->reg_n++);
                        instrs_.push_back(new RiscvInstr::LoadImm(new_reg, rhs));
                        instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::AND, dst, lhs, new_reg));
                    }
            }
            else if (ir_binary->get_type() == BinaryOp::Mod) {
                if (lhs.is_gp()) {
                    int imm = log2(rhs+1);
                    Reg new_tmp = Reg(func->reg_n++);
                    Reg new_reg2 = Reg(func->reg_n++);
                    if(imm > 1){
                        Reg new_reg = Reg(func->reg_n++);
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRA, new_reg, lhs, 31));
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRL, new_reg2, new_reg, 32 - imm));
                        instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, new_tmp, lhs, new_reg2));
                    } else {
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRA, new_reg2, lhs, 31));
                        instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SUB, new_tmp, lhs, new_reg2));
                    }
                    Reg new_tmp2 = Reg(func->reg_n++);
                    if ((int)rhs < 2048 && (int)rhs >= -2048) {
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::AND, new_tmp2, new_tmp, rhs));
                    }
                    else {
                        Reg new_tmp3 = Reg(func->reg_n++);
                        instrs_.push_back(new RiscvInstr::LoadImm(new_tmp3, rhs));
                        instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::AND, new_tmp2, new_tmp, new_tmp3));
                    }
                    if (imm > 1)
                        instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SUB, dst, new_tmp2, new_reg2));
                    else 
                        instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, dst, new_tmp2, new_reg2));
                }
            }
            if (ir_binary->get_type() == BinaryOp::Or) {
                if (lhs.is_gp())
                    if (rhs < 2048 && rhs >= -2048)
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::OR, dst, lhs, rhs));
                    else {
                        instrs_.push_back(new RiscvInstr::LoadImm(dst, rhs));
                        instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::OR, dst, lhs, dst));
                    }
            } 
            else if (ir_binary->get_type() == BinaryOp::Mul) {
                if (lhs.is_gp()) {
                    int shift_amount = 0;
                    if (isPowerOfTwo(rhs)) {
                        shift_amount = log2(rhs);
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, dst, lhs, shift_amount));
                    }
                    else if (isPowerOfTwo(rhs+1)) {
                        shift_amount = log2(rhs+1);
                        Reg new_reg = Reg(func->reg_n++);
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg, lhs, shift_amount));
                        instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SUB, dst, new_reg, lhs));
                    }
                    else if (isPowerOfTwo(rhs-1)) {
                        shift_amount = log2(rhs-1);
                        Reg new_reg = Reg(func->reg_n++);
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg, lhs, shift_amount));
                        instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, dst, new_reg, lhs));
                    }
                    else {
                        bool solved = false;
                        int x = rhs;
                        while (x % 2 == 0) {
                            x >>= 1;
                            shift_amount++;
                        }
                        if (isPowerOfTwo(x+1)) {
                            int shift_amt = log2(x+1);
                            solved = true;
                            Reg new_reg = Reg(func->reg_n++);
                            Reg new_reg2 = Reg(func->reg_n++);
                            instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg, lhs, shift_amt));
                            instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SUB, new_reg2, new_reg, lhs));
                            instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, dst, new_reg2, shift_amount));
                        }
                        else if (isPowerOfTwo(x-1)) {
                            int shift_amt = log2(x-1);
                            solved = true;
                            Reg new_reg = Reg(func->reg_n++);
                            Reg new_reg2 = Reg(func->reg_n++);
                            instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg, lhs, shift_amt));
                            instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, new_reg2, new_reg, lhs));
                            instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, dst, new_reg2, shift_amount));
                        }
                        if (!solved) {
                            x = rhs + 1; 
                            shift_amount = 0;
                            while (x % 2 == 0) {
                                x >>= 1;
                                shift_amount++;
                            }
                            if (isPowerOfTwo(x+1)) {
                                int shift_amt = log2(x+1);
                                solved = true;
                                Reg new_reg = Reg(func->reg_n++);
                                Reg new_reg2 = Reg(func->reg_n++);
                                Reg new_reg3 = Reg(func->reg_n++);
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg, lhs, shift_amt));
                                instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SUB, new_reg2, new_reg, lhs));
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg3, new_reg2, shift_amount));
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::ADD, dst, new_reg3, -1));
                            }
                            else if (isPowerOfTwo(x-1)) {
                                int shift_amt = log2(x-1);
                                solved = true;
                                Reg new_reg = Reg(func->reg_n++);
                                Reg new_reg2 = Reg(func->reg_n++);
                                Reg new_reg3 = Reg(func->reg_n++);
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg, lhs, shift_amt));
                                instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, new_reg2, new_reg, lhs));
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg3, new_reg2, shift_amount));
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::ADD, dst, new_reg3, -1));
                            }
                        }
                        if (!solved) {
                            x = rhs - 1;
                            shift_amount = 0;
                            while (x % 2 == 0) {
                                x >>= 1;
                                shift_amount++;
                            }
                            if (isPowerOfTwo(x+1)) {
                                int shift_amt = log2(x+1);
                                Reg new_reg = Reg(func->reg_n++);
                                Reg new_reg2 = Reg(func->reg_n++);
                                Reg new_reg3 = Reg(func->reg_n++);
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg, lhs, shift_amt));
                                instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SUB, new_reg2, new_reg, lhs));
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg3, new_reg2, shift_amount));
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::ADD, dst, new_reg3, 1));
                            }
                            else if (isPowerOfTwo(x-1)) {
                                int shift_amt = log2(x-1);
                                Reg new_reg = Reg(func->reg_n++);
                                Reg new_reg2 = Reg(func->reg_n++);
                                Reg new_reg3 = Reg(func->reg_n++);
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg, lhs, shift_amt));
                                instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, new_reg2, new_reg, lhs));
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg3, new_reg2, shift_amount));
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::ADD, dst, new_reg3, 1));
                            }
                        }
                    }
                }
            } 
            else if (ir_binary->get_type() == BinaryOp::Div) {
                int imm = ir_binary->getImm();
                bool isDivisorNegative = imm < 0;
                Uint32 d = isDivisorNegative ? -imm : imm;
                int s = ctz(d);
                Multiplier multiplier = chooseMultiplier(d, N);

                if(multiplier.m < (Uint64(1) << N)) {
                    Reg new_reg = Reg(func->reg_n++);
                    Reg new_reg2 = Reg(func->reg_n++);
                    if (d == 3) {
                        Reg new_reg3 = Reg(func->reg_n++);
                        Reg new_reg4 = Reg(func->reg_n++);
                        Reg new_reg5 = Reg(func->reg_n++);
                        instrs_.push_back(new RiscvInstr::LoadImm(new_reg3, 700416));    
                        instrs_.push_back(new RiscvInstr::ADDImm(new_reg4, new_reg3, -1365));
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLLF, new_reg5, new_reg4, 12));
                        instrs_.push_back(new RiscvInstr::ADDImm(new_reg, new_reg5, -1365));
                    }
                    else if (multiplier.m < (Uint64(1) << (N - 1))) {
                        instrs_.push_back(new RiscvInstr::LoadImm(new_reg, multiplier.m));
                    }
                    else {
                        auto load_val = multiplier.m / 2;
                        auto offset = multiplier.m % 2;
                        Reg new_reg3 = Reg(func->reg_n++);
                        Reg new_reg4 = Reg(func->reg_n++);
                        instrs_.push_back(new RiscvInstr::LoadImm(new_reg3, load_val));    
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLLF, new_reg4, new_reg3, 1));
                        instrs_.push_back(new RiscvInstr::ADDImm(new_reg, new_reg4, offset));
                    }
                    Reg new_reg6 = Reg(func->reg_n++);
                    Reg new_reg7 = Reg(func->reg_n++);
                    instrs_.push_back(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::MUL, new_reg6, lhs, new_reg));
                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRAF, new_reg7, new_reg6, 32 + multiplier.l));
                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRL, new_reg2, lhs, 31));
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, dst, new_reg7, new_reg2));
                }
                else {
                    multiplier = chooseMultiplier(d >> s, N - s);
                    if (multiplier.m < (Uint64(1) << N)) {
                        // NOTE: this case is NOT covered by testcases, bug may remain, hopefully not
                        Reg new_reg = Reg(func->reg_n++);
                        Reg new_reg2 = Reg(func->reg_n++);
                        if (multiplier.m < (Uint64(1) << (N - 1))) {
                            instrs_.push_back(new RiscvInstr::LoadImm(new_reg, multiplier.m));
                        }
                        else {
                            auto load_val = multiplier.m / 2;
                            auto offset = multiplier.m % 2;
                            Reg new_reg3 = Reg(func->reg_n++);
                            Reg new_reg4 = Reg(func->reg_n++);
                            instrs_.push_back(new RiscvInstr::LoadImm(new_reg3, load_val));    
                            instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLLF, new_reg4, new_reg3, 1));
                            instrs_.push_back(new RiscvInstr::ADDImm(new_reg, new_reg4, offset));
                        }
                        Reg new_reg5 = Reg(func->reg_n++);
                        Reg new_reg6 = Reg(func->reg_n++);
                        Reg new_reg7 = Reg(func->reg_n++);
                        Reg new_reg8 = Reg(func->reg_n++);
                        instrs_.push_back(new RiscvInstr::Move(new_reg5, lhs));
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRA, new_reg6, new_reg5, s));
                        instrs_.push_back(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::MUL, new_reg7, new_reg6, new_reg));
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRAF, new_reg8, new_reg7, 32 + multiplier.l));
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRL, new_reg2, lhs, 31));
                        instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, dst, new_reg8, new_reg2));
                    }
                    else {
                        Reg new_reg = Reg(func->reg_n++);
                        Reg new_reg2 = Reg(func->reg_n++);
                        Reg new_reg3 = Reg(func->reg_n++);
                        auto load_value = multiplier.m - (Uint64(1) << N);
                        if (load_value < (Uint64(1) << (N - 1))) {
                            instrs_.push_back(new RiscvInstr::LoadImm(new_reg, load_value));
                        }
                        else {
                            auto load_val = load_value / 2;
                            auto offset = load_value % 2;
                            Reg new_reg3 = Reg(func->reg_n++);
                            Reg new_reg4 = Reg(func->reg_n++);
                            instrs_.push_back(new RiscvInstr::LoadImm(new_reg3, load_val));    
                            instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLLF, new_reg4, new_reg3, 1));
                            instrs_.push_back(new RiscvInstr::ADDImm(new_reg, new_reg4, offset));
                        }
                        Reg new_reg5 = Reg(func->reg_n++);
                        Reg new_reg6 = Reg(func->reg_n++);
                        Reg new_reg7 = Reg(func->reg_n++);
                        Reg new_reg8 = Reg(func->reg_n++);
                        instrs_.push_back(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::MUL, new_reg5, lhs, new_reg));
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRAF, new_reg6, new_reg5, 32));
                        instrs_.push_back(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::SUB, new_reg2, lhs, new_reg6));
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRAF, new_reg2, new_reg2, 1));
                        instrs_.push_back(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::ADD, new_reg7, new_reg2, new_reg6));
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRAF, new_reg8, new_reg7, multiplier.l - 1));
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRL, new_reg3, lhs, 31));
                        instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, dst, new_reg8, new_reg3));
                    }
                }
                if (isDivisorNegative) {
                    instrs_.push_back(new RiscvInstr::Unary(RiscvInstr::RvUnaryOp::NEG, dst, dst));
                }
            }
            else if (ir_binary->get_type() == BinaryOp::Shr) {
                if (lhs.is_gp()){
                    Reg new_reg = Reg(func->reg_n++);
                    if(rhs > 1){
                        Reg new_reg3 = Reg(func->reg_n++);
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRA, new_reg3, lhs, 31));
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRL, new_reg, new_reg3, 32 - rhs));
                    } else {
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRL, new_reg, lhs, 32 - rhs));
                    }
                    Reg new_reg2 = Reg(func->reg_n++);
                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, new_reg2, lhs, new_reg));
                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SRA, dst, new_reg2, rhs));
                }
            } 
        } else if (auto ir_label = dynamic_cast<ir::instruction::Label*>(ir_instr)) {
            instrs_.push_back(new RiscvInstr::RiscvLabel(ir_label->get_label()));
        } else if (auto ir_call = dynamic_cast<ir::instruction::Call*>(ir_instr)) {
            int gp_cnt = 0, fp_cnt = 0, stack_cnt = 0;
            Reg new_reg_to_save_imm = SP;
            for (int i = 0; i < ir_call->get_srcs().size(); ++i) {
                bool is_gp_reg = ir_call->get_srcs()[i]->get_type().is_gp();
                if (ir_call->get_srcs()[i]->get_type().is_array())
                    is_gp_reg = true;
                auto src_idx = ir_call->get_srcs()[i]->get_index();
                if (func->assigns.count(ir_call->get_srcs()[i]))
                    src_idx = func->assigns[ir_call->get_srcs()[i]]->get_index();
                Reg arg = Reg(src_idx, false, is_gp_reg);
                if (is_gp_reg) {
                    if (gp_cnt < RegArgCount) {
                        if (func->constant_regs.count(arg)) {
                            if (func->constant_regs[arg] == 0) {
                                arg = ZERO;
                            }
                        }
                        instrs_.push_back(new RiscvInstr::Move(*regs_arg[gp_cnt++], arg, true));
                    }
                    else {
                        gp_cnt++;
                        if(stack_cnt > 2047){
                            if(new_reg_to_save_imm == SP){
                                Reg old_reg = new_reg_to_save_imm;
                                new_reg_to_save_imm = Reg(func->reg_n++);
                                instrs_.push_back(new RiscvInstr::ADDImm(new_reg_to_save_imm, old_reg, 2047));
                            } else {
                                Reg new_reg2 = new_reg_to_save_imm;
                                new_reg_to_save_imm = Reg(func->reg_n++);
                                instrs_.push_back(new RiscvInstr::ADDImm(new_reg_to_save_imm, new_reg2, 2047));
                            }
                            instrs_.push_back(new RiscvInstr::StoreDouble(arg, new_reg_to_save_imm, stack_cnt - 2047, false));
                            stack_cnt = stack_cnt - 2047;
                        }
                        else{
                            instrs_.push_back(new RiscvInstr::StoreDouble(arg, new_reg_to_save_imm, stack_cnt, false));
                        }
                        stack_cnt += 8;
                    }
                } 
                else {
                    if (fp_cnt < FpRegArgCount) {
                        instrs_.push_back(new RiscvInstr::Move(*fp_regs_arg[fp_cnt++], arg, true));
                    }
                    else {
                        fp_cnt++;
                        if(stack_cnt > 2047){
                            if(new_reg_to_save_imm == SP){
                                Reg old_reg = new_reg_to_save_imm;
                                new_reg_to_save_imm = Reg(func->reg_n++);
                                instrs_.push_back(new RiscvInstr::ADDImm(new_reg_to_save_imm, old_reg, 2047));
                            } else {
                                instrs_.push_back(new RiscvInstr::ADDImm(new_reg_to_save_imm, new_reg_to_save_imm, 2047));
                            }
                            instrs_.push_back(new RiscvInstr::StoreDouble(arg, new_reg_to_save_imm, stack_cnt - 2047, false));
                            stack_cnt = stack_cnt - 2047;
                        }
                        else{
                            instrs_.push_back(new RiscvInstr::StoreDouble(arg, new_reg_to_save_imm, stack_cnt, false));
                        }
                        stack_cnt += 8;
                    }
                }
            }
            func->call_funcs.emplace_back(ir_call->getfunc()->get_name());
            instrs_.push_back(new RiscvInstr::Call(ir_call->getfunc()->get_name(), gp_cnt, fp_cnt));
            if(ir_call->getdst() != nullptr) {
                if (ir_call->getdst()->get_type().is_gp())
                    instrs_.push_back(new RiscvInstr::Move(Reg(ir_call->getdst()->get_index()), A0, true));
                else
                    instrs_.push_back(new RiscvInstr::Move(Reg(ir_call->getdst()->get_index(), false, false), FP10, true));
            }
        } else if (auto ir_branch = dynamic_cast<ir::instruction::Branch*>(ir_instr)) {
            if (!prog->bb_map.count(ir_branch->get_target())) {
                std::cout << "【ir_branch】"; ir_branch->print(std::cout);
            }
            assert(prog->bb_map.count(ir_branch->get_target()));
            instrs_.push_back(new RiscvInstr::Jump(prog->bb_map[ir_branch->get_target()]));
            func->add_edge(this, prog->bb_map[ir_branch->get_target()]);
            jump_to_another_block = true;
        } else if (auto ir_condbranch = dynamic_cast<ir::instruction::CondBranch*>(ir_instr)) {
            auto cond_idx = ir_condbranch->getcond()->get_index();
            if (func->assigns.count(ir_condbranch->getcond()))
                cond_idx = func->assigns[ir_condbranch->getcond()]->get_index();
            auto false_bb = ir_condbranch->get_false_bb();
            auto true_bb = ir_condbranch->get_true_bb();
            if (ir_condbranch->get_type() == ir::instruction::CondBranch::IR_Instr_BEQ_ONLY) {
                instrs_.push_back(new RiscvInstr::Branch(RiscvInstr::RvCompareOp::EQ, Reg(cond_idx), prog->bb_map[false_bb]));
                func->add_edge(this, prog->bb_map[false_bb]);
                jump_to_another_block = true;
                continue;
            }
            auto label = (ir_condbranch->get_type() == ir::instruction::CondBranch::IR_Instr_BEQ)
                    ?RiscvInstr::RvCompareOp::EQ : RiscvInstr::RvCompareOp::NE;
            if (!prog->bb_map.count(false_bb)) {
                std::cout << "【ir_condbranch】"; ir_condbranch->print(std::cout);
            }
            if (!prog->bb_map.count(true_bb)) {
                std::cout << "【ir_condbranch】"; ir_condbranch->print(std::cout);
            }
            assert(prog->bb_map.count(false_bb));
            assert(prog->bb_map.count(true_bb));
            bool is_float = false;
            if((*ir_instr->get_src())[0]->get_type().is_gp()){
                if (last_inst != nullptr) {
                    TypeCase (cmp, ir::instruction::Binary*, last_inst) {
                        if (!cmp->getlhs()->get_type().is_gp()) 
                            instrs_.push_back(new RiscvInstr::Branch(label, Reg(cond_idx), prog->bb_map[false_bb]));
                        else {
                            auto lhs_idx = cmp->getlhs()->get_index();
                            if (func->assigns.count(cmp->getlhs()))
                                lhs_idx = func->assigns[cmp->getlhs()]->get_index();
                            auto rhs_idx = cmp->getrhs()->get_index();
                            if (func->assigns.count(cmp->getrhs()))
                                rhs_idx = func->assigns[cmp->getrhs()]->get_index();
                            Reg lhs = Reg(lhs_idx, false, cmp->getlhs()->get_type().is_gp());
                            Reg rhs = Reg(rhs_idx, false, cmp->getrhs()->get_type().is_gp());
                            if (func->constant_regs.count(lhs)) {
                                if (func->constant_regs[lhs] == 0) {
                                    lhs = ZERO;
                                }
                            }
                            if (func->constant_regs.count(rhs)) {
                                if (func->constant_regs[rhs] == 0) {
                                    rhs = ZERO;
                                }
                            }
                            if (cmp->getdst() == ir_condbranch->getcond()) {
                                if (cmp->get_type() == BinaryOp::Lt) {
                                    if (ir_condbranch->get_type() == ir::instruction::CondBranch::IR_Instr_BNE) {
                                        instrs_.push_back(new RiscvInstr::Branch(RiscvInstr::RvCompareOp::BLT, lhs, rhs, prog->bb_map[false_bb]));
                                    }
                                    else {
                                        instrs_.push_back(new RiscvInstr::Branch(RiscvInstr::RvCompareOp::BGE, lhs, rhs, prog->bb_map[false_bb]));
                                    }
                                }
                                else if (cmp->get_type() == BinaryOp::Eq) {
                                    if (ir_condbranch->get_type() == ir::instruction::CondBranch::IR_Instr_BNE) {
                                        instrs_.push_back(new RiscvInstr::Branch(RiscvInstr::RvCompareOp::BEQ, lhs, rhs, prog->bb_map[false_bb]));
                                    }
                                    else {
                                        instrs_.push_back(new RiscvInstr::Branch(RiscvInstr::RvCompareOp::BNE, rhs, lhs, prog->bb_map[false_bb]));
                                    }
                                }
                                else if (cmp->get_type() == BinaryOp::Neq) {
                                    if (ir_condbranch->get_type() == ir::instruction::CondBranch::IR_Instr_BNE) {
                                        instrs_.push_back(new RiscvInstr::Branch(RiscvInstr::RvCompareOp::BNE, lhs, rhs, prog->bb_map[false_bb]));
                                    }
                                    else {
                                        instrs_.push_back(new RiscvInstr::Branch(RiscvInstr::RvCompareOp::BEQ, rhs, lhs, prog->bb_map[false_bb]));
                                    }
                                }
                                else if (cmp->get_type() == BinaryOp::Gt) {
                                    if (ir_condbranch->get_type() == ir::instruction::CondBranch::IR_Instr_BNE) {
                                        instrs_.push_back(new RiscvInstr::Branch(RiscvInstr::RvCompareOp::BGT, lhs, rhs, prog->bb_map[false_bb]));
                                    }
                                    else {
                                        instrs_.push_back(new RiscvInstr::Branch(RiscvInstr::RvCompareOp::BLE, lhs, rhs, prog->bb_map[false_bb]));
                                    }
                                }
                                else if (cmp->get_type() == BinaryOp::Geq) {
                                    if (ir_condbranch->get_type() == ir::instruction::CondBranch::IR_Instr_BNE) {
                                        instrs_.push_back(new RiscvInstr::Branch(RiscvInstr::RvCompareOp::BGE, lhs, rhs, prog->bb_map[false_bb]));
                                    }
                                    else {
                                        instrs_.push_back(new RiscvInstr::Branch(RiscvInstr::RvCompareOp::BLT, lhs, rhs, prog->bb_map[false_bb]));
                                    }
                                }
                                else if (cmp->get_type() == BinaryOp::Leq) {
                                    if (ir_condbranch->get_type() == ir::instruction::CondBranch::IR_Instr_BNE) {
                                        instrs_.push_back(new RiscvInstr::Branch(RiscvInstr::RvCompareOp::BLE, lhs, rhs, prog->bb_map[false_bb]));
                                    }
                                    else {
                                        instrs_.push_back(new RiscvInstr::Branch(RiscvInstr::RvCompareOp::BGT, lhs, rhs, prog->bb_map[false_bb]));
                                    }
                                }
                                else {
                                    instrs_.push_back(new RiscvInstr::Branch(label, Reg(cond_idx), prog->bb_map[false_bb]));
                                }
                            }
                            else {
                                instrs_.push_back(new RiscvInstr::Branch(label, Reg(cond_idx), prog->bb_map[false_bb]));
                            }
                        }
                    }
                    else 
                        instrs_.push_back(new RiscvInstr::Branch(label, Reg(cond_idx), prog->bb_map[false_bb]));
                }
                else 
                    instrs_.push_back(new RiscvInstr::Branch(label, Reg(cond_idx), prog->bb_map[false_bb]));
            } else {
                Reg new_reg = Reg(func->reg_n++, false, false);
                instrs_.push_back(new RiscvInstr::Move(new_reg, ZERO));
                Reg compare_reg = Reg(func->reg_n++, false, true);
                instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::FEQ, compare_reg, Reg(ir_condbranch->getcond()->get_index(), false, false), new_reg));
                auto new_label = (ir_condbranch->get_type() == ir::instruction::CondBranch::IR_Instr_BEQ)
                    ?RiscvInstr::RvCompareOp::NE : RiscvInstr::RvCompareOp::EQ;
                instrs_.push_back(new RiscvInstr::Branch(new_label, compare_reg, prog->bb_map[false_bb]));
            }
            instrs_.push_back(new RiscvInstr::Jump(prog->bb_map[true_bb]));
            func->add_edge(this, prog->bb_map[false_bb]);
            func->add_edge(this, prog->bb_map[true_bb]);
            jump_to_another_block = true;
        } else if (auto ir_return = dynamic_cast<ir::instruction::Return*>(ir_instr)) {
            if(ir_return->get_return_val() != nullptr) {
                auto cond_idx = ir_return->get_return_val()->get_index();
                if (func->assigns.count(ir_return->get_return_val()))
                    cond_idx = func->assigns[ir_return->get_return_val()]->get_index();
                if (ir_return->get_return_val()->get_type().is_gp()) 
                    instrs_.push_back(new RiscvInstr::Move(A0, Reg(cond_idx)));
                else
                    instrs_.push_back(new RiscvInstr::Move(FP10, Reg(cond_idx, false, false)));
            }
            instrs_.push_back(new RiscvInstr::Jump(exit_bb));
            func->add_edge(this, exit_bb);
            jump_to_another_block = true;
        } else if (auto ir_alloca = dynamic_cast<ir::instruction::Alloca*>(ir_instr)) {
            auto cond_idx = ir_alloca->get_addr()->get_index();
            func->reg_val[Reg(cond_idx)] = new StackObject{ir_alloca->get_size(), func->stack_objects_offset_map_[cond_idx]};
            if(func->stack_objects_offset_map_[cond_idx] > 2047 || func->stack_objects_offset_map_[cond_idx] < -2048){
                Reg new_reg = Reg(cond_idx);
                Reg new_reg_to_save_imm = Reg(func->reg_n++);
                instrs_.push_back(new RiscvInstr::LoadImm(new_reg_to_save_imm, func->stack_objects_offset_map_[cond_idx]));
                instrs_.push_back(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::ADD, new_reg, SP, new_reg_to_save_imm));
            }
            else{
                instrs_.push_back(new RiscvInstr::ADDImm(Reg(cond_idx), SP, func->stack_objects_offset_map_[cond_idx]));
            }
        } else if (auto ir_store = dynamic_cast<ir::instruction::Store*>(ir_instr)) {
            auto addr_idx = ir_store->get_addr()->get_index();
            if (func->assigns.count(ir_store->get_addr()))
                addr_idx = func->assigns[ir_store->get_addr()]->get_index();
            Reg addr = Reg(addr_idx);
            auto cond_idx = ir_store->get_src()->get_index();
            if (func->assigns.count(ir_store->get_src()))
                cond_idx = func->assigns[ir_store->get_src()]->get_index();
            Reg src = Reg(cond_idx, false, ir_store->get_src()->get_type().is_gp());
            if (func->constant_regs.count(src)) {
                if (func->constant_regs[src] == 0) {
                    src = ZERO;
                }
            }
            if(ir_store->get_offset() > 2047 || ir_store->get_offset() < -2048){
                Reg new_reg_to_save_imm = Reg(func->reg_n++);
                instrs_.push_back(new RiscvInstr::LoadImm(new_reg_to_save_imm, ir_store->get_offset()));
                instrs_.push_back(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::ADD, new_reg_to_save_imm, new_reg_to_save_imm, addr));
                instrs_.push_back(new RiscvInstr::Store(src, new_reg_to_save_imm, 0));
            }
            else{
                instrs_.push_back(new RiscvInstr::Store(src, addr, ir_store->get_offset()));
            }
        } else if (auto ir_load = dynamic_cast<ir::instruction::Load*>(ir_instr)) {
            const Reg dst = Reg(ir_load->get_dst()->get_index(), false, ir_load->get_dst()->get_type().is_gp());
            auto cond_idx = ir_load->get_addr()->get_index();
            if (func->assigns.count(ir_load->get_addr()))
                cond_idx = func->assigns[ir_load->get_addr()]->get_index();
            const Reg addr = Reg(cond_idx);
            // if (last_inst != nullptr) {
            //     TypeCase (st, ir::instruction::Store*, last_inst) {
            //         if (st->getaddr() == ir_load->getaddr() && st->getoffset() == ir_load->getoffset()) {
            //             func->assigns[ir_load->getdst()] = st->getsrc();
            //             continue;
            //         }
            //     }
            // }
            if(ir_load->get_offset() > 2047 || ir_load->get_offset() < -2048){
                Reg new_reg_to_save_imm = Reg(func->reg_n++);
                Reg new_addr = Reg(func->reg_n++);
                instrs_.push_back(new RiscvInstr::LoadImm(new_reg_to_save_imm, ir_load->get_offset()));
                instrs_.push_back(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::ADD, new_addr, new_reg_to_save_imm, addr));
                instrs_.push_back(new RiscvInstr::Load(dst, new_addr, 0));
            }
            else{
                instrs_.push_back(new RiscvInstr::Load(dst, addr, ir_load->get_offset()));
            }

        } else if (auto ir_loadaddr = dynamic_cast<ir::instruction::LoadAddr*>(ir_instr)) {
            const Reg dst = Reg(ir_loadaddr->get_addr()->get_index());
            func->reg_val[dst] = ir_loadaddr->get_name();
            instrs_.push_back(new RiscvInstr::LoadLabelAddr(dst, ir_loadaddr->get_name()));
        } else if (auto ir_elementptr = dynamic_cast<ir::instruction::ElementPtr*>(ir_instr)) {
            auto ir_srcs = *ir_elementptr->get_src();
            auto indices = std::vector<Temp*>(ir_srcs.begin() + 1, ir_srcs.end());
            auto dims = ir_elementptr->get_base()->get_type().dims;

            auto cond_idx = ir_elementptr->get_base()->get_index();
            if (func->assigns.count(ir_elementptr->get_base()))
                cond_idx = func->assigns[ir_elementptr->get_base()]->get_index();
            Reg base = Reg(cond_idx);

            int dim_size = 4;
            for(int i = dims.size() - 1; i >= 0; dim_size *= dims[i], i--){
                if (i >= indices.size()) continue;
                auto idx_indice = indices[i]->get_index();
                if (func->assigns.count(indices[i]))
                    idx_indice = func->assigns[indices[i]]->get_index();
                Reg index = Reg(idx_indice);
                Reg new_reg2 = (i == 0) ? Reg(ir_elementptr->get_dst()->get_index()) : Reg(func->reg_n++);
                if (func->constant_regs.count(index)) {
                    int offset = func->constant_regs[index] * dim_size;
                    if (offset < 2048) 
                        instrs_.push_back(new RiscvInstr::ADDImm(new_reg2, base, offset));
                    else {
                        Reg new_reg = Reg(func->reg_n++);
                        instrs_.push_back(new RiscvInstr::LoadImm(new_reg, offset));
                        instrs_.push_back(new RiscvInstr::Binary(RvBinaryOp::ADD, new_reg2, new_reg, base));
                    }
                }
                else {
                    Reg new_reg = Reg(func->reg_n++);
                    if (isPowerOfTwo(dim_size)) {
                        instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLLF, new_reg, index, log2(dim_size)));
                    }
                    else {
                        int shift_amount = 0;
                        if (isPowerOfTwo(dim_size)) {
                            shift_amount = log2(dim_size);
                            instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg, index, shift_amount));
                        }
                        else if (isPowerOfTwo(dim_size+1)) {
                            shift_amount = log2(dim_size+1);
                            Reg new_rega = Reg(func->reg_n++);
                            instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_rega, index, shift_amount));
                            instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SUB, new_reg, new_rega, index));
                        }
                        else if (isPowerOfTwo(dim_size-1)) {
                            shift_amount = log2(dim_size-1);
                            Reg new_rega = Reg(func->reg_n++);
                            instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_rega, index, shift_amount));
                            instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, new_reg, new_rega, index));
                        }
                        else {
                            bool solved = false;
                            int x = dim_size;
                            while (x % 2 == 0) {
                                x >>= 1;
                                shift_amount++;
                            }
                            if (isPowerOfTwo(x+1)) {
                                int shift_amt = log2(x+1);
                                solved = true;
                                Reg new_rega = Reg(func->reg_n++);
                                Reg new_rega2 = Reg(func->reg_n++);
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_rega, index, shift_amt));
                                instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SUB, new_rega2, new_rega, index));
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg, new_rega2, shift_amount));
                            }
                            else if (isPowerOfTwo(x-1)) {
                                int shift_amt = log2(x-1);
                                solved = true;
                                Reg new_rega = Reg(func->reg_n++);
                                Reg new_rega2 = Reg(func->reg_n++);
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_rega, index, shift_amt));
                                instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, new_rega2, new_rega, index));
                                instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_reg, new_rega2, shift_amount));
                            }
                            if (!solved) {
                                x = dim_size + 1; 
                                shift_amount = 0;
                                while (x % 2 == 0) {
                                    x >>= 1;
                                    shift_amount++;
                                }
                                if (isPowerOfTwo(x+1)) {
                                    int shift_amt = log2(x+1);
                                    solved = true;
                                    Reg new_rega = Reg(func->reg_n++);
                                    Reg new_rega2 = Reg(func->reg_n++);
                                    Reg new_rega3 = Reg(func->reg_n++);
                                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_rega, index, shift_amt));
                                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SUB, new_rega2, new_rega, index));
                                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_rega3, new_rega2, shift_amount));
                                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::ADD, new_reg, new_rega3, -1));
                                }
                                else if (isPowerOfTwo(x-1)) {
                                    int shift_amt = log2(x-1);
                                    solved = true;
                                    Reg new_rega = Reg(func->reg_n++);
                                    Reg new_rega2 = Reg(func->reg_n++);
                                    Reg new_rega3 = Reg(func->reg_n++);
                                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_rega, index, shift_amt));
                                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, new_rega2, new_rega, index));
                                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_rega3, new_rega2, shift_amount));
                                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::ADD, new_reg, new_rega3, -1));
                                }
                            }
                            if (!solved) {
                                x = dim_size - 1;
                                shift_amount = 0;
                                while (x % 2 == 0) {
                                    x >>= 1;
                                    shift_amount++;
                                }
                                if (isPowerOfTwo(x+1)) {
                                    int shift_amt = log2(x+1);
                                    Reg new_rega = Reg(func->reg_n++);
                                    Reg new_rega2 = Reg(func->reg_n++);
                                    Reg new_rega3 = Reg(func->reg_n++);
                                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_rega, index, shift_amt));
                                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::SUB, new_rega2, new_rega, index));
                                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_rega3, new_rega2, shift_amount));
                                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::ADD, new_reg, new_rega3, 1));
                                }
                                else if (isPowerOfTwo(x-1)) {
                                    int shift_amt = log2(x-1);
                                    Reg new_rega = Reg(func->reg_n++);
                                    Reg new_rega2 = Reg(func->reg_n++);
                                    Reg new_rega3 = Reg(func->reg_n++);
                                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_rega, index, shift_amt));
                                    instrs_.push_back(new RiscvInstr::BinaryInt(RiscvInstr::RvBinaryOp::ADD, new_rega2, new_rega, index));
                                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::SLL, new_rega3, new_rega2, shift_amount));
                                    instrs_.push_back(new RiscvInstr::BinaryImm(RiscvInstr::RvBinaryOp::ADD, new_reg, new_rega3, 1));
                                }
                            }
                            if (!solved) {
                                Reg size_reg = Reg(func->reg_n++);
                                instrs_.push_back(new RiscvInstr::LoadImm(size_reg, dim_size));
                                instrs_.push_back(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::MUL, new_reg, size_reg, index));
                            }
                        }
                    }
                    instrs_.push_back(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::ADD, new_reg2, new_reg, base));
                }
                base = new_reg2;
            }
        } else if (auto ir_phi = dynamic_cast<ir::instruction::Phi*>(ir_instr)) {
            assert(true);
        } else if (auto ir_cast = dynamic_cast<ir::instruction::Cast*>(ir_instr)) {
            const Reg dst = Reg(ir_cast->getdst()->get_index(), false, ir_cast->getdst()->get_type().is_gp());
            auto cond_idx = ir_cast->getsrc()->get_index();
            if (func->assigns.count(ir_cast->getsrc()))
                cond_idx = func->assigns[ir_cast->getsrc()]->get_index();
            const Reg src = Reg(cond_idx, false, ir_cast->getsrc()->get_type().is_gp());
            instrs_.push_back(new RiscvInstr::Convert(dst, src));
        } else {
            assert(false);
        }
        last_inst = ir_instr;
    }

    // gen_asm(std::cout);
    // return jump_to_another_block;

    // fold store zero
    auto prevStore = instrs_.end();
    for(auto iter = instrs_.begin(); iter != instrs_.end(); ++iter) {
        // 检查是把x0当作目的寄存器了
        auto isStoreZero = [&](Instr* inst) {
            TypeCase (st, RiscvInstr::Store*, inst) {
                if (st->get_src() == ZERO)
                    return true;
            }
            return false;
        };

        auto& inst = *iter;
        TypeCase (ld, RiscvInstr::Load*, inst) {
            prevStore = instrs_.end();
            continue;
        }
        TypeCase (call, RiscvInstr::Call*, inst) {
            prevStore = instrs_.end();
            continue;
        }
        TypeCase (br, RiscvInstr::Branch*, inst) {
            prevStore = instrs_.end();
            continue;
        }
        TypeCase (jmp, RiscvInstr::Jump*, inst) {
            prevStore = instrs_.end();
            continue;
        }

        TypeCase (st, RiscvInstr::Store*, inst) {
            if (prevStore == instrs_.end()) {
                prevStore = iter;
                continue;
            }
            auto prevIter = prevStore;
            auto& prevInst = *prevStore;
            prevStore = iter;

            if (isStoreZero(prevInst) && isStoreZero(inst)) {
                auto prev_st = dynamic_cast<RiscvInstr::Store*>(prevInst);
                auto st = dynamic_cast<RiscvInstr::Store*>(inst);
                auto prevBase = prev_st->get_base();
                auto base = st->get_base();
                if (!(prevBase == base)) continue;
                auto prevOffset = prev_st->get_offset();
                auto offset = st->get_offset();
                if (prevOffset + 4 != offset) continue;
                auto new_st = new RiscvInstr::StoreDouble(ZERO, base, prevOffset);
                *iter = new_st;
                instrs_.erase(prevIter);
                prevStore = instrs_.end();
            }
        }
    }

    this->gen_asm(out_log);

    if (instrs_.size() >= 5000)
        return jump_to_another_block;
    
    if (instrs_.size() == 201)
        return jump_to_another_block;

    auto tic = std::chrono::steady_clock::now();

    Instr* last = instrs_.back();
    TypeCase (br, RiscvInstr::Jump*, last)
        instrs_.pop_back();

    std::list<Instr*> final_insts;
    std::map<OperationType, int> OPScheudle[2];
    std::vector<std::pair<int, Instr*>> ready, active;
    std::vector<Instr*> load_stores, on_stack, current_handles;

    std::map<OperationType, int> OPweight;
    OPweight[IntALU] = 2;
    OPweight[IntMULALU] = 2;
    OPweight[IntDIVALU] = 2;
    OPweight[FloatALU] = 2;
    OPweight[FloatMULALU] = 2;
    OPweight[FloatDIVALU] = 2;
    OPweight[StoreUnit] = 2;
    OPweight[LoadUnit] = 2;
    OPweight[BranchUnit] = 0;
    OPweight[LiUnit] = 2;

    std::map<Reg, int> sp_offsets;

    auto inst = instrs_.begin(); // call may load/store, so must keep order
    auto prev_inst = instrs_.begin();
    int idx = 0, prev_idx = 0, inst_cnt = 0;
    int debug_lines = 0;
    // if (name_ == ".L7") debug_lines = 0;
    while (inst != instrs_.end()) {
        // 1. compute dependency graph of Instrs 
        inst = prev_inst;
        idx = prev_idx;
        current_handles.clear();
        // std::cout << "clear\n";
        while (true) {
            if (inst == instrs_.end()) break;
            TypeCase (call, RiscvInstr::Call*, *inst) {
                if (prev_inst != inst) {
                    prev_inst = inst;
                    prev_idx = idx;
                    break;
                }
            }
            TypeCase (br, RiscvInstr::Branch*, *inst) {
                if (prev_inst != inst) {
                    prev_inst = inst;
                    prev_idx = idx;
                    break;
                }
            }
            bool use_standard = false;
            for (auto d: (*inst)->def_reg()) {
                if (d.is_standard() && !(d == ZERO)) {
                    use_standard = true;
                    break;
                }
            }
            if (use_standard) {
                if (prev_inst != inst) {
                    prev_inst = inst;
                    prev_idx = idx;
                    break;
                }
            }
            bool has_conflict = false;
            (*inst)->latency = get_latency(*inst);
            (*inst)->type = get_type(*inst);
            (*inst)->rely_count = 0;
            if ((*inst)->type == LoadUnit || (*inst)->type == StoreUnit) {
                load_stores.push_back(*inst); // Store/Load must be in order 
            }
            current_handles.push_back(*inst);
            // std::cout << "add "; (*inst)->gen_asm(std::cout);
            int pid = prev_idx;
            for (auto prev = prev_inst; prev != inst; prev++) {
                bool conflict = false;
                if ((*prev)->def_reg().size() > 0) {
                    // RAW conflict
                    for (auto u: (*inst)->use_reg()) {
                        for (auto d: (*prev)->def_reg()) {
                            if ((u == d) && (!conflict)) {
                                has_conflict = true; conflict = true;
                                (*inst)->edges_out.insert({pid, *prev});
                                (*prev)->edges_in.insert({idx, *inst});
                                (*inst)->rely_count++;
                            }
                        }
                    }
                    if (!conflict) {
                        // WAW confict (for Call)
                        for (auto de: (*inst)->def_reg()) {
                            for (auto d: (*prev)->def_reg()) {
                                if ((de == d) && (!conflict)) {
                                    has_conflict = true; conflict = true;
                                    (*inst)->edges_out.insert({pid, *prev});
                                    (*prev)->edges_in.insert({idx, *inst});
                                    (*inst)->rely_count++;
                                }
                            }
                        }
                    }
                    if (!conflict) {
                        // WAR confict (for a0, etc.)
                        for (auto d: (*inst)->def_reg()) {
                            for (auto u: (*prev)->use_reg()) {
                                if ((d == u) && (!conflict)) {
                                    has_conflict = true; conflict = true;
                                    (*inst)->edges_out.insert({pid, *prev});
                                    (*prev)->edges_in.insert({idx, *inst});
                                    (*inst)->rely_count++;
                                    continue;
                                }
                            }
                        }
                    }
                }
                pid++;
            }
            if (!has_conflict) {
                ready.push_back({idx, *inst});
            }
            inst++; idx++;
        }

        std::vector<Instr*> vis;  
        for (auto c: current_handles) {
            c->temp = c->rely_count;
            if (c->rely_count == 0) {
                c->cost = c->latency;
                vis.push_back(c);
            }
        }
        while (!vis.empty()) {
            Instr* n = vis.back();
            vis.pop_back();
            for (auto &t: n->edges_out) {
                (t.second)->cost = std::max((t.second)->cost, (t.second)->latency + n->cost);
                (t.second)->temp--;
                if ((t.second)->temp == 0) 
                    vis.push_back(t.second);
            }
        }

        int cycle = 1;
        for (int i = 0; i < 2; i++) {
            OPScheudle[i][IntALU] = 0;
            OPScheudle[i][IntMULALU] = 0;
            OPScheudle[i][IntDIVALU] = 0;
            OPScheudle[i][FloatALU] = 0;
            OPScheudle[i][FloatMULALU] = 0;
            OPScheudle[i][FloatDIVALU] = 0;
            OPScheudle[i][StoreUnit] = 0;
            OPScheudle[i][LoadUnit] = 0;
            OPScheudle[i][BranchUnit] = 0;
            OPScheudle[i][LiUnit] = 0;
        }
        OPScheudle[1][StoreUnit] = 1e9;
        OPScheudle[1][LoadUnit] = 1e9;

        // 2. visit from root and do scheduling
        int inst_size = ready.size();
        // std::cout << current_handles.size() << "\n";
        while ((current_handles.size() != inst_size) || (!ready.empty()) || (!active.empty())) {
            for (auto a = active.begin(); a != active.end();) {
                // std::cout << "cycle " << cycle << " , active "; (*a).second->gen_asm(std::cout);
                if ((*a).second->start_time + (*a).second->latency <= cycle) {
                    // finished execution
                    // std::cout << "cycle " << cycle << " , finished "; (*a).second->gen_asm(std::cout);
                    for (auto s = (*a).second->edges_in.begin(); s != (*a).second->edges_in.end(); s++) {
                        // instrs that depend on a
                        (*s).second->rely_count--;
                        // if (std::find(current_handles.begin(), current_handles.end(), (*s).second) == current_handles.end()) continue;
                        // (*s).second->gen_asm(std::cout); std::cout << "rely_count " << (*s).second->rely_count << "\n";
                        if ((*s).second->rely_count == 0) {
                            ready.push_back(*s);
                            inst_size += 1;
                            // std::cout  << "cycle " << cycle << ", ready instert "; (*s).second->gen_asm(std::cout);
                        }
                    }
                    a = active.erase(a);
                } else 
                    a++;
            }
            if (!ready.empty()) {
                auto r_inst = ready.end();
                int sched_alu = 0;
                TypeCase (call, RiscvInstr::Call*, ready.front().second) {
                    r_inst = ready.begin();
                }
                else TypeCase (br, RiscvInstr::Branch*, ready.front().second) {
                    r_inst = ready.begin();
                }
                else {
                    // choose an Instr to schedule
                    float max_schedule_cost = -1e30;
                    for (auto r = ready.begin(); r != ready.end(); r++) {
                        if ((*r).second->type == LoadUnit || (*r).second->type == StoreUnit) {
                            if ((*r).second != load_stores.front()) continue;
                        }
                        int chosen_alu = -1;
                        for (int i = 0; i < 2; i++) {
                            if (OPScheudle[i][(*r).second->type] >= cycle)
                                continue;
                            else {
                                chosen_alu = i; break;
                            }
                        }
                        if (chosen_alu == -1) continue;
                        if ((*r).second->cost > max_schedule_cost) {
                            max_schedule_cost = (*r).second->cost;
                            r_inst = r;
                            sched_alu = chosen_alu;
                        }
                    }
                }
                if (r_inst != ready.end()) {
                    if ((*r_inst).second->type == LoadUnit || (*r_inst).second->type == StoreUnit) {
                        if ((!load_stores.empty()) && (*r_inst).second == load_stores.front())
                            load_stores.erase(load_stores.begin());
                        // else if ((!on_stack.empty()) && (*r_inst).second == on_stack.front())
                        //     on_stack.erase(on_stack.begin());
                    }
                    OPScheudle[sched_alu][(*r_inst).second->type] = std::min(cycle, OPScheudle[sched_alu].at((*r_inst).second->type)) + (*r_inst).second->latency;
                    (*r_inst).second->start_time = std::min(cycle, OPScheudle[sched_alu].at((*r_inst).second->type));
                    active.push_back(*r_inst);
                    final_insts.push_back((*r_inst).second);
                    // std::cout << "cycle " << cycle << ", schedule "; (*r_inst).second->gen_asm(std::cout);
                    ready.erase(r_inst);
                }
            }
            cycle++;
        }
        std::cout << final_insts.size() << "\n";
    }



    // std::cout << name_ << " after scheduling \n";
    // for (auto inst = final_insts.begin(); inst != final_insts.end(); inst++)
    //     (*inst)->gen_asm(std::cout);
    
    assert(instrs_.size() == final_insts.size());
    instrs_ = final_insts;
    TypeCase (br, RiscvInstr::Jump*, last)
        instrs_.push_back(last);

    this->gen_asm(out_log2);
    // if (name_ == ".L7") {

    // auto toc = std::chrono::steady_clock::now();
    // std::cout << "pipelining takes ";
    // double duration_second = std::chrono::duration<double>(toc - tic).count();
    // std::cout << duration_second << " seconds" << std::endl;
    // std::cout << "???\n";
    return jump_to_another_block;
}


void BasicBlock::gen_asm(std::ostream &out){
    if(label_used) out << name_ << ":\n";

    for (auto instr_it = instrs_.begin(); instr_it != instrs_.end(); instr_it++){
        (*instr_it)->gen_asm(out);
    }
}


Function::Function(Program *prog, ir::Function *ir_func): name_(ir_func->get_name()), reg_n(ir_func->get_temp_used()), stack_object_size_(0), stack_spill_size_(0) {
    this->call_funcs.clear();
    CFG* cfg = new CFG(ir_func);
    // midend::LoopAnalysis* la = new midend::LoopAnalysis(cfg);

    // construct entry bb
    BasicBlock* entry_bb = new BasicBlock(".entry_" + name_);
    entry_bb->set_label_used(true);
    int gp_cnt = 0, fp_cnt = 0, stack_cnt = 0;
    Reg new_reg_to_save_imm = FP;

    // pass args into this function, arg num can be very big
    for (int i = 0; i < ir_func->get_argument_num(); ++i) {
        bool is_gp = (*ir_func->get_arg_temp())[i]->get_type().is_gp();
        if ((*ir_func->get_arg_temp())[i]->get_type().is_array())
            is_gp = true;
        if (is_gp) {
            if (gp_cnt < RegArgCount) {
                entry_bb->get_instr()->push_back(new RiscvInstr::Move(Reg((*ir_func->get_arg_temp())[i]->get_index()), *regs_arg[gp_cnt++]));
            } else {
                if(stack_cnt > 2047){
                    if(new_reg_to_save_imm == FP){
                        Reg old_reg = new_reg_to_save_imm;
                        new_reg_to_save_imm = Reg(this->reg_n++);
                        entry_bb->get_instr()->push_back(new RiscvInstr::ADDImm(new_reg_to_save_imm, old_reg, 2047));
                    } else {
                        entry_bb->get_instr()->push_back(new RiscvInstr::ADDImm(new_reg_to_save_imm, new_reg_to_save_imm, 2047));
                    }
                    entry_bb->get_instr()->push_back(new RiscvInstr::LoadDouble(Reg((*ir_func->get_arg_temp())[i]->get_index()), new_reg_to_save_imm, stack_cnt - 2047));
                    stack_cnt = stack_cnt - 2047;
                }
                else{
                    entry_bb->get_instr()->push_back(new RiscvInstr::LoadDouble(Reg((*ir_func->get_arg_temp())[i]->get_index()), new_reg_to_save_imm, stack_cnt));
                }
                stack_cnt += 8;
            }
        }
        else {
            if (fp_cnt < FpRegArgCount) {
                entry_bb->get_instr()->push_back(new RiscvInstr::Move(Reg((*ir_func->get_arg_temp())[i]->get_index(), false, false), *fp_regs_arg[fp_cnt++]));
            } else {
                if(stack_cnt > 2047){
                    if(new_reg_to_save_imm == FP){
                        Reg old_reg = new_reg_to_save_imm;
                        new_reg_to_save_imm = Reg(this->reg_n++);
                        entry_bb->get_instr()->push_back(new RiscvInstr::ADDImm(new_reg_to_save_imm, old_reg, 2047));
                    } else {
                        entry_bb->get_instr()->push_back(new RiscvInstr::ADDImm(new_reg_to_save_imm, new_reg_to_save_imm, 2047));
                    }
                    entry_bb->get_instr()->push_back(new RiscvInstr::LoadDouble(Reg((*ir_func->get_arg_temp())[i]->get_index(), false, false), new_reg_to_save_imm, stack_cnt - 2047));
                    stack_cnt = stack_cnt - 2047;
                }
                else{
                    entry_bb->get_instr()->push_back(new RiscvInstr::LoadDouble(Reg((*ir_func->get_arg_temp())[i]->get_index(), false, false), new_reg_to_save_imm, stack_cnt));
                }
                stack_cnt += 8;
            }
        }
    }
    bbs.push_back(std::move(entry_bb));

    // construct exit bb
    BasicBlock* exit_bb = new BasicBlock(".exit_" + name_);
    exit_bb->set_label_used(true);

    entry_bb->get_instr()->push_front(new RiscvInstr::LoadImm(Reg(this->reg_n++), 0));
    entry_bb->get_instr()->push_front(new RiscvInstr::LoadImm(Reg(this->reg_n++), 0));

    exit_bb->get_instr()->push_back(new RiscvInstr::Return(ir_func->has_return_type(), ir_func->get_ret_type().base_type != ScalarType::Float));
    exit_bb->get_instr()->push_front(new RiscvInstr::LoadImm(Reg(this->reg_n++), 0));
    exit_bb->get_instr()->push_front(new RiscvInstr::LoadImm(Reg(this->reg_n++), 0));

    // ir_func->print(std::cout); std::cout << "---\n";
    // construct other bbs, analyzing loop level meantime
    for(auto bb : *ir_func->get_basic_blocks()) {
        BasicBlock* new_bb = new BasicBlock(".L" + std::to_string(prog->bb_num++));
        new_bb->set_label_used(true);
        // if (la->get_loop(bb) != nullptr) {
        //     new_bb->loop_level = la->get_loop_depth(bb);
        // }
        prog->bb_map[bb] = new_bb;
        bbs.push_back(std::move(new_bb));
    }
    auto prev_entry = prog->bb_map[ir_func->get_basic_blocks()->front()];
    add_edge(entry_bb, prev_entry);
    bbs.push_back(std::move(exit_bb));

    // analyze stack object size including alloca space and call arg space (one pass)
    bool is_call_instr_exist_ = false;
    int max_call_args_size = 0;
    for(auto bb : *ir_func->get_basic_blocks()) {
        for (auto ir_instr : *bb->get_insts()) {
            if (auto ir_alloca = dynamic_cast<ir::instruction::Alloca*>(ir_instr)) {
                stack_objects_offset_map_[ir_alloca->get_addr()->get_index()] = stack_object_size_;
                stack_object_size_ += ir_alloca->get_size();
            } else if (auto ir_call = dynamic_cast<ir::instruction::Call*>(ir_instr)) {
                is_call_instr_exist_ = true;
                max_call_args_size = ((ir_call->get_srcs()).size() > max_call_args_size) ? (ir_call->get_srcs()).size() : max_call_args_size;
            }
        }
    }
    if(max_call_args_size > RegArgCount) {
        stack_object_size_ += 8 * (max_call_args_size - RegArgCount);
        for(auto it = stack_objects_offset_map_.begin(); it != stack_objects_offset_map_.end(); it++){
            it->second += 8 * (max_call_args_size - RegArgCount);
        }
    }
    stack_reg_size_ = RegCalleeSavedCount;
    if (is_call_instr_exist_) stack_reg_size_ += RegCallerSavedCount * 8;

    // construct basic block instructions
    for(auto it = (*ir_func->get_basic_blocks()).begin(); it != (*ir_func->get_basic_blocks()).end(); it++) {
        auto bb = *it;
        if(!prog->bb_map[bb]->construct(bb, exit_bb, this, prog) && std::next(it) != (*ir_func->get_basic_blocks()).end()){
            this->add_edge(prog->bb_map[bb], prog->bb_map[(*std::next(it))]);
        }
    }

    // delete useless insts
    std::map<Reg, std::unordered_set<std::pair<BasicBlock*, Instr*>>> use_sets;
    std::map<Reg, std::unordered_set<std::pair<BasicBlock*, Instr*>>> def_sets;
    while (true) {
        int bbs_size = bbs.size();
        bool change = false;
        use_sets.clear(); def_sets.clear();
        for (int i = 1; i < bbs_size - 1; i++) {
            auto bb = bbs[i];
            for (auto insn: *bb->get_instr()) {
                // insn->gen_asm(std::cout);
                for (auto use : insn->use_reg()) {
                    use_sets[use].insert({bb, insn});
                }
                for (auto def : insn->def_reg()) {
                    def_sets[def].insert({bb, insn});
                }
            }
        }
        for (auto d: def_sets) {
            if ((!(d.first).is_standard()) && (!use_sets.count(d.first))) {
                change = true;
                auto pair = *d.second.begin();
                // std::cout << "remove"; (pair.second)->gen_asm(std::cout);
                (pair.first)->get_instr()->remove(pair.second);
            }
        }
        if (!change) break;
    }


}

void Function::update_entry_exit_bb() {
     // insert and update instructions in entry and exit bb
    stack_reg_size_ = callee_saved_used.size() * 8;
    int bbs_size = bbs.size();

    if(stack_reg_size_ + stack_spill_size_ + stack_object_size_ < 2047) {
        bbs[0]->get_instr()->pop_front();
        bbs[0]->get_instr()->pop_front();
        for (int i = 0; i < this->callee_saved_used.size(); i++){
            bbs[0]->add_instr(new RiscvInstr::StoreDouble(this->callee_saved_used[i], SP, i * 8 - stack_reg_size_ - stack_spill_size_), 0);
        }
        bbs[0]->add_instr(new RiscvInstr::ADDImm(SP, SP, -(stack_reg_size_ + stack_spill_size_ + stack_object_size_ + 7)/8 * 8), this->callee_saved_used.size());
        bbs[0]->add_instr(new RiscvInstr::ADDImm(FP, SP, (stack_reg_size_ + stack_spill_size_ + stack_object_size_ + 7)/8*8), this->callee_saved_used.size() + 1);
        
        bbs[bbs_size - 1]->get_instr()->pop_front();
        bbs[bbs_size - 1]->get_instr()->pop_front();
        bbs[bbs_size - 1]->get_instr()->push_front(new RiscvInstr::ADDImm(SP, SP, (stack_reg_size_ + stack_spill_size_ + stack_object_size_ + 7)/8*8));
        for (int i = 0; i < this->callee_saved_used.size(); i++){
            bbs[bbs_size - 1]->add_instr(new RiscvInstr::LoadDouble(this->callee_saved_used[i], SP, i * 8 - stack_reg_size_ - stack_spill_size_), 1);
        }
    } else if(stack_reg_size_ + stack_spill_size_ < 2047) {
        bbs[0]->get_instr()->pop_front();
        auto front_dst_reg = bbs[0]->get_instr(0)->def_reg()[0];
        if(auto loadimm = dynamic_cast<RiscvInstr::LoadImm*>(bbs[0]->get_instr(0))){
            auto size = (stack_object_size_ + stack_reg_size_ + stack_spill_size_ + 7)/8 * 8;
            loadimm->update_imm(size);
        } else {
            assert(false);
        }
        for (int i = 0; i < this->callee_saved_used.size(); i++){
            bbs[0]->add_instr(new RiscvInstr::StoreDouble(this->callee_saved_used[i], SP, i * 8 - stack_reg_size_ - stack_spill_size_), 0);
        }
        bbs[0]->add_instr(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::SUB, SP, SP, front_dst_reg), this->callee_saved_used.size() + 1);
        bbs[0]->add_instr(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::ADD, FP, SP, front_dst_reg), this->callee_saved_used.size() + 2);

        bbs[bbs_size - 1]->get_instr()->pop_front();
        front_dst_reg = bbs[bbs_size - 1]->get_instr(0)->def_reg()[0];
        if(auto loadimm = dynamic_cast<RiscvInstr::LoadImm*>(bbs[bbs_size - 1]->get_instr(0))){
            auto size = (stack_object_size_ + stack_reg_size_ + stack_spill_size_ + 7)/8 * 8;
            loadimm->update_imm(size);
        } else {
            assert(false);
        }
        bbs[bbs_size - 1]->add_instr(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::ADD, SP, SP, front_dst_reg), 1);
        for (int i = 0; i < this->callee_saved_used.size(); i++){
            bbs[bbs_size - 1]->add_instr(new RiscvInstr::LoadDouble(this->callee_saved_used[i], SP, i * 8 - stack_reg_size_ - stack_spill_size_), 2);
        }
    } else {
        auto front_instr_front = bbs[0]->get_instr(0);
        auto front_instr_second = bbs[0]->get_instr(1);
        auto front_dst_reg = front_instr_front->def_reg()[0];
        auto front_dst_reg_2 = front_instr_second->def_reg()[0];
        auto end_instr_front = bbs[bbs.size() - 1]->get_instr(0);
        auto end_instr_second = bbs[bbs.size() - 1]->get_instr(1);
        auto end_dst_reg = end_instr_front->def_reg()[0];
        auto end_dst_reg_2 = end_instr_second->def_reg()[0];

        if(auto loadimm = dynamic_cast<RiscvInstr::LoadImm*>(front_instr_second)){
            auto size = (stack_object_size_ + stack_reg_size_ + stack_spill_size_ + 7)/8 * 8;
            loadimm->update_imm(size);
        } else {
            assert(false);
        }
        if(auto loadimm = dynamic_cast<RiscvInstr::LoadImm*>(end_instr_front)){
            auto size = (stack_object_size_ + stack_reg_size_ + stack_spill_size_ + 7)/8 * 8;
            loadimm->update_imm(size);
        } else {
            assert(false);
        }
        if(auto loadimm = dynamic_cast<RiscvInstr::LoadImm*>(front_instr_front)){
            auto size = stack_reg_size_ + stack_spill_size_;
            loadimm->update_imm(size);
        } else {
            assert(false);
        }
        if(auto loadimm = dynamic_cast<RiscvInstr::LoadImm*>(end_instr_second)){
            auto size = stack_reg_size_ + stack_spill_size_;
            loadimm->update_imm(size);
        } else {
            assert(false);
        }
        bbs[0]->add_instr(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::ADD, FP, SP, front_dst_reg_2), 2);
        bbs[0]->add_instr(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::SUB, SP, SP, front_dst_reg_2), 2);
        bbs[0]->add_instr(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::ADD, SP, SP, front_dst_reg), 1);
        bbs[0]->add_instr(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::SUB, SP, SP, front_dst_reg), 1);
        for (int i = 0; i < this->callee_saved_used.size(); i++){
            bbs[0]->add_instr(new RiscvInstr::StoreDouble(this->callee_saved_used[i], SP, i * 8), 2);
        }
        
        bbs[bbs.size() - 1]->add_instr(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::ADD, SP, SP, end_dst_reg_2), 2);
        for (int i = 0; i < this->callee_saved_used.size(); i++)
            bbs[bbs.size() - 1]->add_instr(new RiscvInstr::LoadDouble(this->callee_saved_used[i], SP, i * 8), 2);
        bbs[bbs.size() - 1]->add_instr(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::SUB, SP, SP, end_dst_reg_2), 2);
        bbs[bbs.size() - 1]->add_instr(new RiscvInstr::Binary(RiscvInstr::RvBinaryOp::ADD, SP, SP, end_dst_reg), 1);
    }

    bbs[0]->get_instr()->push_back(new RiscvInstr::Jump(*bbs[0]->succ.begin()));
}

void Function::gen_asm(std::ostream &out) {
    out << "    .align 1\n";
    out << name_ << ":\n";

    // gen asm for bbs
    for (int i = 0; i < bbs.size(); ++i) {
        bbs[i]->gen_asm(out);
    }
}

Program::Program(midend::ir::Module* module) {
    bb_num = 0;
    auto funcs = module -> get_functions();
    use_memset_zero = module->get_use_memset_zero();

    // construct functions
    for (auto func : *module->get_functions()) {
        // construct Function
        functions_.push_back(new Function(this, func));

        // do reg allocate for general registers
        ColoringRegAllocator color_reg_alloc;
        // functions_.back()->gen_asm(std::cout);
        // std::cout << "bf alloc\n";
        color_reg_alloc.alloc_reg(functions_.back(), true);
        // std::cout << "alloc reg\n";

        // analyze callee saved registers for general registers
        functions_.back()->callee_saved_used.clear();
        functions_.back()->callee_saved_used.emplace_back(RA);
        functions_.back()->callee_saved_used.emplace_back(FP);
        for(auto used: color_reg_alloc.used_reg) {
            if(regs_use[used.id()] == callee_save) {
                if(!(used == RA) && !(used == FP)){
                    functions_.back()->callee_saved_used.emplace_back(used);
                }
            }
        }

        // do reg alloc for float registers
        color_reg_alloc.alloc_reg(functions_.back(), false);

        // analyze callee saved registers for float registers
        for(auto used: color_reg_alloc.used_reg) {
            if(!used.is_gp() && regs_use_fp[used.id()] == callee_save) {
                functions_.back()->callee_saved_used.emplace_back(used);
            }
        }

        // update spill size
        functions_.back()->stack_spill_size_ = color_reg_alloc.spill_size();

        // update entry and exit bb
        functions_.back()->update_entry_exit_bb();

    }

    // construct global variables
    for (auto global : *module->get_global_variables()){
        if(global->get_type().is_array()){
            if (global->can_bss_initialize())
                bss_globals_.push_back(new GlobalObject(global));
            else
                data_globals_.push_back(new GlobalObject(global));
        }
        else{
            if(std::get<0>(global->get_init_value()) == ConstValue(0) || (std::get<0>(global->get_init_value()) == ConstValue((float)0.0)))
                bss_globals_.push_back(new GlobalObject(global));
            else
                data_globals_.push_back(new GlobalObject(global));
        }
    }
}

void Program::gen_global_var_asm(std::ostream &out){
    // out << "    .attribute arch, \"rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0\"" << "\n";
    if(data_globals_.size() > 0){
        out << "    .data\n";
        out << "    .align 3\n";
    }
    for (auto &data_global : data_globals_) {
        out << "    .globl " << data_global->get_name() << "\n";
        out << "    " << data_global->get_name() << ":\n";
        if(data_global->get_type().is_array()){
            for(int i = 0; i < std::get<1>(data_global->get_init_value()).size(); i++){
                if (data_global->get_type().base_type == ScalarType::Int)
                    out << "        .word " << std::fixed << std::setprecision(0) << (std::get<1>(data_global->get_init_value())[i].iv) << "\n";
                else {
                    float val = (std::get<1>(data_global->get_init_value())[i].fv);
                    unsigned char *bytePointer = reinterpret_cast<unsigned char*>(&val);
                    unsigned int intValue = *reinterpret_cast<unsigned int*>(bytePointer);
                    out << "        .word " << intValue << "\n";
                }
            }
        }
        else{
            if (data_global->get_type().base_type == ScalarType::Int)
                out << "        .word " << std::fixed << std::setprecision(0) << (std::get<0>(data_global->get_init_value()).iv) << "\n";
            else {
                // std::cout << data_global->get_name() << " is float\n";
                float val = (std::get<0>(data_global->get_init_value()).fv);
                unsigned char *bytePointer = reinterpret_cast<unsigned char*>(&val);
                unsigned int intValue = *reinterpret_cast<unsigned int*>(bytePointer);
                out << "        .word " << intValue << "\n";
            }
        }
    }
    if(bss_globals_.size() > 0){
        out << "    .bss\n";
        out << "    .align 3\n";
    }
    for (auto &bss_global : bss_globals_) {
        out << "    .globl " << bss_global->get_name() << "\n";
        out << "    " << bss_global->get_name() << ":\n";
        out << "        .space " << bss_global->get_type().size() << "\n";
    }
}

} // namespace riscv

} // namespace backend
