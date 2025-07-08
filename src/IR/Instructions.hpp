#pragma once
#include "IR/User.hpp" 
#include "common/type.hpp" 
#include "common/defines.hpp"
#include "IR/BasicBlock.hpp"

namespace IR {

class BasicBlock;
class Function;
class Instruction : public User {
public :
    Instruction(Type* t, std::string name, BasicBlock* bb) : User(t, name), parent(bb){}

    std::string to_str();
    std::string to_llvm();

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
        this->get_parent()->add_instr(this);
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
      
    std::string get_name() const {
        /* User Code Start: Alloca::get_name */
        return _name;
        /* User Code End: Alloca::get_name */
    }
     
private:
    unsigned _alignment;
    Type* _type;
    std::string _name;
};

class LoadInst : public Instruction {
public:
    LoadInst(Type* ty, Value* dst, Value* src, std::string _name, BasicBlock* bb)
    /* User Code Start: Load */
    :Instruction(ty, _name, bb)
    /* User Code End: Load */
    {
        /* User Code Start: Load construct function */

        /* User Code End: Load construct function */
    }

    /* User Code Start: Load place */

    /* User Code End: Load place */
    std::string to_str();
    std::string to_llvm();

     
    unsigned get_align_size() const {
        /* User Code Start: Load::get_align_size */
        return _align_size;
        /* User Code End: Load::get_align_size */
    }
      
    Type* get_type() const {
        /* User Code Start: Load::get_type */
        return _type;
        /* User Code End: Load::get_type */
    }
     
private:
    unsigned _align_size;
    Type* _type;
};

class StoreInst : public Instruction {
public:
    StoreInst(Type* ty, Value* dst, std::string _name, Value* src, BasicBlock* bb)
    /* User Code Start: Store */
    : Instruction(ty, _name, bb)
    /* User Code End: Store */
    {
        /* User Code Start: Store construct function */

        /* User Code End: Store construct function */
    }

    /* User Code Start: Store place */

    /* User Code End: Store place */
    std::string to_str();
    std::string to_llvm();

     
    unsigned get_align_size() const {
        /* User Code Start: Store::get_align_size */
        return _align_size;
        /* User Code End: Store::get_align_size */
    }
      
    Type* get_type() const {
        /* User Code Start: Store::get_type */
        return _type;
        /* User Code End: Store::get_type */
    }
     
private:
    unsigned _align_size;
    Type* _type;
};

class BinaryInst : public Instruction {
public:
    BinaryInst(Type* ty, BinaryOp bop, Value* lhs, Value* rhs, std::string _name, BasicBlock* bb)
    /* User Code Start: Binary */
    : Instruction(ty, _name, bb)
    /* User Code End: Binary */
    {
        /* User Code Start: Binary construct function */

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
    : Instruction(dst_type, _name, bb)
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
    CallInst(IR::Function* func, std::vector<Value*> args, std::string _name, BasicBlock* bb)
    /* User Code Start: Call */
    : Instruction(func->get_return_type(), _name, bb)
    /* User Code End: Call */
    {
        /* User Code Start: Call construct function */

        /* User Code End: Call construct function */
    }

    /* User Code Start: Call place */

    /* User Code End: Call place */
    std::string to_str();
    std::string to_llvm();

     
    IR::Function* get_func() const {
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
    IR::Function* _func;
    std::vector<Value*> _args;
};

class GetElementPtrInst : public Instruction {
public:
    GetElementPtrInst(Type* arr_type, std::vector<Value*> indices, std::string _name, BasicBlock* bb)
    /* User Code Start: GetElementPtr */
    : Instruction(arr_type, _name, bb)
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
     
private:
    Type* _arr_type;
    std::vector<Value*> _indices;
};

}
