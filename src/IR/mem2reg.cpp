#include "IR/mem2reg.hpp"
#include "IR/reverse_postorder.hpp"

#include <iostream>

namespace midend {

Mem2Reg::Mem2Reg(CFG *cfg) : cfg_(cfg) {
    for (auto bb : *cfg->get_bb_list()) DTnode_[bb] = new DominatorTree(bb);
    next_temp_id_ = cfg->get_func()->get_temp_used();
    build_dom();
    build_idom();
    build_df();
    build_temp_def();
    build_bb_temp_use_and_def();
    insert_phi();
    remove_useless_phi();
    // build_rename_map();
    rename(0);
    setphi();
    cfg->get_func()->set_temp_used(next_temp_id_);
}

void Mem2Reg::build_dom() {
    ReversePostOrder rpo(cfg_);
    bool flag = true;
    while (flag) {
        flag = false;
        for (auto bb : rpo.order) {
            // dom(bb) = {bb} U (dom(pres[0]) & dom(pres[1]) & ...)
            std::unordered_set<int> dom;
            auto prevs = cfg_->get_bb_prev(bb);
            bool init = true;
            for (auto iter = prevs->begin(); iter != prevs->end(); iter++) {
                if (init) {
                    if(DTnode_[*iter]->dom_.size() == 0) continue;
                    dom = DTnode_[*iter]->dom_;
                    init = false;
                } else {
                    if(DTnode_[*iter]->dom_.size() == 0) continue;
                    std::unordered_set<int> tmp;
                    for (auto dom_pre : dom) {
                        if (DTnode_[*iter]->dom_.count(dom_pre)) {
                            tmp.insert(dom_pre);
                        }
                    }
                    dom = tmp;
                }
            }
            dom.insert(bb);
            for (auto dom_tmp : dom) {
                if (!DTnode_[bb]->dom_.count(dom_tmp)) {
                    DTnode_[bb]->dom_.insert(dom_tmp);
                    flag = true;
                }
            }
        }
    }
    // for (auto bb : *cfg_->get_bb_list()) {
    //     printf("%d dom : ", bb);
    //     for (auto dom : DTnode_[bb]->dom_) {
    //         printf("%d ", dom);
    //     }
    //     printf("\n");
    // }
}

void Mem2Reg::build_idom() {
    for (auto bb : *cfg_->get_bb_list()) {
        if (bb == *cfg_->get_bb_list()->begin()) {
            DTnode_[bb]->idom_ = -1;
        } else {
            int idom = -1;
            for (auto pre : DTnode_[bb]->dom_) {
                if (pre == bb) continue;
                if (idom == -1) {
                    idom = pre;
                } else {
                    idom = DTnode_[pre]->dom_.count(idom) ? pre : idom;
                }
            }
            DTnode_[bb]->idom_ = idom;
            DTnode_[idom]->dom_succ_.insert(bb);
        }
    }
    // for (auto bb : *cfg_->get_bb_list()) {
    //     printf("%d children :\n", bb);
    //     for(auto dom_succ : DTnode_[bb]->dom_succ_){
    //         printf("%d ", dom_succ);
    //     }
    //     printf("\n");
    // }
}

void Mem2Reg::build_df() {
    for (auto bb : *cfg_->get_bb_list()) {
        for (auto pre : *cfg_->get_bb_prev(bb)) {
            while (pre != DTnode_[bb]->idom_) {
                DTnode_[pre]->df_.insert(bb);
                pre = DTnode_[pre]->idom_;
            }
        }
    }
    // for (auto bb : *cfg_->get_bb_list()) {
    //     printf("%d df : ", bb);
    //     for (auto df : DTnode_[bb]->df_) {
    //         printf("%d ", df);
    //     }
    //     printf("\n");
    // }
}

void Mem2Reg::build_temp_def() {
    for (auto bb : *cfg_->get_bb_list()) {
        for (auto ins : *cfg_->get_bb(bb)->get_insts()) {
            TypeCase(store, ir::instruction::Store *, ins){
                // std::cout << "ins: " << store->to_str() << std::endl;
                auto temp = store->get_addr();
                temp_map[temp->get_index()] = temp;
                temp_def_map[temp->get_index()].insert(bb);
            }
            else TypeCase(load, ir::instruction::Load *, ins){
                // std::cout << "ins: " << load->to_str() << std::endl;
                auto temp = load->get_dst();
                temp_map[temp->get_index()] = temp;
                temp_def_map[temp->get_index()].insert(bb);
            }
        }
    }
}

void Mem2Reg::build_bb_temp_use_and_def() {
    ReversePostOrder rpo(cfg_);
    auto po = rpo.order;
    std::reverse(po.begin(), po.end());
    for (auto bb : po) {
        for (auto ins : *cfg_->get_bb(bb)->get_insts()) {
            TypeCase(load, ir::instruction::Load *, ins){
                // std::cout << "ins: " << load->to_str() << std::endl;
                auto temp = load->get_addr();
                if (!DTnode_[bb]->temp_def_.count(temp->get_index())) {
                    DTnode_[bb]->temp_use_.insert(temp->get_index());
                }
            }
            else TypeCase(store, ir::instruction::Store *, ins){
                // std::cout << "ins: " << store->to_str() << std::endl;
                auto temp = store->get_addr();
                DTnode_[bb]->temp_def_.insert(temp->get_index());
            }
            // else TypeCase(alloca, ir::instruction::Alloca *, ins){
            //     // std::cout << "ins: " << alloca->to_str() << std::endl;
            //     auto temp = alloca->getaddr();
            //     DTnode_[bb]->temp_alloca_.insert(temp->get_index());
            // }
        }
    }
    // for (auto bb : *cfg_->get_bb_list()) {
    //     printf("%d def : ", bb);
    //     for (auto temp : DTnode_[bb]->temp_def_) {
    //         printf("%d ", temp);
    //     }
    //     printf("\n");
    // }
    bool flag = true;
    while (flag) {
        flag = false;
        for (auto bb : po) {
            for (auto suc : *cfg_->get_bb_succ(bb)) {
                for (auto temp : DTnode_[suc]->temp_use_) {
                    // if (!DTnode_[bb]->temp_def_.count(temp)) {
                    if (!DTnode_[bb]->temp_use_.count(temp)) {
                        DTnode_[bb]->temp_use_.insert(temp);
                        flag = true;
                    }
                }
            }
        }
        for (auto bb : rpo.order) {
            for (auto pre : *cfg_->get_bb_prev(bb)) {
                for (auto temp : DTnode_[pre]->temp_def_) {
                    // if(DTnode_[bb]->temp_alloca_.count(temp)) continue;
                    if (!DTnode_[bb]->temp_def_.count(temp)) {
                        DTnode_[bb]->temp_def_.insert(temp);
                        flag = true;
                    }
                }
            }
        }
    }
    // for (auto bb : *cfg_->get_bb_list()) {
    //     printf("%d use : ", bb);
    //     for (auto temp : DTnode_[bb]->temp_use_) {
    //         printf("%d ", temp);
    //     }
    //     printf("\n");
    // }
}

void Mem2Reg::build_rename_map() {
    int new_temp = 0;
    // 如果是 phi 或者 alloca 分配新标号
    for (auto bb : *cfg_->get_bb_list()) {
        for (auto ins : *cfg_->get_bb(bb)->get_insts()) {
            if (auto phi = dynamic_cast<ir::instruction::Phi *>(ins)) {
                DTnode_[bb]->temp_rename_map_[phi->get_dst()->get_index()] = new_temp++;
            } else if (auto store = dynamic_cast<ir::instruction::Store *>(ins)) {
                DTnode_[bb]->temp_rename_map_[phi->get_dst()->get_index()] = new_temp++;
            }
        }
    }
    bool flag = true;
    while (flag) {
        flag = false;
        for (auto bb : *cfg_->get_bb_list()) {
            for (auto pre : *cfg_->get_bb_prev(bb)) {
                for (auto map : DTnode_[pre]->temp_rename_map_) {
                    auto temp = map.first;
                    auto rename = map.second;
                    if (!DTnode_[bb]->temp_rename_map_.count(temp)) {
                        DTnode_[bb]->temp_rename_map_[temp] = rename;
                        flag = true;
                    }
                }
            }
        }
    }
    for (auto bb : *cfg_->get_bb_list()) {
        for (auto ins = cfg_->get_bb(bb)->get_insts()->begin(); ins != cfg_->get_bb(bb)->get_insts()->end(); ins++){
            if (auto phi = dynamic_cast<ir::instruction::Phi *>(*ins)) {
                std::vector<Temp*> values;
                std::vector<ir::BasicBlock*> bbs;
                for (int i = 0; i < phi->get_size(); i++) {
                    auto temp = phi->getvalues()->at(i)->get_index();
                    auto rename = DTnode_[bb]->temp_rename_map_[temp];
                    values.push_back(new Temp(rename, phi->getvalues()->at(i)->get_type()));
                    bbs.push_back(phi->get_bbs()->at(i));
                }
                *phi = ir::instruction::Phi(new Temp(DTnode_[bb]->temp_rename_map_[phi->get_dst()->get_index()], phi->get_dst()->get_type()), values, bbs);
            } else if (auto alloca = dynamic_cast<ir::instruction::Alloca *>(*ins)) {
                cfg_->get_bb(bb)->get_insts()->erase(ins);
                ins--;
            } else if (auto load = dynamic_cast<ir::instruction::Load *>(*ins)) {
                auto lhs = load->get_dst();
                cfg_->get_bb(bb)->get_insts()->erase(ins);
                ins--;
            } else if (auto save = dynamic_cast<ir::instruction::Store *>(*ins)) {
                
                cfg_->get_bb(bb)->get_insts()->erase(ins);
                ins--;
            }
        
        }
    }
}

void Mem2Reg::insert_phi() {
    // printf("BEGIN INSERT PHI\n");
    for (auto pi : temp_def_map) {
        auto W = pi.second;
        auto &temp = temp_map[pi.first];
        // printf("def : temp %d : ", temp->get_index());
        // for (auto def : W) {
        //     printf("%d ", def);
        // }
        // printf("\n");
        std::unordered_set<int> visit;
        while (!W.empty()) {
            auto X = *W.begin();
            W.erase(W.begin());
            for (auto Y : DTnode_[X]->df_) {
                if (visit.count(Y)) continue;
                insert_single_phi(temp, Y);
                visit.insert(Y);
                if (!pi.second.count(Y)) {
                    W.insert(Y);
                }
            }
        }
    }
}

void Mem2Reg::insert_single_phi(Temp* temp, int bb) {
    // printf("temp %d in bb %d\n", temp->get_index(), bb);
    auto temps = std::vector<Temp*>();
    auto bbs = std::vector<ir::BasicBlock*>();
    for (auto pre : *cfg_->get_bb_prev(bb)) {
        bbs.push_back((*cfg_->get_bb_map())[pre]);
        temps.push_back(new Temp(temp->get_index(), temp->get_type()));
    }
    cfg_->get_bb(bb)->add_inst_at_front(new ir::instruction::Phi(temp, temps, bbs, true));
}

void Mem2Reg::remove_useless_phi() {
    for (auto bb : *cfg_->get_bb_list()) {
        bool flag = false;
        for (std::vector<ir::Instruction *>::iterator ins = cfg_->get_bb(bb)->get_insts()->begin(); ins != cfg_->get_bb(bb)->get_insts()->end(); ins++) {
            if (flag == true) ins--, flag = false;
            if (auto phi = dynamic_cast<ir::instruction::Phi *>(*ins)) {
                if (!phi->need_change)continue;
                auto values = phi->getvalues();
                auto bbs = phi->get_bbs();
                // printf("bb %d phi %d\n", bb, phi->getdst()->get_index());
                if (!DTnode_[bb]->temp_use_.count(phi->get_dst()->get_index())) flag = true;
                else {
                    int count = 0;
                    for (int i = 0; i < values->size(); i++) {
                        if (DTnode_[(*bbs)[i]->get_index()]->temp_def_.count((*values)[i]->get_index())) {
                            (*values)[count] = (*values)[i];
                            (*bbs)[count] = (*bbs)[i];
                            count++;
                        }
                    }
                    if (count <= 1) flag = true;
                    else {
                        bbs->resize(count);
                        values->resize(count);
                    }
                }
                if (flag) {
                    // std::cout << "remove phi " << phi->to_str() << std::endl;
                    cfg_->get_bb(bb)->get_insts()->erase(ins);
                }
            } else {
                break;
            }
        }
    }
}

Temp *Mem2Reg::new_temp(int temp_id, Type type){
    Temp *temp = new Temp(next_temp_id_++, type);
    new_temp_from_[temp_id].push_back(temp);
    return temp;
}

void Mem2Reg::rename(int bb){
    std::unordered_set<int> old_temp_to_pop;
    std::unordered_map<int, int> pop_num;
    // std::cout << "rename" << std::endl;
    for (auto ins = cfg_->get_bb(bb)->get_insts()->begin(); ins != cfg_->get_bb(bb)->get_insts()->end(); ins++){
        TypeCase(alloca, ir::instruction::Alloca *, *ins){
            // std::cout << "ins: " << alloca->to_str() << std::endl;
            if(alloca->get_type().is_array()) continue;
            delete alloca;
            cfg_->get_bb(bb)->get_insts()->erase(ins);
            ins--;
            continue;
        }
        TypeCase(store, ir::instruction::Store *, *ins){
            // std::cout << "ins: " << store->to_str() << std::endl;
            if(store->not_delete()) continue;
            new_temp_from_[store->get_addr()->get_index()].push_back(store->get_src());
            old_temp_to_pop.insert(store->get_addr()->get_index());
            if(!pop_num.count(store->get_addr()->get_index()))
                pop_num[store->get_addr()->get_index()] = 1;
            else
                pop_num[store->get_addr()->get_index()]++;
            delete store;
            cfg_->get_bb(bb)->get_insts()->erase(ins);
            ins--;
            continue;
        }
        TypeCase(load, ir::instruction::Load *, *ins){
            // std::cout << "ins: " << load->to_str() << std::endl;
            if(load->not_delete()) continue;
            auto lhs = load->get_dst();
            auto rhs = new_temp_from_[load->get_addr()->get_index()].back();
            delete load;
            *ins = new ir::instruction::Assign(lhs, rhs);
            continue;
        }
        TypeCase(phi, ir::instruction::Phi *, *ins){
            if (!phi->need_change) continue;
            // std::cout << "ins: " << phi->to_str() << std::endl;
            auto temp_id = phi->get_dst()->get_index();
            auto type = phi->get_dst()->get_type().base_type;
            auto new_phi = new ir::instruction::Phi(new_temp(temp_id, type), *phi->getvalues(), *phi->get_bbs(), true);
            *ins = new_phi;
            delete phi;
            old_temp_to_pop.insert(temp_id);
            if(!pop_num.count(temp_id))
                pop_num[temp_id] = 1;
            else
                pop_num[temp_id]++;
        }
    }
    // std::cout << "cfg_succ: " << bb << std::endl;
    for(auto succ : *cfg_->get_bb_succ(bb)){
        // std::cout << "  succ: " << succ << std::endl;
        for (auto ins = cfg_->get_bb(succ)->get_insts()->begin(); ins != cfg_->get_bb(succ)->get_insts()->end(); ins++) {
            TypeCase(phi, ir::instruction::Phi *, *ins){
                if (!phi->need_change) continue;
                for (int i = 0; i < phi->get_size(); i++) {
                    if((*phi->get_bbs())[i]->get_index() == bb){
                        // std::cout << "      old phi: " << phi->to_str() << std::endl;
                        auto value = (*phi->getvalues())[i]->get_index();
                        // std::cout << value << std::endl;
                        if(new_temp_from_[value].empty()){
                            // std::cout << "      remove phi: " << phi->to_str() << std::endl;
                            delete phi;
                            cfg_->get_bb(succ)->get_insts()->erase(ins);
                            ins--;
                            break;
                            // (*phi->getbbs()).erase((*phi->getbbs()).begin() + i);
                            // (*phi->getvalues()).erase((*phi->getvalues()).begin() + i);
                            // i--;
                            // continue;
                        }
                        (*phi->getvalues())[i] = new_temp_from_[value].back();
                        auto new_phi = new ir::instruction::Phi(phi->get_dst(), *phi->getvalues(), *phi->get_bbs(), true);
                        *ins = new_phi;
                        delete phi;
                        break;
                    }
                }
                // std::cout << "      new phi: " << dynamic_cast<ir::instruction::Phi *>(*ins)->to_str() << std::endl;
            }
            else
                break;
        }
    }
    // std::cout << "dom_succ: " << DTnode_[bb]->dom_succ_.size() << std::endl;
    for(auto dom_succ : DTnode_[bb]->dom_succ_){
        rename(dom_succ);
    }
    // std::cout << "pop old: " << std::endl;
    for(auto id : old_temp_to_pop){
        while(pop_num[id] > 0){
            new_temp_from_[id].pop_back();
            pop_num[id]--;
        }
    }
}

void Mem2Reg::setphi() {
    for (auto bb : *cfg_->get_bb_list()) {
        for (auto ins = cfg_->get_bb(bb)->get_insts()->begin(); ins != cfg_->get_bb(bb)->get_insts()->end(); ins++) {
            TypeCase(phi, ir::instruction::Phi *, *ins){
                phi->need_change = false;
            }
            else break;
        }
    }
}

}
