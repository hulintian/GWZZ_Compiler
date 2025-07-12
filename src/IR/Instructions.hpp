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
class Function;
class Instruction : public User {
public :
    Instruction(Type* t, std::string name, BasicBlock* bb) : User(t, name), parent(bb){}

    virtual std::string to_str() = 0;
    virtual std::string to_llvm() = 0;

    BasicBlock* get_parent() { return this->parent; }
    Type* get_type() { return this->inst_type; }
private :
    // The parent baisc block
    BasicBlock* parent;        
    // three address form, maintain the result
    Type* inst_type;
};

class AllocaInst : public Instruction {
public:
    AllocaInst(Type* ty, std::string name, unsigned alignment, BasicBlock* bb)
    /* User Code Start: Alloca */
        // 这里的name指的是用alloca从内存中分配到内存的名字，
    : Instruction(ty, name, bb) 
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
      
    Type* get_type() const {
        /* User Code Start: Alloca::get_type */
        return _type;
        /* User Code End: Alloca::get_type */
    }
     
private:
    unsigned _alignment;
    Type* _type;
};

class LoadInst : public Instruction {
public:
    LoadInst(Type* ty, Value* src, std::string _name, unsigned alignment, BasicBlock* bb)
    /* User Code Start: Load */
    :Instruction(ty, _name, bb), _alignment(alignment), _src(src)
    /* User Code End: Load */
    {
        /* User Code Start: Load construct function */

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
    BinaryInst(Type* ty, BinaryOp bop, Value* lhs, Value* rhs, std::string _name, BasicBlock* bb)
    /* User Code Start: Binary */
    : Instruction(ty, _name, bb), _ty(ty), _bop(bop), _lhs(lhs), _rhs(rhs)
    /* User Code End: Binary */
    {
        /* User Code Start: Binary construct function */

        /* User Code End: Binary construct function */
    }

    /* User Code Start: Binary place */
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
        fcmp,
        oeq ,
        one ,
        ogt ,
        olt ,
    };
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
     
private:
    Type* _ty;
    BinaryOp _bop;
    Value* _lhs;
    Value* _rhs;
};

class ConvertInst : public Instruction {
public:
    ConvertInst(Value* src, Type* src_type, Type* dst_type, std::string _name, BasicBlock* bb)
    /* User Code Start: Convert */
    : Instruction(dst_type, _name, bb), src(src), src_type(src_type), dst_type(dst_type)
        /* User Code End: Convert */
    {
        /* User Code Start: Convert construct function */

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

class GetElementPtrInst : public Instruction {
public:
    GetElementPtrInst(Type* arr_type, Type* base_type, std::vector<Value*> indices, Value* src, std::string _name, BasicBlock* bb)
    /* User Code Start: GetElementPtr */
    : Instruction(base_type, _name, bb), _arr_type(arr_type), _indices(std::move(indices)), _src(src)
    /* User Code End: GetElementPtr */
    {
        /* User Code Start: GetElementPtr construct function */

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

}
