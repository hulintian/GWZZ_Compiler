#include "DomFrontierPrinter.hpp"
#include "DominanceFrontier.hpp"
#include "PassManager.hpp"
#include <iostream>

namespace pass{

bool DomFrontierPrinterPass::run(IR::Function &function,PassManager& pm){
    std::cout << "--- Dominance Frontier for function @" << function.get_name() << " ---\n";
    auto& df_result = pm.get_analysis_manager().get_function_result<DominanceFrontierPass>(function);
    for (auto& bb : function.get_basic_blocks()) {
        std::cout << "  DF(" << bb->get_name() << ") = { ";
        const auto& frontier_set = df_result.get_frontier(bb);
        bool first = true;
        for (IR::BasicBlock* frontier_bb : frontier_set) {
            if (!first) {
                std::cout << ", ";
            }
            std::cout << frontier_bb->get_name();
            first = false;
        }
        std::cout << " }\n";
    }
    std::cout << "------------------------------------------------------\n";
    return false;
}


}
