#include "IR/Context.hpp"

unsigned Context::get_tmp_baisc_block_index() {
    return bb_idx++;
}

unsigned Context::get_tmp_var() {
    return v_idx++;
}

Context::Context() 
    : cur_bb(nullptr), cur_m(nullptr), cur_func(nullptr) {
    _void_ty = get_type(Void);
    _int32_ty = get_type(Int);
    _float_ty = get_type(Float);
    _bool_ty = get_type(Bool);
}
Context::Context(IR::Module* m) 
    : cur_bb(nullptr), cur_m(m), cur_func(nullptr) {
    _void_ty = get_type(Void);
    _int32_ty = get_type(Int);
    _float_ty = get_type(Float);
}
Context::~Context() {
    std::cout << "[INFO] Context destroyed. All IR objects owned by it have been freed.\n";
}
Type* Context::get_type(int base_type, const std::vector<int>& dims) {
    Type query_key(base_type);
    query_key.dims = dims;
    query_key.is_const = false; 


    auto it = _unique_types.find(query_key);
    if (it != _unique_types.end()) {
        return it->second;
    }
    //没找到创建一个新的
    _type_storage.emplace_back(base_type, dims);
    Type* new_type_ptr = &_type_storage.back();
    _unique_types[query_key] = new_type_ptr;
    
    return new_type_ptr;
}

Type* Context::get_pointer_type(Type* base_type) {
    Type pointer_type_obj = base_type->get_pointer_type();
    // 统一的 get_type 工厂方法来获取
    return get_type(pointer_type_obj.base_type, pointer_type_obj.dims);
}



IR::ConstantValue* Context::get_const_int(int value) {
    auto it = _unique_const_ints.find(value);
    if (it != _unique_const_ints.end()) {
        return it->second; // 找到了，返回缓存的指针
    }
    // 没找到，创建一个新的
    Type* ty = get_int32_type();
    ConstValue cv(value);
    auto new_const_ptr = std::make_unique<IR::ConstantValue>(ty, std::to_string(value), cv);
    IR::ConstantValue* raw_ptr = new_const_ptr.get();
    _constant_storage.push_back(std::move(new_const_ptr)); // 移交所有权
    _unique_const_ints[value] = raw_ptr; // 缓存指针  
    return raw_ptr;
}
IR::ConstantValue* Context::get_const_float(float value) {
    auto it = _unique_const_floats.find(value);
    if (it != _unique_const_floats.end()) {
        return it->second; // 找到了，返回缓存的指针
    }
    // 没找到，创建一个新的
    Type* ty = get_float_type();
    ConstValue cv(value);
    auto new_const_ptr = std::make_unique<IR::ConstantValue>(ty, std::to_string(value), cv);
    IR::ConstantValue* raw_ptr = new_const_ptr.get();
    _constant_storage.push_back(std::move(new_const_ptr)); // 移交所有权
    _unique_const_floats[value] = raw_ptr; // 缓存指针  
    return raw_ptr;
}
IR::GlobalValue* Context::create_global_value(
    IR::Module* parent, 
    const std::string& name, 
    std::shared_ptr<Var> var, 
    bool is_initialized, 
    bool is_const
) {
    auto new_gv_ptr = std::make_unique<IR::GlobalValue>(
        parent, name, var, is_initialized, is_const
    );
    IR::GlobalValue* raw_ptr = new_gv_ptr.get();
    _global_value_storage.push_back(std::move(new_gv_ptr));
    return raw_ptr;
}

IR::Function* Context::create_function(
    IR::Module* parent,
    const std::string& name,
    Type* return_type,
    const std::vector<Type*>& args_type,
    const std::vector<std::string>& args_name,
    bool is_lib
) {
    auto new_func_ptr = std::make_unique<IR::Function>(
        parent, name, return_type, args_type, args_name, is_lib
    );
    IR::Function* raw_ptr = new_func_ptr.get();
    _function_storage.push_back(std::move(new_func_ptr));
    return raw_ptr;
}

IR::BasicBlock* Context::create_basic_block(
    IR::Function* parent,
    const std::string& name
) {
    // 调用 get_tmp_baisc_block_index() 来获取唯一ID
    auto new_bb_ptr = std::make_unique<IR::BasicBlock>(
        name,
        parent,
        this->get_tmp_baisc_block_index()
    );
    IR::BasicBlock* raw_ptr = new_bb_ptr.get();
    _basic_block_storage.push_back(std::move(new_bb_ptr));
    return raw_ptr;
}

Type* Context::get_void_type() const{
    return _void_ty;
}

Type* Context::get_int32_type()const {
    return _int32_ty;
}

Type* Context::get_float_type()const {
    return _float_ty;
}
Type* Context::get_bool_type()const {
    return _bool_ty;
}