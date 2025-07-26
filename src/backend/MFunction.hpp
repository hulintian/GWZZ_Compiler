#pragma once 
#include <cassert>
#include <cstdint>
#include <ostream>
#include <string>
#include <set>
#include <map>
#include <unordered_map>
#include <vector>
#include "IR/Value.hpp"
#include "common/regarch.hpp"
#include "common/type.hpp"

namespace backend {

class MachineBasicBlock;
class MachineModule;
class MachineFunction {
public:
    MachineModule* _parent;
    std::string _name;
    Type* _ret_ty;
    std::vector<Type*> arg_types;
    std::vector<std::string> args_name;        // the symbols 

    std::unordered_map<std::string, int> symbol2bias;

    int32_t  stack_size;
    std::vector<RiscvReg::Reg> spills;

    MachineBasicBlock* entry_bb;

    MachineBasicBlock* prologue_bb;
    MachineBasicBlock* epilogue_bb;
    std::set<MachineBasicBlock*> bbs;

    std::map<int, MachineBasicBlock*> idx_bb_mp;
    std::map<int, std::set<int>> prev_bb;
    std::map<int, std::set<int>> next_bb;

    std::map<Value*, RiscvReg::Reg> v2r;

    MachineFunction(MachineModule* mm, std::string name, Type* ret_ty, std::vector<Type*> args_types, std::vector<std::string> arg_names) 
    : _parent(mm), _name(name), _ret_ty(ret_ty),arg_types(std::move(args_types)), args_name(std::move(arg_names))
    {}

    MachineBasicBlock* find_m_bb(int idx) {
        assert(idx_bb_mp.find(idx) != idx_bb_mp.end()  );
        return idx_bb_mp[idx];
    }

    MachineBasicBlock* get_entry_bb() { return entry_bb; }
    void set_entry_bb(MachineBasicBlock* ebb) { entry_bb = ebb; }

    bool has_mbb(int idx) { return idx_bb_mp.find(idx) != idx_bb_mp.end(); }
    MachineBasicBlock* get_mbb(int idx) ;
    void add_mbb(MachineBasicBlock* mbb);

    void set_prologue_bb(MachineBasicBlock* pbb) { this->prologue_bb = pbb; }
    void set_epilogue_bb(MachineBasicBlock* ebb) { this->epilogue_bb = ebb; }

    int32_t get_stack_size() {return stack_size;}
    void set_stack_size(int32_t stks) { this->stack_size = stks; }

    bool has_symbol(std::string s) { return symbol2bias.find(s) != symbol2bias.end(); }
    void add_symbol(std::string s, int bias) {
        assert(!has_symbol(s) && "Already has symbol");
        symbol2bias[s] = bias;
    }
    int get_symbol_bias(std::string s) {
        assert(has_symbol(s) && "Not has symbol");
        return symbol2bias[s];
    }

    Type* get_return_type() { return _ret_ty; }
    
    friend std::ostream& operator<<(std::ostream& os, const MachineFunction& mf) {
        os << mf._name;
        return os;
    }

    void dump_asm(std::ostream& out) ;

    
};

}
