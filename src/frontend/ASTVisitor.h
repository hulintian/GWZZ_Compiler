#pragma once

#include "grammar/Sysy22BaseVisitor.h"
#include "AST.hpp"
#include "grammar/Sysy22Parser.h"
#include <memory>
#include <vector>

namespace frontend {
using namespace ast;
class ASTVisitor : public Sysy22BaseVisitor {
public:
    // 提醒使用返回值 
    [[nodiscard]] CompUnits const &compUnit() { return *this->_compUnits; }

     std::any visitCompUnits(Sysy22Parser::CompUnitsContext *context) override;

     std::any visitConstDecl(Sysy22Parser::ConstDeclContext *context) override;

     std::any visitInt(Sysy22Parser::IntContext *context) override;

     std::any visitFloat(Sysy22Parser::FloatContext *context) override;

     std::any visitVarDecl(Sysy22Parser::VarDeclContext *context) override;

     std::any visitInit(Sysy22Parser::InitContext *context) override;

     std::any visitInitList(Sysy22Parser::InitListContext *context) override;

     std::any visitFuncDef(Sysy22Parser::FuncDefContext *context) override;

     std::any visitVoid(Sysy22Parser::VoidContext *context) override;

     std::any visitScalarParam(Sysy22Parser::ScalarParamContext *context) override;

     std::any visitArrayParam(Sysy22Parser::ArrayParamContext *context) override;

     std::any visitBlock(Sysy22Parser::BlockContext *context) override;

     std::any visitAssignment(Sysy22Parser::AssignmentContext *context) override;

     std::any visitExprStmt(Sysy22Parser::ExprStmtContext *context) override;

     std::any visitBlockStmt(Sysy22Parser::BlockStmtContext *context) override;

     std::any visitIfElse(Sysy22Parser::IfElseContext *context) override;

     std::any visitWhile(Sysy22Parser::WhileContext *context) override;

     std::any visitBreak(Sysy22Parser::BreakContext *context) override;

     std::any visitContinue(Sysy22Parser::ContinueContext *context) override;

     std::any visitReturn(Sysy22Parser::ReturnContext *context) override;

     std::any visitLVal(Sysy22Parser::LValContext *context) override;

     std::any visitPrimaryExp_(Sysy22Parser::PrimaryExp_Context *context) override;

     std::any visitLValExpr(Sysy22Parser::LValExprContext *context) override;

     std::any visitDecConst(Sysy22Parser::DecConstContext *context) override;

     std::any visitHexConst(Sysy22Parser::HexConstContext *context) override;

     std::any visitOctConst(Sysy22Parser::OctConstContext *context) override;

     std::any visitDecFloatConst(Sysy22Parser::DecFloatConstContext *context) override;

     std::any visitHexFloatConst(Sysy22Parser::HexFloatConstContext *context) override;

     std::any visitCall(Sysy22Parser::CallContext *context) override;

     std::any visitUnaryAdd(Sysy22Parser::UnaryAddContext *context) override;

     std::any visitUnarySub(Sysy22Parser::UnarySubContext *context) override;

     std::any visitNot(Sysy22Parser::NotContext *context) override;

     std::any visitStringConst(Sysy22Parser::StringConstContext *context) override;

     std::any visitDiv(Sysy22Parser::DivContext *context) override;

     std::any visitMod(Sysy22Parser::ModContext *context) override;

     std::any visitMul(Sysy22Parser::MulContext *context) override;

     std::any visitAdd(Sysy22Parser::AddContext *context) override;

     std::any visitSub(Sysy22Parser::SubContext *context) override;

     std::any visitGeq(Sysy22Parser::GeqContext *context) override;

     std::any visitLt(Sysy22Parser::LtContext *context) override;

     std::any visitLeq(Sysy22Parser::LeqContext *context) override;

     std::any visitGt(Sysy22Parser::GtContext *context) override;

     std::any visitNeq(Sysy22Parser::NeqContext *context) override;

     std::any visitEq(Sysy22Parser::EqContext *context) override;

     std::any visitAnd(Sysy22Parser::AndContext *context) override;

     std::any visitOr(Sysy22Parser::OrContext *context) override;

     std::any visitNumber(Sysy22Parser::NumberContext *context) override;

private:
    std::vector<std::unique_ptr<Expr>> 
        visitDimensions(const std::vector<Sysy22Parser::ExpContext*> &ctxs);

    std::unique_ptr<CompUnits> _compUnits;
};
}
