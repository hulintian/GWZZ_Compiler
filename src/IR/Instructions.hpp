#pragma once
#include "IR/Function.hpp" 
#include "IR/User.hpp"
#include "IR/Value.hpp"
#include "common/type.hpp"
#include <string> 
#include "common/type.hpp" 
#include "common/defines.hpp" 
#include "IR/BasicBlock.hpp"
#include <iostream> 
namespace IR {

class BasicBlock;
class Function;
class Instruction : public User {
public :
    Instruction(Type* t, std::string name, BasicBlock* bb) : User(t, name), parent(bb){}

    virtual std::string to_str()=0;
    virtual std::string to_llvm()= 0;
    //User Code Start. Sasara
    //偷个懒。这个写法简单，但依赖IR正确性。有更健壮的写法。
    virtual bool is_unconditional_br() const {
        return false; // 基类默认返回 false
    }
    virtual void replace_successor(BasicBlock* old_succ, BasicBlock* new_succ) {
        assert(false && "replace_successor called on a terminator with no successors!");
    }
    bool is_terminator(){
        return this->get_parent()->get_terminator()==this;
    }
    void set_parent(BasicBlock* new_parent){
        this->parent = new_parent;
    }
    void sever_all_uses(){
        for (Value* operand : get_operands()) {
            if (operand) {
                operand->remove_use(this);
            }
        }
        //operands_clear();
    }
    //User Code End. Sasara
    BasicBlock* get_parent() { return this->parent; }
private :
    // The parent baisc block
    BasicBlock* parent;        
    // three address form, maintain the result
};

/* User Code Start: code space 1 */
enum BinaryInstType{
    add = 0,
    sub,
    mul,
    udiv,
    sdiv ,
    urem ,
    srem ,
    fadd,
    fsub ,
    fmul,
    fdiv,
    frem ,
    iand ,
    ior ,
    ixor ,
    icmp ,
    eq ,
    ne ,
    gt ,
    lt ,
    ge,
    le,
    fcmp,
    oeq ,
    one ,
    ogt ,
    olt ,
    oge,
    ole,
    lshr,
    ashr,
    shl,
    fshr,
};
/* User Code End: code space 1 */

class AllocaInst : public Instruction {
public:
    AllocaInst(Type* ty, std::string name, unsigned alignment, BasicBlock* bb)
    /* User Code Start: Alloca */
        // 这里的name指的是用alloca从内存中分配到内存的名字，
    : Instruction(ty, name, bb), _alignment(alignment)
    /* User Code End: Alloca */
    {
        /* User Code Start: Alloca construct function */
        /* User Code End: Alloca construct function */
    }

    /* User Code Start: Alloca place */
    /* User Code End: Alloca place */
    std::string to_str();
    std::string to_llvm();
    void dump();

     
    unsigned get_alignment() const {
        /* User Code Start: Alloca::get_alignment */
        return _alignment;
        /* User Code End: Alloca::get_alignment */
    }
    //by .Sasara
    Type* get_alloca_ty() const {
        return this->get_type();
    }
     
private:
    unsigned _alignment;
};

class LoadInst : public Instruction {
public:
    LoadInst(Type* ty, Value* src, std::string _name, unsigned alignment, BasicBlock* bb)
    /* User Code Start: Load */
    :Instruction(ty, _name, bb), _alignment(alignment), _src(src)
    /* User Code End: Load */
    {
        /* User Code Start: Load construct function */
        add_operand(src);
        /* User Code End: Load construct function */
    }

    /* User Code Start: Load place */

    /* User Code End: Load place */
    std::string to_str();
    std::string to_llvm();
    void replace_all_uses_with(Value* replacement){
        _src = replacement;
        set_operand(0,replacement);
    }
     
    unsigned get_alignment() const {
        /* User Code Start: Load::get_alignment */
        return _alignment;
        /* User Code End: Load::get_alignment */
    }
      
    Value* get_src() const {
        /* User Code Start: Load::get_src */
        return _src;
        /* User Code End: Load::get_src */
    }
     
private:
    unsigned _alignment;
    Value* _src;
};

class StoreInst : public Instruction {
public:
    StoreInst(Type* ty, Value* dst, Value* src, std::string _name, unsigned alignment, BasicBlock* bb)
    /* User Code Start: Store */
    : Instruction(ty, _name, bb), /*_dst(dst), _src(src),*/ _alignment(alignment)
    /* User Code End: Store */
    {
        /* User Code Start: Store construct function */
        add_operand(src); 
        add_operand(dst);
        /* User Code End: Store construct function */
    }

    /* User Code Start: Store place */

    /* User Code End: Store place */
    std::string to_str();
    std::string to_llvm();

     
    Value* get_dst() const {
        /* User Code Start: Store::get_dst */
        return get_operand(1);
        /* User Code End: Store::get_dst */
    }
      
    Value* get_src() const {
        /* User Code Start: Store::get_src */
        return get_operand(0);
        /* User Code End: Store::get_src */
    }
    Value* get_value_operand() const {
        return  get_operand(0);
    }
    Value* get_ptr_operand() const {
        return get_operand(1);
    }  
    unsigned get_alignment() const {
        /* User Code Start: Store::get_alignment */
        return _alignment;
        /* User Code End: Store::get_alignment */
    }
     
private:
    //Value* _dst;
    //Value* _src;
    unsigned _alignment;
};

class BinaryInst : public Instruction {
public:
    BinaryInst(Type* ty, BinaryOp bop, Value* lhs, Value* rhs, std::string _name, BinaryInstType instr_type, BasicBlock* bb)
    /* User Code Start: Binary */
    : Instruction(ty, _name, bb), _ty(ty), _bop(bop), _lhs(lhs), _rhs(rhs), _instr_type(instr_type)
    /* User Code End: Binary */
    {
        /* User Code Start: Binary construct function */
        add_operand(lhs);
        add_operand(rhs);
        /* User Code End: Binary construct function */
    }

    /* User Code Start: Binary place */

    /* User Code End: Binary place */
    std::string to_str();
    std::string to_llvm();

     
    Type* get_ty() const {
        /* User Code Start: Binary::get_ty */
        return _ty;
        /* User Code End: Binary::get_ty */
    }
      
    BinaryOp get_bop() const {
        /* User Code Start: Binary::get_bop */
        return _bop;
        /* User Code End: Binary::get_bop */
    }
      
    Value* get_lhs() const {
        /* User Code Start: Binary::get_lhs */
        return _lhs;
        /* User Code End: Binary::get_lhs */
    }
      
    Value* get_rhs() const {
        /* User Code Start: Binary::get_rhs */
        return _rhs;
        /* User Code End: Binary::get_rhs */
    }
      
    BinaryInstType get_instr_type() const {
        /* User Code Start: Binary::get_instr_type */
        return _instr_type;
        /* User Code End: Binary::get_instr_type */
    }
     
private:
    Type* _ty;
    BinaryOp _bop;
    Value* _lhs;
    Value* _rhs;
    BinaryInstType _instr_type;
};

class ConvertInst : public Instruction {
public:
    ConvertInst(Value* src, Type* src_type, Type* dst_type, std::string _name, BasicBlock* bb)
    /* User Code Start: Convert */
    : Instruction(dst_type, _name, bb), src(src), src_type(src_type), dst_type(dst_type)
        /* User Code End: Convert */
    {
        /* User Code Start: Convert construct function */
        add_operand(src);
        /* User Code End: Convert construct function */
    }

    /* User Code Start: Convert place */

    /* User Code End: Convert place */
    std::string to_str();
    std::string to_llvm();

     
    Value* getsrc() const {
        /* User Code Start: Convert::get_rc */
        return src;
        /* User Code End: Convert::get_rc */
    }
      
    Type* getsrc_type() const {
        /* User Code Start: Convert::get_rc_type */
        return src_type;
        /* User Code End: Convert::get_rc_type */
    }
      
    Type* getdst_type() const {
        /* User Code Start: Convert::get_st_type */
        return dst_type;
        /* User Code End: Convert::get_st_type */
    }
     
private:
    Value* src;
    Type* src_type;
    Type* dst_type;
};

class CallInst : public Instruction {
public:
    CallInst(const IR::Function* func, std::vector<Value*> args, std::string _name, BasicBlock* bb)
    /* User Code Start: Call */
    : Instruction(func->get_return_type(), _name, bb), _func(func),  _args(std::move(args))
    /* User Code End: Call */
    {
        /* User Code Start: Call construct function */
        add_operand(const_cast<IR::Function*>(func)); // Function 也是 Value
        for (Value* arg : _args) {
            add_operand(arg);
        }
        /* User Code End: Call construct function */
    }

    /* User Code Start: Call place */

    /* User Code End: Call place */
    std::string to_str();
    std::string to_llvm();

     
    const IR::Function* get_func() const {
        /* User Code Start: Call::get_func */
        return _func;
        /* User Code End: Call::get_func */
    }
      
    std::vector<Value*> get_args() const {
        /* User Code Start: Call::get_args */
        return _args;
        /* User Code End: Call::get_args */
    }
     
private:
    const IR::Function* _func;
    std::vector<Value*> _args;
};

class ReturnInst : public Instruction {
public:
    ReturnInst(Value* ret_val, std::string name, BasicBlock* bb)
    /* User Code Start: Return */
    : Instruction(ret_val ? ret_val->get_type() : new Type(Void), name, bb), _ret_val(ret_val)
    /* User Code End: Return */
    {
        /* User Code Start: Return construct function */
        if (ret_val) { // 只有在有返回值时才添加
            add_operand(ret_val);
        }
        /* User Code End: Return construct function */
    }

    /* User Code Start: Return place */

    /* User Code End: Return place */
    std::string to_str();
    std::string to_llvm();

     
    Value* get_ret_val() const {
        /* User Code Start: Return::get_ret_val */
        return _ret_val;
        /* User Code End: Return::get_ret_val */
    }
     
private:
    Value* _ret_val;
};

class GetElementPtrInst : public Instruction {
public:
    GetElementPtrInst(Type* arr_type, Type* base_type, std::vector<Value*> indices, Value* src, std::string _name, BasicBlock* bb)
    /* User Code Start: GetElementPtr */
    : Instruction(base_type, _name, bb), _arr_type(arr_type), _indices(std::move(indices)), _src(src)
    /* User Code End: GetElementPtr */
    {
        /* User Code Start: GetElementPtr construct function */
        add_operand(src); // 基地址是第一个操作数
        for (Value* index : _indices) {
            add_operand(index);
        }
        /* User Code End: GetElementPtr construct function */
    }

    /* User Code Start: GetElementPtr place */

    /* User Code End: GetElementPtr place */
    std::string to_str();
    std::string to_llvm();

     
    Type* get_arr_type() const {
        /* User Code Start: GetElementPtr::get_arr_type */
        return _arr_type;
        /* User Code End: GetElementPtr::get_arr_type */
    }
      
    std::vector<Value*> get_indices() const {
        /* User Code Start: GetElementPtr::get_indices */
        return _indices;
        /* User Code End: GetElementPtr::get_indices */
    }
      
    Value* get_src() const {
        /* User Code Start: GetElementPtr::get_src */
        return _src;
        /* User Code End: GetElementPtr::get_src */
    }
     
private:
    Type* _arr_type;
    std::vector<Value*> _indices;
    Value* _src;
};

class PhiInst : public Instruction {
public:
    
    PhiInst(Type* ty, unsigned num_reserved_operands, const std::string& name, BasicBlock* bb, IR::AllocaInst* alloca_src)
    : Instruction(ty, name, bb), _alloca_src(alloca_src) {
    
    }

    /* User Code Start: Phi place */
    AllocaInst* get_alloca_src()const{
        return _alloca_src;
    }

    void add_incoming(Value* value, BasicBlock* pred_bb) {
        // [value_0, block_0, value_1, block_1, value_2, block_2, ...]
        for (unsigned i = 1; i < get_operands().size(); i += 2) {
            if (get_operand(i) == pred_bb) {
                set_operand(i - 1, value);
                return;
            }
        }
        add_operand(value);
        add_operand(pred_bb);
    }
    void remove_incoming_by_block(BasicBlock* pred_bb);//CFG变化用
    unsigned get_num_incoming() const {
        return get_operands().size() / 2;
    }
    Value* get_incoming_value(unsigned index) const {
        assert(index * 2 < get_operands().size() && "Index out of range for Phi incoming value");
        return get_operand(index * 2);
    } 
    BasicBlock* get_incoming_block(unsigned index) const {
        assert(index * 2 + 1 < get_operands().size() && "Index out of range for Phi incoming block");
        return static_cast<BasicBlock*>(get_operand(index * 2 + 1));
    }
    Value* get_incoming_value_for_block(const BasicBlock* pred_bb) const {
        for (unsigned i = 0; i < get_num_incoming(); ++i) {
            if (get_incoming_block(i) == pred_bb) {
                return get_incoming_value(i);
            }
        }
        return nullptr;
    }
    /* User Code End: Phi place */
    std::string to_str();
    std::string to_llvm();

    
private:
    //std::map<BasicBlock*, Value*> _incoming_map;
    IR::AllocaInst* _alloca_src; //标记来源
};

class CondBranchInst : public Instruction {
public:
    CondBranchInst(Type* ty, Value* cond, BasicBlock* cur_bb, BasicBlock* true_bb, BasicBlock* false_bb)
    /* User Code Start: CondBranch */
    : Instruction(ty, "cond branch", cur_bb), _cond(cond),  _true_bb(true_bb), _false_bb(false_bb)
    /* User Code End: CondBranch */
    {
        /* User Code Start: CondBranch construct function */
        add_operand(cond);
        /* User Code End: CondBranch construct function */
    }

    /* User Code Start: CondBranch place */
    // by .Sasara
    void replace_successor(BasicBlock* old_succ, BasicBlock* new_succ){
        bool replaced = false;
        if (_true_bb == old_succ) {
            _true_bb = new_succ;
            replaced = true;
        }
        if (_false_bb == old_succ) {
            _false_bb = new_succ;
            replaced = true;
        }
        if(!replaced){
            assert(false && "Cannot replace a successor that doesn't exist!");
        }
    }
    /* User Code End: CondBranch place */
    std::string to_str();
    std::string to_llvm();

     
    Value* get_cond() const {
        /* User Code Start: CondBranch::get_cond */
        return _cond;
        /* User Code End: CondBranch::get_cond */
    }
      
    BasicBlock* get_true_bb() const {
        /* User Code Start: CondBranch::get_true_bb */
        return _true_bb;
        /* User Code End: CondBranch::get_true_bb */
    }
      
    BasicBlock* get_false_bb() const {
        /* User Code Start: CondBranch::get_false_bb */
        return _false_bb;
        /* User Code End: CondBranch::get_false_bb */
    }
     
private:
    Value* _cond;
    BasicBlock* _true_bb;
    BasicBlock* _false_bb;
};

class BranchInst : public Instruction {
public:
    BranchInst(Type* ty, BasicBlock* cur_bb, BasicBlock* dst_bb)
    /* User Code Start: Branch */
    : Instruction(ty, "branch", cur_bb),  _dst_bb(dst_bb)
    /* User Code End: Branch */
    {
        /* User Code Start: Branch construct function */

        /* User Code End: Branch construct function */
    }

    /* User Code Start: Branch place */
    // by .Sasara
    bool is_unconditional_br() const override{
        return true; // 基类默认返回 false
    }
    void set_target(BasicBlock* new_target) { _dst_bb = new_target; }
    void replace_successor(BasicBlock* old_succ, BasicBlock* new_succ) {
        if (_dst_bb == old_succ) {
            set_target(new_succ);
        }else{
            assert(false && "Cannot replace a successor that doesn't exist!");
        }
    }
    /* User Code End: Branch place */
    std::string to_str();
    std::string to_llvm();

     
    BasicBlock* get_dst_bb() const {
        /* User Code Start: Branch::get_dst_bb */
        return _dst_bb;
        /* User Code End: Branch::get_dst_bb */
    }
     
private:
    BasicBlock* _dst_bb;
};

}
