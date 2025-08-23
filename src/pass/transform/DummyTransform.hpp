// src/pass/DummyTransform.hpp
#pragma once

#include "Pass.hpp"
#include "FunctionCounter.hpp" 
#include "PassManager.hpp"         
#include <iostream>

namespace pass{

class DummyTransformPass : public ModuleTransformPass {
public:
    const char* get_name() const override { return "DummyTransform"; }

    bool run(IR::Module& module, PassManager& pm) override {
        auto& counter_result = pm.get_analysis_manager().get_module_result<FunctionCounterPass>(module);
        std::cout << "DummyTransform: Found " << counter_result.count << " functions!\n";
        return false; 
    }
};


}

