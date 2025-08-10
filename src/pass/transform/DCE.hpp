#pragma once
#include "pass/Pass.hpp"
#include <set>

namespace IR {
class Function;
class Instruction;
}

namespace pass {
class UseDefResult;

class DCEPass : public FunctionTransformPass{
public:
    const char* get_name() const override { return "DCE"; }
    bool run(IR::Function& func, PassManager& pm) override;

private:
    void mark_live(IR::Instruction* instr, 
                   std::set<IR::Instruction*>& live_instrs,
                   const UseDefResult& use_def_result);
};


}