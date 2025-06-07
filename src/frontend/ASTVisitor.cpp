#include "common/defines.hpp"
#include "common/type.hpp"
#include "frontend/AST.hpp"
#include <any>
#include <cassert>
#include <future>
#include <memory>
#include <vector>
#include "frontend/ASTVisitor.h"

using namespace frontend;
using namespace ast;

std::any ASTVisitor::visitCompUnits(Sysy22Parser::CompUnitsContext *context) { 
    // std::cout << "Visit in CompUnits" << std::endl;
    std::vector<CompUnits::Child>  children;
    for(auto ci : context->compUnit()) {
        // For declaration
        if(auto decl = ci->decl()) {
            // use accept function to recursicely find the decl nodes, use vector is because in a declaration can decl multiple vars. 
            auto const decls = std::any_cast<std::shared_ptr<std::vector<Decl*>>>(decl->accept(this));
            for(auto d : *decls) {
                children.emplace_back(std::unique_ptr<Decl>(d));
            }
        }
        // For function
        else if(auto* _func = ci->funcDef()) {
            auto const func = std::any_cast<Func*>(_func->accept(this));
            children.emplace_back(std::unique_ptr<Func>(func));
        }
        // For not match
        else {
            assert(false), "Error in visit CompUnits";
        }
    }
    auto compUnits = new CompUnits(std::move(children));
    _compUnits.reset(compUnits);
    return compUnits;
}

// TODO Need to return the Decl node vector
// info needs 
// Type, is_const, ident, inti_val
std::any ASTVisitor::visitConstDecl(Sysy22Parser::ConstDeclContext *context) { 
    // std::cout << "Visit in const Decl" << std::endl;
    std::vector<Decl*> rets;
    auto const b_type = std::any_cast<ScalarType*>(context->bType()->accept(this));
    std::unique_ptr<ScalarType> base_type(b_type);

    for(auto def : context->constDef()) {
        std::unique_ptr<Ident> ident = std::make_unique<Ident>(def->Ident()->getText()) ;
        auto dims = this->visitDimensions(def->exp());
        std::unique_ptr<SysyType> type;
        if(dims.empty()) { // is scalar type
            type = std::make_unique<ScalarType>(*base_type);
        } else { // is array type
            type = std::make_unique<ArrayType>(*base_type, std::move(dims), false);
        }
        auto const init_new = std::any_cast<Initializer*>(def->initVal()->accept(this));
        std::unique_ptr<Initializer> init(init_new);
        rets.push_back(new Decl(std::move(type), true, std::move(ident), std::move(init)));
    }

    return std::make_shared<std::vector<Decl*>>(std::move(rets));
}

std::any ASTVisitor::visitInt(Sysy22Parser::IntContext *context) { 
    return new ScalarType(Int);
}

std::any ASTVisitor::visitFloat(Sysy22Parser::FloatContext *context) { 
    return new ScalarType(Float);
}

std::any ASTVisitor::visitVarDecl(Sysy22Parser::VarDeclContext *context) { 
    // std::cout << "Visit in Decl" << std::endl;
    std::vector<Decl*> rets;
    auto const b_type = std::any_cast<ScalarType*>(context->bType()->accept(this));
    std::unique_ptr<ScalarType> base_type(b_type);

    for(auto def : context->varDef()) {
        std::unique_ptr<Ident> ident = std::make_unique<Ident>(def->Ident()->getText());
        auto dims = this->visitDimensions(def->exp());
        std::unique_ptr<SysyType> type;
        if(dims.empty()) {
            type = std::make_unique<ScalarType>(*base_type);
        } else {
            type = std::make_unique<ArrayType>(*base_type, std::move(dims), false);
        }
        std::unique_ptr<Initializer> init;
        if(auto init_ptr = def->initVal() ){
            auto init_new = std::any_cast<Initializer*>(init_ptr->accept(this));
            init.reset(init_new);
        }
        rets.push_back(new Decl(std::move(type), true, std::move(ident), std::move(init)));
    }
    return std::make_shared<std::vector<Decl*>>(rets);
}

std::any ASTVisitor::visitInit(Sysy22Parser::InitContext *context) { 
    auto exp_new = std::any_cast<Expr*>(context->exp()->accept(this));
    std::unique_ptr<Expr>  expr(exp_new);
    return new Initializer(std::move(expr));
}

std::any ASTVisitor::visitInitList(Sysy22Parser::InitListContext *context) { 
    std::vector<std::unique_ptr<Initializer>> initList;
    auto init_list = context->initVal();
    for(auto il : init_list) {
        auto const v = std::any_cast<Initializer*>(il->accept(this));
        initList.emplace_back(v);
    }
    return new Initializer(std::move(initList));
}

// need type, idnet, param, body
std::any ASTVisitor::visitFuncDef(Sysy22Parser::FuncDefContext *context) { 
    // std::cout << "Visit in Func" << std::endl;
    auto const type_new = std::any_cast<ScalarType*>(context->funcType()->accept(this));
    std::unique_ptr<ScalarType> type(type_new);
    Ident ident(context->Ident()->getText(), false);
    std::vector<std::unique_ptr<Param>> params;
    if(auto p = context->funcFParams()) {
        for(auto p_new : p->funcFParam()) {
            auto const param = std::any_cast<Param*>(p_new->accept(this));
            params.emplace_back(param);
        }
    }
    auto const body_ptr = std::any_cast<Block*>(context->block()->accept(this));
    std::unique_ptr<Block> body(body_ptr);
    return new Func(std::move(type), ident, std::move(params), std::move(body));
}

std::any ASTVisitor::visitVoid(Sysy22Parser::VoidContext *context) { 
    return static_cast<ScalarType*>(nullptr);  // use nullptr to represent void type
}

std::any ASTVisitor::visitScalarParam(Sysy22Parser::ScalarParamContext *context) { 
    auto const type_ptr = std::any_cast<ScalarType*>(context->bType()->accept(this));
    std::unique_ptr<ScalarType> type(type_ptr);
    Ident id(context->Ident()->getText());
    return new Param(id, std::move(type));
}

std::any ASTVisitor::visitArrayParam(Sysy22Parser::ArrayParamContext *context) { 
    auto const type_ptr = std::any_cast<ScalarType*>(context->bType()->accept(this));
    std::unique_ptr<ScalarType> btype(type_ptr);
    Ident id(context->Ident()->getText());
    auto dims = this->visitDimensions(context->exp());
    std::unique_ptr<SysyType> type(new ArrayType(*btype, std::move(dims), true));
    return new Param(id, std::move(type));
}

std::any ASTVisitor::visitBlock(Sysy22Parser::BlockContext *context) { 
    std::vector<Block::child> children;
    for(auto it : context->blockItem()) {
        if(auto decl = it->decl()) {
            auto const defs = std::any_cast<std::shared_ptr<std::vector<Decl*>>>(decl->accept(this));
            for(auto d : *defs) {
                children.emplace_back(std::unique_ptr<Decl>(d));
            }
        } else if(auto stmt_ptr = it->stmt()) {
            auto const stmt = std::any_cast<Stmt*>(stmt_ptr->accept(this));
            children.emplace_back(std::unique_ptr<Stmt>(stmt));
        } else {
            assert(false && "Error in visitBlock");
        }
    }
    return new Block(std::move(children));
}

std::any ASTVisitor::visitAssignment(Sysy22Parser::AssignmentContext *context) { 
    auto const lhs_ptr = std::any_cast<LValue*>(context->lVal()->accept(this));
    std::unique_ptr<LValue> lhs(lhs_ptr);
    auto const rhs_ptr = std::any_cast<Expr*>(context->exp()->accept(this));
    std::unique_ptr<Expr> rhs(rhs_ptr);
    auto ret = new Assignment(std::move(lhs), std::move(rhs));
    return static_cast<Stmt*>(ret);
}

std::any ASTVisitor::visitExprStmt(Sysy22Parser::ExprStmtContext *context) { 
    std::unique_ptr<Expr> expr;
    if(auto expr_ptr = context->exp()) {
        expr.reset(std::any_cast<Expr*>(expr_ptr->accept(this)));
    }
    auto const ret = new ExprStmt(std::move(expr));
    return static_cast<Stmt*>(ret);
}

std::any ASTVisitor::visitBlockStmt(Sysy22Parser::BlockStmtContext *context) { 
    auto const ret = std::any_cast<Block*>(context->block()->accept(this));
    return static_cast<Stmt*>(ret);
}

std::any ASTVisitor::visitIfElse(Sysy22Parser::IfElseContext *context) { 
    // condition, then, (else)
    auto const cond_ptr = std::any_cast<Expr*>(context->cond()->accept(this));
    std::unique_ptr<Expr> cond(cond_ptr);
    auto const then_ptr = std::any_cast<Stmt*>(context->stmt(0)->accept(this));
    std::unique_ptr<Stmt> then(then_ptr);
    std::unique_ptr<Stmt> _else;
    if(auto const else_ptr = context->stmt(1)) {
        _else.reset(std::any_cast<Stmt*>(else_ptr->accept(this)));
    }
    auto ret = new IfStmt(std::move(cond), std::move(then), std::move(_else));
    return static_cast<Stmt*>(ret);
}

std::any ASTVisitor::visitWhile(Sysy22Parser::WhileContext *context) { 
    auto const cond_ptr = std::any_cast<Expr*>(context->cond()->accept(this));
    std::unique_ptr<Expr> cond(cond_ptr);
    auto const body_ptr = std::any_cast<Stmt*>(context->stmt()->accept(this));
    std::unique_ptr<Stmt> body(body_ptr);
    auto ret = new WhileStmt(std::move(cond), std::move(body));
    return static_cast<Stmt*>(ret);
}

std::any ASTVisitor::visitBreak(Sysy22Parser::BreakContext *context) { 
    return static_cast<Stmt*>(new Break());
}

std::any ASTVisitor::visitContinue(Sysy22Parser::ContinueContext *context) { 
    return static_cast<Stmt*>(new Continue());
}

std::any ASTVisitor::visitReturn(Sysy22Parser::ReturnContext *context) { 
    std::unique_ptr<Expr> ret_exp;
    if(auto ret_ptr = context->exp()) {
        ret_exp.reset(std::any_cast<Expr*>(ret_ptr->accept(this)));
    }
    auto ret = new Return(std::move(ret_exp));
    return static_cast<Stmt*>(ret);
}

std::any ASTVisitor::visitLVal(Sysy22Parser::LValContext *context) { 
    Ident id(context->Ident()->getText());
    std::vector<std::unique_ptr<Expr>> indices;

    for(auto ids_ptr : context->exp()) {
        indices.emplace_back(std::any_cast<Expr*>(ids_ptr->accept(this)));
    }
    return new LValue(id, std::move(indices));
}

std::any ASTVisitor::visitPrimaryExp_(Sysy22Parser::PrimaryExp_Context *context) { 
    // expr closed by () or number 
    if(context->number()) {
        return context->number()->accept(this);
    } else {
        assert(context->exp() && "Error in visitPrimaryExp_") ;
        return context->exp()->accept(this);
    }
} 

std::any ASTVisitor::visitLValExpr(Sysy22Parser::LValExprContext *context) { 
    auto const ret = std::any_cast<LValue*>(context->lVal()->accept(this));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitDecConst(Sysy22Parser::DecConstContext *context) { 
    return int(std::stoll(context->getText(), nullptr, 10));
}

std::any ASTVisitor::visitHexConst(Sysy22Parser::HexConstContext *context) { 
    // Parse hex string (starts with 0x) as base 16
    return int(std::stoll(context->getText(), nullptr, 16));
}

std::any ASTVisitor::visitOctConst(Sysy22Parser::OctConstContext *context) { 
    // Parse octal string (starts with 0) as base 8
    return int(std::stoll(context->getText(), nullptr, 8));
}

std::any ASTVisitor::visitDecFloatConst(Sysy22Parser::DecFloatConstContext *context) { 
    return std::stof(context->getText());
}

std::any ASTVisitor::visitHexFloatConst(Sysy22Parser::HexFloatConstContext *context)  {
    return std::stof(context->getText());
}
 

std::any ASTVisitor::visitCall(Sysy22Parser::CallContext *context) { 
    Ident id(context->Ident()->getText(), false);
    std::vector<Call::Argument> args;
    auto args_ctx = context->funcRParams();
    if(args_ctx) {
        for(auto a : args_ctx->funcRParam()) {
            if(auto exp = a->exp()) {
                auto const arg = std::any_cast<Expr*>(exp->accept(this));
                args.emplace_back(std::unique_ptr<Expr>(arg));
            }else if(auto str = a->stringConst()) {
                auto const s = std::any_cast<std::shared_ptr<std::string>>(str->accept(this));
                auto sl = new StringLiteral(*s);
                args.emplace_back(*sl);
            }
        }
    }
    unsigned line = context->getStart()->getLine();
    auto const ret = new Call(id, std::move(args), line);
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitUnaryAdd(Sysy22Parser::UnaryAddContext *context) { 
    UnaryOp uop = UnaryOp::Add;
    auto const operand = std::any_cast<Expr*>(context->unaryExp()->accept(this));
    auto ret = new UnaryExpr(uop, std::unique_ptr<Expr>(operand));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitUnarySub(Sysy22Parser::UnarySubContext *context) { 
    UnaryOp uop = UnaryOp::Sub;
    auto const operand = std::any_cast<Expr*>(context->unaryExp()->accept(this));
    auto ret = new UnaryExpr(uop, std::unique_ptr<Expr>(operand));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitNot(Sysy22Parser::NotContext *context) { 
    UnaryOp uop = UnaryOp::Not;
    auto const operand = std::any_cast<Expr*>(context->unaryExp()->accept(this));
    auto ret = new UnaryExpr(uop, std::unique_ptr<Expr>(operand));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitStringConst(Sysy22Parser::StringConstContext *context) { 
  return std::make_shared<std::string>(context->getText());
}

std::any ASTVisitor::visitDiv(Sysy22Parser::DivContext *context) { 
    BinaryOp bop = BinaryOp::Div;
    auto const lhs_ptr = std::any_cast<Expr*>(context->mulExp()->accept(this));
    auto const rhs_ptr = std::any_cast<Expr*>(context->unaryExp()->accept(this));
    auto const ret = new BinaryExpr(bop, std::unique_ptr<Expr>(lhs_ptr), std::unique_ptr<Expr>(rhs_ptr));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitMod(Sysy22Parser::ModContext *context) { 
    BinaryOp bop = BinaryOp::Mod;
    auto const lhs_ptr = std::any_cast<Expr*>(context->mulExp()->accept(this));
    auto const rhs_ptr = std::any_cast<Expr*>(context->unaryExp()->accept(this));
    auto const ret = new BinaryExpr(bop, std::unique_ptr<Expr>(lhs_ptr), std::unique_ptr<Expr>(rhs_ptr));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitMul(Sysy22Parser::MulContext *context) { 
    BinaryOp bop = BinaryOp::Mul;
    auto const lhs_ptr = std::any_cast<Expr*>(context->mulExp()->accept(this));
    auto const rhs_ptr = std::any_cast<Expr*>(context->unaryExp()->accept(this));
    auto const ret = new BinaryExpr(bop, std::unique_ptr<Expr>(lhs_ptr), std::unique_ptr<Expr>(rhs_ptr));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitAdd(Sysy22Parser::AddContext *context) { 
    BinaryOp bop = BinaryOp::Add;
    auto const lhs_ptr = std::any_cast<Expr*>(context->addExp()->accept(this));
    auto const rhs_ptr = std::any_cast<Expr*>(context->mulExp()->accept(this));
    auto const ret = new BinaryExpr(bop, std::unique_ptr<Expr>(lhs_ptr), std::unique_ptr<Expr>(rhs_ptr));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitSub(Sysy22Parser::SubContext *context) { 
    BinaryOp bop = BinaryOp::Sub;
    auto const lhs_ptr = std::any_cast<Expr*>(context->addExp()->accept(this));
    auto const rhs_ptr = std::any_cast<Expr*>(context->mulExp()->accept(this));
    auto const ret = new BinaryExpr(bop, std::unique_ptr<Expr>(lhs_ptr), std::unique_ptr<Expr>(rhs_ptr));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitGeq(Sysy22Parser::GeqContext *context) { 
    BinaryOp bop = BinaryOp::Geq;
    auto const lhs_ptr = std::any_cast<Expr*>(context->relExp()->accept(this));
    auto const rhs_ptr = std::any_cast<Expr*>(context->addExp()->accept(this));
    auto const ret = new BinaryExpr(bop, std::unique_ptr<Expr>(lhs_ptr), std::unique_ptr<Expr>(rhs_ptr));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitLt(Sysy22Parser::LtContext *context) { 
    BinaryOp bop = BinaryOp::Lt;
    auto const lhs_ptr = std::any_cast<Expr*>(context->relExp()->accept(this));
    auto const rhs_ptr = std::any_cast<Expr*>(context->addExp()->accept(this));
    auto const ret = new BinaryExpr(bop, std::unique_ptr<Expr>(lhs_ptr), std::unique_ptr<Expr>(rhs_ptr));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitLeq(Sysy22Parser::LeqContext *context) { 
    BinaryOp bop = BinaryOp::Leq;
    auto const lhs_ptr = std::any_cast<Expr*>(context->relExp()->accept(this));
    auto const rhs_ptr = std::any_cast<Expr*>(context->addExp()->accept(this));
    auto const ret = new BinaryExpr(bop, std::unique_ptr<Expr>(lhs_ptr), std::unique_ptr<Expr>(rhs_ptr));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitGt(Sysy22Parser::GtContext *context) { 
    BinaryOp bop = BinaryOp::Gt;
    auto const lhs_ptr = std::any_cast<Expr*>(context->relExp()->accept(this));
    auto const rhs_ptr = std::any_cast<Expr*>(context->addExp()->accept(this));
    auto const ret = new BinaryExpr(bop, std::unique_ptr<Expr>(lhs_ptr), std::unique_ptr<Expr>(rhs_ptr));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitNeq(Sysy22Parser::NeqContext *context) { 
    BinaryOp bop = BinaryOp::Neq;
    auto const lhs_ptr = std::any_cast<Expr*>(context->eqExp()->accept(this));
    auto const rhs_ptr = std::any_cast<Expr*>(context->relExp()->accept(this));
    auto const ret = new BinaryExpr(bop, std::unique_ptr<Expr>(lhs_ptr), std::unique_ptr<Expr>(rhs_ptr));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitEq(Sysy22Parser::EqContext *context) { 
    BinaryOp bop = BinaryOp::Eq;
    auto const lhs_ptr = std::any_cast<Expr*>(context->eqExp()->accept(this));
    auto const rhs_ptr = std::any_cast<Expr*>(context->relExp()->accept(this));
    auto const ret = new BinaryExpr(bop, std::unique_ptr<Expr>(lhs_ptr), std::unique_ptr<Expr>(rhs_ptr));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitAnd(Sysy22Parser::AndContext *context) { 
    BinaryOp bop = BinaryOp::And;
    auto const lhs_ptr = std::any_cast<Expr*>(context->lAndExp()->accept(this));
    auto const rhs_ptr = std::any_cast<Expr*>(context->eqExp()->accept(this));
    auto const ret = new BinaryExpr(bop, std::unique_ptr<Expr>(lhs_ptr), std::unique_ptr<Expr>(rhs_ptr));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitOr(Sysy22Parser::OrContext *context) { 
    BinaryOp bop = BinaryOp::Or;
    auto const lhs_ptr = std::any_cast<Expr*>(context->lOrExp()->accept(this));
    auto const rhs_ptr = std::any_cast<Expr*>(context->lAndExp()->accept(this));
    auto const ret = new BinaryExpr(bop, std::unique_ptr<Expr>(lhs_ptr), std::unique_ptr<Expr>(rhs_ptr));
    return static_cast<Expr*>(ret);
}

std::any ASTVisitor::visitNumber(Sysy22Parser::NumberContext *context) { 
    if(auto literal = context->intConst()) {
        auto l = std::any_cast<IntLiteral::Value>(literal->accept(this));
        auto ret = new IntLiteral(l);
        return static_cast<Expr*>(ret);
    }else if(auto literal = context->floatConst()) {
        auto l = std::any_cast<FloatLiteral::Value>(literal->accept(this));
        auto ret = new FloatLiteral(l);
        return static_cast<Expr*>(ret);
    }
    assert(false && "Error in visitNumber");
    return static_cast<Expr*>(nullptr);
}

std::vector<std::unique_ptr<Expr>> 
ASTVisitor::visitDimensions(const std::vector<Sysy22Parser::ExpContext*> &ctxs) {
    std::vector<std::unique_ptr<Expr>> rets;
    for(auto dim : ctxs) {
        auto expr_new = std::any_cast<Expr*>(dim->accept(this));
        rets.emplace_back(expr_new);
    }
    return rets;
}

