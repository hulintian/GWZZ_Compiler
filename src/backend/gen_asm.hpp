#pragma once 

#include "IR/BasicBlock.hpp"
#include "IR/Function.hpp"
#include "IR/GlobalValue.hpp"
#include "IR/Instructions.hpp"
#include "IR/Module.hpp"
#include "backend/MFunction.hpp"
#include "backend/MModule.hpp"
#include "backend/miscs.hpp"
#include "backend/ASMBuilder.hpp"
#include "common/regarch.hpp"

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
            cnt += f->get_bbs().size();
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

        for(auto func : m->get_funcs()) {
            translate_func(func);
        }

        return this->get_cur_module();
    }

    MachineModule* get_cur_module() { return this->mctx->get_module(); }

    void translate_gv(IR::GlobalValue);
    void translate_func(IR::Function* func);
    void gen_prolo_epil(backend::MachineFunction* mfunc);
    void translate_bb(IR::BasicBlock* bb);

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
