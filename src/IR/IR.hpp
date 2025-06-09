#pragma once

#include "common/type.hpp"
#include "common/utils.hpp"
#include "common/defines.hpp"
#include "IR/temp.hpp"
#include <cassert>
#include <cmath>
#include <cstdint>
#include <execution>
#include <ostream>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <utility>
#include <variant>
#include <vector>
namespace midend {
class CFG;

namespace ir {
class Function;
class BasicBlock;

/**
 * @brief meta data
 */
class DataMeta {
public:
    explicit DataMeta() = default;
    DataMeta(Type type, bool is_global, const std::string &name="") :
        _type(type), _is_global(is_global), _name(name) {
            if(is_global) {
                if(!type.is_array()) {
                    if(type.base_type == Int) {
                        init_value = ConstValue(0);
                    } else {
                        init_value = ConstValue((float)0.0);
                    }
                }
            }
        }

    std::string to_str() {
        if(_type.is_array()){
            std::string ret = temp->to_str() + " : " + _name;
            for (auto dim : _type.dims) {
                if(dim == 0) ret += "[]";
                else ret += "[" + std::to_string(dim) + "]";
            }
            return ret;
        }
        else{
            return temp->to_str() + " : " + _name;
        }
    }

    void set_temp(Temp *temp) { this->temp = temp; }
    void set_init_value(ConstValue init_value) {
        if (_type.base_type == Int){
            if (init_value.type == Int)
                this->init_value = ConstValue(init_value.iv);
            else if (init_value.type == Float)
                this->init_value = ConstValue((int)init_value.fv);
        }
        else{
            if (init_value.type == Float)
                this->init_value = ConstValue(init_value.fv);
            else if (init_value.type == Int)
                this->init_value = ConstValue((float)init_value.iv);
        }
    }
    void set_init_value(std::vector<ConstValue> init_value) { this->init_value = init_value; }

    Type get_type() const { return _type; }
    bool is_global() const { return _is_global; }
    const std::string& get_name() const { return _name; }
    const std::variant<ConstValue, std::vector<ConstValue>>& get_init_value() const { return init_value; }
    bool is_not_init() const { return not_init; }
    void set_not_init(bool not_init)  {  this->not_init = not_init ; }
    bool can_bss_initialize() const { return can_bss_init; }
    void set_bss_initialize(bool can_bss_init) { this->can_bss_init = can_bss_init; }
    Temp* get_temp() const { return temp; }

    // TODO get and set init values
protected:
    Type _type;
    bool _is_global;
    std::string _name;
    std::variant<ConstValue, std::vector<ConstValue>> init_value;
    bool not_init = false;
    bool can_bss_init = false;
    Temp* temp;             // ir 临时寄存器
};

// for variable
class DataVar : public DataMeta {
public:
    explicit DataVar() = default;
    DataVar(Type var_type, bool is_global, const std::string &name="") :
        DataMeta(var_type, is_global, name) {}
};

class DataArray : public DataMeta {
public:
    explicit DataArray() = default;
    DataArray(Type var_type, bool is_global, const std::string &name="") :
        DataMeta(var_type, is_global, name) {}
};

enum IRValueType {
    Argument_VAL,
    BasicBlock_VAL,
    Constant_VAL,
    Function_VAL,
    GlobalVariable_VAL,
    Instruction_VAL,
};

class Value {
public :
    explicit Value() = default;
    Value(IRValueType type, const std::string &name = "") : _type(type), _name(name) {}
    std::string to_str() {
        // this is the base class for value, 
        return "none to_str method for (" + _name + ")";
    }

    IRValueType get_type() const { return _type; }
    const std::string& get_name() const { return _name; }
protected:
    IRValueType _type;
    std::string _name;
};

// Kind of in instruction 
enum IRInstKind {
    LABEL_INST,
    INST_SEQ,
    INST_JUMP,
    INST_JUMP_COND,
    INST_CALL,
    INST_RET,
};

class Instruction : public Value {
public:
    explicit Instruction() = default;
    Instruction(IRInstKind inst_kind, const std::vector<Temp*> &dsts, const std::vector<Temp*> &srcs) :
        Value(IRValueType::Instruction_VAL), _inst_kind(inst_kind), _dsts(dsts), _srcs(srcs) {}

    IRInstKind get_inst_kind() const { return _inst_kind; }
    BasicBlock* get_parent() const { return _parent; }
    void set_parent(BasicBlock* parent) { _parent = parent; }

    std::vector<Temp*>* get_dst() { return &_dsts; }
    std::vector<Temp*>* get_src() { return &_srcs; } 

    virtual std::string to_str() = 0;
    virtual std::string to_llvm_str(int &llvm_temp_cnt) { return "* " + to_str(); }

    void print(std::ostream &out) {
        if(_inst_kind != LABEL_INST) print_indent(out, INDENT_LEN);
        out << to_str() << "\n";
    }
    // change using value
    void change_use(Temp* old_temp, Temp* new_temp) {
        for(auto &i : _srcs) {
            if(i == old_temp) {
                i = new_temp;
            }
        }
    }
protected:
    BasicBlock* _parent;
    IRInstKind _inst_kind;
    std::vector<Temp*> _dsts;           // 目的操作数
    std::vector<Temp*> _srcs;           // 源操作数

};

class BasicBlock : public Value {
public:
    explicit BasicBlock() {}
    BasicBlock(int idx) : _idx(idx) {}
    BasicBlock(Function* parent, const std::vector<Instruction*> &insts, int idx) : 
        Value(IRValueType::BasicBlock_VAL, "B"+ std::to_string(idx)), _parent(parent), _insts(insts), _idx(idx) {}

    int get_index() const { return _idx; }
    Function* get_parent() const { return _parent; }
    std::vector<Instruction*>* get_insts() { return &_insts; }
    void add_inst(Instruction* inst) { _insts.push_back(inst); inst->set_parent(this); }
    // TODO add instructions at the end, at begining, after an instruction , before end instruction
    void add_inst_at(int pos, Instruction* inst) {
        assert(pos < _insts.size() && "Adding position out of range");
        _insts.insert(_insts.begin()+pos, inst);
        inst->set_parent(this);
    }
    void add_inst_at_front(Instruction* inst) {
        _insts.insert(_insts.begin(), inst);
        inst->set_parent(this);
    }
    void add_inst_before_terminal(Instruction* inst) {
        _insts.insert(_insts.end()-1, inst);
        inst->set_parent(this);
    }
    /**
     *  @ param inst 要插入的指令的前一个指令（目的地）
     *  @ param a_inst 插入的指令
     * */ 
    void add_inst_after_inst(Instruction* inst, Instruction* a_inst) {
        for(auto i = _insts.begin(); i != _insts.end(); i++) {
            if(*i == inst) {
                _insts.insert(i+1, a_inst);
                inst->set_parent(this);
                return ;
            }
        } 
        // if not find inst
        assert(false && "Inst not found");
    }
    // TODO remove instructions
    void remove_inst(Instruction* inst) {
        for(auto i = _insts.begin(); i != _insts.end(); i++) {
            if(*i == inst) {
                _insts.erase(i);
                return ;
            }
        } 
        assert(false && "Inst not found");
    }

    void print(std::ostream &out ) const {
        out << _name << "\n";
        for(auto &child : _insts) {
            child->print(out);
        }
    }

    bool visit;
    void clear_visit() { visit = false; }

protected:
    int _idx;
    Function* _parent;
    std::vector<Instruction*> _insts;
    std::vector<Temp*> _define;
    std::vector<Temp*> _live_in;
    std::vector<Temp*> _live_out;
    std::vector<Temp*> _live_use;
};

class Module;
class Function : public Value {
public:
    explicit Function() = default;
    Function(Module* paren, Type ret_type, const std::vector<DataMeta*> &args, const std::string &name) : 
        Value(IRValueType::Function_VAL, name), ret_type(ret_type), _arguments(args), _bb_used(0) {}

    bool is_main() { return _name == "main"; }
    bool has_return_type() { return ret_type.base_type == Void; }
    Module* get_parent() const { return _parent; }
    Type get_ret_type() const { return ret_type; }
    const std::vector<DataMeta*>* get_arguments() const { return &_arguments; }
    const int get_argument_num() const { return _arguments.size(); }
    std::vector<BasicBlock*>* get_basic_blocks()  { return &bbs; }
    std::vector<Instruction*>* get_instructions() { return &insts; }
    std::vector<Temp*>* get_arg_temp() { return &arg_temp; }
    int get_temp_used() const { return _temp_used; }
    void set_temp_used(int used) { _temp_used = used; }
    int get_bb_used() const { return _bb_used; }
    void set_bb_used(int used) { _bb_used = used; }

    const std::vector<Temp*>* get_arg_temps() const { return &arg_temp; }
    void add_arg_temp(Temp* temp) { arg_temp.push_back(temp); }
    void add_args(DataMeta* arg) { _arguments.push_back(arg); }
    void add_bb(BasicBlock* bb) { bbs.push_back(bb); }

    void clear_visit() {
        for(auto b : bbs) {
            b->clear_visit();
        }
    }

    bool is_param(Temp* temp) {
        for(int i=0; i<arg_temp.size(); i++) {
            if(arg_temp[i] == temp ) return true;
        }
        return false;
    }

    void print(std::ostream& out) {
        out << "def " << type_string(ret_type) << " " << _name << " ( ";
        // print args 
        for(int i=0; i < arg_temp.size(); i++) {
            out << arg_temp[i]->to_str();
            if(i != arg_temp.size()-1) out << ", ";
        }
        out << " ) {\n";
        for(auto b : bbs) {
            b->print(out);
        }
        out << "}\n";
    }

    BasicBlock* get_entry() { return bbs[0]; }

    bool is_pure() { return pure==1; }
    
    int has_side_effect = -1;       // use global variables
    int pure = -1;
    int only_load_arg = -1;
    std::map<std::pair<BasicBlock *, BasicBlock *>, double> branch_frequency;
    std::unordered_map<Temp *, std::string> global_temps;
protected:
    Type ret_type;
    Module *_parent;
    std::vector<DataMeta*> _arguments;
    std::vector<Temp*> arg_temp;
    std::vector<BasicBlock* > bbs;
    std::vector<Instruction* > insts;
    int _temp_used;
    int _bb_used;
};

class LibFunction: public Function{
public:
    explicit LibFunction() = default;
    LibFunction(Module *parent, Type ret_type, const std::vector<DataMeta*> &arguments, const std::string &name) : 
        Function(parent, ret_type, arguments, name) {}
};

namespace instruction {
extern int &llvm_temp_cnt;

class Assign : public Instruction {
public:
    explicit Assign() = default;
    // use add 0 or 0.0 assign to a temp registor
    Assign(Temp* dst, Temp* src) : 
        Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{dst}, std::vector<Temp*>{src}) {}

    std::string to_str() override { return _dsts[0]->to_str() + " = " + _srcs[0]->to_str(); };
    std::string to_llvm_str(int &llvm_temp_cnt) override;
        
    void sec_src(Temp* src) { _srcs[0] = src; }
    Temp* get_src() { return _srcs[0]; }
    Temp* get_dst() { return _dsts[0]; }
    bool is_output_inst() { return true; }
};

class Alloca : public Instruction {
public:
    explicit Alloca() = default;
    Alloca(Temp* addr, Type type) :
        Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{addr}, std::vector<Temp*>{}), _type(type) {}

    std::string to_str() override { return "alloca " + _dsts[0]->to_str() + " = " + std::to_string(_type.size()); };
    std::string to_llvm_str(int &llvm_temp_cnt) override {
        return _dsts[0]->to_llvm_str() + " = alloca "
                                       + type_llvm_string(_type)
                                       + " , i32 " 
                                       + std::to_string(_type.size()); 
    }

    Temp* get_addr() { return _dsts[0]; }
    Type get_type() { return _type; }
    int get_size() { return _type.size(); }
    bool is_output_inst() { return true; }
protected:
    // the type for alloca
    Type _type;
};

class Load : public Instruction {
public:
    explicit Load() = default;

    Load(Temp* dst, Temp* addr, bool not_delete, int offset = 0) :
        Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{dst}, std::vector<Temp*>{addr}), _offset(offset), _not_delete(not_delete){}

    std::string to_str() override;
    std::string to_llvm_str(int &llvm_temp_cnt) override;


    Temp* get_addr() { return _srcs[0]; }
    void set_addr(Temp* addr) { _srcs[0] = addr; }
    Temp* get_dst() { return _dsts[0]; }

    void set_imm(int imm) { _offset = imm; }
    int get_offset() const { return _offset; }
    bool not_delete() const { return _not_delete; }
    void set_not_delete(bool not_delete) { _not_delete = not_delete; }

    bool is_output_inst() { return true; }
protected:
    int _offset;
    bool _not_delete;
};

class Store : public Instruction {
public:
    explicit Store() = default;
    // store value to addr
    Store(Temp* addr, Temp* src, bool not_delete, int offset = 0) :
        Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{}, std::vector<Temp*>{addr, src}), _offset(offset), _not_delete(not_delete){}

    std::string to_str() override;
    std::string to_llvm_str(int &llvm_temp_cnt) override;

    Temp* get_addr() { return _srcs[0]; }
    Temp* get_src() { return _srcs[1]; }

    void set_addr(Temp* t ) {  _srcs[0] = t; }
    void set_src(Temp* t ) {   _srcs[1] = t; }

    void set_imm(int imm) { _offset = imm; }
    int get_offset() const { return _offset; }
    bool not_delete() const { return _not_delete; }
    void set_not_delete(bool not_delete) { _not_delete = not_delete; }

    bool is_output_inst() { return true; }
protected:
    int _offset;
    bool _not_delete;
};

class Binary : public Instruction {
public:
    explicit Binary() = default;
    // store lhs at srcs0 rhs at src1
    Binary(BinaryOp type, Temp* dst, Temp* lhs, Temp* rhs) : 
        Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{dst}, std::vector<Temp*>{lhs, rhs}), _type(type){}
    std::string to_str() override;
    std::string to_llvm_str(int &llvm_temp_cnt) override;
    std::string op_str();
    ConstValue to_const(ConstValue lhs, ConstValue rhs) ;

    ConstValue to_const() ;

    void setlhs(Temp* lhs) { _srcs[0] = lhs; }
    void setrhs(Temp* rhs) { _srcs[1] = rhs; }
    void settype(BinaryOp type) { _type = type; }
    void swap_lhs_rhs() { std::swap(_srcs[0], _srcs[1]); }
    Temp* getdst() const { return _dsts[0]; }
    Temp* getlhs() const { return _srcs[0]; }
    Temp* getrhs() const { return _srcs[1]; }
    BinaryOp get_type() const { return _type; }
    BinaryOp get_swap_type() const {
        if (_type == BinaryOp::Lt) return BinaryOp::Gt;
        if (_type == BinaryOp::Leq) return BinaryOp::Geq;
        if (_type == BinaryOp::Gt) return BinaryOp::Lt;
        if (_type == BinaryOp::Geq) return BinaryOp::Leq;
        return _type;
    }
    bool is_output_inst() { return true; }
protected:
    BinaryOp _type;
};

// Immediate variants
class BinaryImm : public Instruction {
public:
    explicit BinaryImm() = default;
    BinaryImm(BinaryOp type, Temp* dst, Temp* lhs, ConstValue rhs) : Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{dst}, std::vector<Temp*>{lhs}), _imm(rhs.iv) {}

    std::string to_str() override ;
    std::string to_llvm_str(int &llvm_temp_cnt) override ;

    void setlhs(Temp* lhs) { _srcs[0] = lhs; }
    Temp* getlhs() const{ return _srcs[0]; }
    Temp* getdst() const{ return _dsts[0]; }
    int32_t getImm() const { return _imm; }

    inline ConstValue getconst() const { return ConstValue(_imm); }
    inline BinaryOp get_type() const { return _type; }
    bool is_output_inst() { return true; }
protected:
    BinaryOp _type;
    int32_t _imm;
};

// none condition branch
// just "br label %Tx"
class Branch : public Instruction {
public:
    explicit Branch() = default;
    Branch(BasicBlock* bb) : 
        Instruction(IRInstKind::INST_JUMP, std::vector<Temp*>{}, std::vector<Temp*>{}), bb(bb) {}
    std::string to_str() { return "jump " + bb->get_name(); }
    std::string to_llvm_str(int &llvm_temp_cnt) { return "br label %B" + std::to_string(bb->get_index()); }

    void set_target(BasicBlock* b) { bb = b; }
    BasicBlock* get_target() { return bb; }
    bool is_output_inst() { return false; }
protected:
    BasicBlock* bb;
};

class CondBranch : public Instruction {
public:
    enum IRInstrCondBranch {
        IR_Instr_BEQ,
        IR_Instr_BNE,
        IR_Instr_BEQ_ONLY,
    };
    explicit CondBranch() = default;

    std::string to_str() override; 
    std::string to_llvm_str(int &llvm_temp_cnt) override;

    CondBranch(IRInstrCondBranch type, BasicBlock* true_bb, BasicBlock* false_bb, Temp* cond) : 
        Instruction(IRInstKind::INST_JUMP_COND, std::vector<Temp*>{}, std::vector<Temp*>{cond}), _true_bb(true_bb), _false_bb(false_bb) , _type(type) {}
    inline Temp* getcond() const { return _srcs[0]; }
    void setcond(Temp* src) { _srcs = {src}; }
    inline BasicBlock* get_true_bb() const { return _true_bb; }
    inline BasicBlock* get_false_bb() const { return _false_bb; }
    inline IRInstrCondBranch get_type() const { return _type; }
    inline void set_true_bb(BasicBlock* bb) { _true_bb = bb; }
    inline void set_false_bb(BasicBlock* bb) { _false_bb = bb; }
    bool is_output_inst() { return false; }
protected:
    BasicBlock* _true_bb;
    BasicBlock* _false_bb;
    IRInstrCondBranch _type;
};

class Label : public Instruction {
public:
    explicit Label() = default;
    Label(const std::string label) :
        Instruction(IRInstKind::LABEL_INST, std::vector<Temp *> {}, std::vector<Temp *> {}), _label(label) {}
    std::string to_str() { return _label; }
    std::string get_label() const { return _label; }
    void set_label(const std::string & label) { _label = label; }
    bool is_output_inst() { return false; }
private:
    std::string _label;
};

class Call : public Instruction {
public:
    explicit Call() = default;
    Call(Temp* dst, const std::vector<Temp*> &srcs, Function* func) :
        Instruction(IRInstKind::INST_CALL, std::vector<Temp*>{dst}, srcs ), _func(func) {}
    std::string to_str() override;
    std::string to_llvm_str(int &llvm_temp_cnt) override;

    Function* getfunc() { return _func; }
    Temp* getdst() const { return _dsts[0]; }

    inline std::vector<Temp *> get_srcs() const { return _srcs; }

    bool is_output_inst() { return (_dsts[0] == nullptr); }
    void add_global_load(Temp* temp) { global_load_.push_back(temp); }
    void clear_global_load() { global_load_.clear(); }
    std::vector<Temp*>* get_global_load() { return &global_load_; }
    std::string get_func_name() { return _func->get_name(); }
protected:
    Function* _func;
    std::vector<Temp*> global_load_;
};

// sitofp fptosi
// %x = fptosi float %x1 to i32
// or
// %x = sitofp i32 %x1 to fptosi
class Cast : public Instruction {
public:
    explicit Cast() = default;
    /**
     * @brief Cast Instruction construct Function, cast src to t type
     */
    Cast(Temp* dst, Temp* src, Type t) :
        Instruction(IRInstKind::INST_SEQ, std::vector<Temp *> {dst},  std::vector<Temp *> {src}) , _type(t) {}

    std::string to_str() override;
    std::string to_llvm_str(int &llvm_temp_cnt) override;

    Temp* getsrc() const{ return _srcs[0]; }
    Temp* getdst() const{ return _dsts[0]; }

    Type get_type() const { return _type; }
protected:
    Type _type;
};

class ElementPtr : public Instruction {
public:
    explicit ElementPtr() = default;
    ElementPtr(Temp* dst, Temp* base, std::vector<Temp*> idxs) :
        Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{dst}, std::vector<Temp*>{}) {
            _srcs.push_back(base);
            _srcs.insert(_srcs.end(), idxs.begin(), idxs.end());
        }
    std::string to_str() override;
    std::string to_llvm_str(int &llvm_temp_cnt) override;

    inline Temp* get_dst() const { return _dsts[0]; }
    inline Temp* get_base() const { return _srcs[0]; }
    inline void set_base(Temp* base) { _srcs[0] = base; }
    inline std::vector<Temp*> get_indices() const { return std::vector<Temp*>(_srcs.begin() + 1, _srcs.end()); }
    bool is_output_inst() { return true; }
protected:
};

class Phi : public Instruction {
public:
    explicit Phi() = default;
    Phi(Temp *dst, const std::vector<Temp*> &values, const std::vector<BasicBlock*> &bbs, bool need_change = false, bool is_arrayssa = false) :
        Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{dst}, values),  need_change(need_change),_bbs(bbs), _is_arrayssa(is_arrayssa) {}


    void add_src_and_bb(BasicBlock* bb, Temp* src) {
        int bb_idx = 0;
        // if bb is already exist in srcs list
        for(auto i : _bbs ) {
            if(i == bb) {
                _srcs[bb_idx] = src;
                return;
            }
            bb_idx++;
        }
        // else push back
        _srcs.push_back(src);
        _bbs.push_back(bb);
    } 

    void erase_src_temp(BasicBlock* bb) {
        int bb_idx = 0;
        // find bb's place 
        for(auto i = _bbs.begin(); i != _bbs.end(); i++) { 
            if(*i == bb) {
                _bbs.erase(i);
                break;
            }
            bb_idx++;
        }
        int src_idx = 0;    // count and find iterator
        for(auto i = _srcs.begin(); i != _srcs.end(); i++) {
            if(src_idx == bb_idx) {
                _srcs.erase(i);
                break;
            }
            src_idx++;
        }
    }

    std::string to_str() override;
    std::string to_llvm_str(int &llvm_temp_cnt) override;

    int get_size() const { return _srcs.size(); }
    Temp* get_dst() const { return _dsts[0]; }
    void set_dst(Temp* dst) { _dsts[0] = dst; }
    std::vector<Temp*>* getValues() { return &_srcs; }
    // zip temp and bb
    std::vector<std::pair<Temp*, BasicBlock*>> get_pairs() {
        std::vector<std::pair<Temp*, BasicBlock*>> pairs;
        int idx = 0;
        for(auto it = _bbs.begin(); it != _bbs.end(); it++) {
            pairs.push_back({_srcs[idx], *it});
            idx++;
        }
        return pairs;
    }
    inline Temp* get_src_temp(BasicBlock* bb) {
        int bb_idx = 0;
        // if bb is already exist in srcs list
        for(auto i : _bbs ) {
            if(i == bb) {
                return _srcs[bb_idx];
            }
            bb_idx++;
        }
        return nullptr;
    }
    inline void set_src_temp(BasicBlock* old_bb, BasicBlock* new_bb, Temp* temp) { 
        int bb_idx = 0;
        for(auto i : _bbs ) {
            if(i == old_bb) {
                _bbs[bb_idx] = new_bb;
                _srcs[bb_idx] = temp;
            }
            bb_idx++;
        }
    }
    inline void add_pair(BasicBlock* bb, Temp* temp) {
        _bbs.push_back(bb);
        _srcs.push_back(temp);
    }

    bool is_output_inst() { return true; }
    bool need_change;
    bool is_arrayssa() { return _is_arrayssa; }
    std::vector<BasicBlock*>* get_bbs() { return &_bbs; }
    std::vector<Temp*>* getvalues() { return &_srcs; }
    std::unordered_set<Temp*>* get_used() { return &_used; }
protected:
    std::vector<BasicBlock*> _bbs;              // store bbs 
    std::unordered_set<Temp*> _used;
    bool _is_arrayssa;
};

class Return : public Instruction {
public:
    explicit Return() = default;
    Return(Temp* val) :
        Instruction(IRInstKind::INST_RET, std::vector<Temp*>{}, std::vector<Temp*>{val}) {}
    std::string to_str() override;
    std::string to_llvm_str(int &llvm_temp_cnt) override;
    // TODO get set has return 
    bool has_return_type() { return _srcs.size() != 0; }
    void set_return_val(Temp* val) { _srcs[0] = val; }
    Temp* get_return_val() { return _srcs[0]; }
    bool is_output_inst() { return false; }
};

class Unary : public Instruction {
public:
    explicit Unary() = default;
    Unary(Temp* dst, Temp* src, UnaryOp op) : 
        Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{dst}, std::vector<Temp*>{src}), _type(op) {}

    std::string to_str() override;
    std::string to_llvm_str(int &llvm_temp_cnt) override;

    UnaryOp get_type() { return _type; }
    Temp* get_dst() const { return _dsts[0]; }
    Temp* get_src() const { return _srcs[0]; }

    std::string op_str() {
        if (_type == UnaryOp::Add) return " + ";
        if (_type == UnaryOp::Sub) return " - ";
        if (_type == UnaryOp::Not) return " ! ";
        assert(false);
    }
    ConstValue to_const(ConstValue src) {
        if (_type == UnaryOp::Add) return src;
        if (_type == UnaryOp::Sub) return src.getNeg();
        if (_type == UnaryOp::Not) return src.getNot();
        assert(false);
    }

    bool is_output_inst() { return true; }
protected:
    UnaryOp _type;
};

// Array operations
class ArrayLoad : public Instruction {
public:
    explicit ArrayLoad() = default;
    ArrayLoad(Temp* dst, Temp* dep, Temp* addr, int offset, bool before_call = false) :
        Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{dst}, std::vector<Temp*>{dep, addr}), _offset(offset), _before_call(before_call) {}
    std::string to_str() override{
        return "arrayload " + _dsts[0]->to_str() + " = dep " + _srcs[0]->to_str() + " from " + _srcs[1]->to_str() + "[" + std::to_string(_offset) + "]";
    }
    std::string to_llvm_str(int &llvm_temp_cnt) override {
        return "Not support now";
    }

    Temp* get_dst() const { return _dsts[0]; }
    void set_dst(Temp* dst) { _dsts[0] = dst; }

    Temp* get_dep() const { return _srcs[0]; }
    void set_dep(Temp* dep) { _srcs[0] = dep; }

    Temp* get_addr() const { return _srcs[1]; }
    void set_addr(Temp* addr) { _srcs[1] = addr; }

    int get_offset() const { return _offset; }
    void set_offset(int offset) { _offset = offset; }
    bool is_output_inst() { return true; }
    bool before_call() { return _before_call; }
protected:
    int _offset;
    bool _before_call;
};

class ArrayStore : public Instruction {
public:
    explicit ArrayStore() = default;
    ArrayStore(Temp* dst, Temp* dep, Temp* addr, Temp* src, int offset, bool after_call = false) :
        Instruction(IRInstKind::INST_SEQ, 
                    std::vector<Temp*>{dst},
                    std::vector<Temp*>{dep, addr, src}),
        _offset(offset), _after_call(after_call) {}

    std::string to_str() override {
        std::string ret = "arraystore dst " + _dsts[0]->to_str() + " dep " + _srcs[0]->to_str() + " to " + _srcs[1]->to_str() + "[" + std::to_string(_offset) + "] from " + _srcs[2]->to_str();
        ret += " used: ";
        for (auto temp : _used) {
            ret += temp->to_str() + " ";
        }
        return ret;
    }
    std::string to_llvm_str(int &llvm_temp_cnt) override {
        return "Not support now";
    }

    Temp* getdst() const { return _dsts[0]; }
    Temp* getdep() const { return _srcs[0]; }
    Temp* getaddr() const { return _srcs[1]; }
    Temp* getsrc() const { return _srcs[2]; }

    // TODO set addr src offset
    void set_addr(Temp* addr) { _srcs[1] = addr; }
    void set_src(Temp* src) { _srcs[2] = src; }
    void set_offset(int offset) { _offset = offset; }
    int get_offset() const { return _offset; }
    bool is_after_call() const { return _after_call; }
    const std::unordered_set<Temp*>* get_used_temps() { return &_used; }
    bool is_output_inst() { return false; }
protected:
    int _offset;
    bool _after_call;
    std::unordered_set<Temp*> _used;
};

// use add or fadd with 0 to load a immediate data to a temp
class LoadImm4 : public Instruction {
public:
    explicit LoadImm4() = default;
    LoadImm4(Temp* dst, ConstValue imm) 
        : Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{dst}, std::vector<Temp*>{}) , _imm(imm) {}

    std::string to_str() { return _dsts[0]->to_str() + " = " + _imm.to_string(); }
    std::string to_llvm_str(int &llvm_temp_cnt) {
        if (_dsts[0]->get_type() == Int) {
            return _dsts[0]->to_llvm_str() + " = add " + type_llvm_string(_dsts[0]->get_type()) + " 0, " + _imm.to_string();
        } else {
            return _dsts[0]->to_llvm_str() + " = fadd " + type_llvm_string(_dsts[0]->get_type()) + " 0.0, " + _imm.to_string();
        }
    }

    ConstValue get_imm() const { return _imm; }
    Temp* get_dst() const { return _dsts[0]; }
    void setimm(int i) { _imm = i; }
    bool is_output_inst() { return true; }
protected:
    ConstValue _imm;
};

class LoadAddr : public Instruction {
public:
    explicit LoadAddr() = default;
    LoadAddr(Temp* addr, std::string name, Type type) : 
        Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{addr}, std::vector<Temp*>{}), type_(type), name_(name) {}
    inline std::string to_str() { return _dsts[0]->to_str() + " = &" + name_; }
    inline std::string to_llvm_str(int &llvm_temp_cnt) {
        if (_dsts[0]->get_type().is_array()) {
            if (_dsts[0]->get_type().base_type == Int) return _dsts[0]->to_llvm_str() + " = getelementptr [" + std::to_string(type_.nr_elems()) + " x i32], [" + std::to_string(type_.nr_elems()) + " x i32]* @"+ name_ + ", i32 0, i32 0";
            if (_dsts[0]->get_type().base_type == Float) return _dsts[0]->to_llvm_str() + " = getelementptr [" + std::to_string(type_.nr_elems()) + " x float], [" + std::to_string(type_.nr_elems()) + " x float]* @"+ name_ + ", i32 0, i32 0";
        } else {
            if (_dsts[0]->get_type().base_type == Int) return _dsts[0]->to_llvm_str() + " = getelementptr i32, i32* @"+ name_;
            if (_dsts[0]->get_type().base_type == Float) return _dsts[0]->to_llvm_str() + " = getelementptr float, float* @"+ name_;
        }
        return "";
    }
    inline Temp* get_addr() const {return _dsts[0]; }
    inline std::string get_name() const {return name_; }
    bool is_output_inst() { return true; }
    Type type_;
protected:
    std::string name_;
};

class Maximum : public Instruction {
public:
    explicit Maximum() = default;
    Maximum(Temp* dst, Temp* src1, Temp* src2) : 
        Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{dst}, std::vector<Temp*>{src1, src2}) {}
    inline std::string to_str() { return "maximum " + _dsts[0]->to_str() + " = max(" + _srcs[0]->to_str() + ", " + _srcs[1]->to_str() + ")"; }
    inline std::string to_llvm_str(int &llvm_temp_cnt) {
        return "not supported";
    }
    inline Temp* getdst() const { return _dsts[0]; }
    inline Temp* getsrc1() const { return _srcs[0]; }
    inline Temp* getsrc2() const { return _srcs[1]; }
    bool is_output_inst() { return true; }
};

class Minimum : public Instruction {
public:
    explicit Minimum() = default;
    Minimum(Temp* dst, Temp* src1, Temp* src2) : 
        Instruction(IRInstKind::INST_SEQ, std::vector<Temp*>{dst}, std::vector<Temp*>{src1, src2}) {}
    inline std::string to_str() { return "minimum " + _dsts[0]->to_str() + " = min(" + _srcs[0]->to_str() + ", " + _srcs[1]->to_str() + ")"; }
    inline std::string to_llvm_str(int &llvm_temp_cnt) {
        return "not supported";
    }
    inline Temp* getdst() const { return _dsts[0]; }
    inline Temp* getsrc1() const { return _srcs[0]; }
    inline Temp* getsrc2() const { return _srcs[1]; }
    bool is_output_inst() { return true; }
};


} // end of inst

class Module {
public:
    explicit Module() = default;
    Module(const std::vector<Function*> & functions, const std::vector<DataMeta*> global_variables) : 
        _funcs(functions), _global_variables(global_variables) {
            if (!check_global_variables()) {
                printf("global variables are not global.\n");
                assert(false);
            }
        }
    inline std::vector<Function*> * get_functions() { return &_funcs; }
    inline std::vector<DataMeta*> * get_global_variables() { return &_global_variables; }
    inline std::unordered_map<std::string, Function*> get_func_map() { return func_map; }
    inline void add_function(Function * function) {
        // func_map.emplace(function->get_name(), function);
        _funcs.push_back(function);
    }
    inline void add_global_variable(DataMeta * global_variable) {
        _global_variables.push_back(global_variable);
        global_var_map.emplace(global_variable->get_name(), global_variable);
    }
    bool check_global_variables() {
        for (auto global_variable : _global_variables) {
            if (!global_variable->is_global()) {
                return false;
            }
        }
        return true;
    }
    void print(std::ostream &out) const {
        for (auto &global : _global_variables){
            if(global->get_type().is_array()){
                out << "init global " << type_string(global->get_type()) << ' ' << global->get_name() << " = {";
                // auto init_values = std::get<1>(global->get_init_value());
                // for (auto &init_value : init_values){
                //     if(init_value.type == Int)
                //         out << init_value.iv << ' ';
                //     else{
                //         out << init_value.fv << ' ';
                //     }
                // }
                out << "}" << std::endl;
            }
            else{
                if(std::get<0>(global->get_init_value()).type == Int)
                    out << "init global " << type_string(global->get_type()) << ' ' << global->get_name() << " with " << std::get<0>(global->get_init_value()).iv << std::endl;
                else{
                    out << "init global " << type_string(global->get_type()) << ' ' << global->get_name() << " with " << std::get<0>(global->get_init_value()).fv << std::endl;
                }
            }
        }
        for (auto &child : _funcs) {
            child->print(out);
        }
    }

    virtual ~Module() {};
    std::unordered_map<std::string, Function*> func_map;
    std::unordered_map<std::string, LibFunction*> lib_funcs;
    std::unordered_map<std::string, DataMeta*> global_var_map;
    void set_use_memset_zero(bool use_memset_zero) { this->use_memset_zero = use_memset_zero; }
    bool get_use_memset_zero() const { return use_memset_zero; }
protected:
    std::vector<Function*> _funcs;
    std::vector<DataMeta*> _global_variables;
    bool use_memset_zero = false;              // 
};

class User : public Value {
protected:
    std::vector<Value*> operands_;
public:
    explicit User() = default;
    User(IRValueType type, const std::vector<Value*> & operands, const std::string & name = "") : Value(type, name), operands_(operands) {}
};

} // end of ir 
} // end of midend
