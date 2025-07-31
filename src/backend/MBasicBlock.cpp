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

}
