#pragma once
#include "IR/Function.hpp"
#include "IR/Module.hpp"
#include "IR/BasicBlock.hpp"
#include "IR/Instructions.hpp"
#include "common/defines.hpp"
#include "common/type.hpp"
#include <memory>
#include <string>
#include <vector> 
#include "IR/GlobalValue.hpp" 
#include "IR/Context.hpp"
#include "frontend/AST.hpp"

namespace IR {
class IRBuilder {
public:
    IRBuilder(Context* ctx) : _cur_ctx(ctx)  {
        /* User Code Start: IRBuilder construct function */
        /* User Code End: IRBuilder construct function */
    }

    /* User Code Start: code space 1 */
    // TODO : 在此微操
        // here is safe
        //
    // a cache for base type
    // std::map<int, Type*> tbt;
    // ConstantValue *zero, *fzero;

    // Type* get_base_type(int base_type) {
    //     if(tbt.find(base_type) != tbt.end()) {
    //         return tbt[base_type];
    //     } else {
    //         auto ty = new Type(base_type);
    //         tbt[base_type] = ty;
    //         return ty;
    //     }
    // }
    
    
    GlobalValue* create_gv(std::shared_ptr<Var> var, const std::string &sym, bool is_const) {
        auto _cur_module = this->get_cur_module();
        assert(_cur_module && "Current module is not set in context!");
        bool initialized = var->arr_val || var->val;
        auto* gv = _cur_ctx->create_global_value(_cur_module, sym, var, initialized, is_const);  
        _cur_module->add_gv(gv);
        return gv;
    }
    
    // create bb with name, before function define
    BasicBlock* create_bb(std::string &name, Function *func) {
        auto nbb = _cur_ctx->create_basic_block(func, name);
        func->insert_bb(nbb);
        return nbb;
    }

    BasicBlock* create_bb() {
        auto* current_func = _cur_ctx->get_current_function();
        assert(current_func != nullptr && "Cannot create BasicBlock without a current function set in context!");
        int idx = _cur_ctx->get_tmp_baisc_block_index(); // 假设有一个只用于命名而不增加内部计数的getter，或者就用主计数器
        auto bb_name = "BB" + std::to_string(idx);
        auto* nbb = _cur_ctx->create_basic_block(current_func, bb_name);

        current_func->insert_bb(nbb);
        
        return nbb;
    }
    
    // This function initially create an entry basic block , if is not lib func
    // Function* create_func(const std::string &name, Type* return_type, std::vector<Type*> args_type, std::vector<std::string> args_name, bool is_lib) {
    //     auto _cur_module = this->get_cur_module();
    //     assert(!_cur_module->find_function(name) && "Already exists Func ");
    //     auto nfunc = new Function(_cur_module, name, return_type, args_type, args_name, is_lib);
    //     _cur_module->add_func(nfunc);
        
    //     std::string entry_name = "entry";
    //     auto entry_bb = create_bb(entry_name, nfunc);
    //     // set the insert point
    //     _cur_ctx->set_current_basic_block(entry_bb);
    //     _cur_ctx->set_current_function(nfunc);

    //     nfunc->set_entry_bb(entry_bb);

    //     //then parse the arguments
    //     for(int i=0; i<args_type.size(); i++) {
    //         // create alloca Instructions
    //         auto var = create_alloca(args_name[i], args_type[i]);
    //         this->get_cur_func()->add_alias(args_name[i], var);
    //     }

    //     return nfunc;
    // }
    Function* create_func(const std::string &name, Type* return_type, std::vector<Type*> args_type, std::vector<std::string> args_name, bool is_lib) {
        auto* current_module = _cur_ctx->get_current_module();
        assert(current_module && "Current module is not set in context!");
        assert(!current_module->find_function(name) && "Function already exists!");
        // 将创建任务委托给Context
        auto* nfunc = _cur_ctx->create_function(current_module, name, return_type, args_type, args_name, is_lib);
        
        // 将创建好的Function注册到Module中
        current_module->add_func(nfunc);

        std::string entry_name = "entry";
        // create_bb 也需要被重构，假设它现在调用 context->create_basic_block
        auto* entry_bb = this->create_bb(entry_name, nfunc);
        
        // set the insert point
        _cur_ctx->set_current_basic_block(entry_bb);
        _cur_ctx->set_current_function(nfunc);

        nfunc->set_entry_bb(entry_bb);

        // then parse the arguments
        for(size_t i = 0; i < args_type.size(); i++) {
            // create alloca Instructions
            // create_alloca 也已经被重构为使用 context
            auto* var = this->create_alloca(args_name[i], args_type[i]);
            nfunc->add_alias(args_name[i], var);
        }

        return nfunc;
    }
    //flag
    

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
    // 调用Context获取唯一的int32和float类型指针
        Type* int_type = _cur_ctx->get_int32_type();
        Type* float_type = _cur_ctx->get_float_type();
        // 假设 create_cvt 也已经被重构为使用 context->create_instruction
        return this->create_cvt(v, int_type, float_type);
    }

    Instruction* cvt_to_int(Value* v) {
        Type* int_type = _cur_ctx->get_int32_type();
        Type* float_type = _cur_ctx->get_float_type();
        return this->create_cvt(v, float_type, int_type);
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
        if (val->get_type()->base_type == Float) {
            // 从Context按需获取值为0.0f的浮点常量
            ConstantValue* fzero = _cur_ctx->get_const_float(0.0f);
            // 假设 create_ne 也已经被重构
            return this->create_ne(val, fzero);
        } else {
            // 从Context按需获取值为0的整数常量
            ConstantValue* zero = _cur_ctx->get_const_int(0);
            return this->create_ne(val, zero);
        }
    }

    void enter_loop(BasicBlock* cond, BasicBlock* end) {
        this->get_cur_func()->push_break_continue_point(end, cond);
    }

    void exit_loop() {
        this->get_cur_func()->pop_break_continue_point();
    }

    void reg_lib_func(
        const std::string& name,
        Type* return_type,
        std::vector<Type*> arg_types,
        std::vector<std::string> arg_names
    ) {
        auto* current_module = _cur_ctx->get_current_module();
        assert(current_module && "Current module is not set in context!");

        // 调用Context的工厂方法来创建Function对象
        // Context现在拥有了这个对象的内存
        auto* lib_func = _cur_ctx->create_function(
            current_module,
            name,
            return_type,
            arg_types,
            arg_names,
            true // is_lib = true
        );

        // 将新创建的库函数注册到Module中
        current_module->add_lib_func(lib_func);
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
     

     
    Instruction* create_alloca(std::string name, Type* ty) {
        // ty 是要分配的元素类型, e.g., i32
        Type* elem_ty = ty;
        // alloca指令自身的类型是指针类型, e.g., i32*
        Type* ptr_ty = _cur_ctx->get_pointer_type(elem_ty);
        
        BasicBlock* parent_bb = _cur_ctx->get_current_basic_block();
        assert(parent_bb && "Current BasicBlock is not set in context!");
        unsigned alignment = _cur_ctx->var_align; // 从context获取对齐值

        auto* inst = _cur_ctx->create_instruction<AllocaInst>(ptr_ty, name, alignment, parent_bb);
        inst->set_allocated_type(elem_ty); // 设置分配的元素类型
 
        _cur_ctx->get_current_function()->get_entry_bb()->add_instr(inst);
        _cur_ctx->get_current_function()->add_allocas(inst);
        
        return inst;
    }
     
    Instruction* create_load(Type* type, Value* src) {
        BasicBlock* parent_bb = _cur_ctx->get_current_basic_block();
        assert(parent_bb && "Current BasicBlock is not set in context!");
        
        unsigned alignment = type->is_ptr() ? _cur_ctx->ptr_align : _cur_ctx->var_align;
        auto name = "%T" + std::to_string(_cur_ctx->get_tmp_var());
        
        auto* inst = _cur_ctx->create_instruction<LoadInst>(type, src, name, alignment, parent_bb);
        
        parent_bb->add_instr(inst);
        return inst;
    }
     
    Instruction* create_store(Value* dst, Value* src) {
        BasicBlock* parent_bb = _cur_ctx->get_current_basic_block();
        assert(parent_bb && "Current BasicBlock is not set in context!");
        assert(dst->get_type()->is_ptr() && "Destination of a store must be a pointer!");

        Value* final_src = src;
        
        Type* dst_ptr_type = dst->get_type();
        Type dst_element_type_obj = dst_ptr_type->get_pointer_element_type();
        Type* src_type = src->get_type();
        if (src_type->base_type != dst_element_type_obj.base_type) {
            if (dst_element_type_obj.base_type == Int) {
                std::cout << "[INFO] Implicitly converting value to Int for Store.\n";
                final_src = this->cvt_to_int(src);
            } else {
                std::cout << "[INFO] Implicitly converting value to Float for Store.\n";
                final_src = this->cvt_to_float(src);
            }
        }
        Type* void_type = _cur_ctx->get_void_type();
        unsigned alignment = dst_ptr_type->is_ptr2scalar() ? _cur_ctx->var_align : _cur_ctx->ptr_align;

        auto* inst = _cur_ctx->create_instruction<StoreInst>(
            void_type,     // Store指令的类型是void
            dst,           // 目标指针
            final_src,     // 可能是经过类型转换后的源值
            "",            // Store指令没有名字
            alignment,
            parent_bb
        );
        parent_bb->add_instr(inst);
        return inst;

    }
     
    Instruction* create_getelementptr(Type* arr_type, std::vector<Value*> indices, Value* src) {
        BasicBlock* parent_bb = _cur_ctx->get_current_basic_block();
        assert(parent_bb && "Current BasicBlock is not set in context!");

        Type* base_scalar_type = _cur_ctx->get_type(arr_type->base_type);
        Type* result_type = _cur_ctx->get_pointer_type(base_scalar_type);
        auto name = "%T" + std::to_string(_cur_ctx->get_tmp_var());

        auto* instr = _cur_ctx->create_instruction<GetElementPtrInst>(
            result_type,      
            arr_type,         
            base_scalar_type, 
            indices,
            src,
            name,
            parent_bb
        );
        
        parent_bb->add_instr(instr);
        return instr;
    }
     
    Instruction* create_binary_op(
        /* User Code Start: create_binary_op args */
        Value* lhs, Value* rhs, BinaryOp bop
        /* User Code End: create_binary_op args */
    ){
        /* User Code Start: create_binary_op */
        BasicBlock* parent_bb = _cur_ctx->get_current_basic_block();
        assert(parent_bb && "Current BasicBlock is not set in context!");

        // 类型一致化逻辑保留
        Value* n_lhs, * n_rhs;
        auto norm = this->check_lhs_rhs_all_float(lhs, rhs);
        n_lhs = norm[0];
        n_rhs = norm[1];

        auto name = "%T" + std::to_string(_cur_ctx->get_tmp_var());
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

        auto* instr = _cur_ctx->create_instruction<BinaryInst>(ty, bop, n_lhs, n_rhs, name, bit, parent_bb);
        parent_bb->add_instr(instr);
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
     
    Instruction* create_br(
        /* User Code Start: create_br args */
        BasicBlock* dst
        /* User Code End: create_br args */
    ){
        /* User Code Start: create_br */
        BasicBlock* parent_bb = _cur_ctx->get_current_basic_block();
        assert(parent_bb && "Current BasicBlock is not set in context!");
        Type* void_type = _cur_ctx->get_void_type();
    
        auto* inst = _cur_ctx->create_instruction<BranchInst>(void_type, parent_bb, dst);
        parent_bb->add_instr(inst);
        return inst;
        /* User Code End: create_br */
    }
     
    Instruction* create_cond_br(
        /* User Code Start: create_cond_br args */
        Value *cond, BasicBlock* true_bb, BasicBlock* false_bb
        /* User Code End: create_cond_br args */
    ){
        /* User Code Start: create_cond_br */
        BasicBlock* parent_bb = _cur_ctx->get_current_basic_block();
        assert(parent_bb && "Current BasicBlock is not set in context!");
        Type* void_type = _cur_ctx->get_void_type();

        auto* inst = _cur_ctx->create_instruction<CondBranchInst>(void_type, cond, parent_bb, true_bb, false_bb);
        
        parent_bb->add_instr(inst);
        return inst;
        /* User Code End: create_cond_br */
    }
     
    Instruction* create_call(
        /* User Code Start: create_call args */
        const IR::Function* func, std::vector<Value*> args
        /* User Code End: create_call args */
    ){
        /* User Code Start: create_call */
        BasicBlock* parent_bb = _cur_ctx->get_current_basic_block();
        assert(parent_bb && "Current BasicBlock is not set in context!");
        auto name = "%T" + std::to_string(_cur_ctx->get_tmp_var());
    
        auto* inst = _cur_ctx->create_instruction<CallInst>(func, args, name, parent_bb);
        
        parent_bb->add_instr(inst);
        return inst;
        /* User Code End: create_call */
    }
     
    Instruction* create_ret(
        /* User Code Start: create_ret args */
        Value* ret_val
        /* User Code End: create_ret args */
    ){
        /* User Code Start: create_ret */
        BasicBlock* parent_bb = _cur_ctx->get_current_basic_block();
        assert(parent_bb && "Current BasicBlock is not set in context!");
        // ReturnInst 的类型取决于它是否有返回值
        Type* ret_type = ret_val ? ret_val->get_type() : _cur_ctx->get_void_type();
        
        auto* instr = _cur_ctx->create_instruction<ReturnInst>(ret_val, "", parent_bb);
        
        parent_bb->add_instr(instr);
        return instr;
        /* User Code End: create_ret */
    }
     
    Instruction* create_phi(
        /* User Code Start: create_phi args */
        Type* type
        /* User Code End: create_phi args */
    ){
        /* User Code Start: create_phi */
        BasicBlock* parent_bb = _cur_ctx->get_current_basic_block();
        assert(parent_bb && "Cannot create PHI node without a current basic block.");
        auto name = "%T" + std::to_string(_cur_ctx->get_tmp_var());
        auto* instr = _cur_ctx->create_instruction<PhiInst>(type, name, parent_bb);
        // PHI指令必须放在块的开头
        parent_bb->add_instr_begin(instr);
        return instr;
        /* User Code End: create_phi */
    }
     
    Instruction* create_cvt(
        /* User Code Start: create_cvt args */
        Value* v, Type* from, Type* to
        /* User Code End: create_cvt args */
    ){
        /* User Code Start: create_cvt */
        assert(!from->is_array() && !to->is_array() && "Cannot convert array types.");
        if (*from == *to) {
            if (auto* inst = dynamic_cast<Instruction*>(v)) {
                return inst;
            }
            // 如果v不是指令，不能直接返回。这是一个逻辑漏洞，但我们暂时保留。
        }
        BasicBlock* parent_bb = _cur_ctx->get_current_basic_block();
        assert(parent_bb && "Current BasicBlock is not set in context!");
        auto name = "%T" + std::to_string(_cur_ctx->get_tmp_var());
        auto* instr = _cur_ctx->create_instruction<ConvertInst>(v, from, to, name, parent_bb);
        parent_bb->add_instr(instr);
        return instr;
        /* User Code End: create_cvt */
    }
    
private:
    Context* _cur_ctx;


    /* User Code Start: 2 */
    /* User Code End: 2 */
};
}
