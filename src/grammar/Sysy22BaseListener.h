
// Generated from Sysy22.g4 by ANTLR 4.13.2

#pragma once


#include "antlr4-runtime.h"
#include "Sysy22Listener.h"


/**
 * This class provides an empty implementation of Sysy22Listener,
 * which can be extended to create a listener which only needs to handle a subset
 * of the available methods.
 */
class  Sysy22BaseListener : public Sysy22Listener {
public:

  virtual void enterProg(Sysy22Parser::ProgContext * /*ctx*/) override { }
  virtual void exitProg(Sysy22Parser::ProgContext * /*ctx*/) override { }

  virtual void enterCompUnits(Sysy22Parser::CompUnitsContext * /*ctx*/) override { }
  virtual void exitCompUnits(Sysy22Parser::CompUnitsContext * /*ctx*/) override { }

  virtual void enterCompUnit(Sysy22Parser::CompUnitContext * /*ctx*/) override { }
  virtual void exitCompUnit(Sysy22Parser::CompUnitContext * /*ctx*/) override { }

  virtual void enterDecl(Sysy22Parser::DeclContext * /*ctx*/) override { }
  virtual void exitDecl(Sysy22Parser::DeclContext * /*ctx*/) override { }

  virtual void enterConstDecl(Sysy22Parser::ConstDeclContext * /*ctx*/) override { }
  virtual void exitConstDecl(Sysy22Parser::ConstDeclContext * /*ctx*/) override { }

  virtual void enterConstDef(Sysy22Parser::ConstDefContext * /*ctx*/) override { }
  virtual void exitConstDef(Sysy22Parser::ConstDefContext * /*ctx*/) override { }

  virtual void enterVarDecl(Sysy22Parser::VarDeclContext * /*ctx*/) override { }
  virtual void exitVarDecl(Sysy22Parser::VarDeclContext * /*ctx*/) override { }

  virtual void enterVarDef(Sysy22Parser::VarDefContext * /*ctx*/) override { }
  virtual void exitVarDef(Sysy22Parser::VarDefContext * /*ctx*/) override { }

  virtual void enterInit(Sysy22Parser::InitContext * /*ctx*/) override { }
  virtual void exitInit(Sysy22Parser::InitContext * /*ctx*/) override { }

  virtual void enterInitList(Sysy22Parser::InitListContext * /*ctx*/) override { }
  virtual void exitInitList(Sysy22Parser::InitListContext * /*ctx*/) override { }

  virtual void enterInt(Sysy22Parser::IntContext * /*ctx*/) override { }
  virtual void exitInt(Sysy22Parser::IntContext * /*ctx*/) override { }

  virtual void enterFloat(Sysy22Parser::FloatContext * /*ctx*/) override { }
  virtual void exitFloat(Sysy22Parser::FloatContext * /*ctx*/) override { }

  virtual void enterFuncDef(Sysy22Parser::FuncDefContext * /*ctx*/) override { }
  virtual void exitFuncDef(Sysy22Parser::FuncDefContext * /*ctx*/) override { }

  virtual void enterFuncType(Sysy22Parser::FuncTypeContext * /*ctx*/) override { }
  virtual void exitFuncType(Sysy22Parser::FuncTypeContext * /*ctx*/) override { }

  virtual void enterFuncFParams(Sysy22Parser::FuncFParamsContext * /*ctx*/) override { }
  virtual void exitFuncFParams(Sysy22Parser::FuncFParamsContext * /*ctx*/) override { }

  virtual void enterScalarParam(Sysy22Parser::ScalarParamContext * /*ctx*/) override { }
  virtual void exitScalarParam(Sysy22Parser::ScalarParamContext * /*ctx*/) override { }

  virtual void enterArrayParam(Sysy22Parser::ArrayParamContext * /*ctx*/) override { }
  virtual void exitArrayParam(Sysy22Parser::ArrayParamContext * /*ctx*/) override { }

  virtual void enterBlock(Sysy22Parser::BlockContext * /*ctx*/) override { }
  virtual void exitBlock(Sysy22Parser::BlockContext * /*ctx*/) override { }

  virtual void enterBlockItem(Sysy22Parser::BlockItemContext * /*ctx*/) override { }
  virtual void exitBlockItem(Sysy22Parser::BlockItemContext * /*ctx*/) override { }

  virtual void enterAssign(Sysy22Parser::AssignContext * /*ctx*/) override { }
  virtual void exitAssign(Sysy22Parser::AssignContext * /*ctx*/) override { }

  virtual void enterExprStmt(Sysy22Parser::ExprStmtContext * /*ctx*/) override { }
  virtual void exitExprStmt(Sysy22Parser::ExprStmtContext * /*ctx*/) override { }

  virtual void enterBlockStmt(Sysy22Parser::BlockStmtContext * /*ctx*/) override { }
  virtual void exitBlockStmt(Sysy22Parser::BlockStmtContext * /*ctx*/) override { }

  virtual void enterIfElse(Sysy22Parser::IfElseContext * /*ctx*/) override { }
  virtual void exitIfElse(Sysy22Parser::IfElseContext * /*ctx*/) override { }

  virtual void enterWhile(Sysy22Parser::WhileContext * /*ctx*/) override { }
  virtual void exitWhile(Sysy22Parser::WhileContext * /*ctx*/) override { }

  virtual void enterBreak(Sysy22Parser::BreakContext * /*ctx*/) override { }
  virtual void exitBreak(Sysy22Parser::BreakContext * /*ctx*/) override { }

  virtual void enterContinue(Sysy22Parser::ContinueContext * /*ctx*/) override { }
  virtual void exitContinue(Sysy22Parser::ContinueContext * /*ctx*/) override { }

  virtual void enterReturn(Sysy22Parser::ReturnContext * /*ctx*/) override { }
  virtual void exitReturn(Sysy22Parser::ReturnContext * /*ctx*/) override { }

  virtual void enterExp(Sysy22Parser::ExpContext * /*ctx*/) override { }
  virtual void exitExp(Sysy22Parser::ExpContext * /*ctx*/) override { }

  virtual void enterCond(Sysy22Parser::CondContext * /*ctx*/) override { }
  virtual void exitCond(Sysy22Parser::CondContext * /*ctx*/) override { }

  virtual void enterLVal(Sysy22Parser::LValContext * /*ctx*/) override { }
  virtual void exitLVal(Sysy22Parser::LValContext * /*ctx*/) override { }

  virtual void enterPrimaryExp_(Sysy22Parser::PrimaryExp_Context * /*ctx*/) override { }
  virtual void exitPrimaryExp_(Sysy22Parser::PrimaryExp_Context * /*ctx*/) override { }

  virtual void enterLValExpr(Sysy22Parser::LValExprContext * /*ctx*/) override { }
  virtual void exitLValExpr(Sysy22Parser::LValExprContext * /*ctx*/) override { }

  virtual void enterIntConst(Sysy22Parser::IntConstContext * /*ctx*/) override { }
  virtual void exitIntConst(Sysy22Parser::IntConstContext * /*ctx*/) override { }

  virtual void enterFloatConst(Sysy22Parser::FloatConstContext * /*ctx*/) override { }
  virtual void exitFloatConst(Sysy22Parser::FloatConstContext * /*ctx*/) override { }

  virtual void enterNumber(Sysy22Parser::NumberContext * /*ctx*/) override { }
  virtual void exitNumber(Sysy22Parser::NumberContext * /*ctx*/) override { }

  virtual void enterUnaryExp_(Sysy22Parser::UnaryExp_Context * /*ctx*/) override { }
  virtual void exitUnaryExp_(Sysy22Parser::UnaryExp_Context * /*ctx*/) override { }

  virtual void enterCall(Sysy22Parser::CallContext * /*ctx*/) override { }
  virtual void exitCall(Sysy22Parser::CallContext * /*ctx*/) override { }

  virtual void enterUnaryAdd(Sysy22Parser::UnaryAddContext * /*ctx*/) override { }
  virtual void exitUnaryAdd(Sysy22Parser::UnaryAddContext * /*ctx*/) override { }

  virtual void enterUnarySub(Sysy22Parser::UnarySubContext * /*ctx*/) override { }
  virtual void exitUnarySub(Sysy22Parser::UnarySubContext * /*ctx*/) override { }

  virtual void enterNot(Sysy22Parser::NotContext * /*ctx*/) override { }
  virtual void exitNot(Sysy22Parser::NotContext * /*ctx*/) override { }

  virtual void enterStringConst(Sysy22Parser::StringConstContext * /*ctx*/) override { }
  virtual void exitStringConst(Sysy22Parser::StringConstContext * /*ctx*/) override { }

  virtual void enterFuncRParam(Sysy22Parser::FuncRParamContext * /*ctx*/) override { }
  virtual void exitFuncRParam(Sysy22Parser::FuncRParamContext * /*ctx*/) override { }

  virtual void enterFuncRParams(Sysy22Parser::FuncRParamsContext * /*ctx*/) override { }
  virtual void exitFuncRParams(Sysy22Parser::FuncRParamsContext * /*ctx*/) override { }

  virtual void enterDiv(Sysy22Parser::DivContext * /*ctx*/) override { }
  virtual void exitDiv(Sysy22Parser::DivContext * /*ctx*/) override { }

  virtual void enterMod(Sysy22Parser::ModContext * /*ctx*/) override { }
  virtual void exitMod(Sysy22Parser::ModContext * /*ctx*/) override { }

  virtual void enterMul(Sysy22Parser::MulContext * /*ctx*/) override { }
  virtual void exitMul(Sysy22Parser::MulContext * /*ctx*/) override { }

  virtual void enterMulExp_(Sysy22Parser::MulExp_Context * /*ctx*/) override { }
  virtual void exitMulExp_(Sysy22Parser::MulExp_Context * /*ctx*/) override { }

  virtual void enterAddExp_(Sysy22Parser::AddExp_Context * /*ctx*/) override { }
  virtual void exitAddExp_(Sysy22Parser::AddExp_Context * /*ctx*/) override { }

  virtual void enterAdd(Sysy22Parser::AddContext * /*ctx*/) override { }
  virtual void exitAdd(Sysy22Parser::AddContext * /*ctx*/) override { }

  virtual void enterSub(Sysy22Parser::SubContext * /*ctx*/) override { }
  virtual void exitSub(Sysy22Parser::SubContext * /*ctx*/) override { }

  virtual void enterGeq(Sysy22Parser::GeqContext * /*ctx*/) override { }
  virtual void exitGeq(Sysy22Parser::GeqContext * /*ctx*/) override { }

  virtual void enterLt(Sysy22Parser::LtContext * /*ctx*/) override { }
  virtual void exitLt(Sysy22Parser::LtContext * /*ctx*/) override { }

  virtual void enterRelExp_(Sysy22Parser::RelExp_Context * /*ctx*/) override { }
  virtual void exitRelExp_(Sysy22Parser::RelExp_Context * /*ctx*/) override { }

  virtual void enterLeq(Sysy22Parser::LeqContext * /*ctx*/) override { }
  virtual void exitLeq(Sysy22Parser::LeqContext * /*ctx*/) override { }

  virtual void enterGt(Sysy22Parser::GtContext * /*ctx*/) override { }
  virtual void exitGt(Sysy22Parser::GtContext * /*ctx*/) override { }

  virtual void enterNeq(Sysy22Parser::NeqContext * /*ctx*/) override { }
  virtual void exitNeq(Sysy22Parser::NeqContext * /*ctx*/) override { }

  virtual void enterEq(Sysy22Parser::EqContext * /*ctx*/) override { }
  virtual void exitEq(Sysy22Parser::EqContext * /*ctx*/) override { }

  virtual void enterEqExp_(Sysy22Parser::EqExp_Context * /*ctx*/) override { }
  virtual void exitEqExp_(Sysy22Parser::EqExp_Context * /*ctx*/) override { }

  virtual void enterLAndExp_(Sysy22Parser::LAndExp_Context * /*ctx*/) override { }
  virtual void exitLAndExp_(Sysy22Parser::LAndExp_Context * /*ctx*/) override { }

  virtual void enterAnd(Sysy22Parser::AndContext * /*ctx*/) override { }
  virtual void exitAnd(Sysy22Parser::AndContext * /*ctx*/) override { }

  virtual void enterOr(Sysy22Parser::OrContext * /*ctx*/) override { }
  virtual void exitOr(Sysy22Parser::OrContext * /*ctx*/) override { }

  virtual void enterLOrExp_(Sysy22Parser::LOrExp_Context * /*ctx*/) override { }
  virtual void exitLOrExp_(Sysy22Parser::LOrExp_Context * /*ctx*/) override { }


  virtual void enterEveryRule(antlr4::ParserRuleContext * /*ctx*/) override { }
  virtual void exitEveryRule(antlr4::ParserRuleContext * /*ctx*/) override { }
  virtual void visitTerminal(antlr4::tree::TerminalNode * /*node*/) override { }
  virtual void visitErrorNode(antlr4::tree::ErrorNode * /*node*/) override { }

};

