#pragma once
#include "pass/Pass.hpp"

namespace IR {
class Function;
class Instruction;
class PhiInst;
}

namespace pass {
    
class PHISimplifyPass : public FunctionTransformPass{
public:
    const char* get_name() const override{return "PHISimplify";}
    bool run(IR::Function& F,PassManager& pm)override;
private:
    bool cleanup_duplicate_entries(IR::PhiInst* phi);
};

} // namespace pass