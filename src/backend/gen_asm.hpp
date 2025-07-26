#pragma once 

#include "IR/BasicBlock.hpp"
#include "IR/Function.hpp"
#include "IR/GlobalValue.hpp"
#include "IR/Module.hpp"
#include "backend/MFunction.hpp"
#include "backend/MModule.hpp"
#include "backend/miscs.hpp"
#include "backend/ASMBuilder.hpp"

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

        for(auto func : m->get_funcs()) {
            translate_func(func);
        }

        return this->get_cur_module();
    }

    MachineModule* get_cur_module() { return this->mctx->get_module(); }

    void translate_gv(IR::GlobalValue);
    void translate_func(IR::Function* func);
    void gen_prolo_epil();
    void translate_bb(IR::BasicBlock* bb);

private:
    MCtx* mctx;
    ASMBuilder* abuilder;
};

}
