#include "PHIEliminate.hpp"
#include <map>
#include <set>
#include <stack>
#include <string>

#include "PassManager.hpp"
#include "BasicBlock.hpp"
#include "utils.hpp"
#include "UndefValue.hpp"
#include "defines.hpp"

namespace pass {

void PHIEliminatePass::init() {
     this->phi2slot.clear();
     this->phis.clear();
     this->sym2slot.clear();
     this->inference_graph.clear();

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

void PHIEliminatePass::phi_promotion(IR::PhiInst* phi) {
// TODO store the value at the coming basicblock 
//      load the value the the phi place

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
        IR::Instruction* store_instr;

        if(auto undefined_value = dynamic_cast<IR::UndefValue*>(coming_value)) {
            IR::ConstantValue* const_zero;
            if(phi->get_type()->base_type == 1) {
                auto cv = new ConstValue((float)0);
                const_zero = this->_pm->get_ir_builder().create_const_value(phi->get_type(), *cv);
            } else {
                auto cv = new ConstValue((int)0);
                const_zero = this->_pm->get_ir_builder().create_const_value(phi->get_type(), *cv);
            }

            store_instr = new IR::StoreInst(coming_value->get_type(), phi_slot, const_zero, "", 4, coming_bb);
        } else {
            store_instr = new IR::StoreInst(coming_value->get_type(), phi_slot, coming_value, "", 4, coming_bb);
        }
        coming_bb->add_instr_before_terminator(store_instr);
    }

    
    auto phi_bb = phi->get_parent();
    phi_bb->add_instruction_at_front(phi_value);
    phi_bb->remove_instr(phi);
}

void PHIEliminatePass::gen_inference_and_phiEli() {
    this->inference_graph.clear();
    this->rinference_graph.clear();
    // TODO firstly check the phi instrs and generate an inference graph
    for(auto phi : this->phis) {
        if(!this->eliminated[phi]) {
            // 针对有环的情况，在消除环后重新构建冲突图
            int incoming_cnt = phi->get_num_incoming();
            for(int i=0; i < incoming_cnt; i++) {
                auto icval = phi->get_incoming_value(i);
                if(icval != phi)
                if(auto viap = dynamic_cast<IR::PhiInst*>(icval)) {
                    this->inference_graph[phi].insert(viap);
                    this->rinference_graph[viap].insert(phi);
                }
            }
        }
    }

    // TODO find the free phi
    std::set<IR::PhiInst*> free_phis;
    for(auto phi : phis) {
        if(auto it = inference_graph.find(phi); it == inference_graph.end() || it->second.empty() ) {
            free_phis.insert(phi);
        }
    }

    std::map<IR::PhiInst*, bool> visited;
    for(auto fphi : free_phis) {
        this->phi_promotion(fphi);
        visited[fphi] = true;
        this->eliminated[fphi] = true;
    } 

    // TODO need to check has loop in inference graph, ignore them
    // TODO 查找环，并消除
    // 三色法
    // 0 -> 未访问 1 -> 访问过，但是所有的入口没访问全 2 -> 所有的入口都访问了，结束访问 
    std::map<IR::PhiInst*, int> three_colors;
    auto check_is_all_visited = [&](IR::PhiInst* phi) -> bool {
        if(auto it = inference_graph.find(phi); it == inference_graph.end() || it->second.empty() ) {
            // this is the free phi
            return true;
        } else {
            bool res = true;
            for(auto comings : inference_graph[phi]) {
                // if has unvisited return false 
                if(!three_colors[comings]) res = false;
            }
            return false;
        }

    }; 

    std::stack<IR::PhiInst*> stk;
    for(auto phi : this->phis) {
        if(!eliminated[phi]) {
            // TODO 找到环并消除
            if(three_colors[phi]) continue;     // 已经访问过了的，不管是访问中还是访问结束
            
            three_colors[phi] = 1;
            stk.push(phi);

            while(!stk.empty()) {
                auto top_phi = stk.top();
                if(check_is_all_visited(top_phi)) {
                    three_colors[phi] = 2;
                    stk.pop();
                }

                for(auto n_phi : inference_graph[top_phi]) {
                    // 未访问过的
                    if( three_colors[n_phi] == 0 ) {
                        stk.push(n_phi);
                    } else if(three_colors[n_phi] == 1) {
                        // 是环，消除环，并重新构建冲突图
                        // insert an instr, add or fadd 0.0
                        IR::ConstantValue* zero;
                        IR::Instruction* mv_phi2tmep;
                        if(n_phi->get_type()->base_type == 1) {
                            zero = this->_pm->get_ir_builder().fzero;
                            mv_phi2tmep = new IR::BinaryInst(n_phi->get_type(), BinaryOp::Add, n_phi, zero, "", IR::fadd, n_phi->get_parent());
                        } else {
                            zero = this->_pm->get_ir_builder().zero;
                            mv_phi2tmep = new IR::BinaryInst(n_phi->get_type(), BinaryOp::Add, n_phi, zero, "", IR::fadd, n_phi->get_parent());
                        }
                        n_phi->get_parent()->add_curinst_after_inst(mv_phi2tmep, n_phi);

                        auto users = this->use_def_res->get_users(n_phi);
                        for(auto user : users) {
                            user->replace_operand(n_phi, mv_phi2tmep);
                        }
                        this->update_use_def();
                        
                        this->gen_inference_and_phiEli();
                    }
                }
            }
        }
    }
    // 在消除环之后这里是没有环的了，能够拓扑排序
    // 消除环后拓扑排序

    auto can_eliminate = [&](IR::PhiInst* phi) -> bool {
        if(auto it = inference_graph.find(phi); it == inference_graph.end() || it->second.empty() ) {
            // this is the free phi
            return true;
        } else {
            bool res = true;
            for(auto icom_phi : inference_graph[phi]) {
                if(!eliminated[icom_phi]) {
                    res = false;
                    return res;
                }
            }
            return res;
        }
    };

    std::stack<IR::PhiInst*> elim_work;
    for(auto phi : phis) {
        
        if( can_eliminate(phi) ) elim_work.push((phi));

        while(!elim_work.empty()) {
            auto c_phi = elim_work.top();
            elim_work.pop();

            this->phi_promotion(phi);
            this->eliminated[phi] = true;

            for(auto n_phi : inference_graph[phi]) {
                if(!this->eliminated[n_phi]) {
                    if(can_eliminate(n_phi)) {
                        stk.push(n_phi);
                    }
                }
            }
        }

    }
}

bool PHIEliminatePass::run(IR::Function& f, PassManager& pm) {
    this->_func = &f;
    this->_pm = &pm;

    init();
    collect_all_phi();
    check_and_confirm_slot();
//    phi_promotion();


#ifdef SHOW_PHIS
    view_all_phis();
#endif

    return true;
}

}
