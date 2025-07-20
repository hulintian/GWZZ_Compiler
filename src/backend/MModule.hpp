#pragma once 

#include <backend/MBasicBlock.hpp>
#include <backend/MFunction.hpp>
#include <vector>
namespace backend {

class MachineModule {
public:
    std::vector<MachineFunction*> funcs;

};

}
