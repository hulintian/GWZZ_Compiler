#include "pass/analysis/DominanceFrontier.hpp"
#include "pass/PassManager.hpp"
#include <memory>

namespace pass{

std::unique_ptr<AnalysisResult> 
DominanceFrontierPass::run(const IR::Function &func,PassManager& pm){
    auto result = std::make_unique<DominanceFrontierResult>();
    if(func.get_basic_blocks().empty())return result;
    _result = result.get();
    auto& dom_tree = pm.get_analysis_manager().get_function_result<DominatorTreePass>(func);
    // dom_tree构造树形结构
    std::map<IR::BasicBlock*, std::vector<IR::BasicBlock*>> dom_tree_children;
    for (auto& bb : func.get_basic_blocks()) {
        auto idom = dom_tree.get_idom(bb);
        if (idom != nullptr) {
            dom_tree_children[idom].push_back(bb);
        }
    }
    //后续遍历计算
    solve(func.get_entry_bb(), dom_tree, dom_tree_children);
    return result;
}

void DominanceFrontierPass::solve(IR::BasicBlock* B, const DominatorTreeResult& dt,
                                  const std::map<IR::BasicBlock*, std::vector<IR::BasicBlock*>>& dom_tree_children) {
    //递归
    auto it = dom_tree_children.find(B);
    if (it != dom_tree_children.end()) {
        for (auto* child : it->second) {
            solve(child, dt, dom_tree_children);
        }
    }

    std::set<IR::BasicBlock*>& df_b = _result->_frontiers[B];
    df_b.clear();
    //DF_local()
    for (auto* successor : B->get_successors()) {
        if (dt.get_idom(successor) != B) {
            df_b.insert(successor);
        }
    }
    //DF_up()
    if(it != dom_tree_children.end()){

        for(auto* dt_child : it->second){
            const auto& df_child = _result->get_frontier(dt_child);

            for (auto* Y : df_child) {
                // B不严格支配Y那么Y的边界需要向上传递
                if (dt.get_idom(Y) != B) {
                    df_b.insert(Y);
                }
            }
        }
    }
}


}