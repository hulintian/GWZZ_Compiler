lexer grammar SysyLex;

// Lexer rules

// Types
INT     :   'int';
FLOAT   :   'float';
VOID    :   'void';

// Keywords
IF      :   'if';
ELSE    :   'else';
WHILE   :   'while';
BREAK   :   'break';
CONTINUE:   'continue';
RETURN  :   'return';

// values

Ident       :   [a-zA-Z_][a-zA-Z0-9_]*;

// numbers

fragment Sign :[+-];
fragment Digit:[0-9];
fragment Non_zero:[1-9];
fragment Hex_Digit:[0-9A-Za-z];
fragment Oct_Digit:[0-7];
fragment Hex_prefix: '0x' | '0X';

IntConst    
    : DecConst
    | OctConst
    | HexConst
    ;

DecConst    
    : Non_zero Digit*
    ;

OctConst    
    : '0'
    | '0' Oct_Digit+
    ;

HexConst    
    : Hex_prefix Hex_Digit+
    ;

FloatConst  
    : DecimalFloatingConst
    | HexFloatingConst
    ;

// 小数+指数 或 整数+指数
DecimalFloatingConst
    : Frac_constant Exp?
    | Digit+ Exp
    ;

fragment Frac_constant
    : Digit* '.' Digit+
    | Digit+ '.'
    ;

fragment Exp :  [eE] Sign? Digit+;

HexFloatingConst
    : Hex_prefix Hex_frac_constant B_Exp
    | Hex_prefix Hex_Digit+ B_Exp
    ;

fragment Hex_frac_constant
    : Hex_Digit* '.' Hex_Digit+
    | Hex_Digit+ '.'
    ;

fragment B_Exp
    : [Pp] Sign? Digit+
    ;


WhiteSpace  :   [ \t\r\n]   -> skip;
LineComment : '//' ~[\r\n]* -> skip;
BlockComment:   '/*'    .*?     '/*'    ->  skip;
