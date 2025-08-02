#include "codegen.hpp"
#include "BasicBlock.hpp"
#include "Function.hpp"
#include "GlobalValue.hpp"
#include "Instructions.hpp"
#include "Module.hpp"
#include "Value.hpp"
#include "defines.hpp"
#include "type.hpp"
#include "utils.hpp"
#include "AST.hpp"
#include <cassert>
#include <cmath>
#include <memory>
#include <string>
#include <vector>

namespace  frontend {

void CodeGen::add_libs() {
    builder->reg_lib_func("getint", new Type(Int), {}, {});
    builder->reg_lib_func("getch", new Type(Int), {}, {});
    builder->reg_lib_func("getarray", new Type(Int), {new Type(Int, std::vector<int>{0})}, {"a"});
    builder->reg_lib_func("getfloat", new Type(Float), {}, {});
    builder->reg_lib_func("getfarray", new Type(Int), {new Type(Float, std::vector<int>{0})}, {"a"});

    builder->reg_lib_func("putint", new Type(Void), {new Type(Int)}, {"a"});
    builder->reg_lib_func("putch", new Type(Void), {new Type(Int)}, {"a"});
    builder->reg_lib_func("putarray", new Type(Void), {new Type(Int), new Type(Int, std::vector<int>{0})}, {"n", "a"});
    builder->reg_lib_func("putfloat", new Type(Void), {new Type(Float)}, {"a"});
    builder->reg_lib_func("putfarray", new Type(Void), {new Type(Int), new Type(Float, std::vector<int>{0})}, {"n", "a"});

    // 可变参数列表？
    builder->reg_lib_func("putf", new Type(Void), {new Type(Int, std::vector<int>{0})}, { "a"});
    
    builder->reg_lib_func("starttime", new Type(Void), {}, {});
    builder->reg_lib_func("stoptime", new Type(Void), {}, {});

    // 我加的
    builder->reg_lib_func("putline", new Type(Void), {}, {});
    builder->reg_lib_func("putintl", new Type(Void), {new Type(Int)}, {"a"});
}

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
    if(decl.is_const() || decl.is_const()) {
        assert(decl.var->val || decl.var->arr_val);
        builder->create_gv(decl.var, _symbol, true); 
    } else {
        builder->create_gv(decl.var, _symbol, false); 
    }
}

// TODO 把语义分析收集来的SymbolTable 翻译
//      语义分析收集到的信息在ast 的 val 里
IR::Function* CodeGen::gen_func(const ast::Func& func) {
    assert(!_module->find_function(func.ident().identifier()) && "Function is already defined.\n");
    auto &type = func.type();
    auto & func_name = func.ident().identifier();
    Type *return_type;
    if(type != nullptr) {
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

    if(this->get_cur_bb()->get_intrs().empty() || !builder->is_jump_instr(this->get_cur_bb()->get_intrs().back())) {
        builder->create_ret(nullptr);
    }
    
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

void CodeGen::gen_block(const ast::Block& block) {
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
        new_name += "@_"+std::to_string(amc[name] + 1);
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
            if(decl.init()) {
                auto &expr = std::get<std::unique_ptr<ast::Expr>>(decl.init()->value());
                auto res = gen_expr(*expr);
                builder->create_store(type, new_name, val, res);
            }
        }
    } else {
        if(decl.init() && decl.init()->value().index() == 1) {
            auto &il = std::get<std::vector<std::unique_ptr<ast::Initializer>>>(decl.init()->value());
            int idx = 0;
            this->gen_initial_list(il, var->type, 0, *var->arr_val, idx, val);
        }
    }

}

// llvm 的 gep 要一级一级下去，没初始化的默认为0  
// 直接拉成线，计算相对位值
void CodeGen::gen_initial_list(const std::vector<std::unique_ptr<ast::Initializer>> &init_list, 
                               const Type& type,
                               int depth,
                               std::map<int, ConstValue> &arr_val,
                               int& idx,
                               Value* arr_sym) {
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
                Type* nt = new Type(type);
                auto const_v = ConstValue(idx);
                // 这里是赋初值，都是知道的，所以直接给个常量行
                auto cv = builder->create_const_value(builder->get_base_type(Int), const_v.to_string(), const_v);
                auto addr = builder->create_getelementptr(nt, std::vector<Value*>{cv}, arr_sym);
                auto rhs = builder->create_const_value(builder->get_base_type(type.base_type), arr_val[idx].to_string(), arr_val[idx]);
                // store就是个过程，名字无所谓 
                builder->create_store(builder->get_base_type(type.base_type), "", addr, rhs);
            }  else {
                auto &expr = std::get<std::unique_ptr<ast::Expr>>(value);
                auto rhs = gen_expr(*expr);
                Type* nt = new Type(type);
                auto const_v = ConstValue(idx);
                auto cv = builder->create_const_value(builder->get_base_type(Int), const_v.to_string(), const_v);
                auto addr = builder->create_getelementptr(nt, std::vector<Value*>{cv}, arr_sym);
                builder->create_store(builder->get_base_type(type.base_type), "", addr, rhs );
            }
            idx++;
        } else if(value.index() == 1){
                auto &next_dim = std::get<std::vector<std::unique_ptr<ast::Initializer>>>(value);
                gen_initial_list(next_dim, type, depth+1, arr_val, idx, arr_sym);
        }
    }
    if(idx < fill) {
        idx = fill;
    }
}

void CodeGen::gen_stmt(const ast::Stmt& stmt) {
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
        builder->create_store(sym->get_type(), "",sym, rhs_val);
    } else if(auto while_stmt = dynamic_cast<const ast::WhileStmt*>(statement)) {
        gen_while(*while_stmt);
    } else if(auto if_stmt = dynamic_cast<const ast::IfStmt*>(statement)) {
        gen_if(*if_stmt);
    } else if(auto break_stmt = dynamic_cast<const ast::Break*>(statement)) {
        builder->create_br(builder->get_cur_func()->get_break_point());
        auto after = builder->create_bb();
        //this should be unreachable
        builder->set_cur_bb(after);
    } else if(auto Continue_stmt = dynamic_cast<const ast::Continue*>(statement)) {
        builder->create_br(builder->get_cur_func()->get_continue_point());
        auto after = builder->create_bb();
        builder->set_cur_bb(after);
    } else if(auto block = dynamic_cast<const ast::Block*>(statement)) {
        gen_block(*block);
    } else if(auto ret = dynamic_cast<const ast::Return*>(statement)) {
        if(auto &ret_exp  = ret->rets()) {
            auto ret_val = gen_expr(*ret_exp);
            auto func_rty = this->get_cur_func()->get_return_type();
            if( func_rty->base_type != ret_val->get_type()->base_type) {
                ret_val = builder->create_cvt(ret_val, ret_val->get_type(), func_rty);
            }
            builder->create_ret(ret_val);
        } else {
            // bool for_test = this->get_cur_func()->get_return_type()->base_type == Void;
            assert(this->get_cur_func()->get_return_type()->base_type == Void && "Non void function, but return a void value\n" );
            builder->create_ret(nullptr);
        }
    }

}

void CodeGen::gen_while(const ast::WhileStmt& ws){ 
    auto cond_bb = builder->create_bb();
    auto loop_body_bb = builder->create_bb();
    auto loop_end_bb = builder->create_bb();

    builder->create_br(cond_bb);
    builder->set_cur_bb(cond_bb);
    auto cond = this->gen_cond_expr(ws.cond().get(), loop_body_bb, loop_end_bb);
    if(cond) {
        builder->create_cond_br(cond, loop_body_bb, loop_end_bb);
    }

    builder->enter_loop(cond_bb, loop_end_bb);

    // into the loop body ,  then insert the br inst to while cond for next step
    builder->set_cur_bb(loop_body_bb);
    this->gen_stmt(*ws.body().get());
    builder->create_br(cond_bb);

    // exit the loop, set cur_bb be the while end bb 
    builder->exit_loop();
    builder->set_cur_bb(loop_end_bb);
}
void CodeGen::gen_if(const ast::IfStmt& is){ 
    auto cond_bb = builder->create_bb();
    auto then_bb = builder->create_bb();
    IR::BasicBlock* ow_bb = nullptr;
    auto end_bb = builder->create_bb();
    if(is.else_stmt() != nullptr) {
        ow_bb = builder->create_bb();
    } else {
        ow_bb = end_bb;
    }

    // jump to cond branch
    builder->create_br(cond_bb);
    builder->set_cur_bb(cond_bb);

    // the cond branchs
    auto cond = gen_cond_expr(is.cond().get(), then_bb, ow_bb);
    if(cond != nullptr) {
        builder->create_cond_br(cond, then_bb, ow_bb);
    }

    // then bb
    builder->set_cur_bb(then_bb);
    gen_stmt(*is.then().get());
    // 在当前分支结束的时候需要跳到分支结束后的那个基本块，如果是ret或br指令了就不用管
    if( this->get_cur_bb()->get_intrs().empty() || !builder->is_jump_instr(this->get_cur_bb()->get_intrs().back())) {
        builder->create_br(end_bb);
    }

    // else bb
    if(is.else_stmt() != nullptr) {
        builder->set_cur_bb(ow_bb);
        gen_stmt(*is.else_stmt().get());
        if( this->get_cur_bb()->get_intrs().empty() || !builder->is_jump_instr(this->get_cur_bb()->get_intrs().back())) {
            builder->create_br(end_bb);
        }
    }

    // if end 
    builder->set_cur_bb(end_bb);
}

Value* CodeGen::gen_cond_expr(ast::Expr* expr, IR::BasicBlock* true_bb, IR::BasicBlock* false_bb) {
    if(auto lexp = dynamic_cast<ast::BinaryExpr*>(expr)) {
        auto bop = lexp->op();
        auto &lhs = lexp->lhs();
        auto &rhs = lexp->rhs();

        if(bop == BinaryOp::And) {
            auto next_cond_bb = builder->create_bb();
            auto lcond = gen_cond_expr(lhs.get(), next_cond_bb, false_bb);
            if(lcond != nullptr) {
                builder->create_cond_br(lcond, next_cond_bb, false_bb);
            }
            this->ctx->set_current_basic_block(next_cond_bb);

            auto rcond = gen_cond_expr(rhs.get(), true_bb, false_bb);
            if(rcond != nullptr) {
                builder->create_cond_br(rcond, true_bb, false_bb);
            }

            return nullptr;
        } else if( bop == BinaryOp::Or ) {
            auto next_cond_bb = builder->create_bb();
            auto lcond = gen_cond_expr(lhs.get(), true_bb, next_cond_bb);
            if(lcond != nullptr) {
                builder->create_cond_br(lcond, true_bb, next_cond_bb);
            }
            this->ctx->set_current_basic_block(next_cond_bb);

            auto rcond = gen_cond_expr(rhs.get(), true_bb, false_bb);
            if(rcond != nullptr) {
                builder->create_cond_br(rcond, true_bb, false_bb);
            }


            return nullptr;
        } 
    }
    // 计算算术表达式
    if(auto ue = dynamic_cast<ast::UnaryExpr*>(expr)) {
        if(ue->op() == UnaryOp::Not) return gen_expr(ue);
    }
    // 如果是 cmp bop 
    if(auto be = dynamic_cast<ast::BinaryExpr*>(expr)) {
        if(is_cmp_op(be->op())) {
            return gen_expr(be);
        }
    }
    auto res = gen_expr(expr);
    return builder->create_ne_zero(res);
    // builder->create_cond_br(cond, true_bb, false_bb);
}


Value* CodeGen::gen_expr(const ast::Expr* expr) {
    if(auto fl = dynamic_cast<const ast::FloatLiteral*>(expr)) {
        auto cv = new ConstValue(fl->value());
        return builder->create_const_value(builder->get_base_type(Float), *cv);
    }
    if(auto il = dynamic_cast<const ast::IntLiteral*>(expr)) {
        auto cv = new ConstValue(il->value());
        return builder->create_const_value(builder->get_base_type(Int), *cv);
    }
    if(auto lval = dynamic_cast<const ast::LValue*>(expr)) {
        // only check the scalar type, 
        // TODO need to deal with array type
        // DONE : 没有考虑到函数传参传入的数组，其本质是指针
        // Lval as an expression is means that get the value
        // 考虑一下是要值还是要指针， 是数组且indices不完全
        auto var = lval->var;
        auto addr = gen_lval(lval);
        if(var->type.is_array() && var->type.nr_dims() > lval->indices().size()) {
            // std::cout << var->type.size() << " " << lval->indices().size();
            return addr;
        }
        return builder->create_load(builder->get_base_type(var->type.base_type), addr);
    } else if( auto bexpr = dynamic_cast<const ast::BinaryExpr*>(expr)) {
        return this->gen_binary(*bexpr);
    } else if( auto uexpr = dynamic_cast<const ast::UnaryExpr*>(expr)) {
        auto uop = uexpr->op();
        auto &od = uexpr->operand();
        auto zero = new ConstValue(0);
        switch (uop) {
            case UnaryOp::Add: return gen_expr(*od) ; break;
            case UnaryOp::Sub: return builder->create_sub(builder->create_const_value(builder->get_base_type(Int), *zero), this->gen_expr(*od)) ; break;
            // wait to impl when deal with cond expr, cmp with 0, this should return i1 type
            case UnaryOp::Not: 
                               auto opd  = this->gen_expr(*od);
                               return  builder->create_ne(opd, opd) ; break;
        }
        return nullptr; // should never go here
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
        auto instr = builder->create_call(func, args);
        return instr;
    }
    return nullptr;
}

IR::Instruction* CodeGen::gen_binary(const ast::BinaryExpr& bexpr) {
    auto bop = bexpr.op();
    auto lhs = this->gen_expr(*bexpr.lhs());
    auto rhs = this->gen_expr(*bexpr.rhs());
    // TODO check the lhs and rhs 
    return builder->create_binary_op(lhs, rhs, bop);
}

// just get the address
Value* CodeGen::gen_lval(const ast::LValue* lval) {
        // only check the scalar type, 
        // TODO 这里处理左值只要找到符号就行
        auto lsym = lval->ident().identifier();
        // bool flag = this->get_cur_func()->has_symbol(lsym);
        auto lv =  this->get_cur_func()->find_alias(lsym);
        auto gv =  this->get_cur_module()->get_gv(lsym);
        assert(this->get_cur_func()->has_symbol(lsym) || this->get_cur_module()->has_gv(lsym));
        auto var = lval->var;
        // the symbol 
        auto val_ptr = this->get_cur_func()->find_alias(lsym);
        if(val_ptr == nullptr) {
            val_ptr = this->get_cur_module()->get_gv(lsym);
        }
        assert(val_ptr);
        // 如果是数组，要计算其偏移量，传递的是指针
        if(lval->var->type.is_array()) {
            assert(var->type.nr_dims() >= lval->indices().size() &&  "The dim size is not matched.\n");
            // 维度相等，取值， lval的下标维度不等，取地址
            // calcualte the bias 
            int n = var->type.nr_dims();
            int get_dim = lval->indices().size();

            if(get_dim == 0) {
                return static_cast<Value*>(val_ptr);
            }

            std::vector<ConstValue> coefficient(n);
            coefficient[n-1] = ConstValue(1);
            
            for(int i=n-1; i>=1; i--) {
                coefficient[i-1] = ConstValue(coefficient[i].iv * var->type.dims[i]) ;
            }
            // times indices to cal the final bias 
            // if dim == 1
            // TODO need to calculate the bias 
            // n is the symbol's dim, get_dim is the lval' dim
            auto bias = gen_expr(*lval->indices()[0]);
            if(n > 1) 
                bias = builder->create_mul(bias, builder->create_const_value(builder->get_base_type(Int), coefficient[0]));

            // Type ptr_type = var->type;
            // ptr_type = ptr_type.get_lower_dim();
            for(int i=1; i<get_dim-1; i++) {
                auto lhs = gen_expr(*lval->indices()[i]);
                auto n_bias = builder->create_mul(lhs, builder->create_const_value(builder->get_base_type(Int), coefficient[i]));
                bias = builder->create_add(bias, n_bias);
                // ptr_type = ptr_type.get_lower_dim();
            }
            if(n == get_dim && n > 1) {
                auto tail = gen_expr(*lval->indices()[n-1]);
                bias = builder->create_add(bias, tail);
                // ptr_type = builder->get_base_type(var->type.base_type);
            } else if(get_dim > 1){
                auto lhs = gen_expr(*lval->indices()[get_dim-1]);
                auto n_bias = builder->create_mul(lhs, builder->create_const_value(builder->get_base_type(Int), coefficient[get_dim-1]));
                bias = builder->create_add(bias, n_bias);
                // ptr_type = ptr_type.get_lower_dim();
            }

            auto addr = builder->create_getelementptr(&var->type, {bias}, val_ptr);
        return static_cast<Value*>(addr);
            // TODO need to return the address of the lval
        }
        return static_cast<Value*>(val_ptr);
}

}
