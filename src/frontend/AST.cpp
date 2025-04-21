#include "frontend/AST.hpp"
#include "common/defines.hpp"
#include "common/type.hpp"
#include "common/utils.hpp"
#include <string_view>

using namespace frontend::ast;
using std::ostream;

using AstScalarType = frontend::ast::ScalarType;

std::string_view op_string(UnaryOp op) {
    unsigned i = static_cast<unsigned>(op);
    if(i > 3) return "<unknow_unary_op>";
    static constexpr std::string_view op_strings_unary[] = {
        "+", "-", "!" };
    return op_strings_unary[i];
}

std::string_view op_string(BinaryOp op) {
    unsigned i = static_cast<unsigned>(op);
    if(op >= BinaryOp::NR_OPS) return "<unknown_binary_op>";
    static constexpr std::string_view op_string_binary[] = {
        "+",  "-", "*", "/", "%", "==", "!=", "<", ">", "<=", ">=", "&&", "||", ">>", "<<", "<<<",
    };
    return op_string_binary[i];
}

std::string_view type_string(int t) {
    switch (t) {
        case Int: return "int" ; break;
        case Float: return "float" ; break;
        default: break;
    } 
    return "<unknown_scalar_type>";
}

std::string_view type_string(const AstScalarType *t) {
    if(!t) return "void";
    return type_string(t->type());
}

ostream &operator<<(ostream &os, const std::unique_ptr<AstScalarType> &type) {
  os << type_string(type.get());
  return os;
}

ostream &operator<<(ostream &os, const Ident &ident) {
  os << ident.identifier();
  return os;
}

ostream &operator<<(ostream &os, const ArrayType &type) {
  os << type_string(type.base_type());
  int n_dims = type.dimensions().size();
  if (type.omit_first_dimesion()) n_dims++;
  for (int i = 0; i < n_dims; i++)
    os << "[]";
  return os;
}

ostream &operator<<(ostream &os, const std::unique_ptr<SysyType> &type) {
  if (!type) {
    os << "void";
    return os;
  }

  auto raw = type.get();
  if (auto scalar_type = dynamic_cast<AstScalarType *>(raw)) {
    os << type_string(scalar_type);
  } else if (auto array_type = dynamic_cast<ArrayType *>(raw)) {
    os << *array_type;
  } else {
    assert(false), "Error: Invalid sysYTypem,this should not happen!";
  }
  return os;
}

ostream &operator<<(ostream &os, const Param &param) {
  os << param.type() << ' ' << param.ident();
  return os;
}

void AstScalarType::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << type_string(this) << '\n';
}

void ArrayType::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << *this << '\n';
}

void Ident::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << *this << '\n';
}

void Param::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << *this << '\n';
}

void LValue::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "LValue " << _ident << ":";
  for (auto const &index : this->_indices) {
    out << "[" << "\n";
    index->print(out, indent + INDENT_LEN);//这里最后会带一个换行
    print_indent(out, indent);
    out << ']';
  }
  out << '\n';
}

void UnaryExpr::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "UnaryExpr " << op_string(_op) << '\n';
  assert(_operand), "Error: No operand,this should not happen!";

  _operand->print(out, indent + INDENT_LEN);//最后会带一个换行符
}

void BinaryExpr::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "BinaryExpr " << op_string(_op) << '\n';
  assert(_lhs), "Error:no lhs,this should not happen!";
  assert(_rhs), "Error:no rhs,this should not happen!";
  _lhs->print(out, indent + INDENT_LEN);//最后会带一个换行符
  _rhs->print(out, indent + INDENT_LEN);//最后会带一个换行符
}

void IntLiteral::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "IntLiteral " << _value << '\n';
}

void FloatLiteral::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "FloatLiteral " << _value << '\n';
}

void StringLiteral::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "StringLiteral " << _value << '\n';
}

void Call::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "Call func:" << _func << "(\n";
  for (auto &arg : _args) {
    // is expression
    if (arg.index() == 0) { 
      auto &expr = std::get<std::unique_ptr<Expr>>(arg);
      assert(expr), "Error: in call print(),this should not happen!";
      expr->print(out, indent + INDENT_LEN);
    }
    // is string literal 
    else {
      auto &literal = std::get<StringLiteral>(arg);
      literal.print(out, indent + INDENT_LEN);
    }
  }
  print_indent(out, indent);
  out << ")\n";
}

void ExprStmt::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "ExprStmt\n";
  if (_expr)
    _expr->print(out, indent + INDENT_LEN);
}

void Assignment::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "Assignment (\n";
  assert(_lhs), "Error in assignment print lhs,this should not happen!";
  _lhs->print(out, indent + INDENT_LEN);
  assert(_rhs), "Error in assignment print rhs,this should not happen!";
  _rhs->print(out, indent + INDENT_LEN);
  print_indent(out, indent);
  out << ")\n";
}

void Initializer::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "Initializer (\n";
  // is expression
  if (_value.index() == 0) {
    auto &expr = std::get<std::unique_ptr<Expr>>(_value);
    assert(expr), "Error in Initializer, this should not happen!";
    expr->print(out, indent + INDENT_LEN);
  } 
  // is initializers(vec)
  else {
    auto &initializers =
        std::get<std::vector<std::unique_ptr<Initializer>>>(_value);
    for (auto &initializer : initializers) {
      assert(initializer), "Error in Initializer, this should not happen!";
      initializer->print(out, indent + INDENT_LEN);
    }
  }
  print_indent(out, indent);
  out << ")\n";
}

void Decl::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "Declaration ";
  if (_is_const)
    out << "const ";
  out << _type << ' ' << *_ident << '\n';
  if (_init)
    _init->print(out, indent + INDENT_LEN);
}

void Block::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "Block {\n";
  for (auto &child : _children) {
    // declaration
    if (child.index() == 1) {
      auto &decl = std::get<std::unique_ptr<Decl>>(child);
      assert(decl), "Error in Block print,this should not happen!";
      decl->print(out, indent + INDENT_LEN);
    } 
    // statement
    else {
      auto &stmt = std::get<std::unique_ptr<Stmt>>(child);
      assert(stmt), "Error in Block print,this should not happen!";
      stmt->print(out, indent + INDENT_LEN);
    }
  }
  print_indent(out, indent);
  out << "}\n";
}

void IfStmt::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "IfElse {\n";

  print_indent(out, indent + INDENT_LEN);
  out << "Cond\n";
  assert(_cond), "Error in Cond,this should not happen!";
  _cond->print(out, indent + INDENT_LEN * 2);

  print_indent(out, indent + INDENT_LEN);
  out << "Then\n";
  assert(_then), "Error in Then,this should not happen!";
  _then->print(out, indent + INDENT_LEN * 2);

  if (_else) {
    print_indent(out, indent + INDENT_LEN);
    out << "Else\n";
    _else->print(out, indent + INDENT_LEN * 2);
  }

  print_indent(out, indent);
  out << "}\n";
}

void WhileStmt::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "While {\n";

  print_indent(out, indent + INDENT_LEN);
  out << "Cond\n";
  assert(_cond), "Error in cond,this should not happen!";
  _cond->print(out, indent + INDENT_LEN * 2);

  print_indent(out, indent + INDENT_LEN);
  out << "Body\n";
  assert(_body), "Error in body,this should not happen!";
  _body->print(out, indent + INDENT_LEN * 2);

  print_indent(out, indent);
  out << "}\n";
}

void Break::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "Break\n";
}

void Continue::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "Continue\n";
}

void Return::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "Return\n";
  if (_rets)
    _rets->print(out, indent + INDENT_LEN);
}

void Func::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "Function " << _type << ' ' << _ident;
  out << '(';
  for (int i = 0; i < _params.size(); ++i) {
    if (i)
      out << ", ";
    assert(_params[i]), "Error in params No." + std::to_string(i) + ",this should not happen!";
    out << *_params[i];
  }
  out << ")\n";
  assert(_body), "Error in body,this should not happen!";
  _body->print(out, indent + INDENT_LEN);
}

void CompUnits::print(std::ostream &out, unsigned int indent) const {
  print_indent(out, indent);
  out << "CompileUnit start{\n";
  for (auto &child : _children) {
    // is declaration
    if (child.index() == 0) {
      auto &decl = std::get<std::unique_ptr<Decl>>(child);
      decl->print(out, indent + INDENT_LEN);
    } 
    // is function
    else {
      auto &func = std::get<std::unique_ptr<Func>>(child);
      func->print(out, indent + INDENT_LEN);
    }
  }
  print_indent(out, indent);
  out << "}CompileUnit end\n";
}
