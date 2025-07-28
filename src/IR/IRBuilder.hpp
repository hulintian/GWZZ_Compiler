#pragma once
#include "IR/Function.hpp"
#include "IR/Module.hpp"
#include "IR/BasicBlock.hpp"
#include "IR/Instructions.hpp"
#include "common/defines.hpp"
#include "common/type.hpp"
#include <memory>
#include <vector>
#include <string> 
#include "IR/GlobalValue.hpp" 
#include "IR/Context.hpp" 
#include "frontend/AST.hpp"

namespace IR {
class IRBuilder {
public:
    IRBuilder(Context* ctx) : _cur_ctx(ctx)  {
        /* User Code Start: IRBuilder construct function */
        auto zo = ConstValue(0);
        auto fo = ConstValue((float)0.0);
        zero = new ConstantValue(this->get_base_type(0), "0", zo);
        fzero = new ConstantValue(this->get_base_type(0), std::to_string((float)0.0), fo);
        /* User Code End: IRBuilder construct function */
    }

    /* User Code Start: code space 1 */
    // TODO : 在此微操
        // here is safe
        //
    // a cache for base type
    std::map<int, Type*> tbt;
    ConstantValue *zero, *fzero;

    Type* get_base_type(int base_type) {
        if(tbt.find(base_type) != tbt.end()) {
            return tbt[base_type];
        } else {
            auto ty = new Type(base_type);
            tbt[base_type] = ty;
            return ty;
        }
    }
    
    
    GlobalValue* create_gv(std::shared_ptr<Var> var, const std::string &sym, bool is_const) {
        auto _cur_module = this->get_cur_module();
        bool initialized = var->arr_val || var->val;
        auto gv = new GlobalValue(_cur_module, sym, var, initialized, is_const); 
        _cur_module->add_gv(gv);
        
        return gv;
    }
    
    // create bb with name, before function define
    BasicBlock* create_bb(std::string &name, Function *func) {
        auto nbb = new BasicBlock(name, func, _cur_ctx->get_tmp_baisc_block_index());
        assert(!func->find_bb(nbb->get_bb_idx()) && "Already has this BasicBlock");
        return nbb;
    }

    BasicBlock* create_bb() {
        assert(this->get_cur_func() != nullptr && "Not in function\n");
        int  idx = this->get_cur_ctx()->get_tmp_baisc_block_index();
        auto bb_name = "BB" + std::to_string(idx);
        auto nbb = new BasicBlock(bb_name, this->get_cur_func(), idx);
        this->get_cur_func()->insert_bb(nbb);
        return nbb;
    }
    
    // This function initially create an entry basic block , if is not lib func
    Function* create_func(const std::string &name, Type* return_type, std::vector<Type*> args_type, std::vector<std::string> args_name, bool is_lib) {
        auto _cur_module = this->get_cur_module();
        assert(!_cur_module->find_function(name) && "Already exists Func ");
        auto nfunc = new Function(_cur_module, name, return_type, args_type, args_name, is_lib);
        _cur_module->add_func(nfunc);
        
        std::string entry_name = "entry";
        auto entry_bb = create_bb(entry_name, nfunc);
        // set the insert point
        _cur_ctx->set_current_basic_block(entry_bb);
        _cur_ctx->set_current_function(nfunc);

        nfunc->set_entry_bb(entry_bb);

        //then parse the arguments
        for(int i=0; i<args_type.size(); i++) {
            // create alloca Instructions
            auto var = create_alloca(args_name[i], args_type[i]);
            this->get_cur_func()->add_alias(args_name[i], var);
        }

        return nfunc;
    }

    ConstantValue* create_const_value(Type* ty, const std::string &name, ConstValue &v) {
        return new ConstantValue(ty, name, v);
    }
    ConstantValue* create_const_value(Type* ty, ConstValue &v) {
        // std::string temp = "%T" + std::to_string(this->get_cur_ctx()->get_tmp_var());
        // 常量不用临时变量，直接常量的值to string
        return new ConstantValue(ty, v.to_string(), v);
    }
    

    IR::Module* get_cur_module() const {
        /* User Code Start: ::get_cur_module */
        return _cur_ctx->get_current_module();
        /* User Code End: ::get_cur_module */
    }
      
    IR::Function* get_cur_func() const {
        /* User Code Start: ::get_cur_func */
        return _cur_ctx->get_current_function();
        /* User Code End: ::get_cur_func */
    }
      
    IR::BasicBlock* get_cur_bb() const {
        /* User Code Start: ::get_cur_bb */
        return _cur_ctx->get_current_basic_block();
        /* User Code End: ::get_cur_bb */
    }
      
    void set_cur_module( IR::Module* module ) {
        /* User Code Start: set_module */
        _cur_ctx->set_current_module(module);
        /* User Code End: set_module */
    }
      
    void set_cur_func( IR::Function* func ) {
        /* User Code Start: set_func */
        _cur_ctx->set_current_function(func);
        /* User Code End: set_func */
    }
      
    void set_cur_bb( IR::BasicBlock* bb ) {
        /* User Code Start: set_bb */
        _cur_ctx->set_current_basic_block(bb);
        /* User Code End: set_bb */
    }

    Instruction* cvt_to_float(Value* v) {
        return this->create_cvt(v, this->get_base_type(0), this->get_base_type(1));
    }

    Instruction* cvt_to_int(Value* v) {
        return this->create_cvt(v, this->get_base_type(1), this->get_base_type(0));
    }

    // lhs & rhs 类型一致化
    std::vector<Value*> check_lhs_rhs_all_float(Value* lhs, Value* rhs) {
        Value* n_rhs = rhs;
        Value* n_lhs = lhs;
        if(rhs->get_type()->base_type == 1 || lhs ->get_type()->base_type == 1) {
            if(rhs->get_type()->base_type == 0) {
                n_rhs = this->cvt_to_float(rhs);
            } else if(lhs->get_type()->base_type == 0) {
                n_lhs = this->cvt_to_float(lhs);
            }
        }
        // 
        return std::vector<Value*>{n_lhs, n_rhs};
    }

    Instruction* create_ne_zero(Value* val) {
        if(val->get_type()->base_type == Float) {
            return create_ne(val, this->fzero);
        } else {
            return create_ne(val, this->zero);
        }
    }

    void enter_loop(BasicBlock* cond, BasicBlock* end) {
        this->get_cur_func()->push_break_continue_point(end, cond);
    }

    void exit_loop() {
        this->get_cur_func()->pop_break_continue_point();
    }

    void reg_lib_func(const std::string& name,
                      Type* return_type,
                      std::vector<Type*> arg_types,
                      std::vector<std::string> arg_names
                      ) {
        this->get_cur_module()->add_lib_func(new Function(this->get_cur_module(),
                                                                name,
                                                                return_type,
                                                                arg_types,
                                                                arg_names,
                                                                true));
    }

    bool is_jump_instr(IR::Instruction* instr) {
        if(auto res = dynamic_cast<ReturnInst*>(instr)) {
            return true;
        }else if(auto res = dynamic_cast<CondBranchInst*>(instr)) {
            return true;
        }else if(auto res = dynamic_cast<BranchInst*>(instr)) {
            return true;
        }
        return false;
    }

    /* User Code End: code space 1 */

     
    Context* get_cur_ctx() const {
        /* User Code Start: ::get_cur_ctx */
        return _cur_ctx;
        /* User Code End: ::get_cur_ctx */
    }
     

     
    void set_cur_ctx( Context* ctx ) {
        /* User Code Start: set_ctx */
        this->_cur_ctx = ctx;
        /* User Code End: set_ctx */
    }
     

     
    Instruction* create_alloca(
        /* User Code Start: create_alloca args */
        std::string name, Type* ty 
        /* User Code End: create_alloca args */
    ){
        /* User Code Start: create_alloca */
        unsigned alignment = ty->is_ptr() ? 8 : 4;
        auto inst = new AllocaInst(ty, name, alignment, _cur_ctx->get_current_basic_block());
        this->get_cur_bb()->add_instr(inst);
        this->get_cur_func()->add_allocas(inst);
        return inst;
        /* User Code End: create_alloca */
    }
     
    Instruction* create_load(
        /* User Code Start: create_load args */
        Type* type, Value* src
        /* User Code End: create_load args */
    ){
        /* User Code Start: create_load */
        unsigned alignment = type->is_ptr() ? 8 : 4;
        auto name = "%T" + std::to_string(this->_cur_ctx->get_tmp_var());
        auto inst = new LoadInst(type, src, name, alignment, this->get_cur_bb());
        this->get_cur_bb()->add_instr(inst);
        return inst;
        /* User Code End: create_load */
    }
     
    Instruction* create_store(
        /* User Code Start: create_store args */
        Type* type, std::string name, Value* dst, Value* src
        /* User Code End: create_store args */
    ){
        /* User Code Start: create_store */
        unsigned alignment = type->is_ptr() ? 8 : 4;
        if(src->get_type()->base_type != dst->get_type()->base_type) {
            if(dst->get_type()->base_type == 0) {
                this->cvt_to_int(src);
            } else {
                this->cvt_to_float(src);
            }
        }
        auto inst = new StoreInst(type, dst, src, name, alignment, this->get_cur_bb());
        this->get_cur_bb()->add_instr(inst);
        return inst;
        /* User Code End: create_store */
    }
     
    Instruction* create_getelementptr(
        /* User Code Start: create_getelementptr args */
        Type* arr_type,  std::vector<Value*> indices , Value* src
        /* User Code End: create_getelementptr args */
    ){
        /* User Code Start: create_getelementptr */
        // llvm是一个维度，一个维度下降下去的，处理，我接口是这么写的，内部偷个懒，因为是静态数组，直接拉成一条（将成一维数组）
        auto name = "%T" + std::to_string(this->get_cur_ctx()->get_tmp_var());
        auto instr = new GetElementPtrInst(arr_type, this->get_base_type(arr_type->base_type), indices, src, name, this->get_cur_bb());
        this->get_cur_bb()->add_instr(instr);
        return instr;
        /* User Code End: create_getelementptr */
    }
     
    Instruction* create_binary_op(
        /* User Code Start: create_binary_op args */
        Value* lhs, Value* rhs, BinaryOp bop
        /* User Code End: create_binary_op args */
    ){
        /* User Code Start: create_binary_op */
        Value* n_lhs, *n_rhs;

        // let lhs & rhs type same
        auto norm = this->check_lhs_rhs_all_float(lhs, rhs);
        n_lhs = norm[0];
        n_rhs = norm[1];

        auto name = "%T" + std::to_string(this->get_cur_ctx()->get_tmp_var());
        BinaryInstType bit;

        auto ty = n_lhs->get_type();
        switch (bop) {
            case BinaryOp::Add :    if(ty->base_type == 1) { bit = BinaryInstType::fadd; } else { bit = BinaryInstType::add; }; break;
            case BinaryOp::Sub:     if(ty->base_type == 1) { bit = BinaryInstType::fsub; } else { bit = BinaryInstType::sub; }; break;
            case BinaryOp::Mul:     if(ty->base_type == 1) { bit = BinaryInstType::fmul; } else { bit = BinaryInstType::mul; }; break; 
            case BinaryOp::Div:     if(ty->base_type == 1) { bit = BinaryInstType::fdiv; } else { bit = BinaryInstType::sdiv; }; break; 
            case BinaryOp::Mod:     if(ty->base_type == 1) { bit = BinaryInstType::frem; } else { bit = BinaryInstType::srem; }; break;
            case BinaryOp::Eq:      if(ty->base_type == 1) { bit = BinaryInstType::oeq; } else { bit = BinaryInstType::eq; }; break;
            case BinaryOp::Neq:     if(ty->base_type == 1) { bit = BinaryInstType::one; } else { bit = BinaryInstType::ne; }; break;
            case BinaryOp::Lt:      if(ty->base_type == 1) { bit = BinaryInstType::olt; } else { bit = BinaryInstType::lt; }; break;
            case BinaryOp::Gt:      if(ty->base_type == 1) { bit = BinaryInstType::ogt; } else { bit = BinaryInstType::gt; }; break;
            case BinaryOp::Leq:     if(ty->base_type == 1) { bit = BinaryInstType::ole; } else { bit = BinaryInstType::le; }; break;
            case BinaryOp::Geq:     if(ty->base_type == 1) { bit = BinaryInstType::oge; } else { bit = BinaryInstType::ge; }; break;
            case BinaryOp::LShr:     if(ty->base_type == 1) { bit = BinaryInstType::fshr; } else { bit = BinaryInstType::lshr; }; break;
            case BinaryOp::Shr:     if(ty->base_type == 1) { bit = BinaryInstType::fshr; } else { bit = BinaryInstType::ashr; }; break;
            case BinaryOp::Shl:    if(ty->base_type == 1) { bit = BinaryInstType::shl; } else { bit = BinaryInstType::shl; }; break;
        }

        bool is_cmp = is_cmp_op(bop);

        Instruction* instr;
        if(is_cmp) {
            // cmp instr should put the res to int reg
            instr = new BinaryInst(this->get_base_type(Int), bop, n_lhs, n_rhs, name, bit,this->get_cur_bb() );
        } else {
            instr = new BinaryInst(ty, bop, n_lhs, n_rhs, name, bit,this->get_cur_bb() );
        }

        this->get_cur_bb()->add_instr(instr);

        return instr;
        /* User Code End: create_binary_op */
    }
     
    Instruction* create_add(
        /* User Code Start: create_add args */
        Value* lhs, Value* rhs
        /* User Code End: create_add args */
    ){
        /* User Code Start: create_add */
        return this->create_binary_op(lhs, rhs, BinaryOp::Add);
        /* User Code End: create_add */
    }
     
    Instruction* create_sub(
        /* User Code Start: create_sub args */
        Value* lhs, Value* rhs
        /* User Code End: create_sub args */
    ){
        /* User Code Start: create_sub */
        return this->create_binary_op(lhs, rhs, BinaryOp::Sub);
        /* User Code End: create_sub */
    }
     
    Instruction* create_mul(
        /* User Code Start: create_mul args */
        Value* lhs, Value* rhs
        /* User Code End: create_mul args */
    ){
        /* User Code Start: create_mul */
        // only two type , if on is float, cvt another
        // has a float
        return  this->create_binary_op(lhs, rhs, BinaryOp::Mul);
        /* User Code End: create_mul */
    }
     
    Instruction* create_udiv(
        /* User Code Start: create_udiv args */
        Value* lhs, Value* rhs
        /* User Code End: create_udiv args */
    ){
        /* User Code Start: create_udiv */
        return nullptr;
        /* User Code End: create_udiv */
    }
     
    Instruction* create_sdiv(
        /* User Code Start: create_sdiv args */
        Value* lhs, Value* rhs
        /* User Code End: create_sdiv args */
    ){
        /* User Code Start: create_sdiv */
        return nullptr;
        /* User Code End: create_sdiv */
    }
     
    Instruction* create_urem(
        /* User Code Start: create_urem args */
        Value* lhs, Value* rhs
        /* User Code End: create_urem args */
    ){
        /* User Code Start: create_urem */
        return nullptr;
        /* User Code End: create_urem */
    }
     
    Instruction* create_srem(
        /* User Code Start: create_srem args */
        Value* lhs, Value* rhs
        /* User Code End: create_srem args */
    ){
        /* User Code Start: create_srem */
        return nullptr;
        /* User Code End: create_srem */
    }
     
    Instruction* create_fadd(
        /* User Code Start: create_fadd args */
        Value* lhs, Value* rhs
        /* User Code End: create_fadd args */
    ){
        /* User Code Start: create_fadd */
        return nullptr;
        /* User Code End: create_fadd */
    }
     
    Instruction* create_fsub(
        /* User Code Start: create_fsub args */
        Value* lhs, Value* rhs
        /* User Code End: create_fsub args */
    ){
        /* User Code Start: create_fsub */
        return nullptr;
        /* User Code End: create_fsub */
    }
     
    Instruction* create_fmul(
        /* User Code Start: create_fmul args */
        Value* lhs, Value* rhs
        /* User Code End: create_fmul args */
    ){
        /* User Code Start: create_fmul */
        return nullptr;
        /* User Code End: create_fmul */
    }
     
    Instruction* create_fdiv(
        /* User Code Start: create_fdiv args */
        Value* lhs, Value* rhs
        /* User Code End: create_fdiv args */
    ){
        /* User Code Start: create_fdiv */
        return nullptr;
        /* User Code End: create_fdiv */
    }
     
    Instruction* create_frem(
        /* User Code Start: create_frem args */
        Value* lhs, Value* rhs
        /* User Code End: create_frem args */
    ){
        /* User Code Start: create_frem */
        return nullptr;
        /* User Code End: create_frem */
    }
     
    Instruction* create_and(
        /* User Code Start: create_and args */
        Value* lhs, Value* rhs
        /* User Code End: create_and args */
    ){
        /* User Code Start: create_and */
        return nullptr;
        /* User Code End: create_and */
    }
     
    Instruction* create_or(
        /* User Code Start: create_or args */
        Value* lhs, Value* rhs
        /* User Code End: create_or args */
    ){
        /* User Code Start: create_or */
        return nullptr;
        /* User Code End: create_or */
    }
     
    Instruction* create_xor(
        /* User Code Start: create_xor args */
        Value* lhs, Value* rhs
        /* User Code End: create_xor args */
    ){
        /* User Code Start: create_xor */
        return nullptr;
        /* User Code End: create_xor */
    }
     
    Instruction* create_icmp(
        /* User Code Start: create_icmp args */
        Value* lhs, Value* rhs
        /* User Code End: create_icmp args */
    ){
        /* User Code Start: create_icmp */
        return nullptr;
        /* User Code End: create_icmp */
    }
     
    Instruction* create_eq(
        /* User Code Start: create_eq args */
        Value* lhs, Value* rhs
        /* User Code End: create_eq args */
    ){
        /* User Code Start: create_eq */
        return this->create_binary_op(lhs, rhs, BinaryOp::Eq);
        /* User Code End: create_eq */
    }
     
    Instruction* create_ne(
        /* User Code Start: create_ne args */
        Value* lhs, Value* rhs
        /* User Code End: create_ne args */
    ){
        /* User Code Start: create_ne */
        return this->create_binary_op(lhs, rhs, BinaryOp::Neq);
        /* User Code End: create_ne */
    }
     
    Instruction* create_gt(
        /* User Code Start: create_gt args */
        Value* lhs, Value* rhs
        /* User Code End: create_gt args */
    ){
        /* User Code Start: create_gt */
        return nullptr;
        /* User Code End: create_gt */
    }
     
    Instruction* create_lt(
        /* User Code Start: create_lt args */
        Value* lhs, Value* rhs
        /* User Code End: create_lt args */
    ){
        /* User Code Start: create_lt */
        return nullptr;
        /* User Code End: create_lt */
    }
     
    Instruction* create_ge(
        /* User Code Start: create_ge args */
        Value* lhs, Value* rhs
        /* User Code End: create_ge args */
    ){
        /* User Code Start: create_ge */
        return nullptr;
        /* User Code End: create_ge */
    }
     
    Instruction* create_le(
        /* User Code Start: create_le args */
        Value* lhs, Value* rhs
        /* User Code End: create_le args */
    ){
        /* User Code Start: create_le */
        return nullptr;
        /* User Code End: create_le */
    }
     
    Instruction* create_fcmp(
        /* User Code Start: create_fcmp args */
        Value* lhs, Value* rhs
        /* User Code End: create_fcmp args */
    ){
        /* User Code Start: create_fcmp */
        return nullptr;
        /* User Code End: create_fcmp */
    }
     
    Instruction* create_oeq(
        /* User Code Start: create_oeq args */
        Value* lhs, Value* rhs
        /* User Code End: create_oeq args */
    ){
        /* User Code Start: create_oeq */
        return nullptr;
        /* User Code End: create_oeq */
    }
     
    Instruction* create_one(
        /* User Code Start: create_one args */
        Value* lhs, Value* rhs
        /* User Code End: create_one args */
    ){
        /* User Code Start: create_one */
        return nullptr;
        /* User Code End: create_one */
    }
     
    Instruction* create_ogt(
        /* User Code Start: create_ogt args */
        Value* lhs, Value* rhs
        /* User Code End: create_ogt args */
    ){
        /* User Code Start: create_ogt */
        return nullptr;
        /* User Code End: create_ogt */
    }
     
    Instruction* create_olt(
        /* User Code Start: create_olt args */
        Value* lhs, Value* rhs
        /* User Code End: create_olt args */
    ){
        /* User Code Start: create_olt */
        return nullptr;
        /* User Code End: create_olt */
    }
     
    Instruction* create_oge(
        /* User Code Start: create_oge args */
        Value* lhs, Value* rhs
        /* User Code End: create_oge args */
    ){
        /* User Code Start: create_oge */
        return nullptr;
        /* User Code End: create_oge */
    }
     
    Instruction* create_ole(
        /* User Code Start: create_ole args */
        Value* lhs, Value* rhs
        /* User Code End: create_ole args */
    ){
        /* User Code Start: create_ole */
        return nullptr;
        /* User Code End: create_ole */
    }
     
    Instruction* create_br(
        /* User Code Start: create_br args */
        BasicBlock* dst
        /* User Code End: create_br args */
    ){
        /* User Code Start: create_br */
        auto instr = new BranchInst(this->get_base_type(0),  this->get_cur_bb(), dst);
        this->get_cur_bb()->add_instr(instr);
        return instr;
        /* User Code End: create_br */
    }
     
    Instruction* create_cond_br(
        /* User Code Start: create_cond_br args */
        Value *cond, BasicBlock* true_bb, BasicBlock* false_bb
        /* User Code End: create_cond_br args */
    ){
        /* User Code Start: create_cond_br */
        auto instr = new CondBranchInst(this->get_base_type(0), cond, this->get_cur_bb(), true_bb, false_bb);
        this->get_cur_bb()->add_instr(instr);
        return instr;
        /* User Code End: create_cond_br */
    }
     
    Instruction* create_call(
        /* User Code Start: create_call args */
        const IR::Function* func, std::vector<Value*> args
        /* User Code End: create_call args */
    ){
        /* User Code Start: create_call */
        auto name = "%T" + std::to_string(this->get_cur_ctx()->get_tmp_var());
        auto inst = new CallInst(func, args, name, this->get_cur_bb());
        this->get_cur_bb()->add_instr(inst);
        return inst;
        /* User Code End: create_call */
    }
     
    Instruction* create_ret(
        /* User Code Start: create_ret args */
        Value* ret_val
        /* User Code End: create_ret args */
    ){
        /* User Code Start: create_ret */
        auto instr = new ReturnInst(ret_val, "", this->get_cur_bb());
        this->get_cur_bb()->add_instr(instr);
        return instr;
        /* User Code End: create_ret */
    }
     
    Instruction* create_phi(
        /* User Code Start: create_phi args */

        /* User Code End: create_phi args */
    ){
        /* User Code Start: create_phi */
        return nullptr;
        /* User Code End: create_phi */
    }
     
    Instruction* create_cvt(
        /* User Code Start: create_cvt args */
        Value* v, Type* from, Type* to
        /* User Code End: create_cvt args */
    ){
        /* User Code Start: create_cvt */
        assert(!from->is_array() && !to->is_array() && "Can't cvt the array type\n");
        if(from->base_type == to->base_type) {
            return static_cast<Instruction*>(v);
        }

        auto name = "%T" + std::to_string(this->get_cur_ctx()->get_tmp_var());
        auto instr = new ConvertInst(v, from, to, name, this->get_cur_bb());
        this->get_cur_bb()->add_instr(instr);

        return instr;
        /* User Code End: create_cvt */
    }
    
private:
    Context* _cur_ctx;


    /* User Code Start: 2 */
    /* User Code End: 2 */
};
}
