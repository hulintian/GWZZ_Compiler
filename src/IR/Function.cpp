#include "IR/Function.hpp"
#include "common/type.hpp"
#include <ostream>

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


}

// User Code End. Sasara
