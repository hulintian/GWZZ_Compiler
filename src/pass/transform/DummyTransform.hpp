// src/pass/DummyTransform.hpp
#pragma once

#include "pass/Pass.hpp"
#include "pass/analysis/FunctionCounter.hpp" 
#include "pass/PassManager.hpp"         
#include <iostream>

class DummyTransformPass : public pass::ModuleTransformPass {
public:
    const char* get_name() const override { return "DummyTransform"; }

    bool run(IR::Module& module, pass::PassManager& pm) override {
        auto& counter_result = pm.get_analysis_manager().get_module_result<FunctionCounterPass>(module);
        std::cout << "DummyTransform: Found " << counter_result.count << " functions!\n";
        return false; 
    }
};