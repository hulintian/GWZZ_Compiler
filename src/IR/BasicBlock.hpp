#pragma once

#include <cassert>
#include <string>

namespace IR {

class Function;
class BasicBlock{
public:
    BasicBlock(const std::string &name, Function* func, int idx) : _parent(func), bb_label(name), _idx(idx) {}

    BasicBlock(const std::string &name,  int idx) : bb_label(name), _idx(idx) {}
    
    void set_parent(Function* func) {
        assert(func && "The function ptr is null\n");
        this->_parent = func;
    }

    int get_bb_idx() const { return _idx; }
private:
    Function* _parent;
    std::string bb_label;
    int _idx;
};
}
