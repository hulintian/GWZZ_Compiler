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
#include <set>
namespace pass{



void collect_first_store_values(
    IR::Function& function,
    const std::set<IR::AllocaInst*>& promotables,
    const UseDefResult& use_def,
    std::map<IR::AllocaInst*, std::map<IR::BasicBlock*, Value*>,std::less<void*>>& first_store_map)
{
    for (auto* alloca : promotables) {
        const auto& users = use_def.get_users(alloca);
        // 遍历该 alloca 的所有 store
        for (auto* user : users) {
            auto* store = dynamic_cast<IR::StoreInst*>(user);
            if (!store) continue;
            // 仅处理 store 到 alloca 本身的情况
            if (store->get_ptr_operand() != alloca) continue;

            IR::BasicBlock* bb = store->get_parent();

            if (!first_store_map[alloca].count(bb)) {
                first_store_map[alloca][bb] = store->get_value_operand();
            }
        }
    }
}
static void cleanup_instructions(std::vector<IR::AllocaInst*> promotable_allocas,std::set<IR::Instruction*> to_remove){
    for (auto* instr : to_remove) {
        instr->get_parent()->remove_instr(instr);
    }
    for (auto* alloca : promotable_allocas){
        alloca->get_parent()->remove_instr(alloca);
    }
}

static bool is_alloca_promotable(IR::AllocaInst* alloca_inst, const UseDefResult& use_def_result) {
    if (alloca_inst->get_alloca_ty()->is_array()) {
        return false;
    }
    const std::vector<IR::User*>& users = use_def_result.get_users(alloca_inst);
    if (users.empty()) {
        return false;
    }
    //合法jiancha
    for (IR::User* user : users) {
        if (dynamic_cast<const IR::LoadInst*>(user)) {
            continue; 
        }
        if (auto* store = dynamic_cast<const IR::StoreInst*>(user)) {
            if (store->get_ptr_operand() == alloca_inst) {
                continue;
            }
        }
        std::cout << "DEBUG: Alloca " << alloca_inst->get_name() 
                  << " is not promotable due to user: " 
                  << static_cast<IR::Instruction*>(user)->to_str() << std::endl;
        return false;
    }
    for (const IR::User* user : users) {
        if (dynamic_cast<const IR::LoadInst*>(user)) {
            return true; 
        }
    }
    return false;
}

bool Mem2RegPass::run(IR::Function& function, PassManager& pm) { 
    if (function.get_entry_bb() == nullptr) {
        return false;
    }
    auto& dom_tree = pm.get_analysis_manager().get_function_result<DominatorTreePass>(function);
    auto& dom_frontier = pm.get_analysis_manager().get_function_result<DominanceFrontierPass>(function);
    auto& use_def = pm.get_analysis_manager().get_function_result<UseDefAnalysisPass>(function);
    auto& builder = pm.get_ir_builder();
    std::vector<IR::AllocaInst*> promotable_allocas;
    std::set<IR::Instruction*> to_remove;
    collect_promotable_allocas(function, promotable_allocas,use_def);
     
    std::set<IR::AllocaInst*> promotable_set(promotable_allocas.begin(), promotable_allocas.end());
    if (promotable_allocas.empty()) {
        return false;
    }
    _alloca_to_phis_map.clear();
    insert_phi_nodes(function, promotable_allocas, dom_frontier,use_def,builder);

    std::map<IR::AllocaInst*, std::map<IR::BasicBlock*, Value*>,std::less<void*>> first_store_map;
    collect_first_store_values(function, promotable_set, use_def, first_store_map);

    // Debug 输出验证
    for (auto& [alloca, bbmap] : first_store_map) {
        std::cout << "Alloca " << alloca->get_name() << ":\n";
        for (auto& [bb, val] : bbmap) {
            std::cout << "  Initial store in BB " << bb->get_name()
                    << " -> " << val->get_name() << "\n";
        }
    }
    // 构建树形 dom_tree
    std::map<IR::BasicBlock*, std::vector<IR::BasicBlock*>> dom_tree_children;
    for (auto& bb : function.get_basic_blocks()) {
        IR::BasicBlock* idom = dom_tree.get_idom(bb);
        if (idom != nullptr) {
            dom_tree_children[idom].push_back(bb);
        }
    }
    value_stack.clear(); // 确保值栈是空的
    for (auto* alloca : promotable_allocas) {
        value_stack[alloca].push(IR::UndefValue::get(alloca->get_alloca_ty()));
    }


    // 栈初始化
    for (auto* alloca : promotable_allocas) {
        auto it = first_store_map[alloca].find(function.get_entry_bb());
        if (it != first_store_map[alloca].end()) {
            value_stack[alloca].push(it->second);
        }
    }


    rename_variables(function.get_entry_bb(), first_store_map, dom_tree_children,to_remove,use_def);

    cleanup_instructions(promotable_allocas,to_remove);
    return true;
}  

void Mem2RegPass::collect_promotable_allocas (IR::Function& function, 
                                              std::vector<IR::AllocaInst*>& allocas,
                                              const UseDefResult& use_def_result){
    for(const auto& bb:function.get_basic_blocks()){
        for(const auto &inst:bb->get_intrs()){
            if(auto* alloca_inst = dynamic_cast<IR::AllocaInst*>(inst)){
                if (is_alloca_promotable(alloca_inst, use_def_result)) {
                    allocas.push_back(alloca_inst);
                }
            }
        }
    }
}

void Mem2RegPass::insert_phi_nodes(IR::Function& function, 
                                 const std::vector<IR::AllocaInst*>& allocas,
                                 const DominanceFrontierResult& dom_frontier_result,
                                 const UseDefResult& use_def_result,
                                 IR::IRBuilder& builder) {
                   
    for(auto* alloca_inst : allocas){
        std::set<IR::BasicBlock*> defining_blocks;
        const auto& users = use_def_result.get_users(alloca_inst);
        for (auto* user : users) {
            if (auto store = dynamic_cast<IR::StoreInst*>(user)) {
                defining_blocks.insert(store->get_parent());
            }
        }
        std::deque<IR::BasicBlock*> worklist(defining_blocks.begin(), defining_blocks.end());
        std::set<IR::BasicBlock*> phi_placed_blocks;

        while (!worklist.empty()) {
            IR::BasicBlock* current = worklist.front();
            worklist.pop_front();

            const auto& df_set = dom_frontier_result.get_frontier(current);
            
            for (auto* df_block : df_set) {
                if (phi_placed_blocks.find(df_block) == phi_placed_blocks.end()) {
                    builder.set_cur_module(function.get_parent());
                    builder.set_cur_func(&function);
                    builder.set_cur_bb(df_block);
                    Type* phi_type = alloca_inst->get_alloca_ty();
                    auto* phi_instruction = builder.create_phi(phi_type,alloca_inst);
                    auto* phi_node = static_cast<IR::PhiInst*>(phi_instruction);
                    _alloca_to_phis_map[alloca_inst][df_block] = phi_node;
                    phi_placed_blocks.insert(df_block);
                    worklist.push_back(df_block);
                }
            }
        }
    }                                
}


void Mem2RegPass::rename_variables(IR::BasicBlock* bb,
                      const std::map<IR::AllocaInst*, std::map<IR::BasicBlock*,Value*>,std::less<void*>>& first_store_map,
                      const std::map<IR::BasicBlock*, std::vector<IR::BasicBlock*>>& dom_tree_children,
                      std::set<IR::Instruction*>& to_remove,
                      const UseDefResult& use_def) {
    //std::cout << "Renaming BB " << bb->get_name() << std::endl;
    // 先处理phi
    std::map<IR::AllocaInst*, int> pushed_counts;
    std::vector<IR::AllocaInst*> pushed_in_this_bb;
    for (auto& [alloca, bb2phi] : _alloca_to_phis_map) {
        auto it_phi = bb2phi.find(bb);
        if (it_phi != bb2phi.end()) {
            IR::PhiInst* phi = it_phi->second;
            // 只处理被提升的变量
            if (value_stack.count(alloca)) {
                value_stack[alloca].push(phi);
                pushed_counts[alloca]++;
                pushed_in_this_bb.push_back(alloca);

                std::cout << "Push PHI " << alloca->get_name()
                          << " := " << phi->get_name()
                          << " at entry of BB " << bb->get_name() << std::endl;
            }
        }
    }

    // 处理其他指令
    auto& instrs = bb->get_intrs();
    for (auto it = instrs.begin(); it != instrs.end();++it){
        auto* instr = *it;

        if (auto* store = dynamic_cast<IR::StoreInst*>(instr)) {
            if (auto* alloca = dynamic_cast<IR::AllocaInst*>(store->get_ptr_operand())){

                if (value_stack.count(alloca)) {
                    Value* val = store->get_value_operand();
                    value_stack[alloca].push(val);
                    pushed_counts[alloca]++;

                    std::cout << "Push " << alloca->get_name()
                      << " := " << val->get_name()
                      << " in BB " << bb->get_name() << std::endl;
                    //延迟删除
                    to_remove.insert(instr);
                }
            }
            continue;
        }
        if (auto* load = dynamic_cast<IR::LoadInst*>(instr)) {
            if (auto* alloca = dynamic_cast<IR::AllocaInst*>(load->get_src())) {
                if (value_stack.count(alloca) && !value_stack[alloca].empty()) {

                    if (value_stack[alloca].empty()) {
                        std::cerr << "Error: use of uninitialized value for $" << alloca->get_name() << "\n";
                        exit(1);
                    }

                    Value* replacement = value_stack[alloca].top();
                    std::cout << "Replace Load " << alloca->get_name()
                                << " → " << replacement->get_name()
                                << " in BB " << bb->get_name() << std::endl;
                    for (auto* user : use_def.get_users(load)) {
                        user->replace_operand(load, replacement);
                    }
                    to_remove.insert(instr);
                }
            }
            continue;
        }    
    }
    // 填充 phi
    for (IR::BasicBlock* succ : bb->get_successors()) {
        // 找出栈中最 新 的val
        for (auto& [alloca, bb2phi] : _alloca_to_phis_map) {
            auto it_phi_in_succ = bb2phi.find(succ);
            if (it_phi_in_succ == bb2phi.end()) continue;

            if (!value_stack.count(alloca) || value_stack[alloca].empty()) {
                std::cerr << "Error: missing current version for "
                          << alloca->get_name()
                          << " when wiring phi in succ BB "
                          << succ->get_name() << " from pred "
                          << bb->get_name() << "\n";
                std::exit(1);
            }
            Value* cur_version;
            if (value_stack.count(alloca) && !value_stack[alloca].empty()) {
                cur_version = value_stack[alloca].top();
            } else {
                // 应该永远不被执行
                cur_version = IR::UndefValue::get(alloca->get_alloca_ty());
            }
            IR::PhiInst* phi_in_succ = it_phi_in_succ->second;
            // 正常情况都是覆盖
            phi_in_succ->add_incoming(cur_version, bb);

            std::cout << "Phi wiring: succ BB " << succ->get_name()
                      << " phi(" << phi_in_succ->get_name() << ") for $"
                      << alloca->get_name()
                      << " gets value " << cur_version->get_name()
                      << " from pred " << bb->get_name() << std::endl;
        }
    }

    // 递归
    auto it = dom_tree_children.find(bb);
    if (it != dom_tree_children.end()) {
        for (auto* child : it->second) {
            rename_variables(child, first_store_map, dom_tree_children,to_remove,use_def);
        }
    }

    // 回溯
    for (auto const& [alloca, count] : pushed_counts) {
        auto& stack = value_stack[alloca];
        for (int i = 0; i < count; ++i) {
            if (!stack.empty()) {
                stack.pop();
            }
        }
    }
}


} // namespace pass
