#pragma once

// This head file defines the Context, 

#include "Function.hpp"
#include "Module.hpp"
#include "BasicBlock.hpp"

/**
 * @brief defines the Context
 */
class Context {
private:
    unsigned v_idx = 0;             // count the template variables
    unsigned bb_idx = 0;            // count the basic blocks

    IR::BasicBlock* cur_bb;
    IR::Module* cur_m;
    IR::Function* cur_func;
            
public:
    unsigned var_align = 4;
    unsigned ptr_align = 8;
    unsigned get_tmp_var();
    unsigned get_tmp_baisc_block_index();

    IR::BasicBlock* get_current_basic_block() { return cur_bb; }
    IR::Function* get_current_function() { return cur_func; }
    IR::Module* get_current_module() { return cur_m; }

    void set_current_basic_block(IR::BasicBlock* bb) { cur_bb = bb; }
    void set_current_function(IR::Function* func) { cur_func = func; }
    void set_current_module(IR::Module* mod) { cur_m = mod; }

    Context(){}
    Context(IR::Module* m) : cur_m(m) {}
};
