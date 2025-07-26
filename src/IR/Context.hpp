#pragma once

// This head file defines the Context, 

#include <IR/Function.hpp>
#include <IR/Module.hpp>
#include <IR/BasicBlock.hpp>
#include <IR/Instructions.hpp>
/*User Code Start . Sasara*/
#include "common/type.hpp" 
#include <list>
#include <memory>
#include <map>



//比较器
struct TypeComparator {
    bool operator()(const Type& a, const Type& b) const {
        if (a.base_type != b.base_type) return a.base_type < b.base_type;
        if (a.is_const != b.is_const) return a.is_const < b.is_const;
        return a.dims < b.dims;
    }
};
/*User Code End . Sasara*/


/**
 * @brief defines the Context
 */
class Context {
private:
    unsigned v_idx = 0;             // count the template variables
    unsigned bb_idx = 0;            // count the basic blocks

    IR::BasicBlock* cur_bb = nullptr;
    IR::Module* cur_m = nullptr;
    IR::Function* cur_func = nullptr;
    /*by Sasara*/
    std::map<int, IR::ConstantValue*> _unique_const_ints;
    std::map<float, IR::ConstantValue*> _unique_const_floats;


    std::list<std::unique_ptr<IR::ConstantValue>> _constant_storage;
    std::list<std::unique_ptr<IR::GlobalValue>> _global_value_storage;
    std::list<std::unique_ptr<IR::Instruction>> _instruction_storage;
    std::list<std::unique_ptr<IR::BasicBlock>> _basic_block_storage;
    std::list<std::unique_ptr<IR::Function>> _function_storage;
    std::list<Type> _type_storage; // 存储Type对象本身
    std::map<Type, Type*, TypeComparator> _unique_types; // 映射到存储中的对象的指针
    Type* _void_ty;
    Type* _int32_ty;
    Type* _float_ty;
    Type* _bool_ty;
            
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

    Context();
    Context(IR::Module* m);
    // by Sasara
    ~Context();
     // --- 类型管理 API ---
    Type* get_void_type() const;
    Type* get_int32_type() const;
    Type* get_float_type() const;
    Type* get_bool_type() const; 
    Type* get_type(int base_type, const std::vector<int>& dims = {});
    Type* get_pointer_type(Type* base_type);

    IR::ConstantValue* get_const_int(int value);
    IR::ConstantValue* get_const_float(float value);


    IR::GlobalValue* create_global_value(
        IR::Module* parent, 
        const std::string& name, 
        std::shared_ptr<Var> var, 
        bool is_initialized, 
        bool is_const
    );
    IR::Function* create_function(
        IR::Module* parent,
        const std::string& name,
        Type* return_type,
        const std::vector<Type*>& args_type,
        const std::vector<std::string>& args_name,
        bool is_lib
    );
    IR::BasicBlock* create_basic_block(
        IR::Function* parent,
        const std::string& name
    );
    template<typename T, typename... Args>
    T* create_instruction(Args&&... args);
};
//指令创建模板
template<typename T, typename... Args>
T* Context::create_instruction(Args&&... args) {
    auto new_inst_ptr = std::make_unique<T>(std::forward<Args>(args)...);
    T* raw_ptr = new_inst_ptr.get();
    _instruction_storage.push_back(std::move(new_inst_ptr));
    return raw_ptr;
}