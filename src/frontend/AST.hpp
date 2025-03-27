#pragma once

#include "common/Display.hpp"
#include "common/defines.hpp"
#include <memory>
#include <variant>
#include <vector>


namespace frontend {
namespace ast {

class SysyType : public Display {
public:
    virtual ~SysyType() = default;
};

/// 标量类型
class ScalarType : public SysyType {
public:
    using Type = int;

    ScalarType(Type type) : _type_(type) {}
    virtual ~ScalarType() = default;

    void print(std::ostream &out, unsigned level) const override;

private:
    /// 用整数表示类型， 0 --> int ; 1 --> float;
    Type _type_;
};

/// 数组类型
class ArrayType : public SysyType {
public:
    virtual ~ArrayType() = default;
};

class Ident : public Display {
public:
    Ident(std::string ident_name) : ident_name(std::move(ident_name)) {}
    virtual ~Ident() = default;
    void print(std::ostream &out, unsigned level) const override;

    std::string &identifier() {return ident_name;}
private:
    std::string ident_name;
};

class ASTNode : public Display {};



class Func : public ASTNode {};

class Expr : public ASTNode {};

class Stmt : public ASTNode {};

class Initializer : public ASTNode {};

class StringLiteral : public ASTNode {};

class BinaryExpr : public Expr {};

class LValue : public Expr {};

class Literal : public Expr {};

class Call : public Expr {};

class IntLiteral : public Literal {};

class FloatLiteral : public Literal {};

class Assignment : public Stmt {};
class Block : public Stmt {
public:

    void print(std::ostream &out, unsigned level) const override;
};

class Break : public Stmt {
public:
    virtual ~Break() = default;
    void print(std::ostream &out, unsigned level) const override;
};
class Return : public Stmt {
public:
    explicit Return(std::unique_ptr<Expr> rets) : _rets(std::move(rets)) {}

    const std::unique_ptr<Expr> &rets() {return _rets;}
    
    virtual ~Return() = default;
    void print(std::ostream &out, unsigned level) const override;
private:
    std::unique_ptr<Expr> _rets;
};

class Continue : public Stmt {
public:
    virtual ~Continue() = default;
    void print(std::ostream &out, unsigned level) const override;
};
class ExprStmt : public Stmt {};
class IfStmt : public Stmt {};
class WhileStmt : public Stmt {};

class Decl : public ASTNode {
public:
    Decl(std::unique_ptr<SysyType> type, bool is_const, std::unique_ptr<Ident> ident, std::unique_ptr<Initializer> init) : _type(std::move(type)), _is_const(is_const), _ident(std::move(ident)), _init(std::move(init))   {}

    const std::unique_ptr<SysyType> &type() { return _type; }
    const bool is_const() {return _is_const;}
    const std::unique_ptr<Ident> &ident() {return _ident;} 
    const std::unique_ptr<Initializer> &init() {return  _init;}
    
    virtual ~Decl() = default;
    void print(std::ostream &out, unsigned level) const override;
private:
    std::unique_ptr<SysyType> _type;
    bool _is_const;
    std::unique_ptr<Ident> _ident;
    std::unique_ptr<Initializer> _init;
};

class CompUnit : public ASTNode {
public:
    using Child = std::variant<std::unique_ptr<Decl>, std::unique_ptr<Func>>;

    explicit CompUnit(std::vector<Child> children) : _children(std::move(children)) {}
    
    virtual ~CompUnit() = default;
    void print(std::ostream &out, unsigned level) const override;

    const std::vector<Child> &children() {return _children;}
private:
    std::vector<Child> _children;
};


};
};

