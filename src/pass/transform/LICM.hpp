#include "pass/Pass.hpp"
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

class LICMPass : public FunctionTransformPass {
public:
    const char* get_name()const override {return "LoopInvariantCodeMotion";}
    bool run(IR::Function& function,PassManager& pm) override;

private:
    using LoopInvariantsSet = std::set<IR::Instruction *>; 
    bool run_on_loop (Loop* loop,
                      const DominatorTreeResult& dom_tree,
                      AliasAnalysisResult& AA,
                      IR::IRBuilder& ir_builder);
    bool is_loop_invariant (IR::Instruction* inst, 
                            const Loop* loop, 
                            const LoopInvariantsSet& hoisted_insts);
    bool can_be_safely_hoisted (IR::Instruction* inst, 
                                const Loop* loop,
                                const DominatorTreeResult& dom_tree,
                                AliasAnalysisResult& AA);
    IR::BasicBlock* get_or_create_preheader(Loop* loop, 
                                            const DominatorTreeResult& dom_tree,
                                            IR::IRBuilder& ir_builder);
};
}