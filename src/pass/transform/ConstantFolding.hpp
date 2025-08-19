#pragma once
#include "Pass.hpp"
#include <set>
#include <map>
#include <unordered_set>

namespace IR{
class BasicBlock;
class Function;
class Instruction;
class IRBuilder;
class ConstantValue;
}

namespace pass{

class UseDefResult;

class ConstantFoldingPass : public FunctionTransformPass{
public:
    const char* get_name()const override {return "ConstantFolding";}
    bool run(IR::Function& func,PassManager& pm) override;
    

private:
    IR::Function* _func;
    PassManager* _pm;
    UseDefResult* _use_def;
    IR::IRBuilder* _builder;
    std::map<IR::BasicBlock*, std::set<IR::BasicBlock*>> _dom_tree;
    std::unordered_set<IR::Instruction*> _dead_insts;

    void init();
    void refresh_analyses();
    void BFS(IR::BasicBlock* BB);
    void process(IR::BasicBlock* B);
    IR::ConstantValue* tryToConstantFold(IR::Instruction* inst);
    IR::ConstantValue* tryToCVT(IR::Instruction* inst);
    void tryToConstantCondbr(IR::Instruction* inst);
    void dead_inst_clear();
    
};

}