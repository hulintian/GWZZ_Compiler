#include "Mem2Reg.hpp"
#include "PassManager.hpp"
#include "DominatorTree.hpp"
#include "DominanceFrontier.hpp"
#include "UseDefAnalysis.hpp"
#include "Function.hpp"
#include "BasicBlock.hpp"
#include "Instructions.hpp"
#include "Value.hpp"
#include "IRBuilder.hpp"
#include "UndefValue.hpp"
#include <deque>

namespace pass{
/**
 * @brief 构建支配树的树形结构（后续用于DFS）
*/
static std::map<IR::BasicBlock*, std::vector<IR::BasicBlock*>> build_dom_tree(IR::Function& F,DominatorTreeResult &tree){
    std::map<IR::BasicBlock*, std::vector<IR::BasicBlock*>> dom_tree;
    for (auto& bb : F.get_basic_blocks()) {
        IR::BasicBlock* idom = tree.get_idom(bb);
        if (idom != nullptr) {
            dom_tree[idom].push_back(bb);
        }
    }
    return dom_tree;
}
/**
 * @brief 检查Alloca是否具备提升合法性
*/
static bool is_alloca_promotable(IR::AllocaInst* alloca_inst, const UseDefResult& use_def_result) {
    if (alloca_inst->get_alloca_ty()->is_array()) {
        return false;
    }
    const std::vector<IR::User*>& users = use_def_result.get_users(alloca_inst);
    if (users.empty()) {
        return false;
    }
    for (IR::User* user : users) {
        if (dynamic_cast<const IR::LoadInst*>(user)) {
            continue; 
        }
        if (auto* store = dynamic_cast<const IR::StoreInst*>(user)) {
            if (store->get_ptr_operand() == alloca_inst) {
                continue;
            }
        }
        return false;
    }
    for (const IR::User* user : users) {
        if (dynamic_cast<const IR::LoadInst*>(user)) {
            return true; 
        }
    }
    return false;
}
/**
 * @brief （操作）插入phi
*/
static IR::PhiInst* insert_phi(IR::IRBuilder* builder,IR::BasicBlock* BB,IR::AllocaInst* alloca){
    builder->set_cur_module(BB->get_parent()->get_parent());
    builder->set_cur_func(BB->get_parent());
    builder->set_cur_bb(BB);
    Type* phi_type = alloca->get_alloca_ty();
    auto* phi_instruction = builder->create_phi(phi_type,alloca);
    auto* phi_node = static_cast<IR::PhiInst*>(phi_instruction);
    return phi_node;
}

bool Mem2RegPass::run(IR::Function& F,PassManager& pm){
    if (F.get_entry_bb() == nullptr) return false;
    _F = &F;
    _pm = &pm;

    init();

    collect_promotable_allocas();

    insert_phi_nodes();

    for (auto* alloca : _promotable_allocas){
        _value_stack[alloca].push(IR::UndefValue::get(alloca->get_alloca_ty()));
    }

    if (F.get_entry_bb()) {
        rename_variables(F.get_entry_bb());
    }

    cleanup_instructions();

    return true;
}
/**
 * @brief 初始化
*/
void Mem2RegPass::init(){
    _builder = &_pm->get_ir_builder();
    auto& dom_tree = _pm->get_analysis_manager().get_function_result<DominatorTreePass>(*_F);
    _dom_tree = build_dom_tree(*_F,dom_tree);
    _use_def = &_pm->get_analysis_manager().get_function_result<UseDefAnalysisPass>(*_F);
    _dom_frontier = &_pm->get_analysis_manager().get_function_result<DominanceFrontierPass>(*_F);

    _promotable_allocas.clear();
    _to_remove.clear();
    _value_stack.clear();
    _alloca_to_phis_map.clear();
    _phi_to_alloca_map.clear();

}
/**
 * @brief 刷新_use_def
*/
void Mem2RegPass::refresh_analyses(){
    _pm->get_analysis_manager().invalidate_function_result<UseDefAnalysisPass>(*_F);
    _use_def = &_pm->get_analysis_manager().get_function_result<UseDefAnalysisPass>(*_F);
}

/**
 * @brief 寻找可提升Alloca
*/
void Mem2RegPass::collect_promotable_allocas(){
    for(const auto &BB : _F->get_basic_blocks()){
        for(const auto &I : BB->get_intrs()){
            if(auto* alloca_inst = dynamic_cast<IR::AllocaInst*>(I)){
                if (is_alloca_promotable(alloca_inst, *_use_def) && !_F->is_param(alloca_inst)) {
                    _promotable_allocas.insert(alloca_inst);
                }
            }
        }
    }
}
/**
 * @brief 寻找正确位置插入phi
*/
void Mem2RegPass::insert_phi_nodes(){

    for(auto* alloca_inst : _promotable_allocas){

        std::set<IR::BasicBlock*> defining_blocks;
        const auto& users = _use_def->get_users(alloca_inst);

        for (auto* user : users) {
            if (auto store = dynamic_cast<IR::StoreInst*>(user)) {
                defining_blocks.insert(store->get_parent());
            }
        }

        std::deque<IR::BasicBlock*> worklist(defining_blocks.begin(), defining_blocks.end());
        std::set<IR::BasicBlock*> phi_placed_blocks;

        while(!worklist.empty()){
            auto current = worklist.front();
            worklist.pop_front();

            const auto& df_set = _dom_frontier->get_frontier(current);
            for(auto& df_block : df_set){
                if (phi_placed_blocks.find(df_block) == phi_placed_blocks.end()){
                    auto phi_inst = insert_phi(_builder,df_block,alloca_inst);
                    _alloca_to_phis_map[alloca_inst][df_block] = phi_inst;
                    _phi_to_alloca_map[phi_inst] = alloca_inst;
                    phi_placed_blocks.insert(df_block);
                    worklist.push_back(df_block);
                }
            }
        }
    }
}
/**
 * @brief 回填phi & 重命名
*/
void Mem2RegPass::rename_variables(IR::BasicBlock* BB){

    std::cout << "--> ENTER rename_variables for BB [" << BB->get_name() << "]\n";

    std::map<IR::AllocaInst*, int> pushed_counts;
    for (auto* instr : BB->get_intrs()){

        if (auto* phi = dynamic_cast<IR::PhiInst*>(instr)){
            auto* alloca = find_alloca_for_phi(phi);
            if (alloca != nullptr) {
                _value_stack[alloca].push(phi);
                pushed_counts[alloca]++;

                std::cout << "    PUSHED PHI " << phi->get_name() 
                      << " for $" << alloca->get_name() << "\n";
            }
        }
        else if (auto* store = dynamic_cast<IR::StoreInst*>(instr)){
            if (auto* alloca = dynamic_cast<IR::AllocaInst*>(store->get_ptr_operand())){
                if (_promotable_allocas.count(alloca)){
                    Value* stored_val = store->get_value_operand();
                    _value_stack[alloca].push(stored_val);
                    pushed_counts[alloca]++;
                    std::cout << "    PUSHED Store value " << stored_val->get_name() 
                      << " for $" << alloca->get_name() << "\n";
                    _to_remove.insert(store);
                }
            }
        }else if (auto* load = dynamic_cast<IR::LoadInst*>(instr)){
            if (auto* alloca = dynamic_cast<IR::AllocaInst*>(load->get_src())){
                if (_promotable_allocas.count(alloca)){

                    Value* current_version = _value_stack[alloca].top();

                    std::cout << "    REPLACING Load " << load->get_name() 
                      << " with " << current_version->get_name() << "\n";
                    auto users_copy = _use_def->get_users(load);
                    for (auto* user : users_copy) {
                        user->replace_operand(load, current_version);
                    }
                    refresh_analyses();//可能错误出在这一步
                    _to_remove.insert(load);
                }
            }
        }
    }
    for (IR::BasicBlock* S : BB->get_successors()){
        for (auto* instr : S->get_intrs()){
            if (auto* phi = dynamic_cast<IR::PhiInst*>(instr)) {
                auto* alloca = find_alloca_for_phi(phi);
                if (alloca != nullptr && _promotable_allocas.count(alloca)) {
                    Value* value_from_B = _value_stack[alloca].top();
                    phi->add_incoming(value_from_B, BB);

                    std::cout << "    WIRING PHI " << phi->get_name() << " in Succ [" << S->get_name() << "]"
                          << " with value " << value_from_B->get_name() 
                          << " from Pred [" << BB->get_name() << "]\n";
                }
            }else{
                break;
            }
        }
    }

    refresh_analyses();

    if (_dom_tree.count(BB)) {
        for (IR::BasicBlock* child : _dom_tree.at(BB)) {
            rename_variables(child);
        }
    }
    for (auto const& [alloca, count] : pushed_counts) {

        std::cout << "    POP-ing " << count << " value(s) for $" << alloca->get_name() << "\n";
        for (int i = 0; i < count; ++i) {
            _value_stack[alloca].pop();
        }
    }
    std::cout << "<-- EXIT rename_variables for BB [" << BB->get_name() << "]\n";

}
/**
 * @brief 辅助函数
*/
IR::AllocaInst* Mem2RegPass::find_alloca_for_phi(IR::PhiInst* phi_inst){
    auto it = _phi_to_alloca_map.find(phi_inst);
    if (it != _phi_to_alloca_map.end()) {
        return it->second;
    }
    return nullptr;
}
/**
 * @brief 清理
*/
void Mem2RegPass::cleanup_instructions(){
    for (auto* instr : _to_remove) {
        instr->get_parent()->remove_instr(instr);
    }
    for (auto* alloca : _promotable_allocas){
        alloca->get_parent()->remove_instr(alloca);
    }
}

}