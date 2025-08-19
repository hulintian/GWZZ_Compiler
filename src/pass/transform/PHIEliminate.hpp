#pragma once

#include "Pass.hpp"
#include "Function.hpp"
#include "Instructions.hpp"
#include "UseDefAnalysis.hpp"

namespace pass {

class PHIEliminatePass : public FunctionTransformPass {
public:

    std::set<IR::PhiInst*> phis;
    std::map<IR::PhiInst*, IR::AllocaInst*> phi2slot;
    std::map<std::string, IR::AllocaInst*> sym2slot;

    const char* get_name() const override { return "PHIEliminate"; }
    bool run(IR::Function& f, PassManager& pm) override;

    void collect_all_phi();
    void view_all_phis();
    void init();
    void check_and_confirm_slot();

    void phi_promotion();

    void update_use_def();

    int slot_idx = 0;
    int get_slot_idx() { return slot_idx++; }
    IR::Function* _func;
    PassManager* _pm;

    UseDefResult* use_def_res;

};

}
