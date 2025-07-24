#pragma once 
#include "pass/PassManager.hpp"
#include "pass/Pass.hpp"
#include <iostream>

namespace pass{
    
class HelloWorldPass : public ModuleTransformPass{
    const char* get_name() const override{return "HelloWorld";}
    bool run(IR::Module &module, pass::PassManager &pm) override {
        std::cout<<"Hello World!\n";
        return false;
    }
};
    
} // namespace pass

