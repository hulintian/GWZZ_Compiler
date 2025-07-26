#pragma once
#include <IR/IRBuilder.hpp>
#include <memory>
#include <vector>

#include "IR/BasicBlock.hpp"
#include "IR/Context.hpp"
#include "IR/Function.hpp"
#include "IR/GlobalValue.hpp"
#include "IR/Module.hpp"
#include "IR/Value.hpp"
#include "frontend/AST.hpp"

namespace frontend {
//Changed by Sasara
class CodeGen {
private:
    std::unique_ptr<IR::Module> _module;
    Context _context;
    IR::IRBuilder _builder;
    std::optional<int> evaluate_const_expr(const ast::Expr* expr);
    //没精力重构了，只能这样防御一下 .Sasara
    //bool _already_generated = false;
    //mutable std::set<const void*> _visited_ast_nodes;
public:
    CodeGen();
    void add_libs();
    ~CodeGen();
    IR::Module* get_module() { return _module.get(); }
    Context* get_context() { return &_context; }
    IR::IRBuilder* get_builder() { return &_builder; }

    IR::Function* get_cur_func() { return _context.get_current_function(); }
    IR::BasicBlock* get_cur_bb() { return _context.get_current_basic_block(); }
    IR::Module* get_cur_module() { return _context.get_current_module(); }

    std::unique_ptr<IR::Module> gen(const ast::CompUnits& cu);
    void gen_gv(const ast::Decl& decl);
    IR::Function* gen_func(const ast::Func& func);

    void gen_func_body(const ast::Block& block);

    void gen_initial_list(const std::vector<std::unique_ptr<ast::Initializer>> &init_list, const Type& type, int depth, std::map<int, ConstValue> &arr_val, int& idx, Value* arr_sym);
    void gen_block(const ast::Block& block);
    bool gen_stmt(const ast::Stmt& stmt);

    void gen_while(const ast::WhileStmt& ws);
    void gen_if(const ast::IfStmt& is);
    void gen_decl(const ast::Decl& decl);

    Value* gen_cond_expr(ast::Expr* expr, IR::BasicBlock* true_bb, IR::BasicBlock* false_bb);

    Value* gen_expr(const ast::Expr* expr);
    Value* gen_expr(const ast::Expr& expr) {
        return gen_expr(&expr);
    }

    Value* gen_lval(const ast::LValue* lval);

    IR::Instruction* gen_binary(const ast::BinaryExpr& bexpr);

    // maintain the contexts
};

}
