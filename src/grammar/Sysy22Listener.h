
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

  virtual void enterFuncDef(Sysy22Parser::FuncDefContext *ctx) = 0;
  virtual void exitFuncDef(Sysy22Parser::FuncDefContext *ctx) = 0;

  virtual void enterFuncType(Sysy22Parser::FuncTypeContext *ctx) = 0;
  virtual void exitFuncType(Sysy22Parser::FuncTypeContext *ctx) = 0;

  virtual void enterBlock(Sysy22Parser::BlockContext *ctx) = 0;
  virtual void exitBlock(Sysy22Parser::BlockContext *ctx) = 0;

  virtual void enterStmt(Sysy22Parser::StmtContext *ctx) = 0;
  virtual void exitStmt(Sysy22Parser::StmtContext *ctx) = 0;

  virtual void enterNumber(Sysy22Parser::NumberContext *ctx) = 0;
  virtual void exitNumber(Sysy22Parser::NumberContext *ctx) = 0;


};

