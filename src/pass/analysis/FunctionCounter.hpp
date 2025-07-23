#pragma once

#include "pass/Pass.hpp"
#include "IR/Module.hpp"
#include <iostream>

namespace pass{

class FunctionCounterResult : public AnalysisResult {
public:
    int count = 0;
};

class FunctionCounterPass : public ModuleAnalysisPass {
public:
    using Result = FunctionCounterResult;
    const char* get_name() const override {return "FunctionCounter";}
    std::unique_ptr<AnalysisResult> run(const IR::Module& module, PassManager& pm) override{
        auto result = std::make_unique<FunctionCounterResult>();
        result->count=module.get_functions().size();
        return result;
    }
};

}

