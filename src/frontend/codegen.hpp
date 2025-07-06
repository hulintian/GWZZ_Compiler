#pragma once
#include <IR/IRBuilder.hpp>

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
        ctx = new Context();
        builder = new IR::IRBuilder(_module, ctx);
    }

    IR::Module* gen(const ast::CompUnits& cu);
    void gen_gv(const ast::Decl& decl);
    IR::Function* gen_func(const ast::Func& func);

    // this is for 
    // void gen_decl(const ast::Decl& decl);
    // void gen_stmt(const ast::Stmt& stmt);
    // void gen_while(const ast::WhileStmt& while_stmt);
    // void gen_if(const ast::IfStmt& if_stmt);

    IR::Function* cur_func;
    IR::BasicBlock* cur_bb;
    IR::Module* _module;
    IR::IRBuilder* builder;
    Context *ctx;
};

}
