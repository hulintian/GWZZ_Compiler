#include "BasicBlock.hpp"
#include "IR/Instructions.hpp"
#include <string>
#include "common/utils.hpp"
//User Code .Sasara
#include "IR/Function.hpp"
//User Code .Sasara
namespace IR {

void BasicBlock::dump(std::ostream& out) {
    out << this->bb_label  << "\n";
    // << std::to_string(this->get_bb_idx())
    for(auto i : this->get_intrs()) {
         print_indent(out, 4);
         out << i->to_str() 
             << '\n';
    }
}
//User Code Start. Sasara
Instruction* BasicBlock::get_terminator() const{
    if (_instrs.empty()) {
        return nullptr;
    }
    return _instrs.back();
}
const std::vector<BasicBlock*>& BasicBlock::get_successors() const{
    static std::vector<BasicBlock*> successors_cache;
    successors_cache.clear();

    Instruction* term_inst = get_terminator();
    if (term_inst == nullptr) {
        return successors_cache;
    }
    if (auto* br = dynamic_cast<BranchInst*>(term_inst)) {
        successors_cache.push_back(br->get_dst_bb());
    } 
    else if (auto* cond_br = dynamic_cast<CondBranchInst*>(term_inst)) {
        successors_cache.push_back(cond_br->get_true_bb());
        successors_cache.push_back(cond_br->get_false_bb());
    }
    return successors_cache;
}
const std::vector<BasicBlock*>& BasicBlock::get_predecessors() const{
        return _parent->get_cfg()->get_predecessors(this);
}
//User Code End. Sasara

}
