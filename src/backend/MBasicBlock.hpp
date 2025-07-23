#pragma once 

#include "backend/MInstruction.hpp"
#include <vector>
namespace backend {

class MachineBasicBlock {
public:
    int _bb_idx;
    std::vector<MachineInstr*> m_instrs;

    std::vector<MachineInstr*>& get_machine_instrs() { return m_instrs; }
    int get_m_bb_idx() { return _bb_idx; }
};

}
