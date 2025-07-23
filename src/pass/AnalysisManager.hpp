#pragma once

#include <map>
#include <memory>
#include "pass/Analysis.hpp"
#include "pass/PassManager.hpp"
#include <functional>

namespace IR {
class Module;
class Function;
}
namespace pass {
class AnalysisPass;

//分析结果管理器
class AnalysisManager{
private:
    pass::PassManager& pm;
    using FunctionAnalysisMap = std::map<AnalysisID, std::unique_ptr<AnalysisResult>>;
    std::map<const IR::Function*,FunctionAnalysisMap,std::less<>> function_results;
    std::map<AnalysisID,std::unique_ptr<AnalysisResult>> module_results;
public:
    AnalysisManager(pass::PassManager& pm) :  pm(pm) {}
    void invalidate_all_analyses(){
        module_results.clear();
        function_results.clear();
    };
    void invalidate_function_analyses(IR::Function* func){
        if(function_results.count(func)){
            function_results.erase(func);
        }
    }
    //函数模板，返回的是具体分析结果的引用，相当于枢纽
    //get_function_result
    template <typename PassT>
    typename PassT::Result& get_function_result(const IR::Function& F) {
        pass::AnalysisID id = pass::get_pass_id<PassT>();
        if (function_results.count(&F) && function_results.at(&F).count(id)) {
            return static_cast<typename PassT::Result&>(*function_results.at(&F).at(id));
        }
        PassT analysis_pass;
        auto result_ptr = analysis_pass.run(F, pm);
        auto& result_ref = static_cast<typename PassT::Result&>(*result_ptr);
        function_results[&F][id] = std::move(result_ptr);
        return result_ref;
    }
    template <typename PassT>
    typename PassT::Result& get_module_result(const IR::Module& M) {
        pass::AnalysisID id = pass::get_pass_id<PassT>();
        if (module_results.count(id)) {
            return static_cast<typename PassT::Result&>(*module_results.at(id));
        }
        PassT analysis_pass;
        auto result_ptr = analysis_pass.run(M, pm); 
        auto& result_ref = static_cast<typename PassT::Result&>(*result_ptr);
        module_results[id] = std::move(result_ptr);
        return result_ref;
    }

};

}