#pragma once 
#include <cassert>
#include <cstdint>
#include <iostream>
#include <ostream>
#include <string>
#include <set>
#include <map>
#include <unordered_map>
#include <vector>
#include "IR/Value.hpp"
#include "common/regarch.hpp"
#include "common/type.hpp"
#include "common/utils.hpp"

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
    int overflow_arguments = 0;

    std::vector<RiscvReg::Reg> spills;
    std::vector<RiscvReg::Reg> X_used_save_regs;
    std::vector<RiscvReg::Reg> F_used_save_regs;

    MachineBasicBlock* entry_bb;

    MachineBasicBlock* prologue_bb;
    MachineBasicBlock* epilogue_bb;
    std::set<MachineBasicBlock*> bbs;

    std::map<int, MachineBasicBlock*> idx_bb_mp;
    std::map<int, std::set<int>> prev_bb;
    std::map<int, std::set<int>> next_bb;

    std::map<Value*, RiscvReg::Reg> v2r;

    bool has_reg(Value* v) { return v2r.find(v) != v2r.end(); }
    void add_reg_mp(Value* v, RiscvReg::Reg reg) {
        assert(!has_reg(v) && "Value already has register mapping");
        v2r[v] = reg;
    }
    RiscvReg::Reg get_reg(Value* v) {
        if(!has_reg(v)) {
            std::cerr << error << "Not has value " << v->get_name() << "\n";
        }
        assert(has_reg(v) && "Value has no register mapping");
        return v2r[v];
    }

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

    void set_prologue_bb(MachineBasicBlock* pbb);
    void set_epilogue_bb(MachineBasicBlock* ebb);

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
    
    friend std::ostream& operator<<(std::ostream& os, const MachineFunction* mf) {
        os << mf->_name;
        return os;
    }

    void dump_asm(std::ostream& out) ;

    
};

}
