#pragma once
#include "Pass.hpp"
#include <vector>
#include <map>
#include <set>
#include <stack>

namespace IR{
class Function;
class PassManager;
class IRBuilder;
class BasicBlock;
class Instruction;
class AllocaInst;
class PhiInst;
}

class Value;

namespace pass{

class UseDefResult;
class DominatorTreeResult;
class DominanceFrontierResult;

class Mem2RegPass : public FunctionTransformPass {
public:
    const char* get_name() const override {return "Mem2Reg";}
    bool run(IR::Function& F,PassManager& pm)override;

private:
    IR::Function* _F;
    PassManager* _pm;
    IR::IRBuilder* _builder;
    UseDefResult* _use_def;
    DominanceFrontierResult* _dom_frontier;
    std::map<IR::BasicBlock*, std::vector<IR::BasicBlock*>> _dom_tree;

    std::set<IR::AllocaInst*> _promotable_allocas; //可提升Alloca集
    std::set<IR::Instruction*> _to_remove; //待删除指令集
    std::map<IR::AllocaInst*, std::stack<Value*>> _value_stack; 
    std::map<IR::AllocaInst*, std::map<IR::BasicBlock*, IR::PhiInst*>> _alloca_to_phis_map; // Alloca-map{BB,Phi}映射
    std::map<IR::PhiInst*, IR::AllocaInst*> _phi_to_alloca_map; // 便于查找

    void init();
    void refresh_analyses();
    void collect_promotable_allocas();
    void insert_phi_nodes();
    void rename_variables(IR::BasicBlock* BB);
    IR::AllocaInst* find_alloca_for_phi(IR::PhiInst* phi_inst);
    void cleanup_instructions();

};

}