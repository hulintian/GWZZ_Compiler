#include "pass/analysis/DominatorTree.hpp"
#include <memory>

namespace pass{

std::unique_ptr<AnalysisResult> 
DominatorTreePass::run(const IR::Function &func, PassManager& pm){
    auto result = std::make_unique<DominatorTreeResult>();
    if(func.get_basic_blocks().empty())return result;
    compute_idoms(func,*result);
    return result;
}
void DominatorTreePass::compute_idoms(const IR::Function& F, DominatorTreeResult& result){
    const auto &blocks = F.get_basic_blocks();
    IR::BasicBlock *entry = F.get_entry_bb();
    std::map<IR::BasicBlock*, int> post_order_map;
    std::set<IR::BasicBlock*> visited;
    int post_order_counter = 0;
    F.post_order_traversal([&](IR::BasicBlock* bb){
        post_order_map[bb] = post_order_counter++;
    });

    std::map<IR::BasicBlock*,IR::BasicBlock*> idoms;
    for(auto &bb : blocks){
        idoms[bb]=nullptr;
    }
    idoms[entry] = entry;
    //depths[entry] = 0;

    bool changed = true;
    while (changed){
        changed = false;
        //这里后续遍历，迭代速度会快一点.
        std::vector<IR::BasicBlock*> worklist = F.get_reverse_post_order();
        for (auto& bb : worklist){
            if(bb == entry) continue;
            IR::BasicBlock* new_idom = nullptr;
            const auto& preds = bb->get_predecessors();
            for (IR::BasicBlock* p : preds) {
                if (idoms[p] != nullptr) {
                    new_idom = p;
                    break;
                }
            }
            if(new_idom == nullptr) continue;
            for(IR::BasicBlock* p :preds){
                if(p == new_idom) continue;
                if(idoms[p] != nullptr){
                    new_idom = intersect(p,new_idom,idoms,post_order_map);
                }
            }
            //更新
            if(idoms[bb]!= new_idom){
                idoms[bb]=new_idom;
                changed=true;
            }
        }
    }
    idoms[entry]=nullptr;
    result.idom_map=idoms;
}

//寻找最近公共祖先（在支配树）
IR::BasicBlock* DominatorTreePass::intersect(IR::BasicBlock* BB_A,IR::BasicBlock* BB_B,
                              const std::map<IR::BasicBlock*,IR::BasicBlock*> idoms,
                              const std::map<IR::BasicBlock*, int>& post_order){
    IR::BasicBlock* p1 = BB_A;
    IR::BasicBlock* p2 = BB_B;
    while (p1 != p2) {
        while (post_order.at(p1) < post_order.at(p2)) {
            p1 = idoms.at(p1);
        }
        while (post_order.at(p2) < post_order.at(p1)) {
            p2 = idoms.at(p2);
        }
    }
    return p1;
}

}
