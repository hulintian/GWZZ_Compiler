#include "DomTreePrinter.hpp"
#include "DominatorTree.hpp"
#include "PassManager.hpp"

namespace pass{

bool DomTreePrinterPass::run(IR::Function& function, PassManager& pm){
    std::cout << "--- Dominator Tree for function @" << function.get_name() << " ---\n";
    auto& dom_tree_result = pm.get_analysis_manager().get_function_result<DominatorTreePass>(function);
    for (auto& bb: function.get_basic_blocks()) {
        IR::BasicBlock* idom = dom_tree_result.get_idom(bb);
        std::cout << "  idom(" << bb->get_name() << ") = ";
        if (idom != nullptr) {
            std::cout << idom->get_name() << "\n";
        } else {
            std::cout << "<entry block>\n";
        }
    }
    std::cout << "---------------------------------------------------\n";
    return false;
}

}


