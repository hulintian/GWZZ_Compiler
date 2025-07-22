#pragma once

#include "pass/Pass.hpp"
#include "IR/Module.hpp"
#include <iostream>

class FunctionCounterResult : public pass::AnalysisResult {
public:
    int count = 0;
};


class FunctionCounterPass : public pass::ModuleAnalysisPass {
public:
    using Result = FunctionCounterResult;
    const char* get_name() const override {return "FunctionCounter";}
    std::unique_ptr<pass::AnalysisResult> run(IR::Module& module, pass::PassManager& pm) override{
        auto result = std::make_unique<FunctionCounterResult>();
        result->count=module.get_functions().size();
        return result;
    }
};