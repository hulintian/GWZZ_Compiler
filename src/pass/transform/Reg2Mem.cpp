#include "Reg2Mem.hpp"
#include "Function.hpp"
#include "Instructions.hpp"
#include "IRBuilder.hpp"

#include "PassManager.hpp"
#include "UseDefAnalysis.hpp"


namespace pass {

bool Reg2MemPass::run(IR::Function &F,PassManager &pm){
    _F = &F;
    _pm = &pm;
    _builder = &pm.get_ir_builder();
    _use_def = &_pm->get_analysis_manager().get_function_result<UseDefAnalysisPass>(*_F);

    init_phi_set();
    if (_phi_to_process.empty()) return false;

    reset_alloca_in_entry();
    replace_phi_uses();
    insert_stores_at_src();
    insert_loads();
    erase_phi_nodes();
    
    return true;
}

void Reg2MemPass::refresh_analyses(){
    _pm->get_analysis_manager().invalidate_function_result<UseDefAnalysisPass>(*_F);
    _use_def = &_pm->get_analysis_manager().get_function_result<UseDefAnalysisPass>(*_F);
}

void Reg2MemPass::init_phi_set(){
    for(auto &bb : _F->get_bbs()){
        for(auto &inst : bb->get_intrs()){
            auto phi_inst = dynamic_cast<IR::PhiInst*>(inst);
            if(!phi_inst){
                break;
            }
            _phi_to_process.insert(phi_inst);
        }
    }
}

void Reg2MemPass::reset_alloca_in_entry(){
    auto entry_bb = _F->get_entry_bb();
    _builder->set_cur_module(_F->get_parent());
    _builder->set_cur_func(_F);
    _builder->set_cur_bb(entry_bb);
    for (auto& phi : _phi_to_process){
        std::string phi_name = phi->get_name();
        std::string alloca_name = phi_name + ".mem";
        if (alloca_name.rfind('%', 0) == 0) {
            alloca_name[0] = '$';
        }
        auto alloca_inst = _builder->create_alloca(alloca_name,phi->get_type());
        //已经知道是entrybb,但为了标准化
        auto parent_bb = alloca_inst->get_parent();
        auto move_alloca_inst = parent_bb->remove_instr(alloca_inst);
        parent_bb->add_instruction_at_front(move_alloca_inst);
        _phi_to_alloca_map[phi] = static_cast<IR::AllocaInst*>(move_alloca_inst);
    }
    refresh_analyses();
}

void Reg2MemPass::replace_phi_uses(){
    for(auto& phi : _phi_to_process){
        auto alloca = _phi_to_alloca_map.at(phi);
        const std::vector<IR::User*>& users = _use_def->get_users(phi);

        for(auto& user : users){
            auto* user_inst = static_cast<IR::Instruction*>(user);
            _builder->set_cur_bb(user_inst->get_parent());
            if (!dynamic_cast<IR::PhiInst*>(user_inst)){
                auto loadinst = _builder->create_load(phi->get_type(),alloca);
                auto parentbb = loadinst->get_parent();
                auto move_load = parentbb->remove_instr(loadinst);
                parentbb->add_curinst_before_inst(move_load,user_inst);
                user_inst->replace_operand(phi,move_load);
            }else{
                auto user_phi = static_cast<IR::PhiInst*>(user_inst);
                for (unsigned i = 0; i < user_phi->get_num_incoming(); ++i) {
                    if (user_phi->get_incoming_value(i) == phi){
                        auto pred_bb = user_phi->get_incoming_block(i);
                        
                        _builder->set_cur_bb(pred_bb);
                        auto loadinst = _builder->create_load(phi->get_type(),alloca);
                        auto move_load = static_cast<IR::LoadInst*>(pred_bb->remove_instr(loadinst));
                        load_temp[user_phi].push_back({move_load, pred_bb});
                        
                    }
                }
            }
        }
    }
    refresh_analyses();
}

void Reg2MemPass::insert_stores_at_src(){
    for(auto& phi : _phi_to_process){
        auto alloca = _phi_to_alloca_map.at(phi);

        for (unsigned i = 0; i < phi->get_num_incoming(); ++i){
            auto val = phi->get_incoming_value(i);
            auto pred_bb = phi->get_incoming_block(i);
            _builder->set_cur_bb(pred_bb);
            auto storeinst = _builder->create_store(phi->get_type(),phi->get_name()+".store",alloca,val);
            auto parentbb = storeinst->get_parent();
            auto move_store = parentbb->remove_instr(storeinst);
            parentbb->add_instr_before_terminator(move_store);
        }
    }
    refresh_analyses();
}

void Reg2MemPass::insert_loads(){
    if(load_temp.empty()) return;
    for(auto& [phi,load_tasks] : load_temp){
        for (auto& pair : load_tasks){
            auto& loadinst = pair.first;
            auto& preBB = pair.second;
            _builder->set_cur_bb(preBB);
            preBB->add_instr_before_terminator(loadinst);
            phi->add_incoming(loadinst,preBB);
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
