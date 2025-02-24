
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

  virtual void enterFuncDef(Sysy22Parser::FuncDefContext * /*ctx*/) override { }
  virtual void exitFuncDef(Sysy22Parser::FuncDefContext * /*ctx*/) override { }

  virtual void enterFuncType(Sysy22Parser::FuncTypeContext * /*ctx*/) override { }
  virtual void exitFuncType(Sysy22Parser::FuncTypeContext * /*ctx*/) override { }

  virtual void enterBlock(Sysy22Parser::BlockContext * /*ctx*/) override { }
  virtual void exitBlock(Sysy22Parser::BlockContext * /*ctx*/) override { }

  virtual void enterStmt(Sysy22Parser::StmtContext * /*ctx*/) override { }
  virtual void exitStmt(Sysy22Parser::StmtContext * /*ctx*/) override { }

  virtual void enterNumber(Sysy22Parser::NumberContext * /*ctx*/) override { }
  virtual void exitNumber(Sysy22Parser::NumberContext * /*ctx*/) override { }


  virtual void enterEveryRule(antlr4::ParserRuleContext * /*ctx*/) override { }
  virtual void exitEveryRule(antlr4::ParserRuleContext * /*ctx*/) override { }
  virtual void visitTerminal(antlr4::tree::TerminalNode * /*node*/) override { }
  virtual void visitErrorNode(antlr4::tree::ErrorNode * /*node*/) override { }

};

