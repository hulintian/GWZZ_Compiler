#include "LoopInfoPrinter.hpp"
#include "LoopInfo.hpp"
#include "PassManager.hpp"
#include <iostream>

namespace pass{

// prefix参数用于控制缩进，以显示嵌套层次
void print_loop_info(const Loop* loop, const std::string& prefix){
    if (!loop) return;
    std::cout << prefix << "Loop Header: " << loop->get_header()->get_name();
    std::cout << " (depth " << loop->get_blocks().size() << " blocks)\n";
    
    std::cout << prefix << "  Blocks: { ";
    for (auto& bb : loop->get_blocks()) {
        std::cout << bb->get_name() << " ";
    }
    std::cout << "}\n";

    // 递归地打印所有子循环
    if (!loop->get_sub_loops().empty()) {
        std::cout << prefix << "  Sub-Loops:\n";
        for (const auto* sub_loop : loop->get_sub_loops()) {
            print_loop_info(sub_loop, prefix + "    "); // 增加缩进
        }
    }
}

bool LoopInfoPrinterPass::run(IR::Function& function,PassManager& pm){
    std::cout << "--- Loop Analysis for function @" << function.get_name() << " ---\n";

    auto& loop_info = pm.get_analysis_manager().get_function_result<LoopInfoPass>(function);
    if (loop_info.top_level_loops.empty()) {
        std::cout << "  No top-level loops found.\n";
        return false;
    }
    for (const auto* top_level_loop : loop_info.top_level_loops) {
        print_loop_info(top_level_loop, "  ");
    }
    std::cout << "---------------------------------------------------\n";
    return false;
}

}
