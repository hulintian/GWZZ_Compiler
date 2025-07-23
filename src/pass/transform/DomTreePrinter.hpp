#pragma once

#include "pass/Pass.hpp"
#include <iostream>

namespace pass{

class DomTreePrinterPass : public FunctionTransformPass{
public:
    const char* get_name() const override{return "DomTreePrinter";}  
    bool run(IR::Function& function, PassManager& pm) override;
};
    
} // namespace pass


