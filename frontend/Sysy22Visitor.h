
// Generated from Sysy22.g4 by ANTLR 4.10.1

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

    virtual std::any visitDecl(Sysy22Parser::DeclContext *context) = 0;

    virtual std::any visitConstDecl(Sysy22Parser::ConstDeclContext *context) = 0;

    virtual std::any visitBType(Sysy22Parser::BTypeContext *context) = 0;

    virtual std::any visitConstDef(Sysy22Parser::ConstDefContext *context) = 0;

    virtual std::any visitScalarConstInitVal(Sysy22Parser::ScalarConstInitValContext *context) = 0;

    virtual std::any visitListConstInitVal(Sysy22Parser::ListConstInitValContext *context) = 0;

    virtual std::any visitVarDecl(Sysy22Parser::VarDeclContext *context) = 0;

    virtual std::any visitUninitVarDef(Sysy22Parser::UninitVarDefContext *context) = 0;

    virtual std::any visitInitVarDef(Sysy22Parser::InitVarDefContext *context) = 0;

    virtual std::any visitScalarInitVal(Sysy22Parser::ScalarInitValContext *context) = 0;

    virtual std::any visitListInitval(Sysy22Parser::ListInitvalContext *context) = 0;

    virtual std::any visitFuncDef(Sysy22Parser::FuncDefContext *context) = 0;

    virtual std::any visitFuncType(Sysy22Parser::FuncTypeContext *context) = 0;

    virtual std::any visitFuncFParams(Sysy22Parser::FuncFParamsContext *context) = 0;

    virtual std::any visitFuncFParam(Sysy22Parser::FuncFParamContext *context) = 0;

    virtual std::any visitBlock(Sysy22Parser::BlockContext *context) = 0;

    virtual std::any visitBlockItem(Sysy22Parser::BlockItemContext *context) = 0;

    virtual std::any visitAssignment(Sysy22Parser::AssignmentContext *context) = 0;

    virtual std::any visitExpStmt(Sysy22Parser::ExpStmtContext *context) = 0;

    virtual std::any visitBlockStmt(Sysy22Parser::BlockStmtContext *context) = 0;

    virtual std::any visitIfStmt1(Sysy22Parser::IfStmt1Context *context) = 0;

    virtual std::any visitIfStmt2(Sysy22Parser::IfStmt2Context *context) = 0;

    virtual std::any visitWhileStmt(Sysy22Parser::WhileStmtContext *context) = 0;

    virtual std::any visitBreakStmt(Sysy22Parser::BreakStmtContext *context) = 0;

    virtual std::any visitContinueStmt(Sysy22Parser::ContinueStmtContext *context) = 0;

    virtual std::any visitReturnStmt(Sysy22Parser::ReturnStmtContext *context) = 0;

    virtual std::any visitExp(Sysy22Parser::ExpContext *context) = 0;

    virtual std::any visitCond(Sysy22Parser::CondContext *context) = 0;

    virtual std::any visitLVal(Sysy22Parser::LValContext *context) = 0;

    virtual std::any visitPrimaryExp1(Sysy22Parser::PrimaryExp1Context *context) = 0;

    virtual std::any visitPrimaryExp2(Sysy22Parser::PrimaryExp2Context *context) = 0;

    virtual std::any visitPrimaryExp3(Sysy22Parser::PrimaryExp3Context *context) = 0;

    virtual std::any visitInt_Literal(Sysy22Parser::Int_LiteralContext *context) = 0;

    virtual std::any visitFloat_Literal(Sysy22Parser::Float_LiteralContext *context) = 0;

    virtual std::any visitUnary1(Sysy22Parser::Unary1Context *context) = 0;

    virtual std::any visitUnary2(Sysy22Parser::Unary2Context *context) = 0;

    virtual std::any visitUnary3(Sysy22Parser::Unary3Context *context) = 0;

    virtual std::any visitUnaryOp(Sysy22Parser::UnaryOpContext *context) = 0;

    virtual std::any visitFuncRParams(Sysy22Parser::FuncRParamsContext *context) = 0;

    virtual std::any visitExpAsRParam(Sysy22Parser::ExpAsRParamContext *context) = 0;

    virtual std::any visitStringAsRParam(Sysy22Parser::StringAsRParamContext *context) = 0;

    virtual std::any visitMul2(Sysy22Parser::Mul2Context *context) = 0;

    virtual std::any visitMul1(Sysy22Parser::Mul1Context *context) = 0;

    virtual std::any visitAdd2(Sysy22Parser::Add2Context *context) = 0;

    virtual std::any visitAdd1(Sysy22Parser::Add1Context *context) = 0;

    virtual std::any visitRel2(Sysy22Parser::Rel2Context *context) = 0;

    virtual std::any visitRel1(Sysy22Parser::Rel1Context *context) = 0;

    virtual std::any visitEq1(Sysy22Parser::Eq1Context *context) = 0;

    virtual std::any visitEq2(Sysy22Parser::Eq2Context *context) = 0;

    virtual std::any visitLAnd2(Sysy22Parser::LAnd2Context *context) = 0;

    virtual std::any visitLAnd1(Sysy22Parser::LAnd1Context *context) = 0;

    virtual std::any visitLOr1(Sysy22Parser::LOr1Context *context) = 0;

    virtual std::any visitLOr2(Sysy22Parser::LOr2Context *context) = 0;

    virtual std::any visitConstExp(Sysy22Parser::ConstExpContext *context) = 0;


};

