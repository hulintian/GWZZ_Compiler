#include "DCE.hpp"
#include "PassManager.hpp"
#include "UseDefAnalysis.hpp"
#include "Function.hpp"
#include "BasicBlock.hpp"
#include "Instructions.hpp"


namespace pass{

bool DCEPass::run(IR::Function& func,PassManager& pm){
    auto& use_def_result = pm.get_analysis_manager().get_function_result<UseDefAnalysisPass>(func);
    std::set<IR::Instruction*> live_instrs;
    std::vector<IR::Instruction*> to_remove;

    bool changed = false;

    //std::cout << "=============DCE Root Finding=============\n";
    for(auto& bb : func.get_basic_blocks()){

        for(auto &inst : bb->get_intrs()){
            bool is_root = false;
            if (//dynamic_cast<IR::StoreInst*>(inst) ||    
                dynamic_cast<IR::ReturnInst*>(inst) ||  
                dynamic_cast<IR::CallInst*>(inst) ||    
                dynamic_cast<IR::BranchInst*>(inst) ||  
                dynamic_cast<IR::CondBranchInst*>(inst)) 
            {
                is_root = true;
            }
            else if(auto* store = dynamic_cast<IR::StoreInst*>(inst)){
                Value* ptr = store->get_ptr_operand();
                if (!dynamic_cast<IR::AllocaInst*>(ptr)) {
                    is_root = true;
                }
            }else if(0){
                // 指令结果被外部函数使用也要设置root,先不写。
            }
             
            if(is_root == true){
                // std::cout << "  [DCE_ROOT] Found root: " << inst->get_name() 
                //           << " (in BB: " << inst->get_parent()->get_name() << ")\n";
                mark_live(inst, live_instrs, use_def_result);
            }
              
        }
    }

    //std::cout << "==========================================\n";


    std::cout << "=============DCE Erasing=============\n";
    for (auto& bb : func.get_basic_blocks()) {
        for (auto& inst : bb->get_intrs()) {
            if (live_instrs.find(inst) == live_instrs.end()) {
                std::cout << "  [DCE_ERASE] Marking for removal: " << inst->to_str() << std::endl;
                to_remove.push_back(inst);
            }
        }
    }
    std::cout << "=====================================\n";
    if (!to_remove.empty()){
        changed = true;
        for (auto* inst : to_remove) {
            inst->get_parent()->remove_instr(inst);
        }
    }
    return changed;
}
void DCEPass::mark_live(IR::Instruction* inst, 
                        std::set<IR::Instruction*>& live_insts,
                        const UseDefResult& use_def_result) {
    if (!inst) {
        std::cerr << "Error: mark_live called with a null instruction!" << std::endl;
        return;
    }
    if (live_insts.count(inst)) return;
    live_insts.insert(inst);
    // std::cout << "[DCE_MARK] Marking live: " << inst->get_name() 
    //           << " (in BB: " << inst->get_parent()->get_name() << ")" << std::endl;
    

    // 递归标记操作数     
    for (Value* op : inst->get_operands()) {
        if (!op) {
            std::cout << "[DCE_MARK] Found null operand in instruction: " << inst->get_name() << std::endl;
            continue;
        }

        
        // std::cout << "  -> Checking operand: " << op->get_name() 
        //           << " (Addr: " << op << ")" << std::endl; // 打印地址帮助识别
        
        if (op->is_instruction()) {
            mark_live(static_cast<IR::Instruction*>(op), live_insts, use_def_result);
        }else {
            // 操作数不是一个指令
            //std::cout << "  -> Operand " << op->get_name() << " is not an instruction. Skipping." << std::endl;
        }
    }              
}

}
