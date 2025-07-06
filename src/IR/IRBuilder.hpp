#include "IR/Function.hpp"
#include "IR/Module.hpp"
#include "IR/BasicBlock.hpp"
#include "IR/Instructions.hpp"
#include <memory> 
#include "IR/GlobalValue.hpp" 
#include "IR/Context.hpp"

namespace IR {
class IRBuilder {
public:
    IRBuilder(Module* m, Context* ctx) : _cur_module(m), _cur_ctx(ctx)  {}

    /* User Code Start: code space 1 */
    // TODO : 在此微操
        // here is safe
    
    GlobalValue* create_gv(std::shared_ptr<Var> var, const std::string &sym) {
        bool initialized = var->arr_val || var->val;
        auto gv = new GlobalValue(_cur_module, sym, var, initialized); 
        _cur_module->add_gv(gv);
    }
    /* User Code End: code space 1 */

     
    IR::Module* get_cur_module() const {
        /* User Code Start: ::get_cur_module */
        return _cur_module;
        /* User Code End: ::get_cur_module */
    }
      
    IR::Function* get_cur_func() const {
        /* User Code Start: ::get_cur_func */
        return _cur_func;
        /* User Code End: ::get_cur_func */
    }
      
    IR::BasicBlock* get_cur_bb() const {
        /* User Code Start: ::get_cur_bb */
        return _cur_bb;
        /* User Code End: ::get_cur_bb */
    }
      
    Context* get_cur_ctx() const {
        /* User Code Start: ::get_cur_ctx */
        return _cur_ctx;
        /* User Code End: ::get_cur_ctx */
    }
     

     
    void set_cur_module( IR::Module* module ) {
        /* User Code Start: set_module */
        this->_cur_module = module;
        /* User Code End: set_module */
    }
      
    void set_cur_func( IR::Function* func ) {
        /* User Code Start: set_func */
        this->_cur_func = func;
        /* User Code End: set_func */
    }
      
    void set_cur_bb( IR::BasicBlock* bb ) {
        /* User Code Start: set_bb */
        this->_cur_bb = bb;
        /* User Code End: set_bb */
    }
      
    void set_cur_ctx( Context* ctx ) {
        /* User Code Start: set_ctx */
        this->_cur_ctx = ctx;
        /* User Code End: set_ctx */
    }
     

     
    Instruction* create_alloca(
        /* User Code Start:  */
        
    /* User Code End:  */
    ){
        /* User Code Start:  */
    /* User Code End:  */
    }
     
    Instruction* create_load(
        /* User Code Start:  */
    /* User Code End:  */
    ){
        /* User Code Start:  */
    /* User Code End:  */
    }
     
    Instruction* create_store(
        /* User Code Start:  */
    /* User Code End:  */
    ){
        /* User Code Start:  */
    /* User Code End:  */
    }
     
    Instruction* create_getelementptr(
        /* User Code Start:  */
    /* User Code End:  */
    ){
        /* User Code Start:  */
    /* User Code End:  */
    }
     
    Instruction* create_add(
        /* User Code Start:  */
    /* User Code End:  */
    ){
        /* User Code Start:  */
    /* User Code End:  */
    }
    
private:
    IR::Module* _cur_module;
    IR::Function* _cur_func;
    IR::BasicBlock* _cur_bb;
    Context* _cur_ctx;


    /* User Code Start:  */
    /* User Code End:  */
};
}