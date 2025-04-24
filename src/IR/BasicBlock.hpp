#pragma once 

#include <vector>
#include <string>

#include "IR/Instruction.hpp"
namespace ir {
class BasicBlock {
public:
    std::string BB_Label;
    std::vector<Instruction> instructions;
};
}
