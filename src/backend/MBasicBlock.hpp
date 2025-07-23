#pragma once 

#include "backend/MInstruction.hpp"
#include <vector>
namespace backend {

class MachineBasicBlock {

    int _bb_idx;
    std::vector<MachineInstr*> m_instrs;
};

}
