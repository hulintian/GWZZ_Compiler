#pragma once 

#include "utils.hpp"
#include <ostream>
#include <list>
#include <string>
#include <algorithm>
namespace backend {

class MachineInstr;
class MachineBasicBlock {
public:
    int _bb_idx;
    std::string bb_label;
    std::list<MachineInstr*> m_instrs;

    MachineBasicBlock(int idx) : _bb_idx(idx), bb_label("BB"+std::to_string(idx)) {}

    std::list<MachineInstr*>& get_machine_instrs() { return m_instrs; }
    int get_m_bb_idx() { return _bb_idx; }

    void insert_instr(MachineInstr* instr) {
        m_instrs.push_back(instr);
    }

    friend std::ostream& operator<<(std::ostream& os, const MachineBasicBlock* mbb) {
        os << mbb->bb_label;
        return os;
    }
    void dump_asm(std::ostream& out);

    // 在 instr 之前插入
    void insert_instr_before(MachineInstr* pos, MachineInstr* to_insert);
    // 在 instr 之后插入
    void insert_instr_after(MachineInstr* pos, MachineInstr* to_insert);
};

}
