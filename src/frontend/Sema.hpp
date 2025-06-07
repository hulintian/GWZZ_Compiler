#pragma once



#include "common/defines.hpp"
#include "frontend/AST.hpp"
#include "frontend/SymbolTable.hpp"
#include <memory>
#include <optional>
#include <vector>
namespace frontend { 
 
// TODO : 类型检查 隐式类型转换 编译时求值 左值挂载
class Sema {
private:
    SymbolTable sym_tab;

    // 类型检测
    void visit_func(const ast::Func&);
    void visit_decls(const ast::Decl&);
    void visit_stmt(const ast::Stmt&);
    void visit_initialize(
            const std::vector<std::unique_ptr<ast::Initializer>> &init_list,
            const Type &type,
            int depth,
            std::map<int, ConstValue> &arr_var,
            int &index);

    bool already_exits_var_in_current_scope(const SymbolTable& table, const std::string name, bool is_func);

    // 挂载符号，把变量绑定到LValue上，IR生成时能够直接使用，符号表可以直接丢了
    void attach_symbol(const ast::LValue&); 

    // 解析类型
    std::optional<Type> visit_expr_aux(const ast::Expr*);
    std::optional<Type> visit_expr(const ast::Expr*);
    std::optional<Type> visit_expr(const std::unique_ptr<ast::Expr>& p){
        return visit_expr(p.get());
    }

    // 编译时求值（能计算的，定值）
    std::optional<ConstValue> eval(const ast::Expr*);
    std::optional<ConstValue> eval(const std::unique_ptr<ast::Expr> &p){
        return eval(p.get());
    }

    // 隐式类型转换
    ConstValue implicit_cast(int d_type, ConstValue val) const;

    std::optional<ConstValue> 
        parse_scalar_init(const std::unique_ptr<ast::Expr> &expr,
                          const Type &type);
    // 解析类型
    Type parse_type(const std::unique_ptr<ast::SysyType>&);
public:
    void visit_compUnits(const ast::CompUnits&);
    Sema();
};

ConstValue eval(BinaryOp , const ConstValue&, const ConstValue&);
bool type_compatible(const Type&, const Type&);
}
