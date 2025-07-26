#pragma once
#include "pass/Pass.hpp"
#include "pass/Analysis.hpp"
#include "pass/analysis/DominatorTree.hpp" 
#include "IR/BasicBlock.hpp"
#include "IR/Function.hpp"
#include <map>
#include <set>
#include <vector>

namespace pass{

class DominanceFrontierPass;

class DominanceFrontierResult : public AnalysisResult {
public:
    friend class DominanceFrontierPass;
    const std::set<IR::BasicBlock*>& get_frontier(IR::BasicBlock* bb) const {
        auto it = _frontiers.find(bb);
        if (it != _frontiers.end()) {
            return it->second;
        }
        static const std::set<IR::BasicBlock*> empty_set;
        return empty_set;
    }

private:
    std::map<IR::BasicBlock*, std::set<IR::BasicBlock*>> _frontiers;
};

class DominanceFrontierPass : public FunctionAnalysisPass {
public:
    using Result = DominanceFrontierResult;
    const char* get_name() const override { return "DominanceFrontier"; }
    std::unique_ptr<AnalysisResult> run(const IR::Function &func, PassManager& pm) override;

private:
    void compute_df(const IR::Function& F, const DominatorTreeResult& dt);
    void solve(IR::BasicBlock* B, const DominatorTreeResult& dt,
               const std::map<IR::BasicBlock*, std::vector<IR::BasicBlock*>>& dom_tree_children);
    DominanceFrontierResult* _result;
};

}


