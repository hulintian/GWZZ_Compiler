#pragma once
#include "Pass.hpp"
#include <set>
namespace IR{
class BasicBlock;
class Instruction;
class IRBuilder;
}
namespace pass{
class Loop;
class DominatorTreeResult;
class AliasAnalysisResult;
class LoopInfoResult;

class LICMPass : public FunctionTransformPass {
public:
    const char* get_name()const override {return "LoopInvariantCodeMotion";}
    bool run(IR::Function& function,PassManager& pm) override;

private:
    PassManager* _pm = nullptr;
    IR::Function* _F = nullptr;
    IR::IRBuilder* _builder = nullptr;
    DominatorTreeResult* _dom_tree = nullptr;
    AliasAnalysisResult* _AA = nullptr;
    LoopInfoResult* _loop_info = nullptr; // 存储对整个LoopInfo结果的指针

    bool run_on_loop(Loop* loop);
    IR::BasicBlock* get_or_create_preheader(Loop* loop);
    void refresh_analyses();

    using LoopInvariantsSet = std::set<IR::Instruction *>; 
    
    bool is_loop_invariant (IR::Instruction* inst, 
                            const Loop* loop, 
                            const LoopInvariantsSet& hoisted_insts);
    bool can_be_safely_hoisted (IR::Instruction* inst, 
                                const Loop* loop,
                                const DominatorTreeResult& dom_tree,
                                AliasAnalysisResult& AA);
    
};
}
