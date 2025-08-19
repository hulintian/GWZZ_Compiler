#include "PHIEliminate.hpp"
#include <map>
#include <stack>

#include "utils.hpp"

namespace pass {

void PHIEliminatePass::collect_all_phi() {
    
    this->phis.clear();
    this->_func->get_cfg()->regen_cfg();

    auto ebb = this->_func->get_entry_bb();
    std::stack<IR::BasicBlock*> stk;
    stk.push(ebb);

    std::map<int, bool> visited;

    while (!stk.empty()) {
        auto cbb = stk.top();
        stk.pop();

        for(auto sbb : this->_func->get_cfg()->succ_bb[cbb->get_bb_idx()]) {
            if(!visited[sbb])stk.push(this->_func->get_cfg()->idx2bb[sbb]);
        }

        if(!visited[cbb->get_bb_idx()]) {
            visited[cbb->get_bb_idx()] = true;
            for(auto inst : cbb->get_intrs()) {
                if(auto phi_instr = dynamic_cast<IR::PhiInst*>(inst)) {
                    this->phis.insert(phi_instr);
                }
            }
        }
    }
}

void PHIEliminatePass::view_all_phis() {
    std::cerr << info << "find " << this->phis.size() << " phi instrs at " << this->_func->get_func_name() << "\n";
    for(auto p : this->phis) {
        std::cerr << info << " find " 
            << p->to_str() << " is form " 
            << p->get_alloca_src()->to_str() 
            << "\n";
    }
}

bool PHIEliminatePass::run(IR::Function& f, PassManager& pm) {
    this->_func = &f;
    this->_pm = &pm;

    collect_all_phi();

#ifdef SHOW_PHIS
    view_all_phis();
#endif

    return true;
}

}
