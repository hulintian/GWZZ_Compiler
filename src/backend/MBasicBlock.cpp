#include "backend/MBasicBlock.hpp"
#include "backend/MFunction.hpp"
#include "backend/MInstruction.hpp"
#include <ostream>

namespace backend {
    
void MachineBasicBlock::dump_asm(std::ostream& out) {
    out << bb_label << ": \n";
    for(auto i : m_instrs) {
        out << "    " << i->to_asm() << "\n";
    }
    // out << "\n";
}

}
