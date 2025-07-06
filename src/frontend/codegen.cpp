#include "frontend/codegen.hpp"
#include "IR/Function.hpp"
#include "IR/GlobalValue.hpp"
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
            IR::GlobalValue* gv = gen_gv(*decl);
            _module->add_gv(gv);
        } else {
            auto &func = std::get<std::unique_ptr<ast::Func>>(ci);
            IR::Function* ifunc = gen_func(*func);
            _module->add_func(ifunc);
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
//         auto t = 
//         if(auto arg_type = std::dynamic_cast<const ast::ScalarType*>(parm.))
    }
    
    
    return nullptr;
}

}
