#include "MBasicBlock.hpp"
#include "MFunction.hpp"
#include "MInstruction.hpp"
#include "utils.hpp"
#include <iostream>
#include <ostream>

namespace backend {
    
void MachineBasicBlock::dump_asm(std::ostream& out) {
    out << bb_label << ": \n";
    for(auto i : m_instrs) {
#ifndef SHOW_INST_TIME
        out << "    " << i->to_asm() << "\n";
#else
        out << i->time << "    " << i->to_asm() << "\n";
#endif
    }
    // out << "\n";
}

// 在 instr 之前插入
void MachineBasicBlock::insert_instr_before(MachineInstr* pos, MachineInstr* to_insert) {
    auto it = std::find(m_instrs.begin(), m_instrs.end(), pos);
    if (it != m_instrs.end()) {
        // std::cerr << info << "Insrt " << to_insert->to_asm() << "\n";
        m_instrs.insert(it, to_insert);
    } else {
        std::cerr << error << " Not exist instr: " << pos;
    }
}

// 在 instr 之后插入
void MachineBasicBlock::insert_instr_after(MachineInstr* pos, MachineInstr* to_insert) {
    auto it = std::find(m_instrs.begin(), m_instrs.end(), pos);
    if (it != m_instrs.end()) {
        ++it; // 移到pos之后
        m_instrs.insert(it, to_insert);
    } else {
        std::cerr << error << " Not exist instr: " << pos;
    }
}

void MachineBasicBlock::insert_before_branch_instr(MachineInstr* instr) {
    MachineInstr* first_jump;
    for(auto i : this->m_instrs) {
        if(auto br = dynamic_cast<BranchInst*>(i)) {
            first_jump = br;
            break;
        } else if(auto ubr = dynamic_cast<BranchUInst*>(i)) {
            first_jump = ubr;
            break;
        } else if(auto jp = dynamic_cast<JumpInst*>(i)) {
            first_jump = jp;
            break;
        }
    }
    
    this->insert_instr_before(first_jump, instr);
}

}
