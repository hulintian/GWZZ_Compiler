#pragma once 

#include "BasicBlock.hpp"
#include "Function.hpp"
#include "GlobalValue.hpp"
#include "Instructions.hpp"
#include "Module.hpp"
#include "MFunction.hpp"
#include "MModule.hpp"
#include "miscs.hpp"
#include "ASMBuilder.hpp"
#include "regarch.hpp"
#include "Instructions.hpp"

namespace backend {


class ASMGen {
public:
    ASMGen() {
        MachineModule* mm = new MachineModule();
        mctx = new MCtx(mm);
        abuilder = new ASMBuilder(mctx);

    }

    // TODO translate func bb instr
    
    MachineModule* translate(IR::Module* m) {
        // calculate the bbs 
        int cnt = 0;
        for(auto f : m->get_funcs()) {
            for(auto bb : f->get_bbs()) {
                cnt = std::max(cnt, bb->get_bb_idx());
            }
        }
        n_bb_idxs = cnt+1;

        // gv 直接搬运过来
        this->mctx->get_module()->global_items = std::move(m->get_gvs());
        for(auto glit : this->get_cur_module()->global_items) {
            if(glit->is_bss()) {
                this->mctx->get_module()->bss_items.push_back(glit);
            } else {
                this->mctx->get_module()->data_items.push_back(glit);
            }
        }

        // 搬运 lib funcs 
        this->mctx->get_module()->lib_funcs = std::move(m->get_lib_funcs());
        this->mctx->get_module()->_name2lib_func = std::move(m->get_name2lib_func());

        for(auto func : m->get_funcs()) {
            func->re_scain_allocas();
#ifdef SHOW_ALLOCAS
            for(auto alloca : func->get_allocas()) {
                std::cerr << alloca->to_str() << "\n";
            }
#endif
            translate_func(func);
        }

        return this->get_cur_module();
    }

    MachineModule* get_cur_module() { return this->mctx->get_module(); }

    void translate_gv(IR::GlobalValue);
    void translate_func(IR::Function* func);
    void gen_prolo_epil(backend::MachineFunction* mfunc, IR::Function* src_func);
    void translate_bb(IR::BasicBlock* bb);

    void phi_eliminate(IR::PhiInst* phi_instr);

    void translate_binary(IR::BinaryInst* binst);

    int get_new_bb_idx() { return n_bb_idxs++; }
    int get_new_vreg_idx() { return vreg_idx++; }


private:
    MCtx* mctx;
    ASMBuilder* abuilder;
    int n_bb_idxs;
    int vreg_idx = 0;
};

}
