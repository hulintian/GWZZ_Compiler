#include "PHIEliminate.hpp"
#include <map>
#include <stack>
#include <string>

#include "PassManager.hpp"
#include "BasicBlock.hpp"
#include "utils.hpp"

namespace pass {

void PHIEliminatePass::init() {
     this->phi2slot.clear();
     this->phis.clear();
     this->sym2slot.clear();

     use_def_res = &this->_pm->get_analysis_manager().get_function_result<UseDefAnalysisPass>(*this->_func);
}

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

void PHIEliminatePass::check_and_confirm_slot() {
    for(auto p : this->phis) {
        auto from_sym_bol = p->get_alloca_src()->get_name();
        if(sym2slot.find(from_sym_bol) != sym2slot.end()) {
            phi2slot[p] = sym2slot[from_sym_bol];
        } else {
            auto ty = p->get_type();
            std::string slot_name = "phi_slot_@_" + std::to_string(this->get_slot_idx());
            auto phi_slot = new IR::AllocaInst(ty, slot_name, 4, this->_func->get_entry_bb());

            this->_func->get_entry_bb()->add_instr_after_allocas(phi_slot);
            sym2slot[from_sym_bol] = phi_slot;
            phi2slot[p] = phi_slot;
        }
    }
}

void PHIEliminatePass::view_all_phis() {
    std::cerr << info << &this->phis << " find " << this->phis.size() << " phi instrs at " << this->_func->get_func_name() << "\n";
    for(auto p : this->phis) {
        std::cerr << info << " find " 
            << p->to_str() << " is form " 
            << p->get_alloca_src()->to_str() 
            << "\n";
    }
}

void PHIEliminatePass::update_use_def() {
    this->_pm->get_analysis_manager().invalidate_function_result<UseDefAnalysisPass>(*this->_func);

    use_def_res = &this->_pm->get_analysis_manager().get_function_result<UseDefAnalysisPass>(*this->_func);
}

void PHIEliminatePass::phi_promotion() {
// TODO store the value at the coming basicblock 
//      load the value the the phi place

    for(auto phi : this->phis) {
        int comings_cnt = phi->get_num_incoming();
        auto phi_slot = phi2slot[phi];

        // TODO replace phi 
        auto new_phi_value_idx = this->_pm->get_ir_builder().get_cur_ctx()->get_tmp_var();
        std::string new_phi_value_name = "%T" + std::to_string(new_phi_value_idx);
        auto phi_value = new IR::LoadInst(phi->get_type(), phi_slot, new_phi_value_name, 4, phi->get_parent());
        auto phi_users = use_def_res->get_users(phi);
        for(auto phi_user : phi_users) {
            phi_user->replace_operand(phi, phi_value);
        }
        update_use_def();

        for(int i=0; i < comings_cnt; i++) {
            auto coming_bb = phi->get_incoming_block(i);
            auto coming_value = phi->get_incoming_value(i);
            auto store_instr = new IR::StoreInst(coming_value->get_type(), phi_slot, coming_value, "", 4, coming_bb);
            coming_bb->add_instr_before_terminator(store_instr);
        }

        
        auto phi_bb = phi->get_parent();
        phi_bb->add_instruction_at_front(phi_value);
        phi_bb->remove_instr(phi);

    }
}

bool PHIEliminatePass::run(IR::Function& f, PassManager& pm) {
    this->_func = &f;
    this->_pm = &pm;

    init();
    collect_all_phi();
    check_and_confirm_slot();
    phi_promotion();


#ifdef SHOW_PHIS
    view_all_phis();
#endif

    return true;
}

}
