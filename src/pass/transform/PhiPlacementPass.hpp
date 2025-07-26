#pragma once
#include "pass/Pass.hpp"

namespace pass {

class PhiPlacementPass : public FunctionTransformPass {
public:
    const char* get_name() const override { return "PhiPlacement"; }
    bool run(IR::Function& function, PassManager& pm) override;
};

} // namespace pass