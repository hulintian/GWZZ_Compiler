
// Generated from Sysy22.g4 by ANTLR 4.13.2

#pragma once


#include "antlr4-runtime.h"
#include "Sysy22Parser.h"


/**
 * This interface defines an abstract listener for a parse tree produced by Sysy22Parser.
 */
class  Sysy22Listener : public antlr4::tree::ParseTreeListener {
public:

  virtual void enterProg(Sysy22Parser::ProgContext *ctx) = 0;
  virtual void exitProg(Sysy22Parser::ProgContext *ctx) = 0;

  virtual void enterCompUnit(Sysy22Parser::CompUnitContext *ctx) = 0;
  virtual void exitCompUnit(Sysy22Parser::CompUnitContext *ctx) = 0;

  virtual void enterDecl(Sysy22Parser::DeclContext *ctx) = 0;
  virtual void exitDecl(Sysy22Parser::DeclContext *ctx) = 0;

  virtual void enterConstDecl(Sysy22Parser::ConstDeclContext *ctx) = 0;
  virtual void exitConstDecl(Sysy22Parser::ConstDeclContext *ctx) = 0;

  virtual void enterBType(Sysy22Parser::BTypeContext *ctx) = 0;
  virtual void exitBType(Sysy22Parser::BTypeContext *ctx) = 0;

  virtual void enterConstDef(Sysy22Parser::ConstDefContext *ctx) = 0;
  virtual void exitConstDef(Sysy22Parser::ConstDefContext *ctx) = 0;

  virtual void enterScalarConstInitVal(Sysy22Parser::ScalarConstInitValContext *ctx) = 0;
  virtual void exitScalarConstInitVal(Sysy22Parser::ScalarConstInitValContext *ctx) = 0;

  virtual void enterListConstInitVal(Sysy22Parser::ListConstInitValContext *ctx) = 0;
  virtual void exitListConstInitVal(Sysy22Parser::ListConstInitValContext *ctx) = 0;

  virtual void enterVarDecl(Sysy22Parser::VarDeclContext *ctx) = 0;
  virtual void exitVarDecl(Sysy22Parser::VarDeclContext *ctx) = 0;

  virtual void enterUninitVarDef(Sysy22Parser::UninitVarDefContext *ctx) = 0;
  virtual void exitUninitVarDef(Sysy22Parser::UninitVarDefContext *ctx) = 0;

  virtual void enterInitVarDef(Sysy22Parser::InitVarDefContext *ctx) = 0;
  virtual void exitInitVarDef(Sysy22Parser::InitVarDefContext *ctx) = 0;

  virtual void enterScalarInitVal(Sysy22Parser::ScalarInitValContext *ctx) = 0;
  virtual void exitScalarInitVal(Sysy22Parser::ScalarInitValContext *ctx) = 0;

  virtual void enterListInitval(Sysy22Parser::ListInitvalContext *ctx) = 0;
  virtual void exitListInitval(Sysy22Parser::ListInitvalContext *ctx) = 0;

  virtual void enterFuncDef(Sysy22Parser::FuncDefContext *ctx) = 0;
  virtual void exitFuncDef(Sysy22Parser::FuncDefContext *ctx) = 0;

  virtual void enterFuncType(Sysy22Parser::FuncTypeContext *ctx) = 0;
  virtual void exitFuncType(Sysy22Parser::FuncTypeContext *ctx) = 0;

  virtual void enterFuncFParams(Sysy22Parser::FuncFParamsContext *ctx) = 0;
  virtual void exitFuncFParams(Sysy22Parser::FuncFParamsContext *ctx) = 0;

  virtual void enterFuncFParam(Sysy22Parser::FuncFParamContext *ctx) = 0;
  virtual void exitFuncFParam(Sysy22Parser::FuncFParamContext *ctx) = 0;

  virtual void enterBlock(Sysy22Parser::BlockContext *ctx) = 0;
  virtual void exitBlock(Sysy22Parser::BlockContext *ctx) = 0;

  virtual void enterBlockItem(Sysy22Parser::BlockItemContext *ctx) = 0;
  virtual void exitBlockItem(Sysy22Parser::BlockItemContext *ctx) = 0;

  virtual void enterAssignment(Sysy22Parser::AssignmentContext *ctx) = 0;
  virtual void exitAssignment(Sysy22Parser::AssignmentContext *ctx) = 0;

  virtual void enterExpStmt(Sysy22Parser::ExpStmtContext *ctx) = 0;
  virtual void exitExpStmt(Sysy22Parser::ExpStmtContext *ctx) = 0;

  virtual void enterBlockStmt(Sysy22Parser::BlockStmtContext *ctx) = 0;
  virtual void exitBlockStmt(Sysy22Parser::BlockStmtContext *ctx) = 0;

  virtual void enterIfStmt1(Sysy22Parser::IfStmt1Context *ctx) = 0;
  virtual void exitIfStmt1(Sysy22Parser::IfStmt1Context *ctx) = 0;

  virtual void enterIfStmt2(Sysy22Parser::IfStmt2Context *ctx) = 0;
  virtual void exitIfStmt2(Sysy22Parser::IfStmt2Context *ctx) = 0;

  virtual void enterWhileStmt(Sysy22Parser::WhileStmtContext *ctx) = 0;
  virtual void exitWhileStmt(Sysy22Parser::WhileStmtContext *ctx) = 0;

  virtual void enterBreakStmt(Sysy22Parser::BreakStmtContext *ctx) = 0;
  virtual void exitBreakStmt(Sysy22Parser::BreakStmtContext *ctx) = 0;

  virtual void enterContinueStmt(Sysy22Parser::ContinueStmtContext *ctx) = 0;
  virtual void exitContinueStmt(Sysy22Parser::ContinueStmtContext *ctx) = 0;

  virtual void enterReturnStmt(Sysy22Parser::ReturnStmtContext *ctx) = 0;
  virtual void exitReturnStmt(Sysy22Parser::ReturnStmtContext *ctx) = 0;

  virtual void enterExp(Sysy22Parser::ExpContext *ctx) = 0;
  virtual void exitExp(Sysy22Parser::ExpContext *ctx) = 0;

  virtual void enterCond(Sysy22Parser::CondContext *ctx) = 0;
  virtual void exitCond(Sysy22Parser::CondContext *ctx) = 0;

  virtual void enterLVal(Sysy22Parser::LValContext *ctx) = 0;
  virtual void exitLVal(Sysy22Parser::LValContext *ctx) = 0;

  virtual void enterPrimaryExp1(Sysy22Parser::PrimaryExp1Context *ctx) = 0;
  virtual void exitPrimaryExp1(Sysy22Parser::PrimaryExp1Context *ctx) = 0;

  virtual void enterPrimaryExp2(Sysy22Parser::PrimaryExp2Context *ctx) = 0;
  virtual void exitPrimaryExp2(Sysy22Parser::PrimaryExp2Context *ctx) = 0;

  virtual void enterPrimaryExp3(Sysy22Parser::PrimaryExp3Context *ctx) = 0;
  virtual void exitPrimaryExp3(Sysy22Parser::PrimaryExp3Context *ctx) = 0;

  virtual void enterInt_Literal(Sysy22Parser::Int_LiteralContext *ctx) = 0;
  virtual void exitInt_Literal(Sysy22Parser::Int_LiteralContext *ctx) = 0;

  virtual void enterFloat_Literal(Sysy22Parser::Float_LiteralContext *ctx) = 0;
  virtual void exitFloat_Literal(Sysy22Parser::Float_LiteralContext *ctx) = 0;

  virtual void enterUnary1(Sysy22Parser::Unary1Context *ctx) = 0;
  virtual void exitUnary1(Sysy22Parser::Unary1Context *ctx) = 0;

  virtual void enterUnary2(Sysy22Parser::Unary2Context *ctx) = 0;
  virtual void exitUnary2(Sysy22Parser::Unary2Context *ctx) = 0;

  virtual void enterUnary3(Sysy22Parser::Unary3Context *ctx) = 0;
  virtual void exitUnary3(Sysy22Parser::Unary3Context *ctx) = 0;

  virtual void enterUnaryOp(Sysy22Parser::UnaryOpContext *ctx) = 0;
  virtual void exitUnaryOp(Sysy22Parser::UnaryOpContext *ctx) = 0;

  virtual void enterFuncRParams(Sysy22Parser::FuncRParamsContext *ctx) = 0;
  virtual void exitFuncRParams(Sysy22Parser::FuncRParamsContext *ctx) = 0;

  virtual void enterExpAsRParam(Sysy22Parser::ExpAsRParamContext *ctx) = 0;
  virtual void exitExpAsRParam(Sysy22Parser::ExpAsRParamContext *ctx) = 0;

  virtual void enterStringAsRParam(Sysy22Parser::StringAsRParamContext *ctx) = 0;
  virtual void exitStringAsRParam(Sysy22Parser::StringAsRParamContext *ctx) = 0;

  virtual void enterMul2(Sysy22Parser::Mul2Context *ctx) = 0;
  virtual void exitMul2(Sysy22Parser::Mul2Context *ctx) = 0;

  virtual void enterMul1(Sysy22Parser::Mul1Context *ctx) = 0;
  virtual void exitMul1(Sysy22Parser::Mul1Context *ctx) = 0;

  virtual void enterAdd2(Sysy22Parser::Add2Context *ctx) = 0;
  virtual void exitAdd2(Sysy22Parser::Add2Context *ctx) = 0;

  virtual void enterAdd1(Sysy22Parser::Add1Context *ctx) = 0;
  virtual void exitAdd1(Sysy22Parser::Add1Context *ctx) = 0;

  virtual void enterRel2(Sysy22Parser::Rel2Context *ctx) = 0;
  virtual void exitRel2(Sysy22Parser::Rel2Context *ctx) = 0;

  virtual void enterRel1(Sysy22Parser::Rel1Context *ctx) = 0;
  virtual void exitRel1(Sysy22Parser::Rel1Context *ctx) = 0;

  virtual void enterEq1(Sysy22Parser::Eq1Context *ctx) = 0;
  virtual void exitEq1(Sysy22Parser::Eq1Context *ctx) = 0;

  virtual void enterEq2(Sysy22Parser::Eq2Context *ctx) = 0;
  virtual void exitEq2(Sysy22Parser::Eq2Context *ctx) = 0;

  virtual void enterLAnd2(Sysy22Parser::LAnd2Context *ctx) = 0;
  virtual void exitLAnd2(Sysy22Parser::LAnd2Context *ctx) = 0;

  virtual void enterLAnd1(Sysy22Parser::LAnd1Context *ctx) = 0;
  virtual void exitLAnd1(Sysy22Parser::LAnd1Context *ctx) = 0;

  virtual void enterLOr1(Sysy22Parser::LOr1Context *ctx) = 0;
  virtual void exitLOr1(Sysy22Parser::LOr1Context *ctx) = 0;

  virtual void enterLOr2(Sysy22Parser::LOr2Context *ctx) = 0;
  virtual void exitLOr2(Sysy22Parser::LOr2Context *ctx) = 0;

  virtual void enterConstExp(Sysy22Parser::ConstExpContext *ctx) = 0;
  virtual void exitConstExp(Sysy22Parser::ConstExpContext *ctx) = 0;


};

