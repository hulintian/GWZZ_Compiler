#include "pass/transform/AliasTest.hpp"
#include "pass/analysis/AliasAnalysis.hpp"
#include "pass/PassManager.hpp"
#include "IR/Instructions.hpp"
#include "IR/Function.hpp"

#include <iostream>
#include <vector>
#include <set>

namespace pass{

bool AliasTestPass::run(IR::Function& function,PassManager& pm){
    std::cout << "--- Running Alias Analysis Test on function @" << function.get_name() << " ---\n";
    auto& AA = pm.get_analysis_manager().get_module_result<AliasAnalysisPass>(*function.get_parent());
    
    std::set<Value*> unique_memory_pointers;
    for (auto& bb_ptr : function.get_basic_blocks()) {
        for (auto& instr_ptr : bb_ptr->get_intrs()) {
            if (auto* store = dynamic_cast<IR::StoreInst*>(instr_ptr)) {
                unique_memory_pointers.insert(store->get_dst());
            } else if (auto* load = dynamic_cast<IR::LoadInst*>(instr_ptr)) {
                unique_memory_pointers.insert(load->get_src());
            }
        }
    }

    std::vector<Value*> memory_pointers(unique_memory_pointers.begin(), unique_memory_pointers.end());
    if (memory_pointers.empty()) {
        std::cout << "  No memory access instructions found.\n";
        return false;
    }
    std::cout << "  Found " << memory_pointers.size() << " memory access pointers. Comparing all pairs:\n";
    for (size_t i = 0; i < memory_pointers.size(); ++i) {
        for (size_t j = i; j < memory_pointers.size(); ++j) {
            Value* P1 = memory_pointers[i];
            Value* P2 = memory_pointers[j];
            AliasResult result = AA.query(P1, P2);
            std::cout << "    - AA.query(" << P1->get_name() << ", " << P2->get_name() << ") -> ";
            switch (result) {
                case AliasResult::NoAlias:
                    std::cout << "NoAlias\n";
                    break;
                case AliasResult::MayAlias:
                    std::cout << "MayAlias\n";
                    break;
                case AliasResult::MustAlias:
                    std::cout << "MustAlias\n";
                    break;
            }
        }
    }
    std::cout << "---------------------------------------------------\n";
    return false;
}

}

