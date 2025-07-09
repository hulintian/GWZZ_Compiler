#include "frontend/codegen.hpp"
#include "IR/Function.hpp"
#include "IR/GlobalValue.hpp"
#include "IR/Instructions.hpp"
#include "IR/Module.hpp"
#include "common/type.hpp"
#include "frontend/AST.hpp"
#include <cassert>
#include <memory>

namespace  frontend {

IR::Module* CodeGen::gen(const ast::CompUnits& cu) {
    for(auto& ci : cu.children()) {
        if(ci.index() == 0)  {
            auto &decl = std::get<std::unique_ptr<ast::Decl>>(ci);
            gen_gv(*decl);
        } else {
            auto &func = std::get<std::unique_ptr<ast::Func>>(ci);
            IR::Function* ifunc = gen_func(*func);
        }
    }
    return _module;
}

void CodeGen::gen_gv(const ast::Decl& decl) {
    const std::string _symbol = decl.ident()->identifier();
    assert(decl.var && "Not find the variable");
    if(decl.var)  {
        builder->create_gv(decl.var, _symbol); 
    } 
}

// TODO 把语义分析收集来的SymbolTable 翻译
//      语义分析收集到的信息在ast 的 val 里
IR::Function* CodeGen::gen_func(const ast::Func& func) {
    assert(!_module->find_function(func.ident().identifier()) && "Function is already defined.\n");
    auto &type = func.type();
    auto & func_name = func.ident().identifier();
    Type *return_type;
    if(type) {
        return_type = new Type(type->type());
    } else {
        return_type = new Type(Void);
    }

    std::vector<Type*> p_types;
    std::vector<std::string> p_names;
    for(auto &parm : func.params()) {
        auto &p_name = parm->ident().identifier();
        auto p_type = &parm->var->type;
        p_types.push_back(p_type);
        p_names.push_back(p_name);
    }

    auto nf = builder->create_func(func_name, return_type, p_types, p_names, false);

    
    // then translate the body 
    ctx->set_current_function(nf);
    auto &func_body = func.body();
    gen_func_body(*func_body);

    
    // set the insert ptr nullptr, exit func
    ctx->set_current_basic_block(nullptr);
    ctx->set_current_function(nullptr);
    return nf;
}

void CodeGen::gen_func_body(const ast::Block& block) {
    assert(this->get_cur_func() != nullptr && "not in function context\n");
    auto &children = block.children();
    for(auto &child : children) {
        if(child.index() == 0) {
            auto &stmt = std::get<std::unique_ptr<ast::Stmt>>(child);
            gen_stmt(*stmt);
        } else if(child.index() == 1) {
            auto &decl = std::get<std::unique_ptr<ast::Decl>>(child);
            gen_decl(*decl);
        }
    }
}

void CodeGen::gen_decl(const ast::Decl& decl) {
// 对于重复定义的要建一个别名表
    // gv中找，check exists same symbol in 
}

void CodeGen::gen_stmt(const ast::Stmt& stmt) {

}

IR::Instruction* gen_expr(const ast::Expr& expr) {

    return nullptr;
}

}
