
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

  virtual void enterCompUnit(Sysy22Parser::CompUnitContext * /*ctx*/) override { }
  virtual void exitCompUnit(Sysy22Parser::CompUnitContext * /*ctx*/) override { }

  virtual void enterDecl(Sysy22Parser::DeclContext * /*ctx*/) override { }
  virtual void exitDecl(Sysy22Parser::DeclContext * /*ctx*/) override { }

  virtual void enterConstDecl(Sysy22Parser::ConstDeclContext * /*ctx*/) override { }
  virtual void exitConstDecl(Sysy22Parser::ConstDeclContext * /*ctx*/) override { }

  virtual void enterBType(Sysy22Parser::BTypeContext * /*ctx*/) override { }
  virtual void exitBType(Sysy22Parser::BTypeContext * /*ctx*/) override { }

  virtual void enterConstDef(Sysy22Parser::ConstDefContext * /*ctx*/) override { }
  virtual void exitConstDef(Sysy22Parser::ConstDefContext * /*ctx*/) override { }

  virtual void enterScalarConstInitVal(Sysy22Parser::ScalarConstInitValContext * /*ctx*/) override { }
  virtual void exitScalarConstInitVal(Sysy22Parser::ScalarConstInitValContext * /*ctx*/) override { }

  virtual void enterListConstInitVal(Sysy22Parser::ListConstInitValContext * /*ctx*/) override { }
  virtual void exitListConstInitVal(Sysy22Parser::ListConstInitValContext * /*ctx*/) override { }

  virtual void enterVarDecl(Sysy22Parser::VarDeclContext * /*ctx*/) override { }
  virtual void exitVarDecl(Sysy22Parser::VarDeclContext * /*ctx*/) override { }

  virtual void enterUninitVarDef(Sysy22Parser::UninitVarDefContext * /*ctx*/) override { }
  virtual void exitUninitVarDef(Sysy22Parser::UninitVarDefContext * /*ctx*/) override { }

  virtual void enterInitVarDef(Sysy22Parser::InitVarDefContext * /*ctx*/) override { }
  virtual void exitInitVarDef(Sysy22Parser::InitVarDefContext * /*ctx*/) override { }

  virtual void enterScalarInitVal(Sysy22Parser::ScalarInitValContext * /*ctx*/) override { }
  virtual void exitScalarInitVal(Sysy22Parser::ScalarInitValContext * /*ctx*/) override { }

  virtual void enterListInitval(Sysy22Parser::ListInitvalContext * /*ctx*/) override { }
  virtual void exitListInitval(Sysy22Parser::ListInitvalContext * /*ctx*/) override { }

  virtual void enterFuncDef(Sysy22Parser::FuncDefContext * /*ctx*/) override { }
  virtual void exitFuncDef(Sysy22Parser::FuncDefContext * /*ctx*/) override { }

  virtual void enterFuncType(Sysy22Parser::FuncTypeContext * /*ctx*/) override { }
  virtual void exitFuncType(Sysy22Parser::FuncTypeContext * /*ctx*/) override { }

  virtual void enterFuncFParams(Sysy22Parser::FuncFParamsContext * /*ctx*/) override { }
  virtual void exitFuncFParams(Sysy22Parser::FuncFParamsContext * /*ctx*/) override { }

  virtual void enterFuncFParam(Sysy22Parser::FuncFParamContext * /*ctx*/) override { }
  virtual void exitFuncFParam(Sysy22Parser::FuncFParamContext * /*ctx*/) override { }

  virtual void enterBlock(Sysy22Parser::BlockContext * /*ctx*/) override { }
  virtual void exitBlock(Sysy22Parser::BlockContext * /*ctx*/) override { }

  virtual void enterBlockItem(Sysy22Parser::BlockItemContext * /*ctx*/) override { }
  virtual void exitBlockItem(Sysy22Parser::BlockItemContext * /*ctx*/) override { }

  virtual void enterAssignment(Sysy22Parser::AssignmentContext * /*ctx*/) override { }
  virtual void exitAssignment(Sysy22Parser::AssignmentContext * /*ctx*/) override { }

  virtual void enterExpStmt(Sysy22Parser::ExpStmtContext * /*ctx*/) override { }
  virtual void exitExpStmt(Sysy22Parser::ExpStmtContext * /*ctx*/) override { }

  virtual void enterBlockStmt(Sysy22Parser::BlockStmtContext * /*ctx*/) override { }
  virtual void exitBlockStmt(Sysy22Parser::BlockStmtContext * /*ctx*/) override { }

  virtual void enterIfStmt1(Sysy22Parser::IfStmt1Context * /*ctx*/) override { }
  virtual void exitIfStmt1(Sysy22Parser::IfStmt1Context * /*ctx*/) override { }

  virtual void enterIfStmt2(Sysy22Parser::IfStmt2Context * /*ctx*/) override { }
  virtual void exitIfStmt2(Sysy22Parser::IfStmt2Context * /*ctx*/) override { }

  virtual void enterWhileStmt(Sysy22Parser::WhileStmtContext * /*ctx*/) override { }
  virtual void exitWhileStmt(Sysy22Parser::WhileStmtContext * /*ctx*/) override { }

  virtual void enterBreakStmt(Sysy22Parser::BreakStmtContext * /*ctx*/) override { }
  virtual void exitBreakStmt(Sysy22Parser::BreakStmtContext * /*ctx*/) override { }

  virtual void enterContinueStmt(Sysy22Parser::ContinueStmtContext * /*ctx*/) override { }
  virtual void exitContinueStmt(Sysy22Parser::ContinueStmtContext * /*ctx*/) override { }

  virtual void enterReturnStmt(Sysy22Parser::ReturnStmtContext * /*ctx*/) override { }
  virtual void exitReturnStmt(Sysy22Parser::ReturnStmtContext * /*ctx*/) override { }

  virtual void enterExp(Sysy22Parser::ExpContext * /*ctx*/) override { }
  virtual void exitExp(Sysy22Parser::ExpContext * /*ctx*/) override { }

  virtual void enterCond(Sysy22Parser::CondContext * /*ctx*/) override { }
  virtual void exitCond(Sysy22Parser::CondContext * /*ctx*/) override { }

  virtual void enterLVal(Sysy22Parser::LValContext * /*ctx*/) override { }
  virtual void exitLVal(Sysy22Parser::LValContext * /*ctx*/) override { }

  virtual void enterPrimaryExp1(Sysy22Parser::PrimaryExp1Context * /*ctx*/) override { }
  virtual void exitPrimaryExp1(Sysy22Parser::PrimaryExp1Context * /*ctx*/) override { }

  virtual void enterPrimaryExp2(Sysy22Parser::PrimaryExp2Context * /*ctx*/) override { }
  virtual void exitPrimaryExp2(Sysy22Parser::PrimaryExp2Context * /*ctx*/) override { }

  virtual void enterPrimaryExp3(Sysy22Parser::PrimaryExp3Context * /*ctx*/) override { }
  virtual void exitPrimaryExp3(Sysy22Parser::PrimaryExp3Context * /*ctx*/) override { }

  virtual void enterInt_Literal(Sysy22Parser::Int_LiteralContext * /*ctx*/) override { }
  virtual void exitInt_Literal(Sysy22Parser::Int_LiteralContext * /*ctx*/) override { }

  virtual void enterFloat_Literal(Sysy22Parser::Float_LiteralContext * /*ctx*/) override { }
  virtual void exitFloat_Literal(Sysy22Parser::Float_LiteralContext * /*ctx*/) override { }

  virtual void enterUnary1(Sysy22Parser::Unary1Context * /*ctx*/) override { }
  virtual void exitUnary1(Sysy22Parser::Unary1Context * /*ctx*/) override { }

  virtual void enterUnary2(Sysy22Parser::Unary2Context * /*ctx*/) override { }
  virtual void exitUnary2(Sysy22Parser::Unary2Context * /*ctx*/) override { }

  virtual void enterUnary3(Sysy22Parser::Unary3Context * /*ctx*/) override { }
  virtual void exitUnary3(Sysy22Parser::Unary3Context * /*ctx*/) override { }

  virtual void enterUnaryOp(Sysy22Parser::UnaryOpContext * /*ctx*/) override { }
  virtual void exitUnaryOp(Sysy22Parser::UnaryOpContext * /*ctx*/) override { }

  virtual void enterFuncRParams(Sysy22Parser::FuncRParamsContext * /*ctx*/) override { }
  virtual void exitFuncRParams(Sysy22Parser::FuncRParamsContext * /*ctx*/) override { }

  virtual void enterExpAsRParam(Sysy22Parser::ExpAsRParamContext * /*ctx*/) override { }
  virtual void exitExpAsRParam(Sysy22Parser::ExpAsRParamContext * /*ctx*/) override { }

  virtual void enterStringAsRParam(Sysy22Parser::StringAsRParamContext * /*ctx*/) override { }
  virtual void exitStringAsRParam(Sysy22Parser::StringAsRParamContext * /*ctx*/) override { }

  virtual void enterMul2(Sysy22Parser::Mul2Context * /*ctx*/) override { }
  virtual void exitMul2(Sysy22Parser::Mul2Context * /*ctx*/) override { }

  virtual void enterMul1(Sysy22Parser::Mul1Context * /*ctx*/) override { }
  virtual void exitMul1(Sysy22Parser::Mul1Context * /*ctx*/) override { }

  virtual void enterAdd2(Sysy22Parser::Add2Context * /*ctx*/) override { }
  virtual void exitAdd2(Sysy22Parser::Add2Context * /*ctx*/) override { }

  virtual void enterAdd1(Sysy22Parser::Add1Context * /*ctx*/) override { }
  virtual void exitAdd1(Sysy22Parser::Add1Context * /*ctx*/) override { }

  virtual void enterRel2(Sysy22Parser::Rel2Context * /*ctx*/) override { }
  virtual void exitRel2(Sysy22Parser::Rel2Context * /*ctx*/) override { }

  virtual void enterRel1(Sysy22Parser::Rel1Context * /*ctx*/) override { }
  virtual void exitRel1(Sysy22Parser::Rel1Context * /*ctx*/) override { }

  virtual void enterEq1(Sysy22Parser::Eq1Context * /*ctx*/) override { }
  virtual void exitEq1(Sysy22Parser::Eq1Context * /*ctx*/) override { }

  virtual void enterEq2(Sysy22Parser::Eq2Context * /*ctx*/) override { }
  virtual void exitEq2(Sysy22Parser::Eq2Context * /*ctx*/) override { }

  virtual void enterLAnd2(Sysy22Parser::LAnd2Context * /*ctx*/) override { }
  virtual void exitLAnd2(Sysy22Parser::LAnd2Context * /*ctx*/) override { }

  virtual void enterLAnd1(Sysy22Parser::LAnd1Context * /*ctx*/) override { }
  virtual void exitLAnd1(Sysy22Parser::LAnd1Context * /*ctx*/) override { }

  virtual void enterLOr1(Sysy22Parser::LOr1Context * /*ctx*/) override { }
  virtual void exitLOr1(Sysy22Parser::LOr1Context * /*ctx*/) override { }

  virtual void enterLOr2(Sysy22Parser::LOr2Context * /*ctx*/) override { }
  virtual void exitLOr2(Sysy22Parser::LOr2Context * /*ctx*/) override { }

  virtual void enterConstExp(Sysy22Parser::ConstExpContext * /*ctx*/) override { }
  virtual void exitConstExp(Sysy22Parser::ConstExpContext * /*ctx*/) override { }


  virtual void enterEveryRule(antlr4::ParserRuleContext * /*ctx*/) override { }
  virtual void exitEveryRule(antlr4::ParserRuleContext * /*ctx*/) override { }
  virtual void visitTerminal(antlr4::tree::TerminalNode * /*node*/) override { }
  virtual void visitErrorNode(antlr4::tree::ErrorNode * /*node*/) override { }

};

