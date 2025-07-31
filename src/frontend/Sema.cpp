#include "Sema.hpp"
#include "defines.hpp"
#include "type.hpp"
#include "AST.hpp"
#include "SymbolTable.hpp"
#include "utils.hpp"
#include <algorithm>
#include <cassert>
#include <iterator>
#include <memory>
#include <iostream>
#include <optional>
#include <vector>
#include <map>

namespace frontend {
Sema::Sema() {
    // need to add lib functions
    auto &funcs = sym_tab.lib_func_table;

    funcs["getint"] = {.return_type = Int, .params_type = {}, .variadic = false};
    funcs["getch"] = {.return_type = Int, .params_type = {}, .variadic = false};
    funcs["getfloat"] = {.return_type = Float, .params_type = {}, .variadic = false};
    funcs["getarray"] = {.return_type = Int,
            .params_type = {Type{Int, std::vector<int>{0}}},
            .variadic = false};
    funcs["getfarray"] = {.return_type = Int,
            .params_type = {Type{Float, std::vector<int>{0}}},
            .variadic = false};
    funcs["putint"] = {
            .return_type = std::nullopt, .params_type = {Type{Int}}, .variadic = false};
    funcs["putch"] = {
            .return_type = std::nullopt, .params_type = {Type{Int}}, .variadic = false};
    funcs["putfloat"] = {.return_type = std::nullopt,
            .params_type = {Type{Float}},
            .variadic = false};
    funcs["putarray"] = {
            .return_type = std::nullopt,
            .params_type = {Type{Int}, Type{Int, std::vector<int>{0}}},
            .variadic = false};
    funcs["putfarray"] = {
            .return_type = std::nullopt,
            .params_type = {Type{Int}, Type{Float, std::vector<int>{0}}},
            .variadic = false};
    funcs["putf"] = {.return_type = std::nullopt,
            .params_type = {Type{String}},
            .variadic = true};
    funcs["starttime"] = {
            .return_type = std::nullopt, .params_type = {}, .variadic = false};
    funcs["stoptime"] = {
            .return_type = std::nullopt, .params_type = {}, .variadic = false};

    // this is just for test, not impl in lib
    funcs["print"] = {.return_type = std::nullopt,
            .params_type = {Type{String}},
            .variadic = true};

    funcs["putintl"] = {
            .return_type = std::nullopt, .params_type = {Type{Int}}, .variadic = false};
    funcs["putline"] = {.return_type = std::nullopt, .params_type = {}, .variadic = false};
}

void Sema::visit_compUnits(const ast::CompUnits& cu )  {
    for(auto& child : cu.children()) {
        if(child.index() == 0) {
            auto &decl = std::get<std::unique_ptr<ast::Decl>>(child);
            visit_decls(*decl);
        } else {
            auto &func = std::get<std::unique_ptr<ast::Func>>(child);
            visit_func(*func);
        }
    }
}

// 检查是否已经有同名的标识符在当前作用域定义了，只要检查是否与变量重名，维护变量的表和函数的表是不同的
bool Sema::already_exits_var_in_current_scope(const SymbolTable& table, const std::string name, bool is_func) {
    if(table.cur_func == nullptr || is_func) {
        // 判断是否和全局变量重名
        // DONE 检查函数重名的，函数名与全局变量变量，函数与函数之间的重名
        auto it = table.global_variables.find(name);
        if(it != table.global_variables.end())  return true;
        // 在同一作用域内变量不能与函数重名
        auto fit = table.func_table.find(name);
        if(fit != table.func_table.end()) return true;

        // 与库函数
        auto lit = table.lib_func_table.find(name);
        if(lit != table.lib_func_table.end()) return true;
    }else {
        // 在函数中，也就是在局部作用域中，函数内部可能嵌套很多作用域
        auto &cur_scp = table.cur_func->scopes.cur_scope();
        auto it = cur_scp.variables.find(name);
        if(it !=cur_scp.variables.end()) return true;
    }
    return false;
}

void Sema::visit_decls(const ast::Decl& decl ) {
    auto &name = decl.ident()->identifier();
    Type t = parse_type(decl.type());
    t.is_const = decl.is_const();

    std::optional<ConstValue> initial_val;
    std::map<int, ConstValue> *arr_val = nullptr;
    auto &initializer = decl.init();
    // 处理初值
    if(initializer) {
        // DONE 处理初值
        auto &val = initializer->value();
        if(val.index() == 0) {          // Expr - 标量初始化
            auto &expr = std::get<std::unique_ptr<ast::Expr>>(val);
            initial_val = parse_scalar_init(expr, t);
        } else {                        // Initializer - 初始化列表
            auto &init_list = std::get<std::vector<std::unique_ptr<ast::Initializer>>>(val);

            if(!t.is_array()) {         // 非数组的列表初始化
                if(init_list.size() == 0)  {
                    initial_val = implicit_cast(t.base_type, ConstValue{0});
                } else  {
                    auto &expr = std::get<std::unique_ptr<ast::Expr>>(init_list[0]->value());
                    initial_val = parse_scalar_init(expr, t);
                    // 初始化列表超过1警告
                    if(init_list.size() != 1)  std::cerr << warn << "Scalar type variable' initial list size large than 1. \n";
                }
            } else {                    // 数组初始化
                int idx = 0;
                arr_val = new std::map<int, ConstValue>{};
                visit_initialize(init_list, t, 0, *arr_val, idx);
            }
        }
    }
    auto var = std::make_shared<Var>(std::move(t), std::move(initial_val));
    if(arr_val) {
        var->arr_val.reset(arr_val);
    }
    // decl上挂载初值
    decl.var = var;

    // 在当前作用域内检查是否已经定义过这的变量名了，不检查外面的作用域
   if(already_exits_var_in_current_scope(sym_tab, name, false)) {
       std::cerr << error << "Variale " << name << " is already defined.\n";
       assert(false);
   }
    sym_tab.insert(name, std::move(var));
}

void Sema::visit_initialize(
        const std::vector<std::unique_ptr<ast::Initializer>> &init_list,
        const Type &type,
        int depth,
        std::map<int, ConstValue> &arr_var,
        int &index) {
// TODO 
    int dim_size = 1;
    // 多维数组，初始化时当成是扁平的，m*n -> 1 * (m*n)
    if(depth > 0) {
        for(int i=depth; i < type.nr_dims(); ++i){
            dim_size *= type.dims[i];
        }
    }

    // 当前层级initializer中应该填充多少
    int padded = index + dim_size;

    for(auto &p_init : init_list) {
        auto &value = p_init->value();
        if(value.index() == 0) {                //  Expr
            auto &expr = std::get<std::unique_ptr<ast::Expr>>(value);
            if(auto val = parse_scalar_init(expr, type))
                arr_var[index] = val.value();
            ++index;
        } else {                                // 嵌套初始化列表
            auto &sub_list = std::get<std::vector<std::unique_ptr<ast::Initializer>>>(value);
            visit_initialize(sub_list, type, depth+1, arr_var, index);
        }
    }

    // 当前层没有填充满
    if(index < padded) {
        index = padded;
    }
}

void Sema::visit_func(const ast::Func& func) {
    auto &f_name = func.ident().identifier();
    // 判断函数名是否存在重名
    if(already_exits_var_in_current_scope(sym_tab, f_name, true)) {
       std::cerr << error << "Function's idnetifier " << f_name << " is already defined.\n";
       assert(false);
    }

    auto &function = sym_tab.func_table[f_name];
    sym_tab.cur_func = &function;
    auto &return_type = func.type();
    if(!return_type) {
        function.return_type = std::nullopt;
    }else {
        function.return_type = return_type->type();
    }

    for(auto &param : func.params()) {
        auto &p_name = param->ident().identifier();
        auto t = parse_type(param->type());
        function.params_type.push_back(t);
        function.params_name.push_back(p_name);

        auto var = std::make_shared<Var>(std::move(t)); // 形式参数， 没有Var只有类型
        // 挂载值
        param->var = var;
        // 形参加到当前作用域中
        sym_tab.insert(p_name, std::move(var));
    }

    visit_stmt(*func.body());
    // 退出函数作用域
    sym_tab.cur_func = nullptr;
}

void Sema::visit_stmt(const ast::Stmt& node) {
    auto stmt = &node;
    auto &scope = sym_tab.cur_func->scopes;

    // ExprStmt
    if(auto expr_stmt = dynamic_cast<const ast::ExprStmt*>(stmt)) {
        auto &expr = expr_stmt->expr();
        if(expr) visit_expr(expr);
        return ;
    }
    // Assignment
    if(auto assign = dynamic_cast<const ast::Assignment*>(stmt)) {
        auto &lhs = assign->lhs();
        auto &rhs = assign->rhs();
        auto t1 = visit_expr(lhs.get());
        auto t2 = visit_expr(rhs.get());

        // TODO 检查赋值
        if(lhs->var->type.is_const) std::cerr << error << "Assign to a const var.\n";

        if(!t1 || !t2) std::cerr << error << "Can't assign a variable use 'void' type or to assign a 'void' type.\n";

        return ;
    }
    // Return
    if (auto ret_stmt = dynamic_cast<const ast::Return*>(stmt)) { 
        auto &ret = ret_stmt->rets();
        auto &func = sym_tab.cur_func;

        // Confirm hans Return ? is the situation: "return ;""
        if(!ret && func->return_type) {
            std::cerr << error << "Not void function, need return a value.\n";
        }
        // 检查return value
        auto ty = visit_expr(ret);
        // unction returns  void
        if(!func->return_type && ty.has_value()) {
            std::cerr << error << "Function's return type is void, But returned a value.\n";
            return ;
        }
        // return an array type 
        if(ty.has_value() && ty->is_array()) {
            std::cerr << error << "Invalid return. Function can't return array value\n";
            return ;
        }
        return ;
    }
    // TODO Break
    if(auto brk_stmt = dynamic_cast<const ast::Break*>(stmt)) {
        return ;
    }
    // TODO Continue
    if(auto continue_stmt = dynamic_cast<const ast::Continue*>(stmt)) {
        return ;
    }
    // TODO WhileStmt
    if(auto while_stmt = dynamic_cast<const ast::WhileStmt*>(stmt)) {
        auto &while_cond = while_stmt->cond();
        auto &while_body = while_stmt->body();

        auto wc = visit_expr(while_cond);
        scope.enter_scope(true);
        visit_stmt(*while_body);
        scope.exit_scope();
        return ;
    }
    // TODO IfStmt
    if(auto if_stmt = dynamic_cast<const ast::IfStmt*>(stmt)) {
        auto &if_cond = if_stmt->cond();
        auto &if_then = if_stmt->then();
        auto &if_else = if_stmt->else_stmt();

        auto ic = visit_expr(if_cond);
        visit_stmt(*if_then);
        if(if_else) visit_stmt(*if_else);
        return ;
    }
    // TODO Block
    if(auto block = dynamic_cast<const ast::Block*>(stmt)) {
        scope.enter_scope();
        auto &children = block->children();
        for(auto &child : children) {
            if(child.index() == 0) {
                auto &child_ptr = std::get<std::unique_ptr<ast::Stmt>>(child);
                visit_stmt(*child_ptr);
            } else {
                auto &child_ptr = std::get<std::unique_ptr<ast::Decl>>(child);
                visit_decls(*child_ptr);
            }
        }
        scope.exit_scope();
        return;
    }
    return;
}

// 为左值挂载值
void Sema::attach_symbol(const ast::LValue& LVal)  {
    if(LVal.var) return;

    auto &name = LVal.ident().identifier();
    auto &var = sym_tab.getVar(name);
    LVal.var = var;
}

// 类型兼容性
bool type_compatible(const Type &t1, const Type &t2){
    // TODO 判断类型t1和类型t2的兼容性
    bool a1 = t1.is_array(), a2 = t2.is_array();
    if(!a1 && !a2) return true;

    if(t1.base_type != t2.base_type) return false;
    if(t1.is_ptr2scalar() && t2.nr_dims() > 1) return true;
    if(t1.nr_dims() != t2.nr_dims()) return false;

    
    for(int i=1; i < t1.nr_dims(); ++i) {
        if(t1.dims[i] != t2.dims[i]) return false;
    }
    return true;
}

// check the type of expression
std::optional<Type> Sema::visit_expr_aux(const ast::Expr* expr) {
    // Literals
    if(auto _ = dynamic_cast<const ast::IntLiteral*>(expr)) {
        return Type{Int};
    }
    if(auto _ = dynamic_cast<const ast::FloatLiteral*>(expr)) {
        return Type{Float};
    }

    // LValue expressions
    if(auto lval = dynamic_cast<const ast::LValue*>(expr)) {
        attach_symbol(*lval);
        for(auto &index_expr : lval->indices()) {
            visit_expr(index_expr);
        }
        auto &tp = lval->var->type;
        int deref_dims = lval->indices().size();

        std::vector<int> dims;
        std::copy(tp.dims.begin() + deref_dims , tp.dims.end(), std::back_inserter(dims));
        return Type{tp.base_type, std::move(dims)};
    }

    // Function calls
    if(auto call = dynamic_cast<const ast::Call*>(expr)) {
        // TODO: Check function exists and return type matches
        auto func_name = call->func().identifier();
        bool variant = false;
        std::optional<Type> ret_type;
        std::vector<Type> *p_param_type = nullptr;

        if(sym_tab.func_table.count(func_name)) {        // defined function
            auto &f = sym_tab.func_table[func_name];
            ret_type = f.return_type;
            p_param_type = &f.params_type;
        } else if(sym_tab.lib_func_table.count(func_name)) {        // defined function
            auto &lf = sym_tab.lib_func_table[func_name];
            ret_type = lf.return_type;
            p_param_type = &lf.params_type;
        } else {
            // 
            std::cerr << error << "Undefined function.\n" ;
        }

        auto &param_types = *p_param_type;
        int nr_params = param_types.size();
        int nr_args = call->args().size();

        if(!variant && nr_args != nr_params) {
            std::cerr << error << "Call function " << func_name << " expect " << nr_params << "arguments, actual get " << nr_args << " arguments.\n"; 
        }

        for(int i=0; i<nr_args; i++) {
            auto &arg = call->args()[i];
            std::optional<Type> t;
            if(arg.index() == 0) {              // argument is an expression
                auto &arg_expr = std::get<std::unique_ptr<ast::Expr>>(arg);
                t = visit_expr(arg_expr);
                if(!t.has_value()) {
                    std::cerr << error << "Void type argument.\n";
                }
            }
            // 
            if(i < nr_params) {
                if(!type_compatible(t.value(), param_types[i])) {
                    std::cerr << error << "When call function " << func_name << " argument's type is not compatible, expect " << type_string(param_types[i]) << " but get " << type_string(t.value()); 
                }
            }
        }
        return ret_type;
    }

    // Unary operators
    if(auto uexpr = dynamic_cast<const ast::UnaryExpr*>(expr)) {
        // TODO: Check operand type and determine result type
        auto uop = uexpr->op();
        auto &uoperand = uexpr->operand();
    
        auto operand_type = visit_expr(uoperand);
        if(uop == UnaryOp::Not) return Type(Int);

        return operand_type;
    }

    // Binary operators
    if(auto bexpr = dynamic_cast<const ast::BinaryExpr*>(expr)) {
        // TODO: Check operand types and determine result type
        // 没有bool类型，用int来代替， 0 false ， 1 or more true
        auto bop = bexpr->op(); 
        auto &lhs = bexpr->lhs();
        auto &rhs = bexpr->rhs();

        auto t_lhs = visit_expr(lhs);
        auto t_rhs = visit_expr(rhs);

        // 返回值，左边或者右边有一个float返回值就为float
        auto ret_type = (t_lhs.value() == Float || t_rhs.value() == Float ) ? Type(Float) : Type(Int);

        switch (bop) {
        // Logical Operators
            case BinaryOp::Eq:
            case BinaryOp::Neq:
            case BinaryOp::Lt:
            case BinaryOp::Gt:
            case BinaryOp::Leq:
            case BinaryOp::Geq:
            case BinaryOp::And:
            case BinaryOp::Or: return Type(Int);
        // Other Binary operators
            default: return ret_type;
        }
    }

    return std::nullopt;
}

// 在expr的AST上挂载表达式类型
std::optional<Type> Sema::visit_expr(const ast::Expr* expr) {
    auto t = visit_expr_aux(expr);
    expr->type = t;
    return t;
}


Type Sema::parse_type(const std::unique_ptr<ast::SysyType> & st) {
    Type t;
    t.is_const = false;
    auto ptr = st.get();
    // 标量
    if(auto scalar_type = dynamic_cast<ast::ScalarType*>(ptr)) {
        t.base_type = scalar_type->type();
    } else if(auto array_type = dynamic_cast<ast::ArrayType*>(ptr)){ // Array Type
                                                                                    
        t.base_type = array_type->base_type();
        if(array_type->omit_first_dimesion()) t.dims.push_back(0);       // hidden the first dimension
        
        for(auto &dim : array_type->dimensions()) {
            auto val = eval(dim);             // calculate the const value that array dim needs
            t.dims.push_back(val->iv);
        }
    }
    return t;
}

std::optional<ConstValue> Sema::parse_scalar_init(const std::unique_ptr<ast::Expr> &expr,
                                                  const Type &type) {
    auto t = visit_expr(expr);                      // get the type
    auto opt_val = eval(expr);                // get the value

    if(opt_val) 
        return implicit_cast(type.base_type, opt_val.value()); // if have the value, (assign the float variable with a integer number, need to cast it to float form)
    return std::nullopt;
}

// 隐式类型转换
ConstValue Sema::implicit_cast(int d_type, ConstValue val) const {
    if(d_type == val.type) return val;

    if(d_type == Int && val.type==Float) return ConstValue(int(val.fv));
    if(d_type == Float && val.type==Int) return ConstValue(float(val.iv));

    __builtin_unreachable();
}

// the binary operation
ConstValue eval(BinaryOp bop, const ConstValue &lhs, const ConstValue &rhs) {
    auto as_double = [](const ConstValue &val) -> double {
        return val.type == Int ? val.iv : val.fv;
    };
    auto as_bool = [](const ConstValue &val) -> bool {
        return val.type == Int ? bool(val.iv) : bool(val.fv);
    };
    // 左边右边有一个是float 就返回float ， 计算时全转为float，再根据type cast回去
    bool is_float = (lhs.type == Float || rhs.type == Float);

    switch (bop) {
        case BinaryOp::Add:   
        case BinaryOp::Sub: 
        case BinaryOp::Mul: 
        case BinaryOp::Div: {
                                double res = as_double(lhs), rv = as_double(rhs);
                                switch (bop) {
                                    case BinaryOp::Add: 
                                        res = res + rv;
                                        break;
                                    case BinaryOp::Sub:
                                        res = res - rv;
                                        break;
                                    case BinaryOp::Mul:
                                        res = res * rv;
                                        break;
                                    case BinaryOp::Div:
                                        if(rv == 0) {
                                            assert(false && "Divide by 0.\n");
                                        }
                                        res = res / rv;
                                        break;
                                    default:
                                        std::cerr << error << "Should not reach (When evaluating the binary operation).\n";
                                        __builtin_unreachable();
                                }
                                return is_float ? ConstValue{(float)res} : ConstValue{(int)res};
                            }
        case BinaryOp::Mod:  {
                                 assert(is_float && "Invalid operation.\n");
                                 as_bool(rhs.iv == 0 && "Divide by 0.\n");
                                 return ConstValue{lhs.iv % rhs.iv};
                             }
        case BinaryOp::Eq: 
        case BinaryOp::Neq: 
        case BinaryOp::Lt: 
        case BinaryOp::Gt: 
        case BinaryOp::Leq: 
        case BinaryOp::Geq: {
                                bool res = false;
                                double lv = as_double(lhs), rv = as_double(rhs);
                                switch (bop) {
                                    case BinaryOp::Eq:              res = (rv == lv); break;
                                    case BinaryOp::Neq:             res = (rv != lv); break;     
                                    case BinaryOp::Lt:              res = (rv < lv); break;   
                                    case BinaryOp::Gt:              res = (rv > lv); break; 
                                    case BinaryOp::Leq:             res = (rv <= lv); break; 
                                    case BinaryOp::Geq:             res = (rv >= lv); break; 
                                    default:
                                        std::cerr << error << "Should not reach (When evaluating the binary operation).\n";
                                        __builtin_unreachable();
                                }
                                return ConstValue{(int)res};
                            }
        case BinaryOp::And: 
        case BinaryOp::Or: {
                               bool res = as_bool(lhs), rv = as_bool(rhs);
                                switch (bop) {
                                    case BinaryOp::And: res = ( res && rv );        break; 
                                    case BinaryOp::Or:  res = ( res || rv );        break;
                                    default:
                                        std::cerr << error << "Should not reach (When evaluating the binary operation).\n";
                                        __builtin_unreachable();
                                }
                                return ConstValue{(int)res};
                           }
        // wait to impl
        case BinaryOp::LShr:       // shift right
        case BinaryOp::Shr:       // arithmetic shift right
        case BinaryOp::Shl:      // shift left
        default:
            __builtin_unreachable();
    }
}

// Evaluate the value of the expression at compile time
std::optional<ConstValue> Sema::eval(const ast::Expr* expr) {
    // TODO literals
    if(auto float_literal = dynamic_cast<const ast::FloatLiteral*>(expr)) {
        return ConstValue(float_literal->value());
    }
    if(auto int_literal = dynamic_cast<const ast::IntLiteral*>(expr)) {
        return ConstValue(int_literal->value());
    }
    // TODO BinaryExpr
    if(auto bexpr = dynamic_cast<const ast::BinaryExpr*>(expr)) {
        auto bop = bexpr->op();
        const auto lhs = eval(bexpr->lhs());
        const auto rhs = eval(bexpr->rhs());

        if(!lhs || !rhs) {
            return std::nullopt;
        }
        // deal with binary operators 
        return frontend::eval(bop, lhs.value(), rhs.value());
    }
    // TODO UnaryExpr
    if(auto uexpr = dynamic_cast<const ast::UnaryExpr*>(expr)) {
        auto op = uexpr->op();
        auto val = eval(uexpr->operand());
        if(!val) {
            // can evaluate at compile time
            return std::nullopt;
        }
        switch (op) {
            case UnaryOp::Add: 
                return val;
                break;
            case UnaryOp::Sub: 
                if(val->type == Int) return ConstValue(-val->iv);
                else if(val->type == Float) return ConstValue(-val->fv);
                break;
            case UnaryOp::Not:
                if(val->type == Int) return ConstValue(!val->iv);
                else if(val->type == Float) return ConstValue(!val->fv);
                break;
            default:
                // should never executed.
                std::cerr << error << "Unknow Unary Operation.\n";
        }
    }
    // TODO LVal
    if(auto lval_ptr = dynamic_cast<const ast::LValue*>(expr)) {
        attach_symbol(*lval_ptr);
        auto &var = lval_ptr->var;
        auto &type = var->type;
        if(!type.is_const) {                // not a const val, can't eval
            return std::nullopt;
        }
        if(type.is_array()) {               // deal with array type
            auto &subscripts = lval_ptr->indices();
            // array subscripts(bias) check dims is equal
            if(subscripts.size() != type.nr_dims()) {
                std::cerr << error << "not match array shape\n";
                return std::nullopt;
            }
            // 维度匹配了，高维的怎么处理？拉成一条
            auto opt_val = eval(subscripts.back());
            if(!opt_val) {      
                return std::nullopt;        // can't eavluate, need to wait variable
            }
            int index = implicit_cast(Int, opt_val.value()).iv;        // get the integer index
            int dim_size = 1;
            for(int i = subscripts.size()-2; i >= 0; i++) {
                auto opt_val = eval(subscripts[i]);
                if(!opt_val) {
                    return std::nullopt;        // can't eavluate, need to wait variable
                }
                int v = implicit_cast(Int, opt_val.value()).iv;
                dim_size *= type.dims[i+1];
                index  += dim_size * v;         // accl the bias
            }

            assert(var->arr_val && "Not find array init val");
            auto it = var->arr_val->find(index);
            if(it != var->arr_val->end()) {
                return it->second;
            } else {
                // not initialized, return 0 
                return implicit_cast(type.base_type, ConstValue{0});
            }
        } 
        return var->val;
    }
    // TODO Call can't eval at compile time
    if(auto call_ptr = dynamic_cast<const ast::Call*>(expr)) {
        return std::nullopt;
    }

}

}
