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

        std::vector<IR::BasicBlock*> worklist;
        std::set<IR::BasicBlock*> deleted_blocks_this_iteration;
        for (auto& bb : func.get_basic_blocks()) {
            worklist.push_back(bb);
        }
        for (IR::BasicBlock* bb : worklist){
            if (deleted_blocks_this_iteration.count(bb)) {
                continue;
            }
            if (bb->get_intrs().size() == 1 && bb->get_terminator()->is_unconditional_br()) {
                auto br_inst = dynamic_cast<IR::BranchInst*>(bb->get_terminator());
                IR::BasicBlock* successor = br_inst->get_dst_bb();
                if (bb == func.get_entry_bb() || bb == successor) {
                    continue;
                }
                //核心
                std::vector<IR::BasicBlock*> predecessors = bb->get_predecessors();
                for (IR::BasicBlock* pred : predecessors) {
                    pred->get_terminator()->replace_successor(bb, successor);
                }
                // 更新 successor 的前驱列表
                successor->remove_predecessor(bb); // 从后继的前驱中移除自己
                for (IR::BasicBlock* pred : predecessors) {
                    successor->add_predecessor(pred); // 把自己的前驱送给后继
                }

                func.rm_basic_block(bb);
                deleted_blocks_this_iteration.insert(bb);
                changed_in_iteration = true;
                function_changed = true;
            }
        }
    }
}


}
