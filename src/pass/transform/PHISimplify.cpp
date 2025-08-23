#include "PHISimplify.hpp"
#include "PassManager.hpp"
#include "UseDefAnalysis.hpp"
#include "Function.hpp"
#include "BasicBlock.hpp"
#include "Instructions.hpp"
#include "Value.hpp"

#include <set>
#include <map>
#include <iostream>
#include <vector>

namespace pass {

bool PHISimplifyPass::cleanup_duplicate_entries(IR::PhiInst* phi){
    if (phi->get_num_incoming() <= 1) {
        return false;
    }
    // map 去重
    std::map<IR::BasicBlock*, Value*> final_values;
    for (unsigned i = 0; i < phi->get_num_incoming(); ++i) {
        final_values[phi->get_incoming_block(i)] = phi->get_incoming_value(i);
    }
    // bb重复
    if (final_values.size() < phi->get_num_incoming()) {
        std::cout << "PHI Cleanup: Found and removed duplicate entries in " 
                  << phi->get_name() << "\n";
        phi->clear_all_incomings();
        for (const auto& pair : final_values) {
            phi->add_incoming(pair.second, pair.first);
        }
        return true;
    }
    return false;
}

bool PHISimplifyPass::run(IR::Function& F,PassManager& pm){
    bool function_changed = false;
    auto use = pm.get_analysis_manager().get_function_result<UseDefAnalysisPass>(F);
    UseDefResult *use_def = &use;

    std::vector<IR::Instruction*> dead_instructions;
    std::set<IR::PhiInst*> simplified_phis;

    bool made_change_in_iteration = true;
    while (made_change_in_iteration){
        made_change_in_iteration = false;
        std::vector<IR::PhiInst*> to_erase;
        std::vector<std::pair<IR::PhiInst*, Value*>> to_replace;

        for (auto& bb : F.get_basic_blocks()){

            for (auto& inst : bb->get_intrs()) {
                auto* phi = dynamic_cast<IR::PhiInst*>(inst);
                if (!phi) continue;

                if (simplified_phis.count(phi)) {
                    continue;
                }
                // phi bb去重
                if (cleanup_duplicate_entries(phi)) {
                    made_change_in_iteration = true;
                }

                // 一般不太可能
                if (phi->get_num_incoming() == 0) {
                    to_replace.push_back({phi, nullptr}); 
                    continue;
                }
                // 找不等于自身的VAL作为基准
                Value* common_value = nullptr;
                for (unsigned i = 0; i < phi->get_num_incoming(); ++i) {
                    Value* incoming_val = phi->get_incoming_value(i);
                    if (incoming_val != phi) {
                        common_value = incoming_val;
                        break;
                    }
                }
                // 所有入口值都等于PHI
                if (common_value == nullptr) {
                    to_replace.push_back({phi, nullptr}); 
                    continue;
                }
                // 检查剩下的
                bool can_simplify = true;
                for (unsigned i = 0; i < phi->get_num_incoming(); ++i) {
                    Value* incoming_val = phi->get_incoming_value(i);
                    // 条件
                    if (incoming_val != phi && incoming_val != common_value) {
                        can_simplify = false;
                        break;
                    }
                }
                if (can_simplify) {
                    to_replace.push_back({phi, common_value});
                }
            }
        }
        if (!to_replace.empty()){
            made_change_in_iteration = true;
            function_changed = true;
            for(auto& pair : to_replace){
                IR::PhiInst* phi = pair.first;
                Value* replacement = pair.second;
                if (replacement) {
                    std::cout << "PHI Simplify: Replacing " << phi->get_name() 
                              << " with " << replacement->get_name() << "\n";
                    for (auto* user : use_def->get_users(phi)) {
                        user->replace_operand(phi, replacement);
                    }
                }else{
                    std::cerr << "Illegal IR detected in PHISimplifyPass: PHI node '" 
                      << phi->get_name() << "' in BasicBlock '"
                      << phi->get_parent()->get_name()
                      << "' has no defined incoming value.\n"
                      << "This is likely a bug in a preceding pass (e.g., CFG modification or Mem2Reg)." 
                      << std::endl;
                    assert(false && "Undefined PHI node detected!");
                }
                to_erase.push_back(phi);
                simplified_phis.insert(phi);
            }
            dead_instructions.insert(dead_instructions.end(), 
                                     to_erase.begin(), 
                                     to_erase.end());
            pm.get_analysis_manager().invalidate_function_result<UseDefAnalysisPass>(F);
            use_def = &pm.get_analysis_manager().get_function_result<UseDefAnalysisPass>(F);
        }
        
    }
    if (!dead_instructions.empty()) {
        std::cout << "PHI Simplify: Deleting " << dead_instructions.size() << " simplified PHI nodes.\n";
        for (IR::Instruction* instr : dead_instructions) {
            instr->get_parent()->remove_instr(instr);
        }
        pm.get_analysis_manager().invalidate_function_result<UseDefAnalysisPass>(F);
    }
    return function_changed;
}

}
