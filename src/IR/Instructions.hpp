#pragma once
#include "IR/User.hpp"
#include "IR/Value.hpp"
#include "common/type.hpp"
#include <string> 
#include "common/type.hpp" 
#include "common/defines.hpp" 
#include "IR/Function.hpp" 
#include "IR/BasicBlock.hpp"

namespace IR {

class BasicBlock;
class Instruction : public User {
public :
    Instruction(Type* t, std::string name, BasicBlock* bb) : User(t, name), parent(bb){}

    virtual std::string to_str() = 0;
    virtual std::string to_llvm() = 0;

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
        this->add_operand(src);
        /* User Code End: Load construct function */
    }

    /* User Code Start: Load place */

    /* User Code End: Load place */
    std::string to_str();
    std::string to_llvm();

     
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
    : Instruction(ty, _name, bb), _dst(dst), _src(src), _alignment(alignment)
    /* User Code End: Store */
    {
        /* User Code Start: Store construct function */
        this->add_operand(dst);
        this->add_operand(src);
        /* User Code End: Store construct function */
    }

    /* User Code Start: Store place */

    /* User Code End: Store place */
    std::string to_str();
    std::string to_llvm();

     
    Value* get_dst() const {
        /* User Code Start: Store::get_dst */
        return _dst;
        /* User Code End: Store::get_dst */
    }
      
    Value* get_src() const {
        /* User Code Start: Store::get_src */
        return _src;
        /* User Code End: Store::get_src */
    }
      
    unsigned get_alignment() const {
        /* User Code Start: Store::get_alignment */
        return _alignment;
        /* User Code End: Store::get_alignment */
    }
     
private:
    Value* _dst;
    Value* _src;
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
        this->add_operand(lhs);
        this->add_operand(rhs);
        /* User Code End: Binary construct function */
    }

    /* User Code Start: Binary place */
    inline bool is_float_op() { return this->_instr_type == oeq ||
                                       this->_instr_type == one ||
                                       this->_instr_type == oge ||
                                       this->_instr_type == ogt ||
                                       this->_instr_type == olt ||
                                       this->_instr_type == ole ;
    }
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
        this->add_operand(src);
        /* User Code End: Convert construct function */
    }

    /* User Code Start: Convert place */
    inline bool is_x2f() { return dst_type->base_type == 1 && src_type->base_type == 0; }
    inline bool is_f2x() { return dst_type->base_type == 0 && src_type->base_type == 1; }
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
        for(auto a : args) {
            this->add_operand(a);
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
        if(ret_val) this->add_operand(ret_val);
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
        this->add_operand(src);
        for(auto i : indices) {
            this->add_operand(i);
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
    PhiInst(Type* ty, std::string& name, std::vector<BasicBlock*> candidate_bbs, std::vector<Value*> candidate_vars, BasicBlock* bb)
    /* User Code Start: Phi */
    :Instruction(ty, name, bb), _candidate_bbs(std::move(candidate_bbs)), _candidate_vars(std::move(candidate_vars))
    /* User Code End: Phi */
    {
        /* User Code Start: Phi construct function */

        /* User Code End: Phi construct function */
    }

    /* User Code Start: Phi place */

    /* User Code End: Phi place */
    std::string to_str();
    std::string to_llvm();

     
    std::vector<BasicBlock*> get_candidate_bbs() const {
        /* User Code Start: Phi::get_candidate_bbs */
        return _candidate_bbs;
        /* User Code End: Phi::get_candidate_bbs */
    }
      
    std::vector<Value*> get_candidate_vars() const {
        /* User Code Start: Phi::get_candidate_vars */
        return _candidate_vars;
        /* User Code End: Phi::get_candidate_vars */
    }
     
private:
    std::vector<BasicBlock*> _candidate_bbs;
    std::vector<Value*> _candidate_vars;
};

class CondBranchInst : public Instruction {
public:
    CondBranchInst(Type* ty, Value* cond, BasicBlock* cur_bb, BasicBlock* true_bb, BasicBlock* false_bb)
    /* User Code Start: CondBranch */
    : Instruction(ty, "cond branch", cur_bb), _cond(cond),  _true_bb(true_bb), _false_bb(false_bb)
    /* User Code End: CondBranch */
    {
        /* User Code Start: CondBranch construct function */
        this->add_operand(cond);
        /* User Code End: CondBranch construct function */
    }

    /* User Code Start: CondBranch place */

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
