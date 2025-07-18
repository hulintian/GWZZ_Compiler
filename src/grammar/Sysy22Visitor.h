
// Generated from Sysy22.g4 by ANTLR 4.13.2

#pragma once


#include "antlr4-runtime.h"
#include "Sysy22Parser.h"



/**
 * This class defines an abstract visitor for a parse tree
 * produced by Sysy22Parser.
 */
class  Sysy22Visitor : public antlr4::tree::AbstractParseTreeVisitor {
public:

  /**
   * Visit parse trees produced by Sysy22Parser.
   */
    virtual std::any visitProg(Sysy22Parser::ProgContext *context) = 0;

    virtual std::any visitCompUnits(Sysy22Parser::CompUnitsContext *context) = 0;

    virtual std::any visitCompUnit(Sysy22Parser::CompUnitContext *context) = 0;

    virtual std::any visitDecl(Sysy22Parser::DeclContext *context) = 0;

    virtual std::any visitConstDecl(Sysy22Parser::ConstDeclContext *context) = 0;

    virtual std::any visitConstDef(Sysy22Parser::ConstDefContext *context) = 0;

    virtual std::any visitVarDecl(Sysy22Parser::VarDeclContext *context) = 0;

    virtual std::any visitVarDef(Sysy22Parser::VarDefContext *context) = 0;

    virtual std::any visitInit(Sysy22Parser::InitContext *context) = 0;

    virtual std::any visitInitList(Sysy22Parser::InitListContext *context) = 0;

    virtual std::any visitInt(Sysy22Parser::IntContext *context) = 0;

    virtual std::any visitFloat(Sysy22Parser::FloatContext *context) = 0;

    virtual std::any visitFuncDef(Sysy22Parser::FuncDefContext *context) = 0;

    virtual std::any visitFuncType(Sysy22Parser::FuncTypeContext *context) = 0;

    virtual std::any visitFuncFParams(Sysy22Parser::FuncFParamsContext *context) = 0;

    virtual std::any visitScalarParam(Sysy22Parser::ScalarParamContext *context) = 0;

    virtual std::any visitArrayParam(Sysy22Parser::ArrayParamContext *context) = 0;

    virtual std::any visitBlock(Sysy22Parser::BlockContext *context) = 0;

    virtual std::any visitBlockItem(Sysy22Parser::BlockItemContext *context) = 0;

    virtual std::any visitAssign(Sysy22Parser::AssignContext *context) = 0;

    virtual std::any visitExprStmt(Sysy22Parser::ExprStmtContext *context) = 0;

    virtual std::any visitBlockStmt(Sysy22Parser::BlockStmtContext *context) = 0;

    virtual std::any visitIfElse(Sysy22Parser::IfElseContext *context) = 0;

    virtual std::any visitWhile(Sysy22Parser::WhileContext *context) = 0;

    virtual std::any visitBreak(Sysy22Parser::BreakContext *context) = 0;

    virtual std::any visitContinue(Sysy22Parser::ContinueContext *context) = 0;

    virtual std::any visitReturn(Sysy22Parser::ReturnContext *context) = 0;

    virtual std::any visitExp(Sysy22Parser::ExpContext *context) = 0;

    virtual std::any visitCond(Sysy22Parser::CondContext *context) = 0;

    virtual std::any visitLVal(Sysy22Parser::LValContext *context) = 0;

    virtual std::any visitPrimaryExp_(Sysy22Parser::PrimaryExp_Context *context) = 0;

    virtual std::any visitLValExpr(Sysy22Parser::LValExprContext *context) = 0;

    virtual std::any visitIntConst(Sysy22Parser::IntConstContext *context) = 0;

    virtual std::any visitFloatConst(Sysy22Parser::FloatConstContext *context) = 0;

    virtual std::any visitNumber(Sysy22Parser::NumberContext *context) = 0;

    virtual std::any visitUnaryExp_(Sysy22Parser::UnaryExp_Context *context) = 0;

    virtual std::any visitCall(Sysy22Parser::CallContext *context) = 0;

    virtual std::any visitUnaryAdd(Sysy22Parser::UnaryAddContext *context) = 0;

    virtual std::any visitUnarySub(Sysy22Parser::UnarySubContext *context) = 0;

    virtual std::any visitNot(Sysy22Parser::NotContext *context) = 0;

    virtual std::any visitStringConst(Sysy22Parser::StringConstContext *context) = 0;

    virtual std::any visitFuncRParam(Sysy22Parser::FuncRParamContext *context) = 0;

    virtual std::any visitFuncRParams(Sysy22Parser::FuncRParamsContext *context) = 0;

    virtual std::any visitDiv(Sysy22Parser::DivContext *context) = 0;

    virtual std::any visitMod(Sysy22Parser::ModContext *context) = 0;

    virtual std::any visitMul(Sysy22Parser::MulContext *context) = 0;

    virtual std::any visitMulExp_(Sysy22Parser::MulExp_Context *context) = 0;

    virtual std::any visitAddExp_(Sysy22Parser::AddExp_Context *context) = 0;

    virtual std::any visitAdd(Sysy22Parser::AddContext *context) = 0;

    virtual std::any visitSub(Sysy22Parser::SubContext *context) = 0;

    virtual std::any visitGeq(Sysy22Parser::GeqContext *context) = 0;

    virtual std::any visitLt(Sysy22Parser::LtContext *context) = 0;

    virtual std::any visitRelExp_(Sysy22Parser::RelExp_Context *context) = 0;

    virtual std::any visitLeq(Sysy22Parser::LeqContext *context) = 0;

    virtual std::any visitGt(Sysy22Parser::GtContext *context) = 0;

    virtual std::any visitNeq(Sysy22Parser::NeqContext *context) = 0;

    virtual std::any visitEq(Sysy22Parser::EqContext *context) = 0;

    virtual std::any visitEqExp_(Sysy22Parser::EqExp_Context *context) = 0;

    virtual std::any visitLAndExp_(Sysy22Parser::LAndExp_Context *context) = 0;

    virtual std::any visitAnd(Sysy22Parser::AndContext *context) = 0;

    virtual std::any visitOr(Sysy22Parser::OrContext *context) = 0;

    virtual std::any visitLOrExp_(Sysy22Parser::LOrExp_Context *context) = 0;


};

