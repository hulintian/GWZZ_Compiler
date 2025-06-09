#pragma once

#include <variant>
#include <set>
#include <queue>
#include <list>
#include <unordered_set>
#include "IR/IR.hpp"
#include "common/regarch.hpp"

namespace backend{

namespace riscv{

using namespace midend;

class Instr;

/* class for an object in stack */
class StackObject {
private:
    int32_t size, position;
public:
    StackObject(int32_t _size, int32_t _pos = -1) : size(_size), position(_pos) {}
    void set_position(int32_t _pos) { position = _pos; }
    int32_t get_size() { return size; }
    int32_t get_pos() { return position; }
};

class Function;
class Program;

/* class for basicblocks in backend */
class BasicBlock {
private:
    std::string name_;
    bool label_used;
    std::list<Instr*> instrs_;

public:
    /* variables */

    std::set<RiscvReg::Reg> def, live_use, live_in, live_out;
    std::unordered_set<BasicBlock *> prev, succ;
    
    /* functions */

    BasicBlock(std::string name): name_(name), label_used(false) {}
    std::string get_name() const{ return name_; }
    void set_label_used(bool temp) { label_used = temp; }
    std::list<Instr*>* get_instr(){ return &instrs_; }
    bool construct(ir::BasicBlock *ir_bb, BasicBlock *exit_bb, Function *func, Program *prog);
    void add_instr(Instr *instr, std::list<Instr*>::iterator pos) { instrs_.insert(pos, instr); }
    void add_instr(Instr *instr, int pos) { 
        auto it = std::begin(instrs_);
        std::advance(it, pos);  
        instrs_.insert(it, instr);
    }
    std::list<Instr *>::iterator insert_instr(Instr *instr, std::list<Instr *>::iterator pos) {
        return instrs_.insert(pos, instr);
    }
    void change(std::list<Instr *>& new_list){
        instrs_ = new_list;
    }
    Instr* get_instr(int pos){
        auto it = std::begin(instrs_);
        std::advance(it, pos);
        return *it;
    }
    void computeDefAndLiveUse(bool is_gp_pass);
    void computeDefAndLiveUseAfterAlloc();
    void analyzeLivenessForEachInstr();
    void analyzeLivenessForEachInstrAfterAlloc();
    /// generate asm for this BasicBlock
    void gen_asm(std::ostream &out);
    int loop_level = 0;
};

using RegValue = std::variant<int, std::string, StackObject *>;

/* class for function in backend */
class Function {
private:
    std::string name_;
    std::vector<BasicBlock *> bbs;

public:
    /* variables */
    std::map<Temp*, Temp*> assigns;
    /// registers holding the args of this function
    std::vector<RiscvReg::Reg> arg_regs;
    /// functions' names that are called by this function
    std::vector<std::string> call_funcs; 
    std::map<RiscvReg::Reg, int32_t> constant_regs;
    /// mapping from id of Temp to offset in stack frame
    std::map<int, int> stack_objects_offset_map_; 
    /* -- stack mapping in function B --
    A calls B before this moment and B will call C after this moment 

    +---------------+                    -
    |   ARG_N       |                     |
    +---------------+                     |
    |   ....        |                     |-> ARGS PASSED INTO FUNCTION B
    +---------------+                     |
    |   ARG_8       |                     | 
    +---------------+ <-FP NOW           -
    | SPILLED_ARG_1 |                     |
    +---------------+                     |
    |   ....        |                     |->STACK_SPILL_SIZE
    +---------------+                     |
    | SPILLED_ARG_N |                     |
    +---------------+                    -
    |               |                     |
    | CALLER_SAVED  |                     |
    |               |                     |
    +---------------+                     |->STACK_REG_SIZE
    |               |                     |
    | CALLEE_SAVED  |                     |
    |               |                     |
    +---------------+                    -
    |               |                     |
    | ALLOCA_SPACE  |                     |
    |               |                     |
    +---------------+                     |
    |   ARG_N       |                     |->STACK_OBJECT_SIZE 
    +---------------+                     |   
    |   ....        |                     |  PS.THE ARGS ARE PASSED INTO FUNCTION C
    +---------------+                     |
    |   ARG_8       |                     |
    +---------------+ <--SP NOW          -

    */
    int stack_object_size_;
    int stack_reg_size_;
    int stack_spill_size_;
    /// max no. of registers used in this function (id of class Reg)
    int reg_n;
    /// callee saved register used in this function, 
    /// these are the registers actually needed to be saved
    std::vector<RiscvReg::Reg> callee_saved_used;

    std::map<RiscvReg::Reg, RegValue> reg_val;

    /* functions */

    Function(Program *prog, ir::Function *ir_func);
    std::string name() const { return name_; }
    /// the definition of this function is in analysis.cpp, it does the liveness analysis for the Function
    void livenessAnalysis(bool is_gp_pass);
    void livenessAnalysisAfterAlloc();
    /// insert edge between two basicblocks
    void add_edge(BasicBlock *from, BasicBlock *to) {
        from->succ.insert(to);
        to->prev.insert(from);
    }
    /// remove edge between two basicblocks
    void remove_edge(BasicBlock *from, BasicBlock *to) {
        from->succ.erase(to);
        to->prev.erase(from);
    }
    /// get pointer to all basicblocks
    std::vector<BasicBlock *>* get_bbs() { return &bbs; }
    /// generate asm for this Function
    void gen_asm(std::ostream &out);
    /// insert and update instructions in entry and exit bb
    void update_entry_exit_bb();
};

/* class for global object to be stored in bss or data section */
class GlobalObject {
private:
    Type type_;
    std::string name_;
    std::variant<ConstValue, std::vector<ConstValue>> init_value;
public:
    GlobalObject(ir::DataMeta *ir_global_data): type_(ir_global_data->get_type()), name_(ir_global_data->get_name()), init_value(ir_global_data->get_init_value()) {}
    Type get_type() { return type_; }
    std::string get_name() { return name_; }
    std::variant<ConstValue, std::vector<ConstValue>> get_init_value() { return init_value; }
};

/* class for a program in backend */
class Program {
private:
    /// all the functions in this program
    std::vector<Function *> functions_;
    /// all global data initialised(stored in data) in this program
    std::vector<GlobalObject *> data_globals_;
    /// all global data uninitialised(stored in bss) in this program
    std::vector<GlobalObject *> bss_globals_;

public:
    /* variables */

    /// mapping from IR basicblock to backend basicblock
    std::unordered_map<ir::BasicBlock *, BasicBlock *> bb_map;
    /// basicblock num
    int bb_num;
    /// if use __memset_zero__
    bool use_memset_zero;

    /* functions */

    /// Construction: construct backend program from IR
    Program(midend::ir::Module* module);

    /// Destruction
    ~Program() {}

    /// Generate asm for program
    void gen_asm(std::ostream &out);

    /// return functions of this program
    std::vector<Function *> functions();

    /// Generate asm for global variables(both data and bss)
    void gen_global_var_asm(std::ostream &out);
};

} // namespace riscv

} // name
