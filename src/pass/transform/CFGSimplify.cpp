#include "CFGSimplify.hpp"
#include "PassManager.hpp"
#include "Function.hpp"
#include "BasicBlock.hpp"
#include "Instructions.hpp"
#include <vector>
#include <set>

namespace pass {

bool CFGSimplifyPass::run(IR::Function& func,PassManager& pm){
    bool function_changed = false;
    bool changed_in_iteration = true;

    //定点迭代
    while (changed_in_iteration){
        changed_in_iteration = false;

        std::vector<IR::BasicBlock*> to_remove;
        //pre , old ,new
        std::vector<std::tuple<IR::BasicBlock*, IR::BasicBlock*, IR::BasicBlock*>> edges_to_redirect;
        
        for (auto& bb : func.get_basic_blocks()){

            if (bb->get_intrs().size() == 1 && bb->get_terminator()->is_unconditional_br()) {
                auto br_inst = dynamic_cast<IR::BranchInst*>(bb->get_terminator());
                IR::BasicBlock* successor = br_inst->get_dst_bb();
                if (bb == func.get_entry_bb() || bb == successor) {
                    continue;
                }
                // 所有条件满足 
                to_remove.push_back(bb);
                for (IR::BasicBlock* pred : bb->get_predecessors()) {
                    edges_to_redirect.emplace_back(pred, bb, successor);
                }
                break;
            }
        }
        if (!to_remove.empty()){
            changed_in_iteration = true;
            function_changed = true;
            for (const auto& edge : edges_to_redirect) {
                IR::BasicBlock* pred = std::get<0>(edge);
                IR::BasicBlock* old_succ = std::get<1>(edge);
                IR::BasicBlock* new_succ = std::get<2>(edge);
                pred->get_terminator()->replace_successor(old_succ, new_succ);
            }
            //调整phi
            for (auto& bb_removed : to_remove){
                auto successor = bb_removed->get_successors().at(0);
                std::vector<IR::BasicBlock*> predecessors = bb_removed->get_predecessors();

                for (auto& inst : successor->get_intrs()){
                    if (auto* phi = dynamic_cast<IR::PhiInst*>(inst)){
                        Value* val = phi->get_incoming_value_for_block(bb_removed);
                        phi->remove_incoming_by_block(bb_removed);
                        if (val) {
                            for (IR::BasicBlock* pred : predecessors) {
                                phi->set_incoming(val, pred);
                            }
                        }
                    }
                }
            }
            for (IR::BasicBlock* bb_to_remove : to_remove) {
                func.rm_basic_block(bb_to_remove);
            }
            func.refresh_predecessors();
        }
    }
    return function_changed;
}


}
