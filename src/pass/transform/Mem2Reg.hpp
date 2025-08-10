#pragma once
#include "Pass.hpp"
#include <vector>
#include <map>
#include <set>
#include <stack>
namespace IR {
class IRBuilder;
class Instruction;
class AllocaInst;
class BasicBlock;
class Function;
class PhiInst;
}

class Value;

namespace pass {
class UseDefResult;
class DominatorTreeResult;
class DominanceFrontierResult;

class Mem2RegPass : public FunctionTransformPass{
public:
    const char* get_name()const override{return "Mem2Reg";}
    bool run(IR::Function& func,PassManager& pm)override;

private:
    std::map<IR::AllocaInst*, std::map<IR::BasicBlock*, IR::PhiInst*>,std::less<void*>> _alloca_to_phis_map;
    std::map<IR::AllocaInst*, std::stack<Value*>,std::less<void*>> value_stack;


    void collect_promotable_allocas(IR::Function& function, 
                                    std::vector<IR::AllocaInst*>& allocas,
                                    const UseDefResult& use_def_result);
    void insert_phi_nodes(IR::Function& function, 
                          const std::vector<IR::AllocaInst*>& allocas,
                          const DominanceFrontierResult& dom_frontier,
                          const UseDefResult& use_def_result,
                          IR::IRBuilder& ir_builder); 

    void rename_variables(IR::BasicBlock* bb,
                      const std::map<IR::AllocaInst*, std::map<IR::BasicBlock*,Value*>,std::less<void*>>& first_store_map,
                      const std::map<IR::BasicBlock*, std::vector<IR::BasicBlock*>>& dom_tree_children,
                      std::set<IR::Instruction*>& to_remove,
                      const UseDefResult& use_def_result);
 
};

    
} 
