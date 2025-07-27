#pragma once
#include "pass/Pass.hpp"

namespace pass{

class CFGSimplifyPass: public FunctionTransformPass {
public:
    const char* get_name()const override{return "CFGSimplify";}
    bool run(IR::Function &func,PassManager &pm)override;
};


 
}