#include "backend/gen_asm.hpp"
#include "IR/BasicBlock.hpp"
#include "IR/Function.hpp"
#include "IR/Instructions.hpp"
#include "common/type.hpp"
#include "common/utils.hpp"
#include <iostream>

namespace backend {

void ASMGen::translate_func(IR::Function* func) {
    auto fname = func->get_func_name();
    auto frt = func->get_return_type();
    auto fptys = func->get_params_type();
    auto fpns = func->get_func_p_names();
    auto mfunc = this->abuilder->create_m_func(fname, frt, fptys, fpns);

    this->mctx->set_function(mfunc);
    // this->mctx->get_module()->addfuncs(mfunc);
    // 先把基本块翻译过去，跳转指令要用到地址， 后面逐个翻译基本块不用创建了，直接从map中找地址
    int max_bb_idx = 0;
    for(auto ibb : func->get_bbs()) {
        max_bb_idx = std::max(max_bb_idx, ibb->get_bb_idx());
        this->abuilder->create_m_basicblock(ibb->get_bb_idx()) ;
    }
    // after created normal bbs , then create 2 special bb prologue_bb epilogue_bb
    auto prolo_bb = new MachineBasicBlock(max_bb_idx+1);
    this->mctx->get_function()->add_mbb(prolo_bb);
    auto epil_bb = new MachineBasicBlock(max_bb_idx+2);
    this->mctx->get_function()->add_mbb(epil_bb);
    this->mctx->get_function()->set_prologue_bb(prolo_bb);
    this->mctx->get_function()->set_epilogue_bb(epil_bb);

    // 分析参数、收集局部变量的 alloca，函数参数 也是alloca的，对于一个右n个参数的函数，前n个alloca instr就算形参数
    // 在没有分配寄存器之前，无法确定的是spill的寄存器的个数，
    // 哪些用保存寄存器（生命跨过函数的），哪些用临时寄存器
   // std::cout << "==========================================================\n";
    // std::cout << "In Func " << fname << std::endl; 
    // 计算函数内部声明所需要的空间
    int sum_lss = 0;
    for(auto ai : func->get_allocas()) {
        int size;
        auto aty = ai->get_type();
        if(!aty->is_ptr()) {
            if(aty->is_array()) {
                size = aty->nr_elems() * 4;
            } else {
                size = 4;
            }
        } else {
            size = 8;
        }
        sum_lss += size;
        // add the bias 
        this->mctx->get_function()->add_symbol(ai->get_name(), -16-sum_lss);
        // std::cout << ai->to_str() << ";  Size : " << size << std::endl;
    }
    this->mctx->get_function()->set_stack_size(16+sum_lss);
    // std::cout << "LA use " << sum_lss << std::endl;
    // std::cout << "==========================================================\n";

    // dfs to translate the basic block 
    int entry_idx = func->get_entry_bb()->get_bb_idx();
    std::stack<int> next_bb_idx;
    // set the logical entry 
    auto ebb = this->mctx->get_function()->get_mbb(entry_idx);
    this->mctx->get_function()->entry_bb = ebb;
    next_bb_idx.push(entry_idx);
    while(!next_bb_idx.empty()) {
        int bi = next_bb_idx.top();
        next_bb_idx.pop();
        for(auto next_idx : func->get_cfg()->succ_bb[bi]) {
            next_bb_idx.push(next_idx);
        }
        // translate the bb
        translate_bb(func->get_cfg()->idx2bb[bi]);
    }

    // reg alloca 
    
    // gen prologue and epilogue
    this->gen_prolo_epil();
}

void ASMGen::translate_bb(IR::BasicBlock* bb) {
    // get the basic block that 
    int bb_idx = bb->get_bb_idx();
    auto mbb = this->mctx->get_function()->get_mbb(bb_idx);
    this->mctx->set_basic_block(mbb);

    // translate the ir instr to asm 
    //
    for(auto instr : bb->get_intrs()) {
        if(auto alloca = dynamic_cast<IR::AllocaInst*>(instr)) {
            continue;  // Already handled in function translation
        } else if(auto load = dynamic_cast<IR::LoadInst*>(instr)) {

        } else if(auto store = dynamic_cast<IR::StoreInst*>(instr)) {

        } else if(auto binary = dynamic_cast<IR::BinaryInst*>(instr)) {

        } else if(auto convert = dynamic_cast<IR::ConvertInst*>(instr)) {

        } else if(auto call = dynamic_cast<IR::CallInst*>(instr)) {

        } else if(auto gep = dynamic_cast<IR::GetElementPtrInst*>(instr)) {

        } else if(auto ret = dynamic_cast<IR::ReturnInst*>(instr)) {
            // get the epil_bb and jump 
            // is gp or fp 
            // bool rt_gp = this->mctx->get_function()->get_return_type()->base_type == Int;

        } else if(auto branch = dynamic_cast<IR::BranchInst*>(instr)) {
            auto idbb = branch->get_dst_bb(); 
            auto dst_bb = this->mctx->get_function()->get_mbb(idbb->get_bb_idx());
            auto jump = this->abuilder->create_J(dst_bb);
        } else if(auto cond_br = dynamic_cast<IR::CondBranchInst*>(instr)) {

        } else if(auto phi = dynamic_cast<IR::PhiInst*>(instr)) {
            continue;
        } else {
            // Handle unknown instruction type
            std::cerr << error << "Warning: Unknown instruction type in basic block" << std::endl;
        }
    }
}

void ASMGen::gen_prolo_epil() {
}



}
