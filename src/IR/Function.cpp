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
void CFG::build_predecessors(){
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
        assert(_predecessors_built && "Predecessors not built! Call build_predecessors() first.");
        return _predecessor_map.at(const_cast<IR::BasicBlock*>(bb));
    }
}
// User Code End. Sasara
