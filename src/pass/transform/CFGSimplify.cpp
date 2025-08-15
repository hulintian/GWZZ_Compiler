#include "CFGSimplify.hpp"
#include "PassManager.hpp"
#include "Function.hpp"
#include "BasicBlock.hpp"
#include "Instructions.hpp"
#include <vector>
#include <set>
#include <tuple>

namespace pass {

static bool can_removed(IR::BasicBlock* pred,IR::BasicBlock* removedBB,IR::BasicBlock* succ){
    for (auto* inst : succ->get_intrs()){
        if(auto* phi = dynamic_cast<IR::PhiInst*>(inst)){
            Value* vRemoved = phi->get_incoming_value_for_block(removedBB);
            if(!vRemoved) continue;

            Value* vPred = nullptr;
            for (unsigned i = 0; i < phi->get_num_incoming(); ++i){
                if (phi->get_incoming_block(i) == pred){
                    vPred = phi->get_incoming_value(i);
                    break;
                }
            }
            if (vPred && vPred != vRemoved){
                return false;
            }
        }else{
            break;
        }
    }
    return true;
}

// CACHE: 改边前需要缓存的信息
struct PhiPatch { IR::PhiInst* phi; Value* vRemoved; }; // successor 顶部某个 PHI 对应 removed 的值
struct RedirectPlan {
    IR::BasicBlock* removed;                 // 将要删除的跳板块
    IR::BasicBlock* succ;                    // 其唯一后继
    std::vector<IR::BasicBlock*> preds;      // 改边前的前驱快照（按“每块唯一”的 PHI 语义）
    std::vector<PhiPatch> phi_entries;       // successor 顶部各个 PHI 中来自 removed 的条目值
};

bool CFGSimplifyPass::run(IR::Function& func,PassManager& pm){
    bool function_changed = false;
    bool changed_in_iteration = true;

    //定点迭代
    while (changed_in_iteration){
        changed_in_iteration = false;

        std::vector<IR::BasicBlock*> to_remove;
        std::vector<RedirectPlan> plans;
        //pre , old ,new
        //std::vector<std::tuple<IR::BasicBlock*, IR::BasicBlock*, IR::BasicBlock*>> edges_to_redirect;
        
        for (auto& bb : func.get_basic_blocks()){

            if (bb->get_intrs().size() == 1 && bb->get_terminator()->is_unconditional_br()) {
                auto br_inst = dynamic_cast<IR::BranchInst*>(bb->get_terminator());
                IR::BasicBlock* successor = br_inst->get_dst_bb();
                if (bb == func.get_entry_bb() || bb == successor) {
                    continue;
                }
                bool can_rm = true;
                for (IR::BasicBlock* pred : bb->get_predecessors()) {
                    if (!can_removed(pred,bb,successor)){
                        can_rm = false;
                        break;
                    }
                }
                if(!can_rm){
                    continue;
                }
                RedirectPlan plan;
                plan.removed = bb;
                plan.succ    = successor;
                plan.preds   = bb->get_predecessors(); 
                
                // 快照 successor 顶部 PHI 中来自 removed 的值
                for (auto* inst : successor->get_intrs()) {
                    auto* phi = dynamic_cast<IR::PhiInst*>(inst);
                    if (!phi) break; // 只遍历 PHI 区段
                    if (Value* v = phi->get_incoming_value_for_block(bb)) {
                        plan.phi_entries.push_back({phi, v});
                    }
                }

                to_remove.push_back(bb);
                plans.push_back(std::move(plan));
                break;
            }
        }
        if (!to_remove.empty()){
            changed_in_iteration = true;
            function_changed = true;
            for (const auto& plan : plans) {
                for (IR::BasicBlock* pred : plan.preds) {
                    pred->get_terminator()->replace_successor(plan.removed, plan.succ);
                }
            }
            //调整phi
            for (const auto& plan : plans) {
                // successor 顶部 PHI
                for (const auto& pe : plan.phi_entries) {
                    IR::PhiInst* phi = pe.phi;
                    Value* val       = pe.vRemoved;

                    // 安全：把 [*, removed] 全部删空（若一次只能删一条，就循环删）
                    while (phi->get_incoming_value_for_block(plan.removed)) {
                        phi->remove_incoming_by_block(plan.removed);
                    }

                    // 语义：每前驱块唯一——只在缺失时补一条
                    for (IR::BasicBlock* pred : plan.preds) {
                        if (phi->get_incoming_value_for_block(pred) == nullptr) {
                            // can_removed 已经保证不会出现值冲突
                            phi->add_incoming(val, pred);
                        }
                    }

                    // 可选：把“全相等/单来边折叠”放到 PHISimplify，这里不做
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
