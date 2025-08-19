#pragma once

#include "Pass.hpp"
#include "Function.hpp"
#include "Instructions.hpp"

namespace pass {

class PHIEliminatePass : public FunctionTransformPass {
public:

    std::set<IR::PhiInst*> phis;
    std::map<IR::PhiInst*, IR::AllocaInst*> phi2slot;

    const char* get_name() const override { return "PHIEliminate"; }
    bool run(IR::Function& f, PassManager& pm) override;

    void collect_all_phi();
    
    void view_all_phis();

    IR::Function* _func;
    PassManager* _pm;
};

}
