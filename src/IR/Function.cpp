#include "Function.hpp"
#include "BasicBlock.hpp"
#include "Instructions.hpp"
#include "type.hpp"
#include <cstddef>
#include <optional>
#include <ostream>
#include <stack>
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

void CFG::dump(std::ostream &out) {
    for(auto bb : _bbs) {
        bb->dump(out);
        out << "\n";
    }
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


void CFG::regen_cfg() {
}
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

void CFG::rm_predecessor(BasicBlock* bb, BasicBlock* pred_to_remove){
    if(!_predecessors_built){
        _build_predecessors();
    } 
    assert(_predecessors_built && "Predecessors not built! Call build_predecessors() first.");
    auto it = _predecessor_map.find(bb);
    if (it == _predecessor_map.end()) {
        assert(false && "BasicBlock not found in predecessor map!");
        return;
    }
    std::vector<BasicBlock*>& preds = it->second;
    auto new_end = std::remove(preds.begin(), preds.end(), pred_to_remove);
    preds.erase(new_end, preds.end());
    //写时作废
    _predecessors_built = false;
}
void CFG::add_predecessor(BasicBlock* bb, BasicBlock* pred_to_add) {
    if(!_predecessors_built){
        _build_predecessors();
    } 
    _predecessor_map[bb].push_back(pred_to_add);
    //写时作废
    _predecessors_built = false;
}
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

void CFG::regen_cfg() {
    // update bb2idx 

    // start from entry bb 
    BasicBlock* bb = this->entry_bb;
    std::stack<BasicBlock*> stk;
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


}

// User Code End. Sasara
