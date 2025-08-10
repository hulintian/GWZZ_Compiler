#pragma once

#include "Pass.hpp"
#include "AnalysisManager.hpp"
#include "Module.hpp"
#include "IRBuilder.hpp"
#include <vector>
#include <memory>

namespace pass{

class PassManager{
public:
    //构造函数，自动建立AM并绑定
    PassManager(IR::IRBuilder * bd):am(*this),_builder(*bd){}
    void add_module_transform_pass(std::unique_ptr<ModuleTransformPass> pass) {
        transform_passes.push_back(std::move(pass));
    }
    void add_function_transform_pass(std::unique_ptr<FunctionTransformPass> pass) {
        transform_passes.push_back(std::move(pass));
    }

    void run(IR::Module& module) {
        //按顺序执行所有注册的变换pass
        for (auto& pass : transform_passes) {
            if(auto *mtp = dynamic_cast<ModuleTransformPass*>(pass.get())){
                bool changed_module = mtp->run(module,*this);
                if(changed_module){
                    am.invalidate_all_analyses();
                }
            }else if (auto *ftp = dynamic_cast<FunctionTransformPass*>(pass.get())){
                for (auto& func : module.get_functions()) {
                    func->build_predecessors();
                }
                for(auto &func : module.get_functions()){
                    bool changed_function = ftp->run(*func,*this);
                    if(changed_function){
                        am.invalidate_function_analyses(func);
                    }
                }
            }
        }
    }
    AnalysisManager& get_analysis_manager() { return am; }
    IR::IRBuilder& get_ir_builder(){return _builder;}
private:
    std::vector<std::unique_ptr<TransformPass>> transform_passes;
    AnalysisManager am; 
    IR::IRBuilder _builder ;
};

}
