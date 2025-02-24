
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

  virtual std::any visitProg(Sysy22Parser::ProgContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitCompUnit(Sysy22Parser::CompUnitContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFuncDef(Sysy22Parser::FuncDefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitFuncType(Sysy22Parser::FuncTypeContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitBlock(Sysy22Parser::BlockContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitStmt(Sysy22Parser::StmtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual std::any visitNumber(Sysy22Parser::NumberContext *ctx) override {
    return visitChildren(ctx);
  }


};

