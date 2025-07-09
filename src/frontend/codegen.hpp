#pragma once
#include <IR/IRBuilder.hpp>

#include "IR/BasicBlock.hpp"
#include "IR/Context.hpp"
#include "IR/Function.hpp"
#include "IR/GlobalValue.hpp"
#include "IR/Module.hpp"
#include "frontend/AST.hpp"

namespace frontend {

class CodeGen {
public:
    CodeGen(){
        _module = new IR::Module;
        ctx = new Context(_module);
        builder = new IR::IRBuilder(ctx);
    }

    IR::Module* gen(const ast::CompUnits& cu);
    void gen_gv(const ast::Decl& decl);
    IR::Function* gen_func(const ast::Func& func);

    void gen_func_body(const ast::Block& block);

    void gen_block(const ast::Block& block);
    void gen_stmt(const ast::Stmt& stmt);
    void gen_decl(const ast::Decl& decl);

    IR::Instruction* gen_expr(const ast::Expr& expr);

    // this is for 
    // void gen_decl(const ast::Decl& decl);
    // void gen_stmt(const ast::Stmt& stmt);
    // void gen_while(const ast::WhileStmt& while_stmt);
    // void gen_if(const ast::IfStmt& if_stmt);

    IR::Module* _module;
    IR::IRBuilder* builder;
    Context *ctx;

    IR::Function* get_cur_func() { return ctx->get_current_function(); }
    IR::BasicBlock* get_cur_bb() { return ctx->get_current_basic_block(); }
    IR::Module* get_cur_module() { return ctx->get_current_module(); }
};

}
