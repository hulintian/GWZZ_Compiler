#include "ConstantFolding.hpp"
#include "Function.hpp"
#include "BasicBlock.hpp"
#include "Instructions.hpp"
#include "DominatorTree.hpp"
#include "PassManager.hpp"
#include "UseDefAnalysis.hpp"
#include "UndefValue.hpp"
#include <cassert>
#include <queue>
#include <string>
#include <variant>
#include <algorithm>

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
    refresh_dom_tree();
    BFS(_func->get_entry_bb());

    //TODO : rm dead BB
    dead_inst_clear();
    return true;
}

void ConstantFoldingPass::refresh_dom_tree(){
    _pm->get_analysis_manager().invalidate_function_result<DominatorTreePass>(*_func);
    auto& dom_tree = _pm->get_analysis_manager().get_function_result<DominatorTreePass>(*_func);
    _dom_tree = build_dom_tree(*_func,dom_tree);

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
        auto cvt_v = tryToCVT(inst);
        if(cvt_v){
            _dead_insts.insert(inst);

            auto users = _use_def->get_users(inst);
            for(auto user : users){
                user->replace_operand(inst,cvt_v);
            }
            refresh_analyses();
        }

        auto constant_v = tryToConstantFold(inst);
        if(constant_v) {
            _dead_insts.insert(inst);

            auto users = _use_def->get_users(inst);
            for(auto user : users){
                user->replace_operand(inst,constant_v);
            }
            refresh_analyses();
        }
        if(inst->is_conditional_br()){
            tryToConstantCondbr(inst);
        }
        auto phi_v = tryToPhi(inst);
        if(phi_v){
            _dead_insts.insert(inst);

            auto users = _use_def->get_users(inst);
            for(auto user : users){
                user->replace_operand(inst,phi_v);
            }
            refresh_analyses();
        } 
    }
    B->get_parent()->refresh_predecessors();
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
        auto bop = bin_inst->get_bop();
        auto lhs = bin_inst->get_lhs();
        auto rhs = bin_inst->get_rhs();
        auto ty = lhs->get_type();
        auto clhs = dynamic_cast<IR::ConstantValue*>(lhs);
        auto  crhs = dynamic_cast<IR::ConstantValue*>(rhs);

        std::variant<int, float> res;

        switch (bop) {
            case BinaryOp::Add:     if(ty->base_type == 1) { res = clhs->get_value().fv + crhs->get_value().fv; } else { res = clhs->get_value().iv + crhs->get_value().iv; }; break;
            case BinaryOp::Sub:     if(ty->base_type == 1) { res = clhs->get_value().fv - crhs->get_value().fv; } else { res = clhs->get_value().iv - crhs->get_value().iv; }; break;
            case BinaryOp::Mul:     if(ty->base_type == 1) { res = clhs->get_value().fv * crhs->get_value().fv; } else { res = clhs->get_value().iv * crhs->get_value().iv; }; break;
            case BinaryOp::Div:     if(ty->base_type == 1) { res = clhs->get_value().fv / crhs->get_value().fv; } else { res = clhs->get_value().iv / crhs->get_value().iv; }; break;
            case BinaryOp::Mod:     if(ty->base_type == 1) { assert(false && "Unsupport float mod"); } else { res = clhs->get_value().iv % crhs->get_value().iv; }; break;
            case BinaryOp::Eq:     if(ty->base_type == 1) { res = clhs->get_value().fv == crhs->get_value().fv; } else { res = clhs->get_value().iv == crhs->get_value().iv; }; break;
            case BinaryOp::Neq:     if(ty->base_type == 1) { res = clhs->get_value().fv != crhs->get_value().fv; } else { res = clhs->get_value().iv != crhs->get_value().iv; }; break;
            case BinaryOp::Lt:      if(ty->base_type == 1) { res = clhs->get_value().fv < crhs->get_value().fv; } else { res = clhs->get_value().iv < crhs->get_value().iv; }; break;
            case BinaryOp::Gt:      if(ty->base_type == 1) { res = clhs->get_value().fv > crhs->get_value().fv; } else { res = clhs->get_value().iv > crhs->get_value().iv; }; break;
            case BinaryOp::Leq:     if(ty->base_type == 1) { res = clhs->get_value().fv <= crhs->get_value().fv; } else { res = clhs->get_value().iv <= crhs->get_value().iv; }; break;
            case BinaryOp::Geq:     if(ty->base_type == 1) { res = clhs->get_value().fv >= crhs->get_value().fv; } else { res = clhs->get_value().iv >= crhs->get_value().iv; }; break;
            case BinaryOp::LShr:    if(ty->base_type == 1) { assert(false && "Not support float LSHR"); } else { res = clhs->get_value().iv >> crhs->get_value().iv; }; break;
            case BinaryOp::Shr:     if(ty->base_type == 1) { assert(false && "Not support float SHR"); } else { res = clhs->get_value().iv >> crhs->get_value().iv; }; break;
            case BinaryOp::Shl:     if(ty->base_type == 1) { assert(false && "Not support float SHL"); } else { res = clhs->get_value().iv << crhs->get_value().iv; }; break;
        }
        if(ty->base_type == 1 && !is_cmp_op(bop)) {
            auto cv = new ConstValue(std::get<float>(res));
            return this->_builder->create_const_value(ty, *cv);
        } else {
            auto cv = new ConstValue(std::get<int>(res));
            return this->_builder->create_const_value(ty, *cv);
        }
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

void ConstantFoldingPass::dead_inst_clear(){
    if(_dead_insts.empty()){
        std::cout<<"Dead_inst is empty!\n";
        return;
    }
    //std::cout<<"The function has:"<<_dead_insts.size()<<" dead inst!\n";
    for(auto& inst: _dead_insts){
        auto p = inst->get_parent();
        if(p){
            p->remove_instr(inst);
        }
    }
}

IR::ConstantValue* ConstantFoldingPass::tryToCVT(IR::Instruction* inst){
    if(!inst)return nullptr;
    auto cvt = dynamic_cast<IR::ConvertInst*>(inst);
    if(!cvt)return nullptr;
    auto* v = cvt->get_operand(0);
    auto* cv = dynamic_cast<IR::ConstantValue*>(v);
    if(!cv)return nullptr;
    auto* ty = cvt->getdst_type();
    if(ty->base_type == 1){
        auto cvt_v = new ConstValue((float)(cv->get_value().iv));
        return this->_builder->create_const_value(ty,*cvt_v);
    }else{
        auto cvt_v = new ConstValue((int)(cv->get_value().fv));
        return this->_builder->create_const_value(ty,*cvt_v);
    }
    return nullptr;
}
IR::ConstantValue* ConstantFoldingPass::tryToPhi(IR::Instruction* inst){
    if(!inst)return nullptr;
    auto phi = dynamic_cast<IR::PhiInst*>(inst);
    if(!phi)return nullptr;
    // process dead BB

    auto pres = inst->get_parent()->get_predecessors();
    auto incoming_bbs = phi->get_incoming_blocks();
    // step 1
    //std::cout<<"=============step1===============\n";
    if(pres.size() < incoming_bbs.size()){
        for(auto& bb : incoming_bbs){
            auto it_found = std::find(pres.begin(),pres.end(),bb);
            if(it_found == pres.end()){
                phi->remove_incoming_by_block(bb);
            }
        }
    }
    // step 2
    //std::cout<<"=============step2===============\n";
    if(phi->get_num_incoming() == 0){
        _dead_insts.insert(phi);
        return nullptr;
    }
    //std::cout<<"=============step3===============\n";
    //step 3 
    Value* common_value = nullptr;
    for (unsigned i = 0; i < phi->get_num_incoming(); ++i) {
        Value* incoming_val = phi->get_incoming_value(i);
        if (incoming_val != phi && !dynamic_cast<IR::UndefValue*>(incoming_val)){
            common_value = incoming_val;
            break;
        }
    }
    //std::cout<<"=============step4===============\n";
    //std::cout<<common_value->get_name()<<"\n";
    if(common_value == nullptr){
        _dead_insts.insert(phi);
        return nullptr;
    }
    //std::cout<<"=============step5===============\n";
    if(!dynamic_cast<IR::ConstantValue*>(common_value)){
        return nullptr;
    }
    //std::cout<<"=============step6===============\n";
    for (unsigned i = 0; i < phi->get_num_incoming(); ++i) {
        Value* incoming_val = phi->get_incoming_value(i);
        if (incoming_val != phi &&
            !dynamic_cast<IR::UndefValue*>(incoming_val) &&
            incoming_val != common_value) 
        {
            return nullptr;
        }
    }
    //std::cout<<"=============step7===============\n";
    return dynamic_cast<IR::ConstantValue*>(common_value);   
}

}
