#include "frontend/codegen.hpp"
#include "IR/BasicBlock.hpp"
#include "IR/Function.hpp"
#include "IR/GlobalValue.hpp"
#include "IR/Instructions.hpp"
#include "IR/Module.hpp"
#include "IR/Value.hpp"
#include "common/defines.hpp"
#include "common/type.hpp"
#include "common/utils.hpp"
#include "frontend/AST.hpp"
#include <cassert>
#include <cmath>
#include <memory>
#include <string>
#include <vector>

namespace  frontend {

CodeGen::CodeGen() 
    : _module(std::make_unique<IR::Module>()), 
      _context(_module.get()),           
      _builder(&_context)            
{
    _context.set_current_module(_module.get()); 
    add_libs();
}
CodeGen::~CodeGen() {}
std::optional<int> CodeGen::evaluate_const_expr(const ast::Expr* expr) {
    if (const auto* int_literal = dynamic_cast<const ast::IntLiteral*>(expr)) {
        return int_literal->value();
    }
    if (const auto* binary_expr = dynamic_cast<const ast::BinaryExpr*>(expr)) {
        auto lhs_val = evaluate_const_expr(binary_expr->lhs().get());
        auto rhs_val = evaluate_const_expr(binary_expr->rhs().get());
        if (lhs_val && rhs_val) {

            switch (binary_expr->op()) {
                case BinaryOp::Add: return *lhs_val + *rhs_val;
                case BinaryOp::Sub: return *lhs_val - *rhs_val;
                case BinaryOp::Mul: return *lhs_val * *rhs_val;
                case BinaryOp::Div: return *lhs_val / *rhs_val;
                // ... 
                default: return std::nullopt; // 不支持的
            }
        }
    }
    
    // TODO: 添加对一元运算 (UnaryExpr) 和左值 (LValue) 的处理
    // 对于LValue，需要去符号表查找它是否是一个编译时常量
    if (const auto* lval = dynamic_cast<const ast::LValue*>(expr)) {
        // ... 查找符号表 ...
    }
    return std::nullopt;
}
void CodeGen::add_libs() {
    Type* int_type = _context.get_int32_type();
    Type* float_type = _context.get_float_type();
    Type* void_type = _context.get_void_type();
    
    Type* int_ptr_type = _context.get_pointer_type(int_type); 
    Type* float_ptr_type = _context.get_pointer_type(float_type);

    _builder.reg_lib_func("getint",    int_type,       {}, {});
    _builder.reg_lib_func("getch",     int_type,       {}, {});
    _builder.reg_lib_func("getarray",  int_type,       {int_ptr_type}, {"a"});
    _builder.reg_lib_func("getfloat",  float_type,     {}, {});
    _builder.reg_lib_func("getfarray", int_type,       {float_ptr_type}, {"a"});

    _builder.reg_lib_func("putint",    void_type,      {int_type}, {"a"});
    _builder.reg_lib_func("putch",     void_type,      {int_type}, {"a"});
    _builder.reg_lib_func("putarray",  void_type,      {int_type, int_ptr_type}, {"n", "a"});
    _builder.reg_lib_func("putfloat",  void_type,      {float_type}, {"a"});
    _builder.reg_lib_func("putfarray", void_type,      {int_type, float_ptr_type}, {"n", "a"});

    _builder.reg_lib_func("putf",      void_type,      {int_ptr_type}, { "a"});
    
    _builder.reg_lib_func("starttime", void_type,      {}, {});
    _builder.reg_lib_func("stoptime",  void_type,      {}, {});

    // hu 
    _builder.reg_lib_func("putline",   void_type,      {}, {});
    _builder.reg_lib_func("putintl",   void_type,      {int_type}, {"a"});
}

std::unique_ptr<IR::Module> CodeGen::gen(const ast::CompUnits& cu) {
    for (auto& ci : cu.children()) {
        if (ci.index() == 0) {
            auto& decl = std::get<std::unique_ptr<ast::Decl>>(ci);
            gen_gv(*decl);
        } else {
            auto& func = std::get<std::unique_ptr<ast::Func>>(ci);
            gen_func(*func);
        }
    }
    return std::move(_module);
}

void CodeGen::gen_gv(const ast::Decl& decl) {
    const std::string _symbol = decl.ident()->identifier();
    assert(decl.var && "Not find the variable");
    if(decl.is_const()) {
        assert(decl.var->val || decl.var->arr_val && "Constant global variable must be initialized");
        _builder.create_gv(decl.var, _symbol, true); 
    } else {
        _builder.create_gv(decl.var, _symbol, false); 
    }
}

// TODO 把语义分析收集来的SymbolTable 翻译
//      语义分析收集到的信息在ast 的 val 里
IR::Function* CodeGen::gen_func(const ast::Func& func) {
    //std::cout << "[DEBUG] ==> Entering gen_func for @" << func.ident().identifier() 
              //<< " (AST Node Address: " << &func << ")\n";
    assert(!_context.get_current_module()->find_function(func.ident().identifier()) && "Function is already defined.");
    const std::string& func_name = func.ident().identifier();
    const std::unique_ptr<ast::ScalarType>& return_type_node = func.type();
    Type* return_type_ir;
    if (return_type_node) { 
        int return_type_enum = return_type_node->type();
        if (return_type_enum == 0) { // 假设 0 -> int
            return_type_ir = _context.get_int32_type();
        } else { // 假设 1 -> float
            return_type_ir = _context.get_float_type();
        }
    } else {
        return_type_ir = _context.get_void_type();
    }

    std::vector<Type*> p_types_ir;
    std::vector<std::string> p_names;
    for (const auto& param_ast : func.params()) {
        const std::string& p_name = param_ast->ident().identifier();

        const std::unique_ptr<ast::SysyType>& param_sysy_type = param_ast->type();
        Type* p_type_ir = nullptr;

        if (auto* scalar = dynamic_cast<ast::ScalarType*>(param_sysy_type.get())) {
            p_type_ir = _context.get_type(scalar->type());
        } else if (auto* array = dynamic_cast<ast::ArrayType*>(param_sysy_type.get())) {
            std::vector<int> dims;
            if (array->omit_first_dimesion()) {
                dims.push_back(0); // 0 代表指针
            }
            for (const auto& dim_expr : array->dimensions()) {
                std::optional<int> dim_value = evaluate_const_expr(dim_expr.get());
                //数组维度必须是常量
                assert(dim_value.has_value() && "Array dimension must be a constant expression!");
                dims.push_back(*dim_value);
            }
            p_type_ir = _context.get_type(array->base_type(), dims);
        }
        assert(p_type_ir && "Failed to determine parameter IR type");
        p_types_ir.push_back(p_type_ir);
        p_names.push_back(p_name);
    }

    auto* nf = _builder.create_func(func_name, return_type_ir, p_types_ir, p_names, false);
    
    // then translate the body 
    _context.set_current_function(nf);
    gen_block(*func.body());

    if(get_cur_bb()->get_intrs().empty() || !_builder.is_jump_instr(get_cur_bb()->get_intrs().back())) {
        if (*(nf->get_return_type()) == *(_context.get_void_type())) {
            _builder.create_ret(nullptr); // void函数返回
        } else {
            //void wu ret
            std::cerr << "Warning: Non-void function @" << func_name << " does not have a return statement at the end of all paths.\n";
        }
    }
    
    // set the insert ptr nullptr, exit func
    _context.set_current_basic_block(nullptr);
    _context.set_current_function(nullptr);
    //std::cout << "[DEBUG] <== Exiting gen_func for @" << func.ident().identifier() << "\n";
    return nf;
}

// void CodeGen::gen_func_body(const ast::Block& block) {
//     assert(this->get_cur_func() != nullptr && "not in function context\n");
//     auto &children = block.children();
//     std::map<std::string, Value*> old_alias;
//     for(auto &child : children) {
//         if(child.index() == 0) {
//             auto &stmt = std::get<std::unique_ptr<ast::Stmt>>(child);
//             gen_stmt(*stmt);
//         } else if(child.index() == 1) {
//             // 在这里要做个保留现场的操作
//             // 对于重复定义的要建一个别名表
//             // first check in gv, then check in alias,but first replace in alias map
//             // gv中找，check exists same symbol in 
//             auto &decl = std::get<std::unique_ptr<ast::Decl>>(child);
//             auto &name = decl->ident()->identifier();
//             auto old_sym = this->get_cur_func()->find_alias(name);
//             gen_decl(*decl);

//             if(old_sym != nullptr) {
//                 old_alias[name] = old_sym;
//             }
//         }
//     }

//     // 恢复现场
//     for(auto [k,v] : old_alias) {
//         this->get_cur_func()->change_alias(k, v);
//     }
// }

void CodeGen::gen_block(const ast::Block& block) {
    //std::cout << "[DEBUG] ----> Entering gen_block (AST Node Address: " << &block << ")\n";
    assert(this->get_cur_func() != nullptr && "not in function context\n");
    auto &children = block.children();
    std::map<std::string, Value*> old_alias;
    for(auto &child : children) {
        if(child.index() == 0) {
            auto &stmt = std::get<std::unique_ptr<ast::Stmt>>(child);
            bool is_terminated = gen_stmt(*stmt);
            if (is_terminated) {
                break; 
            }
        } else if(child.index() == 1) {
            // 在这里要做个保留现场的操作
            // 对于重复定义的要建一个别名表
            // first check in gv, then check in alias,but first replace in alias map
            // gv中找，check exists same symbol in 
            auto &decl = std::get<std::unique_ptr<ast::Decl>>(child);
            auto &name = decl->ident()->identifier();
            auto old_sym = this->get_cur_func()->find_alias(name);
            gen_decl(*decl);

            if(old_sym != nullptr) {
                old_alias[name] = old_sym;
            }
        }
    }

    // 恢复现场
    for(auto [k,v] : old_alias) {
        this->get_cur_func()->change_alias(k, v);
    }
    //std::cout << "[DEBUG] <---- Exiting gen_block (AST Node Address: " << &block << ")\n";
}

void CodeGen::gen_decl(const ast::Decl& decl) {

    // first create the alloca inst
    const std::string& name = decl.ident()->identifier();
    const auto& ast_sysy_type = decl.type();
    Type* ir_type = nullptr;
    if (auto* scalar = dynamic_cast<ast::ScalarType*>(ast_sysy_type.get())) {
        ir_type = _context.get_type(scalar->type());
    } else if (auto* array = dynamic_cast<ast::ArrayType*>(ast_sysy_type.get())) {
        std::vector<int> dims;
        // 数组类型转换
        if (array->omit_first_dimesion()) dims.push_back(0);
        for (const auto& dim_expr : array->dimensions()) {
            auto dim_value = evaluate_const_expr(dim_expr.get());
            assert(dim_value.has_value() && "Array dimension must be constant!");
            dims.push_back(*dim_value);
        }
        ir_type = _context.get_type(array->base_type(), dims);
    }
    assert(ir_type && "Failed to create IR type for declaration");
    auto& alias_map = get_cur_func()->get_alias_map();
    auto& amc = get_cur_func()->get_alias_cnt_map();
    std::string new_name = name;
    if(this->get_cur_func()->has_symbol(name)) {
        new_name += std::to_string(amc[name] + 1);
    }
    auto* val = _builder.create_alloca(new_name, ir_type);
    alias_map[name] = val;
    amc[name] += 1;

    // then to deal with init
    if (decl.init()) {
        if (!ir_type->is_array()) { 
            auto& init_expr_ptr = std::get<std::unique_ptr<ast::Expr>>(decl.init()->value());
            Value* init_val = gen_expr(init_expr_ptr.get());

            _builder.create_store(val, init_val);

        } else { 
            if (decl.init()->value().index() == 1) { 
                auto &il = std::get<std::vector<std::unique_ptr<ast::Initializer>>>(decl.init()->value());
                int idx = 0;
                this->gen_initial_list(il, *ir_type, 0, *decl.var->arr_val, idx, val);
            }
        }
    } else if (!decl.is_const() && !ir_type->is_array()) {
        IR::ConstantValue* zero = _context.get_const_int(0); // 从Context获取0
        _builder.create_store(val, zero);
    }

}

// llvm 的 gep 要一级一级下去，没初始化的默认为0  
// 直接拉成线，计算相对位值
void CodeGen::gen_initial_list(const std::vector<std::unique_ptr<ast::Initializer>> &init_list, 
                               const Type& ir_type,
                               int depth,
                               std::map<int, ConstValue> &arr_val,
                               int& idx,
                               Value* arr_sym) {
    // current dimesion size
    int dm_size = 1;
    if (depth > 0) {
        for (size_t i = depth; i < ir_type.dims.size(); ++i) {
            dm_size *= ir_type.dims[i];
        }
    }
    int fill = idx + dm_size;
    for (const auto& p_init : init_list) {
        const auto& value = p_init->value();
        if (value.index() == 0) { // 是一个表达式 ast::Expr
            
            Value* rhs_value = nullptr; // 将要存入内存的值

            // 检查 arr_val
            if (arr_val.find(idx) != arr_val.end()) {
                // 如果是预计算的常量，直接从Context获取
                const ConstValue& const_val = arr_val[idx];
                if (const_val.type == Int) {
                    rhs_value = _context.get_const_int(const_val.iv);
                } else {
                    rhs_value = _context.get_const_float(const_val.fv);
                }
            } else {
                // 否则就从AST表达式生成
                const auto& expr = std::get<std::unique_ptr<ast::Expr>>(value);
                rhs_value = gen_expr(expr.get());
            }
            
            IR::ConstantValue* const_idx = _context.get_const_int(idx);

            // 创建 GEP 指令来计算要写入的内存地址
            // arr_sym 的类型是 T*, GEP 的结果也是 T* (这里简化为一维访问)
            // GEP(基指针, [偏移量])
            Value* addr = _builder.create_getelementptr(
                arr_sym->get_type(), // GEP指令的结果类型与基指针类型相同
                {const_idx},
                arr_sym
            );

            //创建 Store 指令
            _builder.create_store(addr, rhs_value);
            
            idx++;

        } else if (value.index() == 1) { // 是一个嵌套的列表
            const auto& next_dim_list = std::get<std::vector<std::unique_ptr<ast::Initializer>>>(value);
            gen_initial_list(next_dim_list, ir_type, depth + 1, arr_val, idx, arr_sym);
        }
    }

    // 零初始化剩余部分
    while (idx < fill) {
        IR::ConstantValue* zero = _context.get_const_int(0); 
        IR::ConstantValue* const_idx = _context.get_const_int(idx);
        Value* addr = _builder.create_getelementptr(arr_sym->get_type(), {const_idx}, arr_sym);
        _builder.create_store(addr, zero);
        idx++;
    }
}

bool CodeGen::gen_stmt(const ast::Stmt& stmt) {
    //std::cout << "[DEBUG] --------> Entering gen_stmt (AST Node Address: " << &stmt << ")\n";
    auto statement = &stmt;
    if(auto expr_stmt = dynamic_cast<const ast::ExprStmt*>(statement)) {
        auto &expr = expr_stmt->expr();
        gen_expr(*expr);
    } else if(auto assign = dynamic_cast<const ast::Assignment*>(statement)) {
        // find the memo load the value
        auto &lval = assign->lhs();
        auto sym = gen_lval(lval.get());
        auto &rhs = assign->rhs();
        auto rhs_val = gen_expr(rhs.get());
        _builder.create_store(sym, rhs_val);
    } else if(auto while_stmt = dynamic_cast<const ast::WhileStmt*>(statement)) {
        gen_while(*while_stmt);
    } else if(auto if_stmt = dynamic_cast<const ast::IfStmt*>(statement)) {
        gen_if(*if_stmt);
        return _builder.get_cur_bb() == nullptr || _builder.get_cur_bb()->get_terminator();
    } else if(auto break_stmt = dynamic_cast<const ast::Break*>(statement)) {
        _builder.create_br(_builder.get_cur_func()->get_break_point());
        //this should be unreachable
        // 后续不应再有任何代码，因为这个块已经结束
    } else if(auto Continue_stmt = dynamic_cast<const ast::Continue*>(statement)) {
        _builder.create_br(_builder.get_cur_func()->get_continue_point());
        auto after = _builder.create_bb();
        _builder.set_cur_bb(after);
    } else if(auto block = dynamic_cast<const ast::Block*>(statement)) {
        gen_block(*block);
    } else if(auto ret = dynamic_cast<const ast::Return*>(statement)) {
        if (auto& ret_exp = ret->rets()) {
            auto* ret_val = gen_expr(ret_exp.get());
            _builder.create_ret(ret_val);
        } else { // 对应 return;
            // 当前函数必须是void函数，才能执行无值的return
            assert(_builder.get_cur_func()->get_return_type()->base_type == Void && "Non-void function trying to return void.");
            _builder.create_ret(nullptr);
        }
    }
    return false;
}

void CodeGen::gen_while(const ast::WhileStmt& ws){ 
    // 获取当前的函数和基本块
    IR::Function* current_func = _builder.get_cur_func();
    IR::BasicBlock* prev_bb = _builder.get_cur_bb();

    // 条件检查块，循环体块，循环结束后的块
    IR::BasicBlock* cond_bb = _builder.create_bb();
    IR::BasicBlock* body_bb = _builder.create_bb();
    IR::BasicBlock* end_bb = _builder.create_bb();

    // 将当前块与循环的条件块连接
    prev_bb->add_instr(_builder.create_br(cond_bb));
    // 生成条件块的代码
    _builder.set_cur_bb(cond_bb);
    gen_cond_expr(ws.cond().get(), body_bb, end_bb);
    _builder.enter_loop(cond_bb, end_bb);
    // 开始生成循环体的代码
    _builder.set_cur_bb(body_bb);
    gen_stmt(*ws.body().get());
    // 检查
    IR::BasicBlock* current_body_end_bb = _builder.get_cur_bb();
    if (current_body_end_bb && !current_body_end_bb->get_terminator()) {
        _builder.create_br(cond_bb);
    }
    // 退出循环上下文
    _builder.exit_loop();
    _builder.set_cur_bb(end_bb);
}
void CodeGen::gen_if(const ast::IfStmt& is){ 
    IR::Function* current_func = _builder.get_cur_func();
    IR::BasicBlock* prev_bb = _builder.get_cur_bb();

    IR::BasicBlock* then_bb = _builder.create_bb();
    IR::BasicBlock* else_bb = nullptr; // 只有在有else分支时才创建
    IR::BasicBlock* end_bb = _builder.create_bb();
    if (is.else_stmt()) {
        else_bb = _builder.create_bb();
    }
    IR::BasicBlock* false_dest = else_bb ? else_bb : end_bb;
    // 生成条件判断和跳转
    _builder.set_cur_bb(prev_bb);
    gen_cond_expr(is.cond().get(), then_bb, false_dest);

    _builder.set_cur_bb(then_bb);
    gen_stmt(*is.then().get());

    if (_builder.get_cur_bb() && !_builder.get_cur_bb()->get_terminator()) {
        _builder.create_br(end_bb);
    }

    if (else_bb) {
        _builder.set_cur_bb(else_bb);
        gen_stmt(*is.else_stmt().get());
        // 检查并添加必要的跳转到 end_bb
        if (_builder.get_cur_bb() && !_builder.get_cur_bb()->get_terminator()) {
            _builder.create_br(end_bb);
        }
    }

    
    _builder.set_cur_bb(end_bb);
    
}

Value* CodeGen::gen_cond_expr(ast::Expr* expr, IR::BasicBlock* true_bb, IR::BasicBlock* false_bb) {
    if (auto* lexp = dynamic_cast<ast::BinaryExpr*>(expr)) {
        BinaryOp bop = lexp->op();
        
        // 短路求值 for '&&'
        if (bop == BinaryOp::And) {
            IR::BasicBlock* next_cond_bb = _builder.create_bb();
            // 生成左侧表达式的条件跳转
            gen_cond_expr(lexp->lhs().get(), next_cond_bb, false_bb);
            _builder.set_cur_bb(next_cond_bb);
            // 生成右侧表达式的条件跳转
            gen_cond_expr(lexp->rhs().get(), true_bb, false_bb);
            return nullptr;
        } 
        // 短路求值 for '||'
        else if (bop == BinaryOp::Or) {
            IR::BasicBlock* next_cond_bb = _builder.create_bb();
            gen_cond_expr(lexp->lhs().get(), true_bb, next_cond_bb);
            _builder.set_cur_bb(next_cond_bb);
            gen_cond_expr(lexp->rhs().get(), true_bb, false_bb);
            return nullptr;
        }
    }
    Value* cond_val = gen_expr(expr);
    
    if (cond_val->get_type() != _context.get_bool_type()) { 
        return _builder.create_ne_zero(cond_val);
    }
    return cond_val;
}


Value* CodeGen::gen_expr(const ast::Expr* expr) {
    if (auto* fl = dynamic_cast<const ast::FloatLiteral*>(expr)) {
        return _context.get_const_float(fl->value());
    }
    if (auto* il = dynamic_cast<const ast::IntLiteral*>(expr)) {
        return _context.get_const_int(il->value());
    }
    if(auto lval = dynamic_cast<const ast::LValue*>(expr)) {
        auto* addr = gen_lval(lval); 
        // 如果是数组类型并且没有完全解引用，那么表达式的结果就是地址本身
        if (lval->var->type.is_array() && lval->var->type.nr_dims() > lval->indices().size()) {
            return addr;
        }
        // 否则，加载地址中的值。
        Type* ptr_type = addr->get_type();
        assert(ptr_type->is_ptr() && "Address for load must be a pointer type!");
        // 使用我们之前为Type添加的get_pointer_element_type，并通过Context获取唯一实例
        Type element_type_obj = ptr_type->get_pointer_element_type();
        Type* result_type = _context.get_type(element_type_obj.base_type, element_type_obj.dims);

        return _builder.create_load(result_type, addr);
    } else if( auto bexpr = dynamic_cast<const ast::BinaryExpr*>(expr)) {
        return this->gen_binary(*bexpr);
    } else if( auto uexpr = dynamic_cast<const ast::UnaryExpr*>(expr)) {
        auto uop = uexpr->op();
        const auto& od = uexpr->operand();
        
        switch (uop) {
            case UnaryOp::Add: 
                return gen_expr(od.get()); // 正号，无操作
            
            case UnaryOp::Sub: {
                IR::ConstantValue* zero = _context.get_const_int(0); // 从Context获取0
                Value* operand_val = gen_expr(od.get());
                // 这里需要处理浮点数的情况
                return _builder.create_sub(zero, operand_val);
            }
            case UnaryOp::Not: {

                IR::ConstantValue* zero = _context.get_const_int(0); // 从Context获取0
                Value* operand_val = gen_expr(od.get());
                // 同上
                return _builder.create_eq(operand_val, zero);
            }
        }
        return nullptr;
    } else if( auto call = dynamic_cast<const ast::Call*>(expr)) {
        // 一列参数类型，一列参数
        auto func_name = call->func().identifier();
        auto func = this->get_cur_module()->get_func(func_name);
        auto func_params = func->get_params_type();
        int pn = func_params.size();
        std::vector<Value*> args;
        auto &func_args = call->args();
        for(int i=0; i < pn; i++) {
            if(func_args[i].index() == 0) {
                auto &expr = std::get<std::unique_ptr<ast::Expr>>(func_args[i]);
                auto ag = this->gen_expr(*expr);
                // assert(*ag->get_type() == *func_params[i] ); TODO should assert here
                args.push_back(ag);
            }else if(func_args[i].index() == 1){
                auto sa = std::get<ast::StringLiteral>(func_args[i]);
                // do nothing, this should give a string for output
            }
        }
        auto instr = _builder.create_call(func, args);
        return instr;
    }
    assert(false && "Unsupported expression type in CodeGen::gen_expr");
    return nullptr;
}

IR::Instruction* CodeGen::gen_binary(const ast::BinaryExpr& bexpr) {
    auto bop = bexpr.op();
    auto lhs = this->gen_expr(*bexpr.lhs());
    auto rhs = this->gen_expr(*bexpr.rhs());
    // TODO check the lhs and rhs 
    return _builder.create_binary_op(lhs, rhs, bop);
}

// just get the address
Value* CodeGen::gen_lval(const ast::LValue* lval) {
    const std::string& lsym = lval->ident().identifier();
    Value* base_ptr = get_cur_func()->find_alias(lsym);
    if (base_ptr == nullptr) {
        base_ptr = get_cur_module()->get_gv(lsym);
    }
    assert(base_ptr && "Symbol not found for LValue!");

    //没有索引，直接返回基地址
    if (lval->indices().empty()) {
        return base_ptr;
    }
    // 处理数组索引
    assert(lval->var && "LValue's var info is not attached!");
    const Type& var_type = lval->var->type; // 获取数组的完整类型
    assert(var_type.is_array() && "Indexing non-array type!");
    
    const auto& ast_indices = lval->indices();
    assert(var_type.nr_dims() >= ast_indices.size() && "Too many dimensions in index");

    // 计算维度系数 
    int n = var_type.nr_dims();
    std::vector<int> coefficients(n);
    coefficients[n - 1] = 1;
    for (int i = n - 2; i >= 0; --i) {
        // Sysy 数组维度从1开始，指针是dims[0]=0
        int dim_size = (i + 1 < var_type.dims.size()) ? var_type.dims[i + 1] : 1;
        coefficients[i] = coefficients[i + 1] * dim_size;
    }
    
    // 计算总偏移量
    Value* total_bias = nullptr;
    for (size_t i = 0; i < ast_indices.size(); ++i) {
        // 生成索引表达式的IR
        Value* index_val = gen_expr(ast_indices[i].get());
        
        IR::ConstantValue* coeff_const = _context.get_const_int(coefficients[i]);
        
        Value* scaled_index = _builder.create_mul(index_val, coeff_const);
        
        // 累加到总偏移量
        if (total_bias == nullptr) {
            total_bias = scaled_index;
        } else {
            total_bias = _builder.create_add(total_bias, scaled_index);
        }
    }
    
    assert(total_bias && "Failed to calculate array offset bias");
    return _builder.create_getelementptr(
        base_ptr->get_type(),
        {total_bias}, 
        base_ptr          
    );
}

}
