#pragma once 

#include "IR/BasicBlock.hpp"
#include "IR/Function.hpp"
#include "backend/MFunction.hpp"
#include "backend/MModule.hpp"
namespace backend {
class MCtx {
public:
    MCtx(MachineModule* mmodule) : mm(mmodule){}

    // Getters
    MachineModule* get_module() const { return mm; }
    MachineFunction* get_function() const { return mfunc; }
    MachineBasicBlock* get_basic_block() const { return mbb; }

    // Setters
    void set_module(MachineModule* mmodule) { mm = mmodule; }
    void set_function(MachineFunction* function) { mfunc = function; }
    void set_basic_block(MachineBasicBlock* bb) { mbb = bb; }

private:
    MachineModule *mm;
    MachineFunction *mfunc;
    MachineBasicBlock* mbb;
};
}
