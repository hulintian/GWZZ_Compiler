#pragma once
#include "Pass.hpp"

namespace IR {
class Function;
class Instruction;
class PhiInst;
}

namespace pass {
class UseDefResult;
    
class PHISimplifyPass : public FunctionTransformPass{
public:
    const char* get_name() const override{return "PHISimplify";}
    bool run(IR::Function& F,PassManager& pm)override;
private:
    IR::Function* _func;
    PassManager* _pm;
    UseDefResult* _use_def;
    // bool cleanup_duplicate_entries(IR::PhiInst* phi);
    // void refresh_analyses();
};

} // namespace pass
