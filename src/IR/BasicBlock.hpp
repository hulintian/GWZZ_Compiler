#pragma once

#include <cassert>
#include <ostream>
#include <string>
#include <vector>

namespace IR {

class Function;
class Instruction;
class BasicBlock{
public:
    BasicBlock(const std::string &name, Function* func, int idx) : _parent(func), bb_label(name), _idx(idx) {}

    BasicBlock(const std::string &name,  int idx) : bb_label(name), _idx(idx) {}
    
    void set_parent(Function* func) {
        assert(func && "The function ptr is null\n");
        this->_parent = func;
    }

    int get_bb_idx() const { return _idx; }
    
    std::vector<Instruction*>& get_intrs() { return _instrs; }

    void add_instr(Instruction* i) {
        this->get_intrs().push_back(i);
    }
    
    void dump(std::ostream& out);
private:
    Function* _parent;
    std::string bb_label;
    int _idx;
    std::vector<Instruction*> _instrs;
};
}
