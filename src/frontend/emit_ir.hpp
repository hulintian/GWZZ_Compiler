#pragma once
#include "frontend/AST.hpp"
#include "IR/IR.hpp"
#include "frontend/funcEmitter.hpp"

namespace frontend{

using namespace midend;

class GenIr{
private:
    std::unordered_map<Var *, DataMeta *> ast2ir_var;
    Module *module;

public:
    GenIr(){};
    virtual ~GenIr() {};

    Type getType(const ast::Func *func);
    Module *transform(const ast::CompUnits &ast);
    void visitParameter(const ast::Param &param, FuncEmitter *funcEmitter);
    void visitStatement(const ast::Stmt &stmt, FuncEmitter *funcEmitter);
    void visitDeclaration(const ast::Decl &decl, FuncEmitter *funcEmitter);
    void visitIf(const ast::IfStmt &if_stmt, FuncEmitter *funcEmitter);
    void visitWhile(const ast::WhileStmt &while_stmt, FuncEmitter *funcEmitter);
    Temp *visitArithExpr(const ast::Expr *expr, FuncEmitter *funcEmitter, int literal_type = -1);
    Temp *visitLogicExpr(const ast::Expr *expr, BasicBlock *true_bb, BasicBlock *false_bb, FuncEmitter *funcEmitter);
    Temp *visitLValue(const ast::LValue *lvalue, FuncEmitter *funcEmitter, bool return_addr_when_scalar);
    int visitInitializer(Type var_type, DataMeta *data, ast::Initializer *initializer, int idx, FuncEmitter *funcEmitter, int max_size, bool is_zero_init);
    Temp *visitCast(Temp *temp, Type to_type, FuncEmitter *funcEmitter);
    ConstValue visitConstExpr(ast::Expr *expr);
    ConstValue visitConstLValue(ast::LValue *lvalue);
    std::vector<ConstValue> visitConstInitializer(ast::Initializer *initializer, Type var_type, int max_size);
};

} // namespace middleend
