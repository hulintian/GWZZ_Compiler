#include "pass/transform/PhiPlacementPass.hpp"
#include "pass/analysis/DominatorTree.hpp"
#include "pass/analysis/DominanceFrontier.hpp"
#include "pass/PassManager.hpp"
#include "IR/Instructions.hpp"
#include "IR/IRBuilder.hpp"
#include "IR/Value.hpp"
#include <set>
#include <vector>
#include <queue>

namespace pass {
bool PhiPlacementPass::run(IR::Function& function, PassManager& pm) {
    // 如果函数中没有任何alloca指令，就没有优化的可能。
    if (function.get_allocas().empty()) {
        return false;
    }
    
    // 1. 获取本Pass依赖的分析结果：支配边界
    auto& df_result = pm.get_analysis_manager().get_function_result<DominanceFrontierPass>(function);
    
    auto allocas = function.get_allocas();
    bool ir_changed = false;

    // 3. 遍历每一个 alloca 变量，为它计算并插入所有需要的PHI节点
    for (auto* alloca_instr_base : allocas) {
        // 从基类指针安全地转换为我们需要的AllocaInst指针
        auto* alloca_inst = dynamic_cast<IR::AllocaInst*>(alloca_instr_base);
        assert(alloca_inst != nullptr && "Value in allocas list is not an AllocaInst!");
        // ================== 调试代码开始 ==================
        std::cout << "[DEBUG] PhiPlacement processing AllocaInst '" << alloca_inst->get_name() << "'\n";
        std::cout << "  AllocaInst address: " << alloca_inst << "\n";
        if (alloca_inst->get_allocated_type_for_debug() == nullptr) {
            std::cout << "  [ERROR] At the beginning of processing, _allocated_type is already NULLPTR!\n";
        } else {
            std::cout << "  _allocated_type address is: " << alloca_inst->get_allocated_type_for_debug() << "\n";
        }
        std::cout << "-------------------------------------------\n";
        // ================== 调试代码结束 ==================
        
        // 存放已经（或将要）为当前alloca变量插入PHI的基本块集合，用于去重
        std::set<IR::BasicBlock*> phi_blocks;

        // 待办列表，用于计算迭代支配边界 (DF+)。
        // 初始内容是所有定义了该变量的基本块。
        std::queue<IR::BasicBlock*> work_list;

        // 步骤 3.1: 寻找所有定义点 (store指令)，初始化 work_list
        for (IR::BasicBlock* bb : function.get_basic_blocks()) {
            for (IR::Instruction* inst : bb->get_intrs()) { // 假设 get_intrs() 返回指令列表
                if (auto* store_inst = dynamic_cast<IR::StoreInst*>(inst)) {
                    // 如果这个store指令是写向我们的alloca变量...
                    if (store_inst->get_dst() == alloca_inst) {
                        // ...那么这个基本块就是一个定义点，将它加入work_list。
                        work_list.push(bb);
                        // 找到了这个块的一个定义，就可以跳出内层循环去检查下一个块了。
                        break; 
                    }
                }
            }
        }
        
        // 如果此变量从未被写入，则无需为它插入PHI。
        if (work_list.empty()) {
            continue;
        }

        // 步骤 3.2: 使用 work_list 算法计算迭代支配边界 (DF+)
        // phi_blocks 集合最终会包含所有需要插入PHI的块。
        while (!work_list.empty()) {
            IR::BasicBlock* current_bb = work_list.front();
            work_list.pop();

            // 遍历当前定义点的支配边界集合
            const auto& frontier_set = df_result.get_frontier(current_bb);
            for (IR::BasicBlock* frontier_bb : frontier_set) {
                // 如果这个边界点还没有被处理过...
                if (phi_blocks.find(frontier_bb) == phi_blocks.end()) {
                    // ...就标记它需要插入PHI...
                    phi_blocks.insert(frontier_bb);
                    // ...并将它也加入work_list，因为PHI节点本身也是一个新的定义，
                    // 它的影响也需要继续向上传播。
                    work_list.push(frontier_bb);
                }
            }
        }

        // 步骤 3.3: 在所有计算出的块中实际插入PHI节点
        if (!phi_blocks.empty()) {
            ir_changed = true; // 标记IR已被修改
        }
        for (IR::BasicBlock* bb_to_insert : phi_blocks) {

            Type* val_type = alloca_inst->get_allocated_type();
            std::string name = alloca_inst->get_name() + ".phi";
            auto* phi = new IR::PhiInst(val_type, name, bb_to_insert);
            bb_to_insert->add_instr_begin(phi);
        }
    }

    // 返回true告诉PassManager IR已经被修改，可能需要重新运行其他分析
    return ir_changed; 
}

} // namespace pass