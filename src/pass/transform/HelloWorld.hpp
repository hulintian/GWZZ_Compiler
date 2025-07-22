#pragma once 
#include "pass/PassManager.hpp"
#include "pass/Pass.hpp"
#include <iostream>

class HelloWorldPass : public pass::ModuleTransformPass{
    const char* get_name() const override{return "HelloWorldPass";}
    bool run(IR::Module &module, pass::PassManager &pm) override {
        std::cout<<"Hello World!\n";
        return false;
    }
};