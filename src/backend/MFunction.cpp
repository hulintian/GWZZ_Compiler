#include "MFunction.hpp"
#include "MBasicBlock.hpp"
#include <cassert>
#include <map>
#include <ostream>

namespace backend {

void MachineFunction::add_mbb(MachineBasicBlock* mbb) {
    assert(!this->has_mbb(mbb->get_m_bb_idx()));
    this->bbs.insert(mbb);
    idx_bb_mp[mbb->get_m_bb_idx()] = mbb;
}

MachineBasicBlock* MachineFunction::get_mbb(int idx) {
    assert(has_mbb(idx) && "Not has machin basic block");
    return this->idx_bb_mp[idx];
}

void MachineFunction::set_prologue_bb(MachineBasicBlock* mbb) {
    assert(!this->has_mbb(mbb->get_m_bb_idx()));
    this->prologue_bb = mbb;
    idx_bb_mp[mbb->get_m_bb_idx()] = mbb;
}
void MachineFunction::set_epilogue_bb(MachineBasicBlock* mbb) {
    assert(!this->has_mbb(mbb->get_m_bb_idx()));
    this->epilogue_bb = mbb;
    idx_bb_mp[mbb->get_m_bb_idx()] = mbb;
}

void MachineFunction::dump_asm(std::ostream& out) {
    out << "    .align 1\n";
    out << this->_name << ": \n";
    this->prologue_bb->dump_asm(out);
    for(auto bb: bbs) {
        bb->dump_asm(out);
        //out << "\n";
    }

    std::map<int, bool> visited;

    // for(auto )

    this->epilogue_bb->dump_asm(out);
}

}

