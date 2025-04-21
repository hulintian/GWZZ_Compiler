
// Generated from Sysy22.g4 by ANTLR 4.13.2

#pragma once


#include "antlr4-runtime.h"
#include "Sysy22Visitor.h"


/**
 * This class provides an empty implementation of Sysy22Visitor, which can be
 * extended to create a visitor which only needs to handle a subset of the available methods.
 */
class  Sysy22BaseVisitor : public Sysy22Visitor {
public:

  virtual std::any visitCompUnits(Sysy22Parser::CompUnitsContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitCompUnit(Sysy22Parser::CompUnitContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitDecl(Sysy22Parser::DeclContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitConstDecl(Sysy22Parser::ConstDeclContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitConstDef(Sysy22Parser::ConstDefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitVarDecl(Sysy22Parser::VarDeclContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitVarDef(Sysy22Parser::VarDefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitInit(Sysy22Parser::InitContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitInitList(Sysy22Parser::InitListContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitInt(Sysy22Parser::IntContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFloat(Sysy22Parser::FloatContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFuncDef(Sysy22Parser::FuncDefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFuncType_(Sysy22Parser::FuncType_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitVoid(Sysy22Parser::VoidContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFuncFParams(Sysy22Parser::FuncFParamsContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitScalarParam(Sysy22Parser::ScalarParamContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitArrayParam(Sysy22Parser::ArrayParamContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitBlock(Sysy22Parser::BlockContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitBlockItem(Sysy22Parser::BlockItemContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitAssignment(Sysy22Parser::AssignmentContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitExprStmt(Sysy22Parser::ExprStmtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitBlockStmt(Sysy22Parser::BlockStmtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitIfElse(Sysy22Parser::IfElseContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitWhile(Sysy22Parser::WhileContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitBreak(Sysy22Parser::BreakContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitContinue(Sysy22Parser::ContinueContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitReturn(Sysy22Parser::ReturnContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitExp(Sysy22Parser::ExpContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitCond(Sysy22Parser::CondContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitLVal(Sysy22Parser::LValContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitPrimaryExp_(Sysy22Parser::PrimaryExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitLValExpr(Sysy22Parser::LValExprContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitDecConst(Sysy22Parser::DecConstContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitOctConst(Sysy22Parser::OctConstContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitHexConst(Sysy22Parser::HexConstContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitDecFloatConst(Sysy22Parser::DecFloatConstContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitHexFloatConst(Sysy22Parser::HexFloatConstContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitNumber(Sysy22Parser::NumberContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitUnaryExp_(Sysy22Parser::UnaryExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitCall(Sysy22Parser::CallContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitUnaryAdd(Sysy22Parser::UnaryAddContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitUnarySub(Sysy22Parser::UnarySubContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitNot(Sysy22Parser::NotContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitStringConst(Sysy22Parser::StringConstContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFuncRParam(Sysy22Parser::FuncRParamContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFuncRParams(Sysy22Parser::FuncRParamsContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitDiv(Sysy22Parser::DivContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitMod(Sysy22Parser::ModContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitMul(Sysy22Parser::MulContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitMulExp_(Sysy22Parser::MulExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitAddExp_(Sysy22Parser::AddExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitAdd(Sysy22Parser::AddContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitSub(Sysy22Parser::SubContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitGeq(Sysy22Parser::GeqContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitLt(Sysy22Parser::LtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitRelExp_(Sysy22Parser::RelExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitLeq(Sysy22Parser::LeqContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitGt(Sysy22Parser::GtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitNeq(Sysy22Parser::NeqContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitEq(Sysy22Parser::EqContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitEqExp_(Sysy22Parser::EqExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitLAndExp_(Sysy22Parser::LAndExp_Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitAnd(Sysy22Parser::AndContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitOr(Sysy22Parser::OrContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitLOrExp_(Sysy22Parser::LOrExp_Context *ctx) override {
    return visitChildren(ctx);
  }


};

