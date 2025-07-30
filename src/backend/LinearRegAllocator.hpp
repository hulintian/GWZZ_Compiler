#pragma once 

#include "backend/MFunction.hpp"
#include "common/regarch.hpp"
#include <vector>
#include <algorithm>

namespace backend {

class RegAllocator {
public:
    MachineFunction* _parent;

    std::map<RiscvReg::Reg, std::pair<int, int>> reg_activated;

    std::set<RiscvReg::Reg> used_S_x;
    std::set<RiscvReg::Reg> used_FS_x;

    int spill_cnt = 0;

    struct temp_reg_live_interval_meta_data {
        RiscvReg::Reg temp_reg;
        int start_;
        int end;
    };

    std::vector<temp_reg_live_interval_meta_data> regs_live_interval;
    
    void sort_interval_regs() {
        std::sort(this->regs_live_interval.begin(), this->regs_live_interval.end(), 
                [&](const temp_reg_live_interval_meta_data& a, const temp_reg_live_interval_meta_data& b) {
                    return a.start_ < b.start_;} );
    }

    std::map<RiscvReg::Reg, bool> used_m_reg;
};

}
