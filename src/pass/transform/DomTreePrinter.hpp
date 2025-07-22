#pragma once

#include "pass/Pass.hpp"
#include <iostream>

class DomTreePrinterPass : public pass::FunctionTransformPass{
public:
    const char* get_name() const override{return "DomTreePrinter";}  
    bool run(IR::Function& function, pass::PassManager& pm) override;
};