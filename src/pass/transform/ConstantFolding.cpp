#include "ConstantFolding.hpp"
#include "Function.hpp"
#include "BasicBlock.hpp"
#include "Instructions.hpp"
#include "DominatorTree.hpp"
#include "PassManager.hpp"
#include "UseDefAnalysis.hpp"
#include <queue>

namespace pass{

static std::map<IR::BasicBlock*, std::set<IR::BasicBlock*>> build_dom_tree(IR::Function& F,DominatorTreeResult &tree){
    std::map<IR::BasicBlock*, std::set<IR::BasicBlock*>> dom_tree;
    for (auto& bb : F.get_basic_blocks()) {
        IR::BasicBlock* idom = tree.get_idom(bb);
        if (idom != nullptr) {
            dom_tree[idom].insert(bb);
        }
    }
    return dom_tree;
}

static bool isConstant(Value* v){
    if(!v)return false;
    return dynamic_cast<IR::ConstantValue*>(v)!=nullptr;
}


bool ConstantFoldingPass::run(IR::Function& func,PassManager& pm){
    _func = &func;
    _pm = &pm;
    init();
    BFS(_func->get_entry_bb());

    //TODO : rm dead BB
    return true;
}

void ConstantFoldingPass::init(){
    _builder = &_pm->get_ir_builder();
    auto& dom_tree = _pm->get_analysis_manager().get_function_result<DominatorTreePass>(*_func);
    _dom_tree = build_dom_tree(*_func,dom_tree);

    _use_def = &_pm->get_analysis_manager().get_function_result<UseDefAnalysisPass>(*_func);

    _dead_insts.clear();
}

void ConstantFoldingPass::refresh_analyses(){
    _pm->get_analysis_manager().invalidate_function_result<UseDefAnalysisPass>(*_func);
    _use_def = &_pm->get_analysis_manager().get_function_result<UseDefAnalysisPass>(*_func);
}

void ConstantFoldingPass::BFS(IR::BasicBlock* BB){
    std::queue<IR::BasicBlock*> worklist;
    worklist.push(BB);

    while(!worklist.empty()){
        auto cur_bb = worklist.front();
        worklist.pop();
        for(auto& bb : _dom_tree[cur_bb]){
            worklist.push(bb);
        }

        process(cur_bb);
    }

}


void ConstantFoldingPass::process(IR::BasicBlock* B){
    for(auto& inst : B->get_intrs()){
        auto constant_v = tryToConstantFold(inst);
        if(constant_v) {
            auto users = _use_def->get_users(inst);
            for(auto user : users){
                user->replace_operand(inst,constant_v);
            }
            refresh_analyses();
        }
        if(inst->is_conditional_br()){
            tryToConstantCondbr(inst);
        }
    }
}

IR::ConstantValue* ConstantFoldingPass::tryToConstantFold(IR::Instruction* inst){
    if (!inst) return nullptr;
    for (unsigned i = 0; i < inst->get_num_operand(); ++i) {
        if (!isConstant(inst->get_operand(i))) {
            return nullptr;
        }
    }
    if (auto* bin_inst = dynamic_cast<IR::BinaryInst*>(inst)){
        // TODO
    }

    return nullptr;
}

void ConstantFoldingPass::tryToConstantCondbr(IR::Instruction* inst){
    auto condbr = dynamic_cast<IR::CondBranchInst*>(inst);
    if(!dynamic_cast<IR::ConstantValue*>(condbr->get_cond()))return;

    _builder->set_cur_module(inst->get_parent()->get_parent()->get_parent());
    _builder->set_cur_func(inst->get_parent()->get_parent());
    _builder->set_cur_bb(inst->get_parent());

    if(condbr->get_cond()==0){
        _builder->create_br(condbr->get_false_bb());
    }else{
        _builder->create_br(condbr->get_true_bb());
    }
    inst->get_parent()->remove_instr(inst);
}

}