# FrontEnd

## 整个编译器架构
- antlr_parset --> ast -(type check, sema)-> ir -(main function check, opt)->  backend_4rv

```mermaid
---
title : Sysy语言编译器
---
graph TD;
    A
```

* [AST](#AST)
* [Sysy22的类型](#Sysy22的类型)

## AST

* AST类图
```mermaid
classDiagram

Display <|-- ASTNode
Display : print()
Display : to_string()
Display : ostream

ASTNode <|-- CompUnit
ASTNode <|-- Func
ASTNode <|-- Decl
ASTNode <|-- Expr
ASTNode <|-- Stmt

ASTNode <|-- Initializer 
ASTNode <|-- StringLiteral 

Expr <|-- BinaryExpr 
Expr <|-- LValue 
Expr <|-- Literal
Expr <|-- Call 

Literal <|-- FloatLiteral
Literal <|-- IntLiteral

Stmt <|-- Assignment 
Stmt <|-- Block 
Stmt <|-- Break 
Stmt <|-- Continue 
Stmt <|-- ExprStmt
Stmt <|-- IfElse
Stmt <|-- Return 
Stmt <|-- While

class CompUnit{
    vector children
    print()
}

class ScalarType {
Type _type_
ScalarType(Type type)
print(ostream &out, unsigned level)
}

class Decl {
Type _type_;
bool is_const;
unique_ptr<Ident> _idnet;
unique_ptr<Initializer> _initializer;
}

```

# Sysy22的类型（定义）

* 基本类型
    | 类型| |
    | --- | --- |
    | int | --- |
    | int array | --- |
    | float | --- |
    | float array| --- |
    | void | 仅修饰函数 |
* 类图

```mermaid
classDiagram
class Type

Type : int base_type
Type : bool is_const
Type : vector dims

 Type:Type()
 Type:Type( btype)
 Type:Type( btype,  const_qualified)
 Type:Type( btype, dimensions)
 Type:Type( type, dimensions)

Type : bool is_dim(a)
Type : string type_string()
Type : bool is_pointer()
Type : bool is_pointer_to_scalar()
Type : bool is_gp()
```

## Typer(类型检查)
- 使用访问者遍历完ANTLR得到的解析树后，得到AST，然后再用访问者（类型检查，也就是语义分析器）进行类型检测
* Typer类图
```mermaid
classDiagram
class Typer {
SymbolTable sym_tab

void visit_declaration(const ast:：Declaration &)
void visit_function(const ast::Function &);
void attach_symbol(const ast::LValue &);
}

Display <|-- Typer
Typer <|-- ArrayType 
Typer <|-- ScalarType

```
