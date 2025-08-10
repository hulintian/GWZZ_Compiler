#include "BasicBlock.hpp"
#include "Instructions.hpp"
#include <string>
#include "common/utils.hpp"
//User Code .Sasara
#include "IR/Function.hpp"
#include <iostream>
//User Code .Sasara
namespace IR {

void BasicBlock::dump(std::ostream& out) {
    out << this->bb_label  << "\n";
    // << std::to_string(this->get_bb_idx())
    for(auto i : this->get_intrs()) {
        assert(i->get_parent() == this && "Instruction's parent pointer is inconsistent!");
        print_indent(out, 4);
        out << i->to_str() 
            << '\n';
    }
}
//User Code Start. Sasara
void BasicBlock::add_instr(Instruction* i) {
    this->get_intrs().push_back(i);
    i->set_parent(this);
}
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
void BasicBlock::remove_predecessor(BasicBlock* bb){
    _parent->get_cfg()->rm_predecessor(this,bb);
}
void BasicBlock::add_predecessor(BasicBlock* bb){
    _parent->get_cfg()->add_predecessor(this,bb);
}
Instruction* BasicBlock::remove_instr(Instruction* inst) {
    std::cout << "  [ERASE] Find result for " << inst->to_str() << ": ";
    auto it = std::find(_instrs.begin(), _instrs.end(), inst);
    if (it != _instrs.end()) {
        std::cout << "FOUND!" << std::endl;
        _instrs.erase(it);
        return inst;
    }else{
        std::cout << "NOT FOUND!" << std::endl;
    }
    inst->set_parent(nullptr);
    return nullptr;
}
void BasicBlock::delete_instr(Instruction* inst){
    if (!inst) return;
    inst->sever_all_uses();
    this->remove_instr(inst);
    delete inst;
}

void BasicBlock::add_instr_before_terminator(Instruction* inst) {
    auto insert_pos = _instrs.end();
    if (!_instrs.empty()) {
        Instruction* terminator = _instrs.back();
        if (terminator->is_terminator()) {
            insert_pos = std::prev(_instrs.end());
        }
    }
    //更新信息
    inst->set_parent(this);
    _instrs.insert(insert_pos, inst);
}
void BasicBlock::add_instruction_at_front(Instruction* inst) {
    inst->set_parent(this);
    _instrs.insert(_instrs.begin(), inst);
}

//User Code End. Sasara

}
