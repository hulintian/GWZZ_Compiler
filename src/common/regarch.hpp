// 这个是使用 return_0;的代码，做了点修改，把fs_x s_x ft_x t_x 这些寄存器分开，用于定寄存器分配的可选寄存器范围
// 这个是使用 return_0;的代码
#pragma once

#include <string>
#include <ostream>
#include <vector>
#include <vector>
#include <map>

namespace RiscvReg {

const int RegCount = 32;
const int RegCallerSavedCount = 15;
const int RegCalleeSavedCount = 13; // FP算calleesave但是不允许分配
const int RegAllocatableCount = 27;
const int RegArgCount = 8;

const int FpRegCount = 32;
const int FpRegCallerSavedCount = 20;
const int FpRegCalleeSavedCount = 12;
const int FpRegAllocatableCount = 32;
const int FpRegArgCount = 8;

const std::string regs_name[RegCount] = {
    "zero", "ra", "sp", "gp", "tp",
    "t0", "t1", "t2",
    "fp",
    "s1",
    "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
    "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11",
    "t3", "t4", "t5", "t6"
};
const std::string regs_name_fp[FpRegCount] = {
    "ft0", "ft1", "ft2", "ft3", "ft4", "ft5", "ft6", "ft7",
    "fs0", "fs1", "fa0", "fa1", "fa2", "fa3", "fa4", "fa5",
    "fa6", "fa7", "fs2", "fs3", "fs4", "fs5", "fs6", "fs7",
    "fs8", "fs9", "fs10", "fs11", "ft8", "ft9", "ft10", "ft11"
};
enum RegisterUsage { caller_save, callee_save, special };
constexpr RegisterUsage regs_use[RegCount] = {
    special,     callee_save, special,     special,
    special,                                // zero, ra, sp, gp, tp
    caller_save, caller_save, caller_save,  // t0-t2
    special, callee_save,               // fp,s1
    caller_save, caller_save, caller_save, caller_save,
    caller_save, caller_save, caller_save, caller_save,  // a0-a7
    callee_save, callee_save, callee_save, callee_save,
    callee_save, callee_save, callee_save, callee_save,
    callee_save, callee_save,                           // s2-s11
    caller_save, caller_save, caller_save, caller_save  // t3-t6
};
constexpr RegisterUsage regs_use_fp[FpRegCount] = {
    caller_save, caller_save, caller_save, caller_save, caller_save, caller_save, caller_save, caller_save,
    callee_save, callee_save, caller_save, caller_save, caller_save, caller_save, caller_save, caller_save,
    caller_save, caller_save, callee_save, callee_save, callee_save, callee_save, callee_save, callee_save,
    callee_save, callee_save, callee_save, callee_save, caller_save, caller_save, caller_save, caller_save
};

class Reg {
protected:
    int index_;
    bool is_standard_;
    bool is_gp_;
public:
    Reg() = default;
    // is_standard -> 是否是物理寄存器； is_gp -> 是否是整数寄存器
    // is_standard -> 是否是物理寄存器； is_gp -> 是否是整数寄存器
    Reg(int index, bool is_standard = false, bool is_gp = true) : index_(index), is_standard_(is_standard), is_gp_(is_gp) {
        if (is_standard_ && !(0 <= index_ && index_ < RegCount)) 
            throw std::runtime_error("invalid standard register index");
    }
    Reg(const Reg * reg) : index_(reg->id()), is_standard_(reg->is_standard()), is_gp_(reg->is_gp()) {}
    Reg(const Reg & reg) : index_(reg.id()), is_standard_(reg.is_standard()), is_gp_(reg.is_gp()) {}
    std::string name() const { 
        if (is_gp_)
            return is_standard_ ? regs_name[index_] : "_T" + std::to_string(index_); 
        return is_standard_ ? regs_name_fp[index_] : "_TF" + std::to_string(index_);
    }
    int id() const { return index_; }
    /// @brief if this register is a standard register 0-31 
    bool is_standard() const { return is_standard_; }
    bool is_gp() const { return is_gp_; }

    friend std::ostream &operator << (std::ostream &os, Reg reg) {
        os << reg.name();
        return os;
    }

    bool operator < (const Reg &b) const { 
        return is_standard_ == b.is_standard_ ? (is_gp_ == b.is_gp_ ? index_ < b.index_ : is_gp_) : is_standard_; 
    }

    bool operator == (const Reg &b) const { 
        return (is_standard_ == b.is_standard_) && (index_ == b.index_) && (is_gp_ == b.is_gp_); 
    }
};

const Reg ZERO = Reg(0, true);  // always zero
const Reg RA = Reg(1, true);  // return address
const Reg SP = Reg(2, true);  // stack pointer
const Reg GP = Reg(3, true);  // global pointer
const Reg TP = Reg(4, true);  // thread pointer
const Reg T0 = Reg(5, true);
const Reg T1 = Reg(6, true);
const Reg T2 = Reg(7, true);
const Reg FP = Reg(8, true);  // frame pointer
const Reg S1 = Reg(9, true);
const Reg A0 = Reg(10, true);
const Reg A1 = Reg(11, true);
const Reg A2 = Reg(12, true);
const Reg A3 = Reg(13, true);
const Reg A4 = Reg(14, true);
const Reg A5 = Reg(15, true);
const Reg A6 = Reg(16, true);
const Reg A7 = Reg(17, true);
const Reg S2 = Reg(18, true);
const Reg S3 = Reg(19, true);
const Reg S4 = Reg(20, true);
const Reg S5 = Reg(21, true);
const Reg S6 = Reg(22, true);
const Reg S7 = Reg(23, true);
const Reg S8 = Reg(24, true);
const Reg S9 = Reg(25, true);
const Reg S10 = Reg(26, true);
const Reg S11 = Reg(27, true);
const Reg T3 = Reg(28, true);
const Reg T4 = Reg(29, true);
const Reg T5 = Reg(30, true);
const Reg T6 = Reg(31, true);

const Reg FP0 = Reg(0, true, false);
const Reg FP1 = Reg(1, true, false);
const Reg FP2 = Reg(2, true, false);
const Reg FP3 = Reg(3, true, false);
const Reg FP4 = Reg(4, true, false);
const Reg FP5 = Reg(5, true, false);
const Reg FP6 = Reg(6, true, false);
const Reg FP7 = Reg(7, true, false);
const Reg FP8 = Reg(8, true, false);
const Reg FP9 = Reg(9, true, false);
const Reg FP10 = Reg(10, true, false);
const Reg FP11 = Reg(11, true, false);
const Reg FP12 = Reg(12, true, false);
const Reg FP13 = Reg(13, true, false);
const Reg FP14 = Reg(14, true, false);
const Reg FP15 = Reg(15, true, false);
const Reg FP16 = Reg(16, true, false);
const Reg FP17 = Reg(17, true, false);
const Reg FP18 = Reg(18, true, false);
const Reg FP19 = Reg(19, true, false);
const Reg FP20 = Reg(20, true, false);
const Reg FP21 = Reg(21, true, false);
const Reg FP22 = Reg(22, true, false);
const Reg FP23 = Reg(23, true, false);
const Reg FP24 = Reg(24, true, false);
const Reg FP25 = Reg(25, true, false);
const Reg FP26 = Reg(26, true, false);
const Reg FP27 = Reg(27, true, false);
const Reg FP28 = Reg(28, true, false);
const Reg FP29 = Reg(29, true, false);
const Reg FP30 = Reg(30, true, false);
const Reg FP31 = Reg(31, true, false);

const std::vector<const Reg*> regs = std::vector<const Reg*>({&ZERO, &RA, &SP, &GP, &TP, &T0, &T1, &T2, &FP, &S1, &A0, &A1, &A2, &A3, &A4, &A5, &A6, &A7, &S2, &S3, &S4, &S5, &S6, &S7, &S8, &S9, &S10, &S11, &T3, &T4, &T5, &T6});
const std::vector<const Reg*> regs_callersaved = std::vector<const Reg*>({&T0, &T1, &T2, &T3, &T4, &T5, &T6, &A0, &A1, &A2, &A3, &A4, &A5, &A6, &A7});
const std::vector<const Reg*> regs_calleesaved = std::vector<const Reg*>({&S1, &S2, &S3, &S4, &S5, &S6, &S7, &S8, &S9, &S10, &S11, &RA, &FP});
const std::vector<const Reg*> regs_allocatable = std::vector<const Reg*>({&T0, &T1, &T2, &T3, &T4, &T5, &T6, &A0, &A1, &A2, &A3, &A4, &A5, &A6, &A7, &S1, &S2, &S3, &S4, &S5, &S6, &S7, &S8, &S9, &S10, &S11, &RA});

const std::vector<const Reg*> regs_saved = std::vector<const Reg*>({&S1, &S2, &S3, &S4, &S5, &S6, &S7, &S8, &S9, &S10, &S11});
const std::vector<const Reg*> temp_regs = std::vector<const Reg*>({&T0, &T1, &T2, &T3, &T4, &T5, &T6});

const std::vector<const Reg*> regs_arg = std::vector<const Reg*>({&A0, &A1, &A2, &A3, &A4, &A5, &A6, &A7});
// const std::vector<int> caller_to_offset({0,0,0,0,0,0,1,2,0,0,3,4,5,6,7,8,9,10,0,0,0,0,0,0,0,0,0,0,11,12,13,14});

const std::vector<const Reg*> fp_regs = std::vector<const Reg*>({
    &FP0, &FP1, &FP2, &FP3, &FP4, &FP5, &FP6, &FP7,
    &FP8, &FP9, &FP10, &FP11, &FP12, &FP13, &FP14, &FP15,
    &FP16, &FP17, &FP18, &FP19, &FP20, &FP21, &FP22, &FP23,
    &FP24, &FP25, &FP26, &FP27, &FP28, &FP29, &FP30, &FP31
});

const std::vector<const Reg*> fp_regs_callersaved = std::vector<const Reg*>({
    &FP0, &FP1, &FP2, &FP3, &FP4, &FP5, &FP6, &FP7,
    &FP10, &FP11, &FP12, &FP13, &FP14, &FP15,
    &FP16, &FP17,
    &FP28, &FP29, &FP30, &FP31
});

const std::vector<const Reg*> fp_regs_calleesaved = std::vector<const Reg*>({
    &FP8, &FP9, &FP18, &FP19, &FP20, &FP21, &FP22, &FP23,
    &FP24, &FP25, &FP26, &FP27
});

const std::vector<const Reg*> fp_regs_arg = std::vector<const Reg*>({
    &FP10, &FP11, &FP12, &FP13, &FP14, &FP15, &FP16, &FP17
});

const std::vector<const Reg*>  fp_Temp_regs = std::vector<const Reg*>({ 
        &FP0, &FP1, &FP2, &FP3, &FP4, &FP5, &FP6, &FP7,
        &FP28, &FP29, &FP30, &FP31
});

inline bool is_in_pool(const std::vector<const Reg*> pool, const Reg* reg) {
    for(auto pr : pool) {
        if(pr->id() == reg->id() && pr->is_gp() == reg->is_gp() ) { return true; }
    }
    return false;
}

}


}
