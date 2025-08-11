#pragma once
#include "Value.hpp"
#include "type.hpp"
#include <cassert>
#include <ostream>
#include <string>
#include <vector>

namespace IR {

class Function;
class Instruction;
class BasicBlock : public Value{
public:
    BasicBlock(const std::string &name, Function* func, int idx) :Value(Type::get_label_ty(),name), _parent(func), bb_label(name), _idx(idx) {}

    BasicBlock(const std::string &name,  int idx) :Value(Type::get_label_ty(),name), bb_label(name), _idx(idx) {}
    
    void set_parent(Function* func) {
        assert(func && "The function ptr is null\n");
        this->_parent = func;
    }

    int get_bb_idx() const { return _idx; }
    
    std::vector<Instruction*>& get_intrs() { return _instrs; }
    //User Code Start. Sasara
    Function* get_parent()const {return this->_parent;}
    Instruction* get_terminator() const;
    const std::vector<BasicBlock*>& get_successors() const;
    const std::vector<BasicBlock*>& get_predecessors() const;
    
    // void remove_predecessor(BasicBlock* bb);
    // void add_predecessor(BasicBlock* bb);
    Instruction* remove_instr(Instruction* inst);
    void delete_instr(Instruction* inst);
    // 在基本块的终结指令之前，插入指令。
    void add_instr_before_terminator(Instruction* inst);
    void add_instruction_at_front(Instruction* instr);
    //User Code End. Sasara
    void add_instr(Instruction* i);
    
    void dump(std::ostream& out);

    std::string get_name() { return bb_label; }
private:
    Function* _parent;
    std::string bb_label;
    int _idx;
    std::vector<Instruction*> _instrs;
};
}
