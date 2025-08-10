#pragma once 
#include "pass/PassManager.hpp"
#include "pass/Pass.hpp"
#include <iostream>

namespace pass{
    
class PredPrinterPass : public FunctionTransformPass{
    const char* get_name() const override{return "PredPrinter";}
    bool run(IR::Function &function, pass::PassManager &pm) override {
        function.build_predecessors();
        for(auto &bb : function.get_basic_blocks()){
            std::cout<<"Predecessors of "<<bb->get_name()<<":";
            for(auto &pre :bb->get_predecessors()){
                std::cout<<" "<<pre->get_name()<<" ";
            }
            std::cout<<"\n";
        }
        return false;
    }
};
    
} // namespace pass
