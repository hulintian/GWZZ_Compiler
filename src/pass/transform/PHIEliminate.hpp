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
    // 统计入度
    std::map<IR::PhiInst*, std::set<IR::PhiInst*>> inference_graph;
    // 统计出度
    std::map<IR::PhiInst*, std::set<IR::PhiInst*>> rinference_graph;

    std::map<IR::PhiInst*, bool> eliminated;
    

    const char* get_name() const override { return "PHIEliminate"; }
    bool run(IR::Function& f, PassManager& pm) override;

    void collect_all_phi();
    void view_all_phis();
    void init();
    void check_and_confirm_slot();

    void phi_promotion(IR::PhiInst* phi);

    void update_use_def();

    void gen_inference_and_phiEli();

    int slot_idx = 0;
    int get_slot_idx() { return slot_idx++; }
    IR::Function* _func;
    PassManager* _pm;

    UseDefResult* use_def_res;

};

}
