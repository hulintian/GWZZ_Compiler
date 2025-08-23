#pragma once

#include "Pass.hpp"

namespace pass{

class LoopInfoPrinterPass : public FunctionTransformPass{
public:
    const char* get_name()const override{return "LoopInfoPrinter";}
    bool run(IR::Function& function,PassManager& pm)override;
};

}
