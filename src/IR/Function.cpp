#include "Function.hpp"
#include "BasicBlock.hpp"
#include "Instructions.hpp"
#include "type.hpp"
#include <map>
#include <optional>
#include <ostream>
#include <stack>
#include <algorithm>
#include <variant>

namespace IR {

void  Function::dump(std::ostream &out) {
    out << "define " << type_string(*this->get_return_type())  << " "
        << this->get_func_name() ;

    out << " ( " ;
    // the params
    auto ps = this->get_params_type();
    for(int i=0; i < ps.size(); i++) {
        out << type_string(*ps[i]);
        if(i != ps.size()-1) {
            out << ", ";
        }
    }
    out << " ) ";

    out << "{\n";
    // the body 
    this->get_cfg()->dump(out);
    out << "}\n";
}

void Function::dump_head(std::ostream &out) {
    out << "define " << type_string(*this->get_return_type())  << " "
        << this->get_func_name() ;

    out << " ( " ;
    // the params
    auto ps = this->get_params_type();
    for(int i=0; i < ps.size(); i++) {
        out << type_string(*ps[i]);
        if(i != ps.size()-1) {
            out << ", ";
        }
    }
    out << " ) ";
}

void CFG::dump(std::ostream &out) {
    for(auto bb : _bbs) {
        bb->dump(out);
        out << "\n";
    }
} 

bool Function::is_param(Instruction *instr) {
    if(auto alloc = dynamic_cast<AllocaInst*>(instr)) {
        auto it = std::find(this->allocas.begin(), this->allocas.end(), alloc);
        if(it != this->allocas.end() && it - this->allocas.begin() < this->_arg_names.size() ) {
            return true;
        }
    }
    return false;
}

// User Code Start. Sasara
void CFG::_build_predecessors()const{
    if (_predecessors_built) return;
    _predecessor_map.clear();
    for(BasicBlock *bb : _bbs){
        _predecessor_map[bb] = {};
    }
    for(BasicBlock* bb : _bbs){
        for (BasicBlock* succ : bb->get_successors()) { 
            _predecessor_map[succ].push_back(bb);
        }
    }
    _predecessors_built = true;
}
void CFG::build_predecessors()const{
    _build_predecessors();
}
// 后序
void Function::post_order_traversal(std::function<void(BasicBlock*)> callback) const{
    std::set<BasicBlock*> visited;
    std::stack<BasicBlock*> stack;
    std::stack<BasicBlock*> post_order_stack;
    stack.push(this->get_entry_bb());
    while (!stack.empty()) {
        BasicBlock* current = stack.top();
        stack.pop();

        if (visited.count(current)) continue;
        visited.insert(current);

        post_order_stack.push(current);

        for (BasicBlock* succ : current->get_successors()) {
            stack.push(succ);
        }
    }
    while (!post_order_stack.empty()) {
        callback(post_order_stack.top());
        post_order_stack.pop();
    }
}
//逆后序
std::vector<BasicBlock*> Function::get_reverse_post_order()const{
    std::vector<BasicBlock*> post_order_list;
    this->post_order_traversal([&post_order_list](BasicBlock* bb) {
        post_order_list.push_back(bb);
    });
    std::reverse(post_order_list.begin(), post_order_list.end());
    return post_order_list;
}

const std::vector<BasicBlock*>& CFG::get_predecessors(const BasicBlock* bb) const {
    if(!_predecessors_built){
        _build_predecessors();
    } 
    assert(_predecessors_built && "Predecessors not built! Call build_predecessors() first.");
    return _predecessor_map.at(const_cast<IR::BasicBlock*>(bb));
}

// void CFG::rm_predecessor(BasicBlock* bb, BasicBlock* pred_to_remove){
//     if(!_predecessors_built){
//         _build_predecessors();
//     } 
//     assert(_predecessors_built && "Predecessors not built! Call build_predecessors() first.");
//     auto it = _predecessor_map.find(bb);
//     if (it == _predecessor_map.end()) {
//         assert(false && "BasicBlock not found in predecessor map!");
//         return;
//     }
//     std::vector<BasicBlock*>& preds = it->second;
//     auto new_end = std::remove(preds.begin(), preds.end(), pred_to_remove);
//     preds.erase(new_end, preds.end());
//     //写时作废
//     _predecessors_built = false;
// }
// void CFG::add_predecessor(BasicBlock* bb, BasicBlock* pred_to_add) {
//     if(!_predecessors_built){
//         _build_predecessors();
//     } 
//     _predecessor_map[bb].push_back(pred_to_add);
//     //写时作废
//     _predecessors_built = false;
// }
void CFG::refresh_predecessors(){
    _predecessors_built = false;
}


using BrInst = std::variant<BranchInst*, CondBranchInst*>;
std::optional<BrInst> get_br_instr(Instruction* instr) {    
    if(auto res = dynamic_cast<BranchInst*>(instr)) {
        return res;
    } else if(auto res = dynamic_cast<CondBranchInst*>(instr)) { 
        return res;
    }
    return std::nullopt;
}


void CFG::dump_cfg(const std::string& title) const {
    std::cout << "--- " << title << " ---\n";

    // 1. 打印所有基本块及其索引 (bb_idx)
    std::cout << "\n[1] Basic Blocks in CFG (" << _bbs.size() << " total):\n";
    for (const auto& bb : _bbs) {
        if (bb) {
            // 假设你的BasicBlock有get_bb_idx()和get_name()方法
            std::cout << "  - BB ID: " << bb->get_bb_idx() 
                      << ", Name: " << bb->get_name() << "\n";
        } else {
            std::cout << "  - NULL Basic Block Pointer found!\n";
        }
    }

    // 2. 打印索引到基本块指针的映射 (idx2bb)
    std::cout << "\n[2] Index to BasicBlock Map (idx2bb):\n";
    for (const auto& pair : idx2bb) {
        if (pair.second) {
            std::cout << "  - Index " << pair.first << " -> BB '" 
                      << pair.second->get_name() << "'\n";
        } else {
            std::cout << "  - Index " << pair.first << " -> NULL Pointer!\n";
        }
    }
    
    // 3. 打印后继关系 (succ_bb)
    std::cout << "\n[3] Successor Map (succ_bb):\n";
    // 最好遍历所有已知的块，而不是只遍历map的键，以防有块没有后继
    for (const auto& bb : _bbs) {
        if (!bb) continue;
        int current_idx = bb->get_bb_idx();
        std::cout << "  - BB " << current_idx << " ('" << bb->get_name() << "') successors: ";
        
        auto it = succ_bb.find(current_idx);
        if (it != succ_bb.end() && !it->second.empty()) {
            std::cout << "{ ";
            for (int succ_idx : it->second) {
                std::cout << succ_idx << " ";
            }
            std::cout << "}\n";
        } else {
            std::cout << "{ (none) }\n";
        }
    }

    // 4. 打印前驱关系 (prev_bb)
    std::cout << "\n[4] Predecessor Map (prev_bb):\n";
    for (const auto& bb : _bbs) {
        if (!bb) continue;
        int current_idx = bb->get_bb_idx();
        std::cout << "  - BB " << current_idx << " ('" << bb->get_name() << "') predecessors: ";

        auto it = prev_bb.find(current_idx);
        if (it != prev_bb.end() && !it->second.empty()) {
            std::cout << "{ ";
            for (int pred_idx : it->second) {
                std::cout << pred_idx << " ";
            }
            std::cout << "}\n";
        } else {
            std::cout << "{ (none) }\n";
        }
    }

    std::cout << "--- End of " << title << " ---\n\n";
}

// User Code End. Sasara

void CFG::regen_cfg() {
    // update bb2idx 

    succ_bb.clear();
    prev_bb.clear();
    // start from entry bb 
    BasicBlock* bb = this->entry_bb;
    std::stack<BasicBlock*> stk;
    this->succ_bb.clear();
    this->prev_bb.clear();
    std::map<int, bool> visited;
    stk.push(bb);
    while(!stk.empty()) {
        auto top = stk.top();
        stk.pop();
        auto br_inst = get_br_instr(top->get_intrs().back());
        if(br_inst) {
            if(std::holds_alternative<BranchInst*>(*br_inst)) {
                auto bi = std::get<BranchInst*>(*br_inst);
                auto next_bb = bi->get_dst_bb();
                succ_bb[top->get_bb_idx()].insert(next_bb->get_bb_idx());
                prev_bb[next_bb->get_bb_idx()].insert(top->get_bb_idx());

                if(!visited[next_bb->get_bb_idx()]) {
                    stk.push(next_bb);
                    visited[next_bb->get_bb_idx()] = true;
                }
            } else if(std::holds_alternative<CondBranchInst*>(*br_inst)) {
                auto cbi = std::get<CondBranchInst*>(*br_inst);
                auto next_t_bb = cbi->get_true_bb();
                auto next_f_bb = cbi->get_false_bb();
                succ_bb[top->get_bb_idx()].insert(next_t_bb->get_bb_idx());
                succ_bb[top->get_bb_idx()].insert(next_f_bb->get_bb_idx());

                prev_bb[next_t_bb->get_bb_idx()].insert(top->get_bb_idx());
                prev_bb[next_f_bb->get_bb_idx()].insert(top->get_bb_idx());

                if(!visited[next_t_bb->get_bb_idx()]) {
                    stk.push(next_t_bb);
                    visited[next_t_bb->get_bb_idx()] = true;
                } 

                if(!visited[next_f_bb->get_bb_idx()]) {
                    stk.push(next_f_bb);
                    visited[next_f_bb->get_bb_idx()] = false;
                }
            }
        }
    }
}

void Function::re_scain_allocas() {
    this->allocas.clear();

    std::map<int, bool> visited;
    std::stack<BasicBlock*> stk;

    stk.push(this->entry_bb);

    this->_cfg->regen_cfg();
    while(!stk.empty()) {
        auto cbi = stk.top();
        stk.pop();
        for(auto nbi : this->_cfg->succ_bb[cbi->get_bb_idx()]) {
            if(!visited[nbi]) {
                stk.push(this->_cfg->idx2bb[nbi]);
            }
        }

        if(!visited[cbi->get_bb_idx()]) {
            visited[cbi->get_bb_idx()] = true;
            for(auto inst: cbi->get_intrs()) {
                if(auto ai = dynamic_cast<AllocaInst*>(inst)) {
                    this->allocas.push_back(ai);
                }
            }
        }
    }
}

}

