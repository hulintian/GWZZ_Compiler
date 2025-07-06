#pragma once

#include <string>

namespace IR {

class Function;
class BasicBlock{
public:
    BasicBlock(const std::string &name, Function* func) : _parent(func), bb_label(name) {}

private:
    Function* _parent;
    std::string bb_label;
    int _idx;
};
}
