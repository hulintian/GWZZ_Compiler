#pragma once

#include "Pass.hpp"

namespace pass{

class AliasTestPass : public FunctionTransformPass {
public:
    const char* get_name() const override {return "AliasTest";}
    bool run(IR::Function& function,pass::PassManager& pm)override;
};

}

