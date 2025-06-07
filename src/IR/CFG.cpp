#include "IR/CFG.hpp"

#include <iostream>

namespace midend {

    CFG::CFG(ir::Function *func): func(func) {
        for (auto bb : *func->get_basic_blocks()) {
            bb_list.push_back(bb->get_index());
            bb_map[bb->get_index()] = bb;
        }
        rebuild();
    }

    void CFG::print() {
        for (auto bb : bb_list) {
            for (auto succ : bb_succ[bb]) {
                printf("bb %d -> %d\n", bb, succ);
            }
            for (auto prev : bb_prev[bb]) {
                printf("bb %d <- %d\n", bb, prev);
            }
        }
    }

    void CFG::add_edge(int from, int to) {
        bb_prev[to].insert(from);
        bb_succ[from].insert(to);
    }

    void CFG::build_bb_edge() {
        for (auto bb : bb_list) {
            bb_succ[bb] = std::unordered_set<int>();
            bb_prev[bb] = std::unordered_set<int>();
        }
        
        for (auto iter = bb_list.begin(); iter != bb_list.end(); iter++) {
            auto bb = *iter;
            if (bb_map[bb]->get_insts()->size() != 0) {
                for (auto ins: *bb_map[bb]->get_insts()) {
                    // auto ins = bb_map[bb]->get_instructions()->back();
                    if (auto jmp = dynamic_cast<ir::instruction::Branch *>(ins)) {
                        add_edge(bb, jmp->get_target()->get_index());
                    } else if (auto cbr = dynamic_cast<ir::instruction::CondBranch *>(ins)) {
                        add_edge(bb, cbr->get_true_bb()->get_index());
                        add_edge(bb, cbr->get_false_bb()->get_index());
                    } else if (auto ret = dynamic_cast<ir::instruction::Return *>(ins)) {
                    
                    } else if (ins == bb_map[bb]->get_insts()->back()) {
                        iter++;
                        if (iter != bb_list.end()) add_edge(bb, *iter);
                        iter--;
                    }
                }
            } else {
                iter++;
                if (iter != bb_list.end()) add_edge(bb, *iter);
                iter--;
            }
        }
    }

    void CFG::remove_unreachable_bb() {
        std::unordered_set<int> visit;
        std::vector<int> q;
        q.push_back(func->get_entry()->get_index());
        visit.insert(func->get_entry()->get_index());
        while (!q.empty()) {
            auto bb = q.back();
            q.pop_back();
            for (auto succ : bb_succ[bb]) {
                if (!visit.count(succ)) {
                    visit.insert(succ);
                    q.push_back(succ);
                }
            }
        }

        std::unordered_set<int> bb_to_remove;
        bb_list.clear();
        for (auto iter = func->get_basic_blocks()->begin(); iter != func->get_basic_blocks()->end(); iter++) {
            auto bb = (*iter)->get_index();
            if (visit.count(bb)) {
                bb_list.push_back(bb);
            } else {
                bb_to_remove.insert(bb);
                for (auto suc : bb_succ[bb]) bb_prev[suc].erase(bb);
                for (auto pre : bb_prev[bb]) bb_succ[pre].erase(bb);
                iter = func->get_basic_blocks()->erase(iter);
                iter--;
            }
        }

        // remove bb in phi instructions
        for (auto bb : bb_list) {
            for (auto iter = bb_map[bb]->get_insts()->begin(); iter != bb_map[bb]->get_insts()->end(); iter++) {
                if (auto phi = dynamic_cast<ir::instruction::Phi *>(*iter)) {
                    if (phi->is_arrayssa()) {
                        continue;
                    }
                    std::vector<ir::BasicBlock *> bbs;
                    std::vector<Temp *> values;
                    std::unordered_set<Temp *> unique_values;
                    for (int i = 0; i < phi->get_bbs()->size(); i++) {
                        if (!bb_to_remove.count(phi->get_bbs()->at(i)->get_index())) {
                            bbs.push_back(phi->get_bbs()->at(i));
                            values.push_back(phi->getvalues()->at(i));
                            unique_values.insert(phi->getvalues()->at(i));
                        }
                    }
                    bb_map[bb]->get_insts()->erase(iter);
                    if (bbs.size() == 0) {
                        // assert(false);
                    } else if (unique_values.size() == 1) {
                        bb_map[bb]->get_insts()->insert(iter, new ir::instruction::Assign(phi->get_dst(), values[0]));
                    } else if (bbs.size() == 1) {
                        bb_map[bb]->get_insts()->insert(iter, new ir::instruction::Assign(phi->get_dst(), values[0]));
                    } else {
                        bb_map[bb]->get_insts()->insert(iter, new ir::instruction::Phi(phi->get_dst(), values, bbs));
                    }
                }
            }
        }
    }

    void CFG::rebuild() {
        build_bb_edge();
        remove_unreachable_bb();
        build_bb_edge();
    }

    void CFG::change_succ(ir::BasicBlock *now_bb, ir::BasicBlock *old_bb, ir::BasicBlock *new_bb) {
        if(get_bb_succ(now_bb->get_index())->count(old_bb->get_index())){
            auto &inst = now_bb->get_insts()->back();
            erase_from_succ(now_bb, old_bb);
            insert_succ(now_bb, new_bb);
            TypeCase(br, ir::instruction::CondBranch *, inst) {
                if(br->get_true_bb() == old_bb) {
                    br->set_true_bb(new_bb);
                }
                if(br->get_false_bb() == old_bb) {
                    br->set_false_bb(new_bb);
                }
                if (br->get_true_bb() == br->get_false_bb()) {
                    inst = new ir::instruction::Branch(new_bb);
                }
            }
            TypeCase(jmp, ir::instruction::Branch *, inst) {
                if(jmp->get_target() == old_bb){
                    jmp->set_target(new_bb);
                }
            }
        }
    }

    void CFG::change_prev(ir::BasicBlock *now_bb, ir::BasicBlock *old_bb, ir::BasicBlock *new_bb) {
        if (get_bb_prev(now_bb->get_index())->count(old_bb->get_index())) {
            erase_from_prev(now_bb, old_bb);
            insert_prev(now_bb, new_bb);
            for (auto &inst : *now_bb->get_insts()) {
                TypeCase(phi, ir::instruction::Phi *, inst) {
                    auto temp = phi->get_src_temp(old_bb);
                    // phi->erase_src_temp(old_bb);
                    phi->set_src_temp(old_bb, new_bb, temp);
                }
                else {
                    break;
                }
            }
        }
    }

} // namespace middleend
