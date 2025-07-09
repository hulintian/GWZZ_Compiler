#pragma once
#include "IR/Function.hpp"
#include "IR/Module.hpp"
#include "IR/BasicBlock.hpp"
#include "IR/Instructions.hpp"
#include <memory>
#include <string>
#include <vector> 
#include "IR/GlobalValue.hpp" 
#include "IR/Context.hpp"
#include "IR/Value.hpp"
#include "common/type.hpp"

namespace IR {
class IRBuilder {
public:
    IRBuilder(Context* ctx) : _cur_ctx(ctx)  {}

    /* User Code Start: code space 1 */
    // TODO : 在此微操
        // here is safe
    
    GlobalValue* create_gv(std::shared_ptr<Var> var, const std::string &sym) {
        auto _cur_module = this->get_cur_module();
        bool initialized = var->arr_val || var->val;
        auto gv = new GlobalValue(_cur_module, sym, var, initialized); 
        _cur_module->add_gv(gv);
        
        return gv;
    }
    
    // create bb with name
    BasicBlock* create_bb(std::string &name, Function *func) {
        auto nbb = new BasicBlock(name, func, _cur_ctx->get_tmp_baisc_block_index());
        assert(!func->find_bb(nbb->get_bb_idx()) && "Already has this BasicBlock");
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
            create_alloca(args_name[i], args_type[i]);
        }

        return nfunc;
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
        auto inst = new AllocaInst(ty, name, 4, _cur_ctx->get_current_basic_block());
        this->get_cur_bb()->add_instr(inst);
        return inst;
        /* User Code End: create_alloca */
    }
     
    Instruction* create_load(
        /* User Code Start: create_load args */
        Type* type, std::string name, Value* dst, Value* src
        /* User Code End: create_load args */
    ){
        /* User Code Start: create_load */
        auto inst = new LoadInst(type, dst, src, name, this->get_cur_bb());
        this->get_cur_bb()->add_instr(inst);
        return inst;
        /* User Code End: create_load */
    }
     
    Instruction* create_store(
        /* User Code Start: create_store args */

        /* User Code End: create_store args */
    ){
        /* User Code Start: create_store */
        return nullptr;
        /* User Code End: create_store */
    }
     
    Instruction* create_getelementptr(
        /* User Code Start: create_getelementptr args */

        /* User Code End: create_getelementptr args */
    ){
        /* User Code Start: create_getelementptr */
        return nullptr;
        /* User Code End: create_getelementptr */
    }
     
    Instruction* create_add(
        /* User Code Start: create_add args */

        /* User Code End: create_add args */
    ){
        /* User Code Start: create_add */
        return nullptr;
        /* User Code End: create_add */
    }
     
    Instruction* create_sub(
        /* User Code Start: create_sub args */

        /* User Code End: create_sub args */
    ){
        /* User Code Start: create_sub */
        return nullptr;
        /* User Code End: create_sub */
    }
     
    Instruction* create_mul(
        /* User Code Start: create_mul args */

        /* User Code End: create_mul args */
    ){
        /* User Code Start: create_mul */
        return nullptr;
        /* User Code End: create_mul */
    }
     
    Instruction* create_udiv(
        /* User Code Start: create_udiv args */

        /* User Code End: create_udiv args */
    ){
        /* User Code Start: create_udiv */
        return nullptr;
        /* User Code End: create_udiv */
    }
     
    Instruction* create_sdiv(
        /* User Code Start: create_sdiv args */

        /* User Code End: create_sdiv args */
    ){
        /* User Code Start: create_sdiv */
        return nullptr;
        /* User Code End: create_sdiv */
    }
     
    Instruction* create_urem(
        /* User Code Start: create_urem args */

        /* User Code End: create_urem args */
    ){
        /* User Code Start: create_urem */
        return nullptr;
        /* User Code End: create_urem */
    }
     
    Instruction* create_srem(
        /* User Code Start: create_srem args */

        /* User Code End: create_srem args */
    ){
        /* User Code Start: create_srem */
        return nullptr;
        /* User Code End: create_srem */
    }
     
    Instruction* create_fadd(
        /* User Code Start: create_fadd args */

        /* User Code End: create_fadd args */
    ){
        /* User Code Start: create_fadd */
        return nullptr;
        /* User Code End: create_fadd */
    }
     
    Instruction* create_fsub(
        /* User Code Start: create_fsub args */

        /* User Code End: create_fsub args */
    ){
        /* User Code Start: create_fsub */
        return nullptr;
        /* User Code End: create_fsub */
    }
     
    Instruction* create_fmul(
        /* User Code Start: create_fmul args */

        /* User Code End: create_fmul args */
    ){
        /* User Code Start: create_fmul */
        return nullptr;
        /* User Code End: create_fmul */
    }
     
    Instruction* create_fdiv(
        /* User Code Start: create_fdiv args */

        /* User Code End: create_fdiv args */
    ){
        /* User Code Start: create_fdiv */
        return nullptr;
        /* User Code End: create_fdiv */
    }
     
    Instruction* create_frem(
        /* User Code Start: create_frem args */

        /* User Code End: create_frem args */
    ){
        /* User Code Start: create_frem */
        return nullptr;
        /* User Code End: create_frem */
    }
     
    Instruction* create_and(
        /* User Code Start: create_and args */

        /* User Code End: create_and args */
    ){
        /* User Code Start: create_and */
        return nullptr;
        /* User Code End: create_and */
    }
     
    Instruction* create_or(
        /* User Code Start: create_or args */

        /* User Code End: create_or args */
    ){
        /* User Code Start: create_or */
        return nullptr;
        /* User Code End: create_or */
    }
     
    Instruction* create_xor(
        /* User Code Start: create_xor args */

        /* User Code End: create_xor args */
    ){
        /* User Code Start: create_xor */
        return nullptr;
        /* User Code End: create_xor */
    }
     
    Instruction* create_icmp(
        /* User Code Start: create_icmp args */

        /* User Code End: create_icmp args */
    ){
        /* User Code Start: create_icmp */
        return nullptr;
        /* User Code End: create_icmp */
    }
     
    Instruction* create_fcmp(
        /* User Code Start: create_fcmp args */

        /* User Code End: create_fcmp args */
    ){
        /* User Code Start: create_fcmp */
        return nullptr;
        /* User Code End: create_fcmp */
    }
     
    Instruction* create_br(
        /* User Code Start: create_br args */

        /* User Code End: create_br args */
    ){
        /* User Code Start: create_br */
        return nullptr;
        /* User Code End: create_br */
    }
     
    Instruction* create_cond_br(
        /* User Code Start: create_cond_br args */

        /* User Code End: create_cond_br args */
    ){
        /* User Code Start: create_cond_br */
        return nullptr;
        /* User Code End: create_cond_br */
    }
     
    Instruction* create_phi(
        /* User Code Start: create_phi args */

        /* User Code End: create_phi args */
    ){
        /* User Code Start: create_phi */
        return nullptr;
        /* User Code End: create_phi */
    }
    
private:
    Context* _cur_ctx;


    /* User Code Start: 2 */
    /* User Code End: 2 */
};
}
