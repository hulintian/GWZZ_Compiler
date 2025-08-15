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
// 辅助：同一基本块内，A 是否出现在 B 之前
static bool comes_before(IR::Instruction* A,IR::Instruction* B) {
    if (A->get_parent() != B->get_parent()) return false;
    const auto& insts = A->get_parent()->get_intrs();
    bool seenA = false;
    for (auto* I : insts) {
        if (I == A) { seenA = true; }
        if (I == B) { return seenA; }
    }
    return false; // 理论上不该走到这里
}

// 辅助：某个 load 是否在同一基本块内被某个 store(A, ...) 严格支配
static bool load_self_defined_in_block(IR::AllocaInst* A, IR::LoadInst* L) {
    auto* B = L->get_parent();
    for (auto* I : B->get_intrs()) {
        if (I == L) break;
        if (auto* ST = dynamic_cast<IR::StoreInst*>(I)) {
            if (ST->get_ptr_operand() == A) return true;
        }
    }
    return false;
}

// 辅助：该 alloca 的所有 load 都是“同块自定义”的？
static bool all_loads_self_defined(IR::AllocaInst* A, const UseDefResult& UD) {
    for (auto* u : UD.get_users(A)) {
        if (auto* L = dynamic_cast<IR::LoadInst*>(u)) {
            // 只看真正从 A 读的 load
            if (L->get_src() != A) return false;
            if (!load_self_defined_in_block(A, L)) return false;
        } else if (auto* ST = dynamic_cast<IR::StoreInst*>(u)) {
            // ok
            (void)ST;
        } else {
            // 其它用户（GEP/call等）你前面已经过滤，这里再兜底
            return false;
        }
    }
    return true;
}

/**
 * @brief 检查Alloca是否具备提升合法性
*/
static bool is_alloca_promotable_strict(IR::AllocaInst* alloca_inst, const UseDefResult& use_def_result,DominatorTreeResult& dom_tree) {
    if (alloca_inst->get_alloca_ty()->is_array()) {
        return false;
    }
    const std::vector<IR::User*>& users = use_def_result.get_users(alloca_inst);
    if (users.empty()) {
        return false;
    }

    std::vector<IR::LoadInst*> loads;
    std::vector<IR::StoreInst*> stores;

    for (IR::User* user : users) {
        if (auto* ld = dynamic_cast<IR::LoadInst*>(user)) {
            // 只认真正从该alloca读的load
            if (ld->get_src() != alloca_inst) return false;
            loads.push_back(ld);
        }
        else if (auto* store = dynamic_cast<IR::StoreInst*>(user)) {
            if (store->get_ptr_operand() != alloca_inst) {
                return false;
            }
            stores.push_back(store);
        }else {
            return false; // 出现了其它用户（如 GEP / bitcast / call 等），不可提升
        }
    }
    if (stores.empty()) return false;
    for (auto* L : loads) {
        bool covered = false;
        for (auto* S : stores) {
            if (S->get_parent() == L->get_parent()) {
                if (comes_before(S, L)) { covered = true; break; }
            } else {
                if (dom_tree.dominates(S->get_parent(), L->get_parent())) {
                    covered = true; break;
                }
            }
        }
        if (!covered) return false; // 有 load 没被任何 store 覆盖 -> 不可提升
    }

    return true;
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

    // for (auto* alloca : _promotable_allocas){
    //     _value_stack[alloca].push(IR::UndefValue::get(alloca->get_alloca_ty()));
    // }

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
 * - 形态检查 + 支配检查 + 严格支配检查
*/
void Mem2RegPass::collect_promotable_allocas(){
    auto& DT = _pm->get_analysis_manager().get_function_result<DominatorTreePass>(*_F);

    for(const auto &BB : _F->get_basic_blocks()){
        for(const auto &I : BB->get_intrs()){
            if(auto* alloca_inst = dynamic_cast<IR::AllocaInst*>(I)){
                if (_F->is_param(alloca_inst)) continue;
                // 仅负责编译期寄存提升的形态是否OK
                if (is_alloca_promotable_strict(alloca_inst, *_use_def, DT)) {
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
        // 关键剪枝
        if (all_loads_self_defined(alloca_inst, *_use_def)) {
            continue;
        }

        std::set<IR::BasicBlock*> defining_blocks;
        const auto& users = _use_def->get_users(alloca_inst);

        for (auto* user : users) {
            if (auto store = dynamic_cast<IR::StoreInst*>(user)) {
                if (store->get_ptr_operand() == alloca_inst) {
                    defining_blocks.insert(store->get_parent());
                }
            }
        }
        if (defining_blocks.empty()) continue;
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

#ifdef DEBUG
    std::cout << "--> ENTER rename_variables for BB [" << BB->get_name() << "]\n";
#endif

    std::map<IR::AllocaInst*, int> pushed_counts;
    for (auto* instr : BB->get_intrs()){

        if (auto* phi = dynamic_cast<IR::PhiInst*>(instr)){
            
            if (auto* alloca = find_alloca_for_phi(phi)) {
                _value_stack[alloca].push(phi);
                pushed_counts[alloca]++;
#ifdef DEBUG
                std::cout << "    PUSHED PHI " << phi->get_name() 
                      << " for $" << alloca->get_name() << "\n";
#endif
            }
        }
        else if (auto* store = dynamic_cast<IR::StoreInst*>(instr)){
            if (auto* alloca = dynamic_cast<IR::AllocaInst*>(store->get_ptr_operand())){
                if (_promotable_allocas.count(alloca)){
                    Value* stored_val = store->get_value_operand();
                    _value_stack[alloca].push(stored_val);
                    pushed_counts[alloca]++;
#ifdef DEBUG
                    std::cout << "    PUSHED Store value " << stored_val->get_name() 
                      << " for $" << alloca->get_name() << "\n";
#endif
                    _to_remove.insert(store);
                }
            }
        }else if (auto* load = dynamic_cast<IR::LoadInst*>(instr)){
            if (auto* alloca = dynamic_cast<IR::AllocaInst*>(load->get_src())){
                if (_promotable_allocas.count(alloca)){

                    if (_value_stack[alloca].empty()){
                        // 按理不会发生（collect阶段已保证合法），兜底：不替换该load
                        std::cerr << "WARN: empty version stack for $" << alloca->get_name()
                                  << " at load " << load->get_name() << ", skip replace.\n";
                        continue;
                    }

                    Value* current_version = _value_stack[alloca].top();
#ifdef DEBUG
                    std::cout << "    REPLACING Load " << load->get_name() 
                      << " with " << current_version->get_name() << "\n";
#endif
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
                    Value* value_from_B = nullptr;
                    if (_value_stack[alloca].empty()){
                        // 理论不应出现；为防崩溃，这里兜底给个undef（日志提示）
#ifdef DEBUG
                        std::cerr << "WARN: empty stack when wiring PHI " << phi->get_name()
                                  << " from Pred [" << BB->get_name() << "], insert undef.\n";
#endif
                        value_from_B = IR::UndefValue::get(alloca->get_alloca_ty());
                    }else{
                        value_from_B = _value_stack[alloca].top();
                    }
                    phi->add_incoming(value_from_B, BB);
#ifdef DEBUG
                    std::cout << "    WIRING PHI " << phi->get_name() << " in Succ [" << S->get_name() << "]"
                          << " with value " << value_from_B->get_name() 
                          << " from Pred [" << BB->get_name() << "]\n";
#endif
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
#ifdef DEBUG
        std::cout << "    POP-ing " << count << " value(s) for $" << alloca->get_name() << "\n";
#endif
        for (int i = 0; i < count; ++i) {
            _value_stack[alloca].pop();
        }
    }
#ifdef DEBUG
    std::cout << "<-- EXIT rename_variables for BB [" << BB->get_name() << "]\n";
#endif
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