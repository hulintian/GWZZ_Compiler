#include "pass/transform/LICM.hpp"
#include "pass/analysis/DominatorTree.hpp"
#include "pass/analysis/AliasAnalysis.hpp"
#include "pass/analysis/LoopInfo.hpp"
#include "pass/PassManager.hpp"

#include "IR/IRBuilder.hpp"
#include "IR/Value.hpp"
#include "IR/Function.hpp"
#include "IR/BasicBlock.hpp"
#include "IR/Instructions.hpp"
#include <set>

namespace pass{

bool LICMPass::run(IR::Function& function,PassManager& pm){
    auto& loop_info = pm.get_analysis_manager().get_function_result<LoopInfoPass>(function);
    auto& dom_tree = pm.get_analysis_manager().get_function_result<DominatorTreePass>(function);
    auto& AA = pm.get_analysis_manager().get_module_result<AliasAnalysisPass>(*function.get_parent());
    auto& builder = pm.get_ir_builder();

    bool function_changed = false;
    for(auto& top_level_loop : loop_info.top_level_loops){
        function_changed = run_on_loop(top_level_loop, dom_tree,AA,builder);
    }
    if(!function_changed){
        std::cout<<"什么都没变化！\n";
    }
    return function_changed;
}


bool LICMPass::run_on_loop(Loop* loop, const DominatorTreeResult& dom_tree,AliasAnalysisResult& AA,IR::IRBuilder& builder){
    bool changed_anything = false;
    for(auto& sub_loop : loop->get_sub_loops()){
        changed_anything = run_on_loop(sub_loop, dom_tree,AA,builder);
    }
    IR::BasicBlock *preheader = get_or_create_preheader(loop, dom_tree,builder);
    if(!preheader){
        std::cout<<"创建preheader失败!\n";
        return changed_anything;
    }
    std::cout<<"创建preheader成功!\n";
    LoopInvariantsSet hoisted_insts;
    bool made_change_in_this_iteration = true;
    while (made_change_in_this_iteration){
        made_change_in_this_iteration = false;
        std::vector<std::pair<IR::Instruction*, IR::BasicBlock*>> instructions_to_move;
        for (auto &bb : loop->get_blocks()) {
            for (auto &inst : bb->get_intrs()) {
                bool invariant = is_loop_invariant(inst, loop, hoisted_insts);
                bool safe = can_be_safely_hoisted(inst, loop, dom_tree, AA);
                
                std::cout << "LICM: Check inst '" << inst->get_name()
                        << "' in BB " << bb->get_name()
                        << "  ⇒  invariant = " << invariant
                        << ", safe = " << safe << "\n";

                if (invariant && safe) {
                    instructions_to_move.push_back({inst, bb});
                }
            }
        }   
        if (!instructions_to_move.empty()) {
            for (auto const& [inst_to_hoist, original_bb] : instructions_to_move) {
                original_bb->remove_instr(inst_to_hoist);
                preheader->add_instr_before_terminator(inst_to_hoist);
                hoisted_insts.insert(inst_to_hoist);
                
                // 打印调试信息
                std::cout << "LICM: Hoisted instruction '" << inst_to_hoist->get_name() 
                          << "' to preheader.\n";
            }
            made_change_in_this_iteration = true;
            changed_anything = true;
        }
    }
    return changed_anything;
}

bool LICMPass::is_loop_invariant (IR::Instruction* inst, const Loop* loop,const LoopInvariantsSet& hoisted_insts) {
    //遍历操作数，尝试感染
    for (auto& operand : inst->get_operands()) {
        if (auto* operand_inst = dynamic_cast<IR::Instruction*>(operand)) {

            if (loop->get_blocks().count(operand_inst->get_parent()) && 
                hoisted_insts.find(operand_inst) == hoisted_insts.end()) {
                return false; 
            }
        }else{
            //其他默认为不变量
        }
        
    }
    return true; // 所有操作数都是不变量，感染成功
}

bool LICMPass::can_be_safely_hoisted(IR::Instruction* inst, const Loop* loop, 
                                     const DominatorTreeResult& dom_tree,AliasAnalysisResult& AA) {
    // 过滤特殊指令
    if (dynamic_cast<IR::AllocaInst*>(inst) || 
        dynamic_cast<IR::PhiInst*>(inst) ||
        inst->is_terminator()) {
        return false;
    }
    
    // 对load指令，别名分析检查
    if (auto* load_inst = dynamic_cast<IR::LoadInst*>(inst)) {
        Value* load_ptr = load_inst->get_src();
        for (auto* bb : loop->get_blocks()) {
            for (auto& other_instr_ptr : bb->get_intrs()) {
                if (auto* store_inst = dynamic_cast<IR::StoreInst*>(other_instr_ptr)) {
                    //保守点
                    if (AA.query(load_ptr, store_inst->get_dst()) != AliasResult::NoAlias) {
                        return false; 
                    }
                }
            }
        }
    }
    // 有时间写。判断inst的bb是否支配所有exit块

    return true;
}


IR::BasicBlock* LICMPass::get_or_create_preheader(Loop* loop, const DominatorTreeResult& dom_tree,IR::IRBuilder& builder) {
    IR::BasicBlock* header = loop->get_header();
    IR::Function* func = header->get_parent();

    //收集循环外部的前驱块
    std::vector<IR::BasicBlock*> external_preds;
    for (IR::BasicBlock* p : header->get_predecessors()) {
        if (!loop->get_blocks().count(p)) {
            external_preds.push_back(p);
        }
    }

    if (external_preds.size() != 1) {
        //这里应该create 前驱块的，但pm没有调用IRbuilder的功能，以后有机会再加。
        builder.set_cur_module(func->get_parent());
        builder.set_cur_func(func);
        auto new_bb = builder.create_bb();
        builder.set_cur_bb(new_bb);
        builder.create_br(header);
        for(auto& pre : external_preds){
            pre->get_terminator()->replace_successor(header,new_bb);
        }

        for (auto& inst : header->get_intrs()){
            if (auto* phi = dynamic_cast<IR::PhiInst*>(inst)){
                
            }
        }





        func->get_cfg()->refresh_predecessors();
        return new_bb;
    }
    IR::BasicBlock* single_pred = external_preds[0];

    //后继也应该是唯一的，且指向循环头
    if (single_pred->get_successors().size() != 1) {
        return nullptr;
    }
    //过滤entry
    if (single_pred == single_pred->get_parent()->get_entry_bb()) {
        return nullptr;
    }
    return single_pred;
}


}
