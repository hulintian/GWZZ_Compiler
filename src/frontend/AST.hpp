#pragma once

#include "common/Display.hpp"
#include "common/defines.hpp"
#include <memory>
#include <optional>
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

    ScalarType(Type type) : _type(type) {}
    virtual ~ScalarType() = default;

    Type type() const { return _type; }
    void print(std::ostream &out, unsigned level) const override;

private:
    /// 用整数表示类型， 0 --> int ; 1 --> float;
    Type _type;
};

class Expr;
/// 数组类型
class ArrayType : public SysyType {
public:
    using Dimension = std::unique_ptr<Expr>;
    virtual ~ArrayType() = default;

    ArrayType(ScalarType type, std::vector<Dimension> dimensions, bool omit_first_dimesion) 
            : _type(type) , _dimensions(std::move(dimensions)), _omit_first_dimesion(omit_first_dimesion) {}
    void print(std::ostream &out, unsigned level) const override;

    ScalarType::Type base_type() const { return _type.type(); }
    const std::vector<Dimension>& dimensions() const { return _dimensions; }
    bool omit_first_dimesion() const { return  _omit_first_dimesion;}

private:
    ScalarType _type;
    std::vector<Dimension> _dimensions;
    bool _omit_first_dimesion; // 是否隐藏第一维大小
};

class Ident : public Display {
public:
    // mangle 是否重构变量名（是否在变量名前加$）,用来区别函数名还是变量名
    Ident(std::string ident_name, bool const mangle = true) : ident_name(mangle ? '$' + ident_name : std::move(ident_name)) {}
    virtual ~Ident() = default;
    void print(std::ostream &out, unsigned level) const override;

    const std::string &identifier() const {return ident_name;}
private:
    std::string ident_name;
};

class ASTNode : public Display {
public:
  virtual ~ASTNode() = default;
};

class Param : public Display {
public:
    explicit Param(Ident ident, std::unique_ptr<SysyType> type)
        : _ident(std::move(ident)), _type(std::move(type)) {}
    virtual ~Param() = default;

    const Ident &ident() const { return _ident; }
    const std::unique_ptr<SysyType> &type() const { return _type; }

    void print(std::ostream &out, unsigned level) const override;
public:
    mutable std::shared_ptr<Var> var;
private:
    Ident _ident;
    // scalar type or array type 
    std::unique_ptr<SysyType> _type;
};

class Block;
class Func : public ASTNode {
public:
    explicit Func(std::unique_ptr<ScalarType> type, Ident ident, std::vector<std::unique_ptr<Param>> params, std::unique_ptr<Block> body) 
        : _type(std::move(type)), _ident(std::move(ident)), _params(std::move(params)), _body(std::move(body)) {}
    virtual ~Func() = default;

    const std::unique_ptr<ScalarType> &type() const { return _type; }
    const Ident &ident() const { return _ident; }
    const std::vector<std::unique_ptr<Param>> &params() const { return _params; }
    const std::unique_ptr<Block> &body() const { return _body; }

    void print(std::ostream &out, unsigned level) const override;

private:
    std::unique_ptr<ScalarType> _type;
    Ident _ident;
    std::vector<std::unique_ptr<Param>> _params;
    std::unique_ptr<Block> _body;
};

class Expr : public ASTNode {
public:
    Expr(){}
    virtual ~Expr() = default;

private:
    mutable std::optional<Type> type;
};

class Stmt : public ASTNode {
public:
  virtual ~Stmt() = default;
};

class Initializer : public ASTNode {
public:
    // 初值类型要么是表达式 or initVal list
    using Value = std::variant<std::unique_ptr<Expr>, std::vector<std::unique_ptr<Initializer>>>; 

    explicit Initializer(std::unique_ptr<Expr> expr) : _value(std::move(expr)) {}
    explicit Initializer(std::vector<std::unique_ptr<Initializer>> init_list) : _value(std::move(init_list)) {}
    virtual ~Initializer() = default;

    const Value &value() { return _value; }
    void print(std::ostream &out, unsigned level) const override;

private:
    Value _value;
};

class StringLiteral : public ASTNode {
public:
    using Value = std::string;

    explicit StringLiteral(std::string value) : _value(std::move(value)) {}
    virtual ~StringLiteral() = default;

    const Value &value() const { return _value; }
    void print(std::ostream &out, unsigned level) const override;

private:
    Value _value;
};

#define GetValue(x) (x.type == Int ? x.iv : x.fv)

class BinaryExpr : public Expr {
public:
  BinaryExpr(BinaryOp op, std::unique_ptr<Expr> lhs,
             std::unique_ptr<Expr> rhs)
      : _op{op}, _lhs{std::move(lhs)}, _rhs{std::move(rhs)} {}
  virtual ~BinaryExpr() = default;

    void print(std::ostream &out, unsigned level) const override;

  BinaryOp op() const { return _op; }
  const std::unique_ptr<Expr> &lhs() const { return _lhs; }
  const std::unique_ptr<Expr> &rhs() const { return _rhs; }

  // calcualte the value, when need
  ConstValue to_const(ConstValue lhs, ConstValue rhs, BinaryOp type_) {
    if (type_ == BinaryOp::And) return ConstValue((int)GetValue(lhs) & (int)GetValue(rhs));
    if (type_ == BinaryOp::Or ) return ConstValue((int)GetValue(lhs) | (int)GetValue(rhs));

    if (lhs.type == Float || rhs.type == Float) {
      if (type_ == BinaryOp::Add) return ConstValue(GetValue(lhs) + GetValue(rhs));
      if (type_ == BinaryOp::Sub) return ConstValue(GetValue(lhs) - GetValue(rhs));
      if (type_ == BinaryOp::Mul) return ConstValue(GetValue(lhs) * GetValue(rhs));
      if (type_ == BinaryOp::Div) return ConstValue(GetValue(lhs) / GetValue(rhs));
    }
    else {
      if (type_ == BinaryOp::Add) return ConstValue((int)GetValue(lhs) + (int)GetValue(rhs));
      if (type_ == BinaryOp::Sub) return ConstValue((int)GetValue(lhs) - (int)GetValue(rhs));
      if (type_ == BinaryOp::Mul) return ConstValue((int)GetValue(lhs) * (int)GetValue(rhs));
      if (type_ == BinaryOp::Div) return ConstValue((int)GetValue(lhs) / (int)GetValue(rhs));
    }
    if (type_ == BinaryOp::Mod) return ConstValue((int)GetValue(lhs) % (int)GetValue(rhs));
    
    if (type_ == BinaryOp::Eq) return lhs == rhs;
    if (type_ == BinaryOp::Neq) return lhs != rhs;

    if (type_ == BinaryOp::Lt) return ConstValue(GetValue(lhs) < GetValue(rhs));
    if (type_ == BinaryOp::Leq) return ConstValue(GetValue(lhs) <= GetValue(rhs));
    if (type_ == BinaryOp::Gt) return ConstValue(GetValue(lhs) > GetValue(rhs));
    if (type_ == BinaryOp::Geq) return ConstValue(GetValue(lhs) >= GetValue(rhs));
    if (type_ == BinaryOp::Shr) return ConstValue((int)GetValue(lhs) >> (int)GetValue(rhs));
    if (type_ == BinaryOp::Shl) return ConstValue((int)GetValue(lhs) << (int)GetValue(rhs));
    assert(false);
}

private:
  BinaryOp _op;
  std::unique_ptr<Expr> _lhs, _rhs;

};

class UnaryExpr : public Expr {
public:
    explicit UnaryExpr(UnaryOp op, std::unique_ptr<Expr> operand)
        : _op(op), _operand(std::move(operand)) {}
    virtual ~UnaryExpr() = default;

    UnaryOp op() const { return _op; }
    const std::unique_ptr<Expr> &operand() const { return _operand; }

    void print(std::ostream &out, unsigned level) const override;

private:
    UnaryOp _op;
    std::unique_ptr<Expr> _operand;
};

// 右值 
// 可变 -> 求值
class LValue : public Expr {
public:
    explicit LValue(Ident ident, std::vector<std::unique_ptr<Expr>> indices = {})
        : _ident(std::move(ident)), _indices(std::move(indices)) {}
    virtual ~LValue() = default;

    const Ident &ident() const { return _ident; }
    const std::vector<std::unique_ptr<Expr>> &indices() const { return _indices; }

    void print(std::ostream &out, unsigned level) const override;

public:
    mutable std::shared_ptr<Var> var;

private:
    Ident _ident;
    std::vector<std::unique_ptr<Expr>> _indices;
};

class Literal : public Expr {
public:
    virtual ~Literal() = default;
};

class Call : public Expr {
public:
    using Argument = std::variant<std::unique_ptr<Expr>, StringLiteral>;

    Call(Ident func, std::vector<Argument> args, unsigned line) 
        : _func(func), _args(std::move(args)), _line(line) {}
    virtual ~Call() = default;

    const Ident &func() const { return _func; }
    const std::vector<Argument> &args() const { return _args; }
    unsigned line() const { return this->_line; }

    void print(std::ostream &out, unsigned level) const override;
private:
    Ident _func;
    std::vector<Argument> _args;
    unsigned _line;
};

class IntLiteral : public Literal {
public:
    using Value = int32_t;
    static_assert(sizeof(Value) == 4);

    IntLiteral(Value value) : _value{value} {}
    virtual ~IntLiteral() = default;

    Value value() const { return _value; }

    void print(std::ostream &out, unsigned level) const override;

private:
  Value _value;
};

class FloatLiteral : public Literal {
public:
  using Value = float;
  static_assert(sizeof(Value) == 4);

  FloatLiteral(Value value) : _value{value} {}
  virtual ~FloatLiteral() = default;

  Value value() const { return _value; }

  void print(std::ostream &out, unsigned level) const override;

private:
  Value _value;
};

// 赋值语句 lhs + rhs 
class Assignment : public Stmt {
public:
    explicit Assignment(std::unique_ptr<LValue> lhs, std::unique_ptr<Expr> rhs) : _lhs(std::move(lhs)), _rhs(std::move(rhs)) {}
    virtual ~Assignment() = default;

    const std::unique_ptr<LValue> &lhs() const { return _lhs; }
    const std::unique_ptr<Expr> &rhs() const { return _rhs; }

    void print(std::ostream &out, unsigned level) const override;

private:
    std::unique_ptr<LValue> _lhs;
    std::unique_ptr<Expr> _rhs;
};


class Decl;
/// block items hans stmts and decls
class Block : public Stmt {
public:
    using child = std::variant<std::unique_ptr<Stmt>, std::unique_ptr<Decl>>;
    
    explicit Block(std::vector<child> children) : _children(std::move(children)) {}
    virtual ~Block() = default;

    const std::vector<child> &children() const { return _children; }
    void print(std::ostream &out, unsigned level) const override;

private:
    std::vector<child> _children;
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
class ExprStmt : public Stmt {
public:
    explicit ExprStmt(std::unique_ptr<Expr> expr) : _expr(std::move(expr)) {}
    void print(std::ostream &out, unsigned level) const override;

    const std::unique_ptr<Expr> &expr() const { return _expr; }

private:
    std::unique_ptr<Expr> _expr;
};

class WhileStmt : public Stmt {
public:
    explicit WhileStmt(std::unique_ptr<Expr> cond, std::unique_ptr<Stmt> body)
        : _cond(std::move(cond)), _body(std::move(body)) {}
    virtual ~WhileStmt() = default;

    const std::unique_ptr<Expr> &cond() const { return _cond; }
    const std::unique_ptr<Stmt> &body() const { return _body; }

    void print(std::ostream &out, unsigned level) const override;

private:
    std::unique_ptr<Expr> _cond;
    std::unique_ptr<Stmt> _body;
};

class IfStmt : public Stmt {
public:
    explicit IfStmt(std::unique_ptr<Expr> cond, std::unique_ptr<Stmt> then_stmt, std::unique_ptr<Stmt> else_stmt = nullptr)
        : _cond(std::move(cond)), _then(std::move(then_stmt)), _else(std::move(else_stmt)) {}
    virtual ~IfStmt() = default;

    const std::unique_ptr<Expr> &cond() const { return _cond; }
    const std::unique_ptr<Stmt> &then() const { return _then; }
    const std::unique_ptr<Stmt> &else_stmt() const { return _else; }

    void print(std::ostream &out, unsigned level) const override;

private:
    std::unique_ptr<Expr> _cond;
    std::unique_ptr<Stmt> _then, _else;
};

class Decl : public ASTNode {
public:
    Decl(std::unique_ptr<SysyType> type, bool is_const, std::unique_ptr<Ident> ident, std::unique_ptr<Initializer> init) : _type(std::move(type)), _is_const(is_const), _ident(std::move(ident)), _init(std::move(init))   {}

    const std::unique_ptr<SysyType> &type() const { return _type; }
    const bool is_const()const {return _is_const;}
    const std::unique_ptr<Ident> &ident() const {return _ident;} 
    const std::unique_ptr<Initializer> &init()const {return  _init;}
    
    virtual ~Decl() = default;
    void print(std::ostream &out, unsigned level) const override;
public:
    mutable std::shared_ptr<Var> var;   //用来挂载值
private:
    std::unique_ptr<SysyType> _type;
    bool _is_const;
    std::unique_ptr<Ident> _ident;
    std::unique_ptr<Initializer> _init;
};

class CompUnits : public ASTNode {
public:
    using Child = std::variant<std::unique_ptr<Decl>, std::unique_ptr<Func>>;

    explicit CompUnits(std::vector<Child> children) : _children(std::move(children)) {}
    
    virtual ~CompUnits() = default;
    void print(std::ostream &out, unsigned level) const override;

    const std::vector<Child> &children() const {return _children;}
private:
    std::vector<Child> _children;
};


};
};

