
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

  virtual void enterCompUnits(Sysy22Parser::CompUnitsContext *ctx) = 0;
  virtual void exitCompUnits(Sysy22Parser::CompUnitsContext *ctx) = 0;

  virtual void enterCompUnit(Sysy22Parser::CompUnitContext *ctx) = 0;
  virtual void exitCompUnit(Sysy22Parser::CompUnitContext *ctx) = 0;

  virtual void enterDecl(Sysy22Parser::DeclContext *ctx) = 0;
  virtual void exitDecl(Sysy22Parser::DeclContext *ctx) = 0;

  virtual void enterConstDecl(Sysy22Parser::ConstDeclContext *ctx) = 0;
  virtual void exitConstDecl(Sysy22Parser::ConstDeclContext *ctx) = 0;

  virtual void enterConstDef(Sysy22Parser::ConstDefContext *ctx) = 0;
  virtual void exitConstDef(Sysy22Parser::ConstDefContext *ctx) = 0;

  virtual void enterVarDecl(Sysy22Parser::VarDeclContext *ctx) = 0;
  virtual void exitVarDecl(Sysy22Parser::VarDeclContext *ctx) = 0;

  virtual void enterVarDef(Sysy22Parser::VarDefContext *ctx) = 0;
  virtual void exitVarDef(Sysy22Parser::VarDefContext *ctx) = 0;

  virtual void enterInit(Sysy22Parser::InitContext *ctx) = 0;
  virtual void exitInit(Sysy22Parser::InitContext *ctx) = 0;

  virtual void enterInitList(Sysy22Parser::InitListContext *ctx) = 0;
  virtual void exitInitList(Sysy22Parser::InitListContext *ctx) = 0;

  virtual void enterInt(Sysy22Parser::IntContext *ctx) = 0;
  virtual void exitInt(Sysy22Parser::IntContext *ctx) = 0;

  virtual void enterFloat(Sysy22Parser::FloatContext *ctx) = 0;
  virtual void exitFloat(Sysy22Parser::FloatContext *ctx) = 0;

  virtual void enterFuncDef(Sysy22Parser::FuncDefContext *ctx) = 0;
  virtual void exitFuncDef(Sysy22Parser::FuncDefContext *ctx) = 0;

  virtual void enterFuncType(Sysy22Parser::FuncTypeContext *ctx) = 0;
  virtual void exitFuncType(Sysy22Parser::FuncTypeContext *ctx) = 0;

  virtual void enterFuncFParams(Sysy22Parser::FuncFParamsContext *ctx) = 0;
  virtual void exitFuncFParams(Sysy22Parser::FuncFParamsContext *ctx) = 0;

  virtual void enterScalarParam(Sysy22Parser::ScalarParamContext *ctx) = 0;
  virtual void exitScalarParam(Sysy22Parser::ScalarParamContext *ctx) = 0;

  virtual void enterArrayParam(Sysy22Parser::ArrayParamContext *ctx) = 0;
  virtual void exitArrayParam(Sysy22Parser::ArrayParamContext *ctx) = 0;

  virtual void enterBlock(Sysy22Parser::BlockContext *ctx) = 0;
  virtual void exitBlock(Sysy22Parser::BlockContext *ctx) = 0;

  virtual void enterBlockItem(Sysy22Parser::BlockItemContext *ctx) = 0;
  virtual void exitBlockItem(Sysy22Parser::BlockItemContext *ctx) = 0;

  virtual void enterAssign(Sysy22Parser::AssignContext *ctx) = 0;
  virtual void exitAssign(Sysy22Parser::AssignContext *ctx) = 0;

  virtual void enterExprStmt(Sysy22Parser::ExprStmtContext *ctx) = 0;
  virtual void exitExprStmt(Sysy22Parser::ExprStmtContext *ctx) = 0;

  virtual void enterBlockStmt(Sysy22Parser::BlockStmtContext *ctx) = 0;
  virtual void exitBlockStmt(Sysy22Parser::BlockStmtContext *ctx) = 0;

  virtual void enterIfElse(Sysy22Parser::IfElseContext *ctx) = 0;
  virtual void exitIfElse(Sysy22Parser::IfElseContext *ctx) = 0;

  virtual void enterWhile(Sysy22Parser::WhileContext *ctx) = 0;
  virtual void exitWhile(Sysy22Parser::WhileContext *ctx) = 0;

  virtual void enterBreak(Sysy22Parser::BreakContext *ctx) = 0;
  virtual void exitBreak(Sysy22Parser::BreakContext *ctx) = 0;

  virtual void enterContinue(Sysy22Parser::ContinueContext *ctx) = 0;
  virtual void exitContinue(Sysy22Parser::ContinueContext *ctx) = 0;

  virtual void enterReturn(Sysy22Parser::ReturnContext *ctx) = 0;
  virtual void exitReturn(Sysy22Parser::ReturnContext *ctx) = 0;

  virtual void enterExp(Sysy22Parser::ExpContext *ctx) = 0;
  virtual void exitExp(Sysy22Parser::ExpContext *ctx) = 0;

  virtual void enterCond(Sysy22Parser::CondContext *ctx) = 0;
  virtual void exitCond(Sysy22Parser::CondContext *ctx) = 0;

  virtual void enterLVal(Sysy22Parser::LValContext *ctx) = 0;
  virtual void exitLVal(Sysy22Parser::LValContext *ctx) = 0;

  virtual void enterPrimaryExp_(Sysy22Parser::PrimaryExp_Context *ctx) = 0;
  virtual void exitPrimaryExp_(Sysy22Parser::PrimaryExp_Context *ctx) = 0;

  virtual void enterLValExpr(Sysy22Parser::LValExprContext *ctx) = 0;
  virtual void exitLValExpr(Sysy22Parser::LValExprContext *ctx) = 0;

  virtual void enterIntConst(Sysy22Parser::IntConstContext *ctx) = 0;
  virtual void exitIntConst(Sysy22Parser::IntConstContext *ctx) = 0;

  virtual void enterFloatConst(Sysy22Parser::FloatConstContext *ctx) = 0;
  virtual void exitFloatConst(Sysy22Parser::FloatConstContext *ctx) = 0;

  virtual void enterNumber(Sysy22Parser::NumberContext *ctx) = 0;
  virtual void exitNumber(Sysy22Parser::NumberContext *ctx) = 0;

  virtual void enterUnaryExp_(Sysy22Parser::UnaryExp_Context *ctx) = 0;
  virtual void exitUnaryExp_(Sysy22Parser::UnaryExp_Context *ctx) = 0;

  virtual void enterCall(Sysy22Parser::CallContext *ctx) = 0;
  virtual void exitCall(Sysy22Parser::CallContext *ctx) = 0;

  virtual void enterUnaryAdd(Sysy22Parser::UnaryAddContext *ctx) = 0;
  virtual void exitUnaryAdd(Sysy22Parser::UnaryAddContext *ctx) = 0;

  virtual void enterUnarySub(Sysy22Parser::UnarySubContext *ctx) = 0;
  virtual void exitUnarySub(Sysy22Parser::UnarySubContext *ctx) = 0;

  virtual void enterNot(Sysy22Parser::NotContext *ctx) = 0;
  virtual void exitNot(Sysy22Parser::NotContext *ctx) = 0;

  virtual void enterStringConst(Sysy22Parser::StringConstContext *ctx) = 0;
  virtual void exitStringConst(Sysy22Parser::StringConstContext *ctx) = 0;

  virtual void enterFuncRParam(Sysy22Parser::FuncRParamContext *ctx) = 0;
  virtual void exitFuncRParam(Sysy22Parser::FuncRParamContext *ctx) = 0;

  virtual void enterFuncRParams(Sysy22Parser::FuncRParamsContext *ctx) = 0;
  virtual void exitFuncRParams(Sysy22Parser::FuncRParamsContext *ctx) = 0;

  virtual void enterDiv(Sysy22Parser::DivContext *ctx) = 0;
  virtual void exitDiv(Sysy22Parser::DivContext *ctx) = 0;

  virtual void enterMod(Sysy22Parser::ModContext *ctx) = 0;
  virtual void exitMod(Sysy22Parser::ModContext *ctx) = 0;

  virtual void enterMul(Sysy22Parser::MulContext *ctx) = 0;
  virtual void exitMul(Sysy22Parser::MulContext *ctx) = 0;

  virtual void enterMulExp_(Sysy22Parser::MulExp_Context *ctx) = 0;
  virtual void exitMulExp_(Sysy22Parser::MulExp_Context *ctx) = 0;

  virtual void enterAddExp_(Sysy22Parser::AddExp_Context *ctx) = 0;
  virtual void exitAddExp_(Sysy22Parser::AddExp_Context *ctx) = 0;

  virtual void enterAdd(Sysy22Parser::AddContext *ctx) = 0;
  virtual void exitAdd(Sysy22Parser::AddContext *ctx) = 0;

  virtual void enterSub(Sysy22Parser::SubContext *ctx) = 0;
  virtual void exitSub(Sysy22Parser::SubContext *ctx) = 0;

  virtual void enterGeq(Sysy22Parser::GeqContext *ctx) = 0;
  virtual void exitGeq(Sysy22Parser::GeqContext *ctx) = 0;

  virtual void enterLt(Sysy22Parser::LtContext *ctx) = 0;
  virtual void exitLt(Sysy22Parser::LtContext *ctx) = 0;

  virtual void enterRelExp_(Sysy22Parser::RelExp_Context *ctx) = 0;
  virtual void exitRelExp_(Sysy22Parser::RelExp_Context *ctx) = 0;

  virtual void enterLeq(Sysy22Parser::LeqContext *ctx) = 0;
  virtual void exitLeq(Sysy22Parser::LeqContext *ctx) = 0;

  virtual void enterGt(Sysy22Parser::GtContext *ctx) = 0;
  virtual void exitGt(Sysy22Parser::GtContext *ctx) = 0;

  virtual void enterNeq(Sysy22Parser::NeqContext *ctx) = 0;
  virtual void exitNeq(Sysy22Parser::NeqContext *ctx) = 0;

  virtual void enterEq(Sysy22Parser::EqContext *ctx) = 0;
  virtual void exitEq(Sysy22Parser::EqContext *ctx) = 0;

  virtual void enterEqExp_(Sysy22Parser::EqExp_Context *ctx) = 0;
  virtual void exitEqExp_(Sysy22Parser::EqExp_Context *ctx) = 0;

  virtual void enterLAndExp_(Sysy22Parser::LAndExp_Context *ctx) = 0;
  virtual void exitLAndExp_(Sysy22Parser::LAndExp_Context *ctx) = 0;

  virtual void enterAnd(Sysy22Parser::AndContext *ctx) = 0;
  virtual void exitAnd(Sysy22Parser::AndContext *ctx) = 0;

  virtual void enterOr(Sysy22Parser::OrContext *ctx) = 0;
  virtual void exitOr(Sysy22Parser::OrContext *ctx) = 0;

  virtual void enterLOrExp_(Sysy22Parser::LOrExp_Context *ctx) = 0;
  virtual void exitLOrExp_(Sysy22Parser::LOrExp_Context *ctx) = 0;


};

