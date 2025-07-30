#include "pass/analysis/UseDefAnalysis.hpp"
#include "pass/PassManager.hpp"
#include "IR/Function.hpp"
#include "IR/Instructions.hpp"
#include <iostream>
namespace pass {

std::unique_ptr<AnalysisResult> 
UseDefAnalysisPass::run(const IR::Function &func, PassManager& pm) {
    auto result = std::make_unique<UseDefResult>();
    // 遍历
    for (auto& bb_ptr : func.get_basic_blocks()) {
        
        for (auto& instr : bb_ptr->get_intrs()) {
            for (Value* operand : instr->get_operands()) {
                
                if (operand) {
                    
                    result->use_def_map[operand].push_back(instr);
                }
            }
        }
    }
     
    return result;
}
}