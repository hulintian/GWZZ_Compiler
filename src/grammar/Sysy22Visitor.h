
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

    virtual std::any visitCompUnit(Sysy22Parser::CompUnitContext *context) = 0;

    virtual std::any visitFuncDef(Sysy22Parser::FuncDefContext *context) = 0;

    virtual std::any visitFuncType(Sysy22Parser::FuncTypeContext *context) = 0;

    virtual std::any visitBlock(Sysy22Parser::BlockContext *context) = 0;

    virtual std::any visitStmt(Sysy22Parser::StmtContext *context) = 0;

    virtual std::any visitNumber(Sysy22Parser::NumberContext *context) = 0;


};

