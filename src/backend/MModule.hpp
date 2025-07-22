#pragma once 

#include "IR/GlobalValue.hpp"
#include <backend/MBasicBlock.hpp>
#include <backend/MFunction.hpp>
#include <vector>
namespace backend {

class MachineModule {
public:
    std::string _mname;
    std::vector<MachineFunction*> funcs;
    std::vector<IR::GlobalValue*> global_items;
};

}
