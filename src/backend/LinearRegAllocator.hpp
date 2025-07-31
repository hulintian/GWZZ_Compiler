#pragma once 

#include "backend/MBasicBlock.hpp"
#include "common/regarch.hpp"
#include <vector>
#include <set>
#include <stack>
#include <algorithm>

namespace backend {

class MachineFunction;
class RegAllocator {
public:
    MachineFunction* _parent;

    RegAllocator(MachineFunction* mf) : _parent(mf) {
        // Initialize integer temp registers (caller-saved)
        for(auto rit = RiscvReg::temp_regs.rbegin(); rit != RiscvReg::temp_regs.rend(); rit++) {
            stk_temp_regs.push(*rit);
        }
        // Initialize integer save registers (callee-saved)
        for(auto rit = RiscvReg::regs_saved.rbegin(); rit != RiscvReg::regs_saved.rend(); rit++) {
            stk_save_regs.push(*rit);
        }
        // Initialize floating-point temp registers (caller-saved)
        for(auto rit = RiscvReg::fp_Temp_regs.rbegin(); rit != RiscvReg::fp_Temp_regs.rend(); rit++) {
            stk_fp_temp_regs.push(*rit);
        }
        // Initialize floating-point save registers (callee-saved)
        for(auto rit = RiscvReg::fp_regs_calleesaved.rbegin(); rit != RiscvReg::fp_regs_calleesaved.rend(); rit++) {
            stk_fp_save_regs.push(*rit);
        }
    }
    std::stack<const RiscvReg::Reg*> stk_temp_regs;
    std::stack<const RiscvReg::Reg*> stk_save_regs;
    std::stack<const RiscvReg::Reg*> stk_fp_temp_regs;
    std::stack<const RiscvReg::Reg*> stk_fp_save_regs;

    std::set<RiscvReg::Reg> used_S_x;
    std::set<RiscvReg::Reg> used_FS_x;

    int spill_cnt = 0;

    long long latest_call_timestamp = -1;

    struct temp_reg_live_interval_meta_data {
        RiscvReg::Reg temp_reg;
        unsigned long long start_;
        unsigned long long end;

        // 寄存器的生命周期是否经历过函数调用
        bool pass_call_instr = false;
        temp_reg_live_interval_meta_data(RiscvReg::Reg reg, 
                        unsigned long long st, 
                        unsigned  long long ed) 
            : temp_reg(reg), start_(st), end(ed) {}
    };

    // 最新的寄存器的活跃区间
    std::map<RiscvReg::Reg, temp_reg_live_interval_meta_data*> reg_activated;

    std::vector<temp_reg_live_interval_meta_data*> regs_live_interval;

    temp_reg_live_interval_meta_data* find_meta_data(RiscvReg::Reg reg, long long ts) {
        
        for(auto interval : regs_live_interval) {
            if( interval->temp_reg == reg &&
                    ts >= interval->start_ &&
                    ts <= interval->end) {
                return interval;
            }
        }

        return nullptr;
    }

    temp_reg_live_interval_meta_data* find_def_meta_data(RiscvReg::Reg reg, long long ts) {
        
        for(auto interval : regs_live_interval) {
            if( interval->temp_reg == reg &&
                    ts == interval->start_ ) {
                return interval;
            }
        }

        return nullptr;
    }
    
    void sort_interval_regs() {
        std::sort(this->regs_live_interval.begin(), this->regs_live_interval.end(), 
                [](const temp_reg_live_interval_meta_data* a, const temp_reg_live_interval_meta_data* b) {
                    return a->start_ < b->start_;} );
    }

    std::map<RiscvReg::Reg, bool> used_m_reg;

    long long timestamp = 0;

    void live_interval_analysis();
    void traverse_bb(MachineBasicBlock* bb);

    void alloca_regs();

    void plot_reg_interval();
};

}
