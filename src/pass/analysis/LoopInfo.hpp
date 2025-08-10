#pragma once

#include "Pass.hpp"
#include "Analysis.hpp"
#include "Loop.hpp"
#include "DominatorTree.hpp"

namespace IR{
class Function;
}


namespace pass{

//Loop分析结果类
class LoopInfoResult : public AnalysisResult{
public:
    //顶层loop
    std::vector<std::unique_ptr<Loop>> all_loops;
    std::vector<Loop*> top_level_loops;
    std::map<IR::BasicBlock*, Loop*> block_to_loop_map;
    Loop* get_loop_for(IR::BasicBlock* bb) const {
        auto it = block_to_loop_map.find(bb);
        if(it != block_to_loop_map.end()) return it->second;
        return nullptr;
    }

};

class LoopInfoPass : public FunctionAnalysisPass{
public:
    using Result = LoopInfoResult;
    const char* get_name()const override{return "LoopInfo";}
    std::unique_ptr<AnalysisResult> run(const IR::Function& function,PassManager& pm) override;

private:
    void find_loops(const IR::Function& F, const DominatorTreeResult& dom_tree, LoopInfoResult& result);
    void build_loop_body(IR::BasicBlock* header, IR::BasicBlock* tail, Loop* loop);
    void build_loop_nesting_tree(LoopInfoResult& result);
};

}

