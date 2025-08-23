#pragma once
#include "Pass.hpp"

namespace pass {
    
class DomFrontierPrinterPass : public FunctionTransformPass{
public:
    const char* get_name() const override{return "DomFrontierPrinter";}
    bool run(IR::Function& function,PassManager& pm)override;
};
} // namespace pass
