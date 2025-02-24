grammar Sysy22;

import SysyLex;

prog : funcDef;

// CompUnit : FuncDef;

funcDef : funcType Ident '('  ')' block;

funcType
    : INT
    | FLOAT
    | VOID
    ;

block
    : '{' stmt '}'
    ;

stmt
    : RETURN number ';'
    ;

number
    : IntConst
    | FloatConst
    ;



