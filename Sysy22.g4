grammar Sysy22;

import SysyLex;

prog : funcDef;

compUnit : funcDef;

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



