grammar Sysy22;

import SysyLex;

prog : compUnits;

compUnits : compUnit* EOF;

compUnit : funcDef | decl;

decl
    : constDecl
    | varDecl
    ;

constDecl
    : CONST bType constDef ( ',' constDef)* ';'
    ;

constDef
    : Ident ('[' exp ']')* Assign initVal
    ;

varDecl
    : bType varDef  (',' varDef)* ';'
    ;

varDef
    : Ident ('[' exp ']')* (Assign initVal)?
    ;

initVal
    : exp   # init
    | '{' (initVal (',' initVal)*)? '}' # initList
    ;

bType
    : INT   # int
    | FLOAT # float
    ;

funcDef : funcType Ident '(' funcFParams? ')' block;

funcType
    : INT
    | FLOAT
    | VOID
    ;

funcFParams
    : funcFParam (',' funcFParam)*
    ;

funcFParam
    : bType Ident   # scalarParam
    | bType Ident '['  ']' '[' exp ']'  # arrayParam
    ;

block
    :  '{' blockItem* '}'
    ;

blockItem
    : decl
    | stmt
    ;

stmt
    : lVal Assign exp ';'  # assignment
    | exp? ';'  # exprStmt
    | block  # blockStmt
    | IF '(' cond ')' stmt (ELSE stmt)?  # ifElse
    | WHILE '(' cond ')' stmt  # while
    | BREAK ';'  # break
    | CONTINUE ';'  # continue
    | RETURN exp? ';'  # return
    ;

exp : addExp;

cond : lOrExp;

lVal : Ident ('[' exp ']')*;

primaryExp
    : '(' exp ')'  # primaryExp_
    | lVal  # lValExpr
    | number  # primaryExp_
    ;

intConst
    : IntConst
    ;

floatConst
    : FloatConst
    ;

number
    : intConst
    | floatConst
    ;

unaryExp
    : primaryExp  # unaryExp_
    | Ident '(' funcRParams? ')'  # call
    | Add unaryExp  # unaryAdd
    | Sub unaryExp  # unarySub
    | Not unaryExp  # not
    ;

stringConst : StringConst;

funcRParam
    : exp
    | stringConst
    ;
funcRParams : funcRParam (',' funcRParam)*;

mulExp
    : unaryExp  # mulExp_
    | mulExp Mul unaryExp  # mul
    | mulExp Div unaryExp  # div
    | mulExp Mod unaryExp  # mod
    ;

addExp
    : mulExp  # addExp_
    | addExp Add mulExp  # add
    | addExp Sub mulExp  # sub
    ;

relExp
    : addExp  # relExp_
    | relExp Lt addExp  # lt
    | relExp Gt addExp  # gt
    | relExp Leq addExp  # leq
    | relExp Geq addExp  # geq
    ;

eqExp
    : relExp  # eqExp_
    | eqExp Eq relExp  # eq
    | eqExp Neq relExp  # neq
    ;

lAndExp
    : eqExp  # lAndExp_
    | lAndExp And eqExp  # and
    ;

lOrExp
    : lAndExp  # lOrExp_
    | lOrExp Or lAndExp  # or
    ;


