#include "frontend/codegen.hpp"
#include "IR/Function.hpp"
#include "IR/GlobalValue.hpp"
#include "IR/Instructions.hpp"
#include "IR/Module.hpp"
#include "IR/Value.hpp"
#include "common/defines.hpp"
#include "common/type.hpp"
#include "frontend/AST.hpp"
#include <cassert>
#include <memory>
#include <string>
#include <vector>

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
        if(decl.is_const()) {
            assert(decl.var->val || decl.var->arr_val);
        }
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
    std::map<std::string, Value*> old_alias;
    for(auto &child : children) {
        if(child.index() == 0) {
            auto &stmt = std::get<std::unique_ptr<ast::Stmt>>(child);
            gen_stmt(*stmt);
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
}

void CodeGen::gen_decl(const ast::Decl& decl) {

    // first create the alloca inst
    auto &name = decl.ident()->identifier();
    auto type = &decl.var->type;

    auto &alias_map = this->get_cur_func()->get_alias_map();
    auto &amc = this->get_cur_func()->get_alias_cnt_map();

    std::string new_name = name;
    if(this->get_cur_func()->has_symbol(name)) {
        new_name += std::to_string(amc[name] + 1);
    }
    auto val = builder->create_alloca(new_name, type);
    alias_map[name] = val;
    amc[name] += 1;

    // then to deal with init
    auto var = decl.var;
    assert(var && "var is nullptr\n");

    // 数组不管怎么样都来成一条线
    if(!var->type.is_array()) {
        if(var->val) {
            auto cosnt_value = new IR::ConstantValue(type, var->val->to_string(), *var->val);
            builder->create_store(type, new_name, val, cosnt_value);
        } else {
            auto &expr = std::get<std::unique_ptr<ast::Expr>>(decl.init()->value());
            auto res = gen_expr(*expr);
            builder->create_store(type, new_name, val, res);
        }
    } else {
        if(decl.init()->value().index() == 1) {
            auto &il = std::get<std::vector<std::unique_ptr<ast::Initializer>>>(decl.init()->value());
            int idx = 0;
            this->gen_initial_list(il, var->type, 0, *var->arr_val, idx);
        }
    }

}

// llvm 的 gep 要一级一级下去，没初始化的默认为0  
// 直接拉成线，计算相对位值
void CodeGen::gen_initial_list(const std::vector<std::unique_ptr<ast::Initializer>> &init_list, 
                               const Type& type,
                               int depth,
                               std::map<int, ConstValue> &arr_val,
                               int& idx) {
    // current dimesion size
    int dm_size = 1;
    if(depth > 0) {
        for(int i=depth; i < type.nr_dims(); ++i) {
            dm_size *= type.dims[i];
        }
    }
    int fill = idx + dm_size;
    for(auto &p_init : init_list) {
        auto &value = p_init->value();
        if(value.index() == 0) {
            // 
            if(arr_val.find(idx) != arr_val.end()) {
                // get the memory and then store
                auto addr = builder->create_getelementptr();
                auto const_v = builder->create_const_value(builder->get_base_type(type.base_type), arr_val[idx].to_string(), arr_val[idx]);
                // store就是个过程，名字无所谓 
                builder->create_store(builder->get_base_type(type.base_type), "", addr, const_v);
            }  else {
                auto &expr = std::get<std::unique_ptr<ast::Expr>>(value);
                auto rhs = gen_expr(*expr);
                auto addr = builder->create_getelementptr();
                builder->create_store(builder->get_base_type(type.base_type), "", addr, rhs );
            }
        } else if(value.index() == 1){
                auto &next_dim = std::get<std::vector<std::unique_ptr<ast::Initializer>>>(value);
                gen_initial_list(next_dim, type, depth+1, arr_val, idx);
        }
        idx++;
    }
    if(idx < fill) {
        idx = fill;
    }
}

void CodeGen::gen_stmt(const ast::Stmt& stmt) {

}

IR::Instruction* CodeGen::gen_expr(const ast::Expr* expr) {
    if(auto lval = dynamic_cast<const ast::LValue*>(expr)) {
        auto lsym = lval->ident().identifier();
        bool flag = this->get_cur_func()->has_symbol(lsym);
        assert(this->get_cur_func()->has_symbol(lsym));
        auto val_ptr = this->get_cur_func()->find_alias(lsym);
        return builder->create_load(&lval->var->type, val_ptr);
    } else if( auto bexpr = dynamic_cast<const ast::BinaryExpr*>(expr)) {

    } else if( auto uexpr = dynamic_cast<const ast::UnaryExpr*>(expr)) {

    } else if( auto call = dynamic_cast<const ast::Call*>(expr)) {

    }
    return nullptr;
}

}
