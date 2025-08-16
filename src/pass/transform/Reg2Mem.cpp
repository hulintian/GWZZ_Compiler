#include "Reg2Mem.hpp"
#include "Function.hpp"
#include "Instructions.hpp"
#include "IRBuilder.hpp"
#include "Value.hpp"
#include "PassManager.hpp"
#include "UseDefAnalysis.hpp"
#include "UndefValue.hpp"
#include "GlobalValue.hpp"


namespace pass {

static Value* get_zero(Type* ty){
    if(ty->base_type == Int){
        auto zo = ConstValue(0);
        auto zero = new IR::ConstantValue(ty, "0", zo);
        return zero;
    }
    else if(ty->base_type == Float){
        auto fo = ConstValue((float)0.0);
        auto fzero = new IR::ConstantValue(ty, std::to_string((float)0.0), fo);
        return fzero;
    }
    else{
        std::cerr<<"[GET ZERO]:The type not Int/Float !\n";
        auto zo = ConstValue(0);
        return new IR::ConstantValue(ty, "0", zo);
    }
    
    
}

bool Reg2MemPass::run(IR::Function &F,PassManager &pm){
    _F = &F;
    _pm = &pm;
    _builder = &pm.get_ir_builder();
    _use_def = &_pm->get_analysis_manager().get_function_result<UseDefAnalysisPass>(*_F);

    _phi_to_process.clear();
    _phi_to_alloca_map.clear();
    _phi_slot_is_semantic.clear();
    load_temp.clear();

    init_phi_set();
    if (_phi_to_process.empty()) return false;
    reset_alloca_in_entry();
    replace_phi_uses();
    insert_stores_at_src();
    insert_loads();
    erase_phi_nodes();
    return true;
    
    return true;
}

void Reg2MemPass::refresh_analyses(){
    _pm->get_analysis_manager().invalidate_function_result<UseDefAnalysisPass>(*_F);
    _use_def = &_pm->get_analysis_manager().get_function_result<UseDefAnalysisPass>(*_F);
}

void Reg2MemPass::init_phi_set() {
    _phi_to_process.clear();
    for (auto& bb : _F->get_bbs()) {
        for (auto& inst : bb->get_intrs()) {
            if (auto* phi = dynamic_cast<IR::PhiInst*>(inst)) {
                _phi_to_process.insert(phi);
            } else {
                break;
            }
        }
    }
}
void Reg2MemPass::reset_alloca_in_entry() {
    auto entry_bb = _F->get_entry_bb();
    _builder->set_cur_module(_F->get_parent());
    _builder->set_cur_func(_F);

    for (auto* phi : _phi_to_process) {

        // === CHANGE: 始终在 entry 为该 phi 分配唯一槽，取消“语义槽”复用启发式 ===
        _builder->set_cur_bb(entry_bb);
        std::string nm = phi->get_name() + std::string(".mem");
        if (!nm.empty() && nm[0] == '%') nm[0] = '$';
        auto* alloca_inst = _builder->create_alloca(nm, phi->get_type());
        auto* parent_bb = alloca_inst->get_parent();
        auto* moved     = parent_bb->remove_instr(alloca_inst);
        parent_bb->add_instr_after_allocas(moved);
        _phi_to_alloca_map[phi] = static_cast<IR::AllocaInst*>(moved);
    }
    refresh_analyses();
}

void Reg2MemPass::replace_phi_uses() {
    for (auto* phi : _phi_to_process) {
        auto* slot = _phi_to_alloca_map.at(phi);
        std::vector<IR::User*> users_snapshot = _use_def->get_users(phi);

        for (auto* user : users_snapshot) {
            auto* U = dynamic_cast<IR::Instruction*>(user);
            if (!U) continue;

            if (dynamic_cast<IR::PhiInst*>(U)) {
                // 不在这里改 PHI 的 incoming，交给“边上 store”处理
                continue;
            }

            _builder->set_cur_bb(U->get_parent());
            auto* ld   = _builder->create_load(phi->get_type(), slot);

            // 把 load 插在使用指令之前
            auto* bb   = ld->get_parent();
            auto* moved= bb->remove_instr(ld);
            bb->add_curinst_before_inst(moved, U);

            // 用该 load 替换操作数
            U->replace_operand(phi, moved);
        }
    }
    refresh_analyses();
}


void Reg2MemPass::insert_stores_at_src() {
    // === CHANGE: 每条边：pred 终结符之前 store incoming 到 φ 的专槽；
    //             若 incoming 是 φ，则从其槽 load 一次再 store。
    for (auto* phi : _phi_to_process) {
        auto* slot = _phi_to_alloca_map.at(phi);

        for (unsigned i = 0; i < phi->get_num_incoming(); ++i) {
            Value* val  = phi->get_incoming_value(i);
            IR::BasicBlock* pred = phi->get_incoming_block(i);

            // incoming 是另一个 φ：从其槽 load
            if (auto* val_phi = dynamic_cast<IR::PhiInst*>(val)) {
                auto it = _phi_to_alloca_map.find(val_phi);
                if (it != _phi_to_alloca_map.end()) {
                    auto* slot2 = it->second;
                    _builder->set_cur_bb(pred);
                    auto* ld = _builder->create_load(val_phi->get_type(), slot2);
                    // 放到 terminator 之前
                    auto* mv = static_cast<IR::LoadInst*>(pred->remove_instr(ld));
                    pred->add_instr_before_terminator(mv);
                    val = mv;
                }
            }
            if (dynamic_cast<IR::UndefValue*>(val) != nullptr) {
                val = get_zero(phi->get_type());   // 不用再往前追溯
            }

            _builder->set_cur_bb(pred);
            auto* st = _builder->create_store(phi->get_type(), phi->get_name()+".store", slot, val);

            // === CHANGE: 直接插在 terminator 之前，保证位于本块对 val 的定义之后 ===
            auto* mv = static_cast<IR::StoreInst*>(pred->remove_instr(st));
            pred->add_instr_before_terminator(mv);
        }
    }
    refresh_analyses();
}

void Reg2MemPass::insert_loads() {
}

void Reg2MemPass::erase_phi_nodes(){
    for (IR::PhiInst* phi : _phi_to_process){
        phi->get_parent()->remove_instr(phi);
    }
    refresh_analyses();
}
} // namespace pass
