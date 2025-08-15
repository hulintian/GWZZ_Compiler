#include "Reg2Mem.hpp"
#include "Function.hpp"
#include "Instructions.hpp"
#include "IRBuilder.hpp"
#include "Value.hpp"
#include "PassManager.hpp"
#include "UseDefAnalysis.hpp"
#include "UndefValue.hpp"


namespace pass {

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
        // 在 φ 所在块里尝试选择“语义槽”：寻找形如
        //   store  (pure(phi, ...))  ->  some_alloca
        // 的写回；一旦找到，就用该 alloca 作为 φ 的目标槽
        IR::AllocaInst* chosen_slot = nullptr;
        IR::BasicBlock* pb = phi->get_parent();

        // 无递归栈的简易“纯运算依赖 φ”判定
        auto is_pure = [](Value* v)->bool {
            if (!v) return false;
            if (dynamic_cast<IR::LoadInst*>(v)) return false;
            if (dynamic_cast<IR::StoreInst*>(v)) return false;
            if (dynamic_cast<IR::CallInst*>(v)) return false;
            if (dynamic_cast<IR::PhiInst*>(v)) return false;
            if (dynamic_cast<IR::AllocaInst*>(v)) return false;
            if (dynamic_cast<IR::GetElementPtrInst*>(v)) return false;
            if (dynamic_cast<IR::BranchInst*>(v)) return false;
            return dynamic_cast<IR::Instruction*>(v) != nullptr; // 例如 add/sub/mul/sdiv/srem/icmp
        };

        auto uses_phi_transitively = [&](Value* v)->bool {
            if (!v) return false;
            std::vector<Value*> stk; stk.push_back(v);
            int budget = 64;
            while (!stk.empty() && budget--) {
                Value* cur = stk.back(); stk.pop_back();
                if (!cur) continue;
                if (cur == phi) return true;
                auto* I = dynamic_cast<IR::Instruction*>(cur);
                if (!I) continue;
                if (!is_pure(I)) continue;
                for (unsigned i = 0; i < I->get_num_operand(); ++i)
                    stk.push_back(I->get_operand(i));
            }
            return false;
        };

        for (auto* inst : pb->get_intrs()) {
            if (auto* st = dynamic_cast<IR::StoreInst*>(inst)) {
                if (!uses_phi_transitively(st->get_value_operand())) continue;
                if (auto* slot = dynamic_cast<IR::AllocaInst*>(st->get_ptr_operand())) {
                    chosen_slot = slot;
                    break;
                }
            }
        }

        if (!chosen_slot) {
            // 回退：在 entry 新建 φ 的专用槽
            _builder->set_cur_bb(entry_bb);
            std::string nm = phi->get_name() + std::string(".mem");
            if (!nm.empty() && nm[0] == '%') nm[0] = '$';
            auto* alloca_inst = _builder->create_alloca(nm, phi->get_type());
            auto* parent_bb = alloca_inst->get_parent();
            auto* moved     = parent_bb->remove_instr(alloca_inst);
            parent_bb->add_instr_after_allocas(moved);
            chosen_slot = static_cast<IR::AllocaInst*>(moved);
        }

        _phi_to_alloca_map[phi] = chosen_slot;
    }
    refresh_analyses();
}

void Reg2MemPass::replace_phi_uses() {
    for (auto* phi : _phi_to_process) {
        auto* slot = _phi_to_alloca_map.at(phi);
        const std::vector<IR::User*>& users = _use_def->get_users(phi);

        for (auto* user : users) {
            auto* U = static_cast<IR::Instruction*>(user);
            _builder->set_cur_bb(U->get_parent());
            if (!dynamic_cast<IR::PhiInst*>(U)) {
                auto* ld   = _builder->create_load(phi->get_type(), slot);
                auto* bb   = ld->get_parent();
                auto* moved= bb->remove_instr(ld);
                bb->add_curinst_before_inst(moved, U);
                U->replace_operand(phi, moved);
            } else {
                auto* user_phi = static_cast<IR::PhiInst*>(U);
                for (unsigned i = 0; i < user_phi->get_num_incoming(); ++i) {
                    if (user_phi->get_incoming_value(i) == phi) {
                        auto* pred = user_phi->get_incoming_block(i);
                        _builder->set_cur_bb(pred);
                        auto* ld = _builder->create_load(phi->get_type(), slot);
                        auto* mv = static_cast<IR::LoadInst*>(pred->remove_instr(ld));
                        load_temp[user_phi].push_back({mv, pred});
                    }
                }
            }
        }
    }
    refresh_analyses();
}


void Reg2MemPass::insert_stores_at_src() {
    for (auto* phi : _phi_to_process) {
        auto* slot = _phi_to_alloca_map.at(phi);

        for (unsigned i = 0; i < phi->get_num_incoming(); ++i) {
            Value* val  = phi->get_incoming_value(i);
            IR::BasicBlock* pred = phi->get_incoming_block(i);

            // incoming 是另一个 φ：从其槽 load 一次
            if (auto* val_phi = dynamic_cast<IR::PhiInst*>(val)) {
                auto it = _phi_to_alloca_map.find(val_phi);
                if (it != _phi_to_alloca_map.end()) {
                    auto* slot2 = it->second;
                    _builder->set_cur_bb(pred);
                    auto* ld = _builder->create_load(val_phi->get_type(), slot2);
                    auto* mv = static_cast<IR::LoadInst*>(pred->remove_instr(ld));
                    pred->add_instr_before_terminator(mv);
                    val = mv;
                }
            }
            if (dynamic_cast<IR::UndefValue*>(val) != nullptr) {
                continue;
            }

            _builder->set_cur_bb(pred);
            auto* st = _builder->create_store(phi->get_type(), phi->get_name()+".store", slot, val);
            auto* bb = st->get_parent();
            auto* mv = bb->remove_instr(st);
            bb->add_instr_before_terminator(mv);
        }
    }
    refresh_analyses();
}

void Reg2MemPass::insert_loads() {
    // 先把延迟的（phi->phi 边）load 插回 terminator 前，并改 incoming
    if (!load_temp.empty()) {
        for (auto& [user_phi, tasks] : load_temp) {
            for (auto& pr : tasks) {
                auto* ld  = pr.first;
                auto* pre = pr.second;
                _builder->set_cur_bb(pre);
                pre->add_instr_before_terminator(ld);
                user_phi->set_incoming(ld, pre);
            }
        }
        refresh_analyses();
    }

    // —— 关键修复 ——：
    // 在 φ 所在块里，找到第一个 call，
    // 然后把“右值经纯运算依赖于该 φ 或者依赖于从其槽（slot）Load 的值”的 store
    // 全部移动到第一个 call 之前（保持出现顺序）。
    for (auto* phi : _phi_to_process) {
        IR::BasicBlock* bb   = phi->get_parent();
        IR::AllocaInst* slot = _phi_to_alloca_map.at(phi);
        if (!bb || !slot) continue;

        IR::Instruction* first_call = nullptr;
        for (auto* inst : bb->get_intrs()) {
            if (dynamic_cast<IR::CallInst*>(inst)) { first_call = inst; break; }
        }
        if (!first_call) continue;

        // 允许“经一次对 slot 的 Load + 纯运算”的依赖追踪
        auto depends_on_phi_or_slot = [&](Value* v) -> bool {
            if (!v) return false;
            std::vector<Value*> stk{v};
            int budget = 128;
            while (!stk.empty() && budget--) {
                Value* cur = stk.back(); stk.pop_back();
                if (!cur) continue;
                if (cur == phi) return true;

                // 允许通过“从该 φ 的槽的 Load”建立依赖
                if (auto* L = dynamic_cast<IR::LoadInst*>(cur)) {
                    if (L->get_src() == slot) return true;
                    // 其它 Load 不继续深入
                    continue;
                }

                auto* I = dynamic_cast<IR::Instruction*>(cur);
                if (!I) continue;

                // 碰到有副作用/内存类指令就停（避免跨越非纯边）
                if (dynamic_cast<IR::CallInst*>(I))  continue;
                if (dynamic_cast<IR::StoreInst*>(I)) continue;
                if (dynamic_cast<IR::GetElementPtrInst*>(I)) continue;
                if (dynamic_cast<IR::AllocaInst*>(I)) continue;
                if (dynamic_cast<IR::BranchInst*>(I)) continue;
                if (dynamic_cast<IR::PhiInst*>(I))   continue;

                // 其余（add/sub/mul/sdiv/srem/icmp 等）视为纯运算，继续展开
                for (unsigned i = 0; i < I->get_num_operand(); ++i) {
                    stk.push_back(I->get_operand(i));
                }
            }
            return false;
        };

        // 收集需要移动的 store（不要求写到 slot，本修复正是为此）
        std::vector<IR::StoreInst*> to_move;
        for (auto* inst : bb->get_intrs()) {
            if (auto* st = dynamic_cast<IR::StoreInst*>(inst)) {
                if (depends_on_phi_or_slot(st->get_value_operand())) {
                    to_move.push_back(st);
                }
            }
        }

        // 按出现顺序移动到第一个 call 之前
        for (auto* st : to_move) {
            if (st == first_call) break; // 保护（理论上不会等于）
            auto* mv = static_cast<IR::StoreInst*>(bb->remove_instr(st));
            bb->add_curinst_before_inst(mv, first_call);
        }
    }

    refresh_analyses();
}

void Reg2MemPass::erase_phi_nodes(){
    for (IR::PhiInst* phi : _phi_to_process){
        phi->get_parent()->remove_instr(phi);
    }
    refresh_analyses();
}
} // namespace pass
