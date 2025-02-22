
// Generated from Sysy22.g4 by ANTLR 4.10.1

#pragma once


#include "antlr4-runtime.h"
#include "Sysy22Visitor.h"


/**
 * This class provides an empty implementation of Sysy22Visitor, which can be
 * extended to create a visitor which only needs to handle a subset of the available methods.
 */
class  Sysy22BaseVisitor : public Sysy22Visitor {
public:

  virtual std::any visitProg(Sysy22Parser::ProgContext *ctx) override {
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

  virtual std::any visitBType(Sysy22Parser::BTypeContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitConstDef(Sysy22Parser::ConstDefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitScalarConstInitVal(Sysy22Parser::ScalarConstInitValContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitListConstInitVal(Sysy22Parser::ListConstInitValContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitVarDecl(Sysy22Parser::VarDeclContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitUninitVarDef(Sysy22Parser::UninitVarDefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitInitVarDef(Sysy22Parser::InitVarDefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitScalarInitVal(Sysy22Parser::ScalarInitValContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitListInitval(Sysy22Parser::ListInitvalContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFuncDef(Sysy22Parser::FuncDefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFuncType(Sysy22Parser::FuncTypeContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFuncFParams(Sysy22Parser::FuncFParamsContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFuncFParam(Sysy22Parser::FuncFParamContext *ctx) override {
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

  virtual std::any visitExpStmt(Sysy22Parser::ExpStmtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitBlockStmt(Sysy22Parser::BlockStmtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitIfStmt1(Sysy22Parser::IfStmt1Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitIfStmt2(Sysy22Parser::IfStmt2Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitWhileStmt(Sysy22Parser::WhileStmtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitBreakStmt(Sysy22Parser::BreakStmtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitContinueStmt(Sysy22Parser::ContinueStmtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitReturnStmt(Sysy22Parser::ReturnStmtContext *ctx) override {
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

  virtual std::any visitPrimaryExp1(Sysy22Parser::PrimaryExp1Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitPrimaryExp2(Sysy22Parser::PrimaryExp2Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitPrimaryExp3(Sysy22Parser::PrimaryExp3Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitInt_Literal(Sysy22Parser::Int_LiteralContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFloat_Literal(Sysy22Parser::Float_LiteralContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitUnary1(Sysy22Parser::Unary1Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitUnary2(Sysy22Parser::Unary2Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitUnary3(Sysy22Parser::Unary3Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitUnaryOp(Sysy22Parser::UnaryOpContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFuncRParams(Sysy22Parser::FuncRParamsContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitExpAsRParam(Sysy22Parser::ExpAsRParamContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitStringAsRParam(Sysy22Parser::StringAsRParamContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitMul2(Sysy22Parser::Mul2Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitMul1(Sysy22Parser::Mul1Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitAdd2(Sysy22Parser::Add2Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitAdd1(Sysy22Parser::Add1Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitRel2(Sysy22Parser::Rel2Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitRel1(Sysy22Parser::Rel1Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitEq1(Sysy22Parser::Eq1Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitEq2(Sysy22Parser::Eq2Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitLAnd2(Sysy22Parser::LAnd2Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitLAnd1(Sysy22Parser::LAnd1Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitLOr1(Sysy22Parser::LOr1Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitLOr2(Sysy22Parser::LOr2Context *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitConstExp(Sysy22Parser::ConstExpContext *ctx) override {
    return visitChildren(ctx);
  }


};

