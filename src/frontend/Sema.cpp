#include "frontend/Sema.hpp"
#include "common/defines.hpp"
#include "frontend/AST.hpp"
#include "frontend/SymbolTable.hpp"
#include "common/utils.hpp"
#include <algorithm>
#include <any>
#include <cassert>
#include <iterator>
#include <memory>
#include <iostream>
#include <optional>
#include <system_error>
#include <vector>
#include <map>

namespace frontend {
Sema::Sema() {
    // need to add lib functions
    auto &libfunc_map = sym_tab.lib_func_table;
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
bool already_exits_var_in_current_scope(const SymbolTable& table, const std::string name, bool is_func) {
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
        auto cur_scp = table.cur_func->scopes.cur_scope();
        auto it = cur_scp.variables.find(name);
        if(it !=cur_scp.variables.end()) return true;
    }
    return false;
}

void Sema::visit_decls(const ast::Decl& decl ) {
    auto &name = decl.ident()->identifier();
    Type t = parse_type(decl.type());

    std::optional<ConstValue> initial_val;
    std::map<int, ConstValue> *arr_val = nullptr;
    auto &initializer = decl.init();
    // 处理初值
    if(initializer) {
        // TODO 处理初值
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
    auto f_name = func.ident().identifier();
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
        // 加到当前作用域中
        sym_tab.insert(f_name, std::move(var));
    }

    visit_stmt(*func.body());
    // 推出函数作用域
    sym_tab.cur_func = nullptr;
}

void Sema::visit_stmt(const ast::Stmt& node) {
    auto stmt = &node;
    auto scope = sym_tab.cur_func->scopes;

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
    }
}

Type Sema::parse_type(const std::unique_ptr<ast::SysyType> & st) {
    Type t;
    t.is_const = false;
    auto ptr = st.get();
    // 标量
    if(auto scalar_type = dynamic_cast<ast::ScalarType*>(ptr)) {
        t.base_type = scalar_type->type();
    } else if(auto array_type = dynamic_cast<ast::ArrayType*>(ptr)){ // Deal with Array Type
        t.base_type = array_type->base_type();
        if(array_type->omit_first_dimesion()) t.dims.push_back(0);       // hidden the first dimension
        
        for(auto &dim : array_type->dimensions()) {
            auto val = eval(dim);
            t.dims.push_back(val->iv);
        }
    }
    return t;
}

std::optional<ConstValue> Sema::parse_scalar_init(const std::unique_ptr<ast::Expr> &expr,
                                                  const Type &type) {
    auto t = visit_expr(expr);
    auto opt_val = eval(expr);

    if(opt_val) 
        return implicit_cast(type.base_type, opt_val.value());
    return std::nullopt;
}

// 隐式类型转换
ConstValue Sema::implicit_cast(int d_type, ConstValue val) const {
    if(d_type == val.type) return val;

    if(d_type == Int && val.type==Float) return ConstValue(int(val.fv));
    if(d_type == Float && val.type==Int) return ConstValue(float(val.iv));

    __builtin_unreachable();
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

ConstValue eval(BinaryOp bop, const ConstValue &cv1, const ConstValue &cv2) {

}
}
