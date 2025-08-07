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

void LICMPass::refresh_analyses() {
    std::cout << "LICM: Refreshing analyses due to CFG change...\n";
    _pm->get_analysis_manager().invalidate_function_analyses(_F);
    // 重新获取
    _dom_tree = &_pm->get_analysis_manager().get_function_result<DominatorTreePass>(*_F);
    _loop_info = &_pm->get_analysis_manager().get_function_result<LoopInfoPass>(*_F);
    _AA = &_pm->get_analysis_manager().get_module_result<AliasAnalysisPass>(*_F->get_parent());
    _F->get_cfg()->refresh_predecessors();
}

bool LICMPass::run(IR::Function& function,PassManager& pm){
    _pm = &pm;
    _F = &function;
    _builder = &pm.get_ir_builder();
    _dom_tree = &pm.get_analysis_manager().get_function_result<DominatorTreePass>(function);
    _AA = &pm.get_analysis_manager().get_module_result<AliasAnalysisPass>(*function.get_parent());
    _loop_info = &pm.get_analysis_manager().get_function_result<LoopInfoPass>(function);
    bool function_changed = false;
    
    // 使用一个循环来确保所有新产生的优化机会都能被处理
    std::vector<Loop*> top_level_loops_copy = _loop_info->top_level_loops;
    for (Loop* top_loop : top_level_loops_copy) {
        if (run_on_loop(top_loop)) {
            function_changed = true;
        }
    }
    _pm = nullptr;
    _F = nullptr;
    _AA = nullptr;
    _builder = nullptr;
    _dom_tree = nullptr;
    _loop_info = nullptr;
    
    return function_changed;
}


bool LICMPass::run_on_loop(Loop* loop){
    bool changed_anything = false;
    std::vector<Loop*> sub_loops_copy = loop->get_sub_loops();
    for (Loop* sub_loop_old_ptr : sub_loops_copy) {
        Loop* sub_loop_current_ptr = _loop_info->get_loop_for(sub_loop_old_ptr->get_header());
        if(!sub_loop_current_ptr) continue;
        if(run_on_loop(sub_loop_current_ptr)){
            changed_anything = true;
        }
    }

    Loop* current_loop = _loop_info->get_loop_for(loop->get_header());
    if (!current_loop) {
        return true; 
    }
    IR::BasicBlock *preheader = get_or_create_preheader(current_loop);
    if(!preheader){
        std::cout<<"创建preheader失败!\n";
        return changed_anything;
    }
    std::cout<<"创建preheader成功!\n";
    changed_anything = true;
    LoopInvariantsSet hoisted_insts;
    bool made_change_in_this_iteration = true;
    while (made_change_in_this_iteration){
        made_change_in_this_iteration = false;
        std::vector<std::pair<IR::Instruction*, IR::BasicBlock*>> instructions_to_move;
        for (auto &bb : current_loop->get_blocks()) {
            for (auto &inst : bb->get_intrs()) {
                bool invariant = is_loop_invariant(inst, current_loop, hoisted_insts);
                bool safe = can_be_safely_hoisted(inst, current_loop, *_dom_tree, *_AA);
                
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


IR::BasicBlock* LICMPass::get_or_create_preheader(Loop* loop) {
    IR::BasicBlock* header = loop->get_header();
    IR::Function* func = header->get_parent();

    //收集循环外部的前驱块
    std::vector<IR::BasicBlock*> external_preds;
    for (IR::BasicBlock* p : header->get_predecessors()) {
        if (!loop->get_blocks().count(p)) {
            external_preds.push_back(p);
        }
    }

    if (external_preds.empty()) {
        std::cerr << "LICM Error: Loop with no external predecessors found.\n";
        return nullptr;
    }
    if (external_preds.size() == 1 && external_preds[0]->get_parent()->get_cfg()->entry_bb!=external_preds[0]) {
        IR::BasicBlock* single_pred = external_preds[0];
        // 还须满足无条件br
        if (single_pred->get_terminator()->get_num_operand() == 1) {
            std::cout << "LICM: Found existing preheader " << single_pred->get_name() 
                      << " for loop " << header->get_name() << "\n";
            return single_pred;
        }
    }

    std::cout << "LICM: Creating new preheader for loop " << header->get_name() << "\n";

    _builder->set_cur_module(func->get_parent());
    _builder->set_cur_func(func);
    auto new_bb = _builder->create_bb();//就默认命名了
    _F->get_cfg()->refresh_predecessors();
    _builder->set_cur_bb(new_bb);
    _builder->create_br(header);
    for (auto& inst : header->get_intrs()){
        auto* phi_in_header = dynamic_cast<IR::PhiInst*>(inst);
        if (!phi_in_header) {
            break; 
        }
        auto* pre_phi_inst = _builder->create_phi(phi_in_header->get_type(),phi_in_header->get_alloca_src());
        auto* pre_phi = static_cast<IR::PhiInst*>(pre_phi_inst);
        //迁移
        for (int i = phi_in_header->get_num_incoming() - 1; i >= 0; --i){
            IR::BasicBlock* incoming_bb = phi_in_header->get_incoming_block(i);
            bool is_external_pred = false;
            for (IR::BasicBlock* ext_pred : external_preds) {
                if (incoming_bb == ext_pred) {
                    is_external_pred = true;
                    break;
                }
            }
            if (is_external_pred){
                pre_phi->add_incoming(phi_in_header->get_incoming_value(i),incoming_bb);
                phi_in_header->remove_incoming_by_index(i);
            } 
        }
        if (pre_phi->get_num_incoming() > 0) {
            phi_in_header->add_incoming(pre_phi, new_bb);
        } else {
            pre_phi->get_parent()->remove_instr(pre_phi);
        }
    }
    for (IR::BasicBlock* pred : external_preds){
        pred->get_terminator()->replace_successor(header,new_bb);
    }
    //更新 
    refresh_analyses();
    
    return new_bb;
}


}
