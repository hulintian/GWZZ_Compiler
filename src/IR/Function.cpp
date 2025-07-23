#include "IR/Function.hpp"
#include "IR/BasicBlock.hpp"
#include "IR/Instructions.hpp"
#include "common/type.hpp"
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
    // start from entry bb 
    BasicBlock* bb = this->entry_bb;
    std::stack<BasicBlock*> stk;
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
                stk.push(next_bb);
            } else if(std::holds_alternative<CondBranchInst*>(*br_inst)) {
                auto cbi = std::get<CondBranchInst*>(*br_inst);
                auto next_t_bb = cbi->get_true_bb();
                auto next_f_bb = cbi->get_false_bb();
                succ_bb[top->get_bb_idx()].insert(next_t_bb->get_bb_idx());
                succ_bb[top->get_bb_idx()].insert(next_f_bb->get_bb_idx());

                prev_bb[next_t_bb->get_bb_idx()].insert(top->get_bb_idx());
                prev_bb[next_f_bb->get_bb_idx()].insert(top->get_bb_idx());
            }
        }
    }
}


}
