#pragma once 

#include <ostream>
#include <vector>
#include <string>
namespace backend {

class MachineInstr;
class MachineBasicBlock {
public:
    int _bb_idx;
    std::string bb_label;
    std::vector<MachineInstr*> m_instrs;


    MachineBasicBlock(int idx) : _bb_idx(idx), bb_label("BB"+std::to_string(idx)) {}

    std::vector<MachineInstr*>& get_machine_instrs() { return m_instrs; }
    int get_m_bb_idx() { return _bb_idx; }

    friend std::ostream& operator<<(std::ostream& os, const MachineBasicBlock& mbb) {
        os << mbb.bb_label;
        return os;
    }
};

}
