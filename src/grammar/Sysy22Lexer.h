
// Generated from Sysy22.g4 by ANTLR 4.13.2

#pragma once


#include "antlr4-runtime.h"




class  Sysy22Lexer : public antlr4::Lexer {
public:
  enum {
    T__0 = 1, T__1 = 2, T__2 = 3, T__3 = 4, T__4 = 5, T__5 = 6, T__6 = 7, 
    T__7 = 8, INT = 9, FLOAT = 10, VOID = 11, IF = 12, ELSE = 13, WHILE = 14, 
    BREAK = 15, CONTINUE = 16, RETURN = 17, CONST = 18, Assign = 19, Add = 20, 
    Sub = 21, Mul = 22, Div = 23, Mod = 24, Eq = 25, Neq = 26, Lt = 27, 
    Gt = 28, Leq = 29, Geq = 30, Not = 31, And = 32, Or = 33, Ident = 34, 
    DecConst = 35, OctConst = 36, HexConst = 37, DecimalFloatingConst = 38, 
    HexFloatingConst = 39, StringConst = 40, WhiteSpace = 41, LineComment = 42, 
    BlockComment = 43
  };

  explicit Sysy22Lexer(antlr4::CharStream *input);

  ~Sysy22Lexer() override;


  std::string getGrammarFileName() const override;

  const std::vector<std::string>& getRuleNames() const override;

  const std::vector<std::string>& getChannelNames() const override;

  const std::vector<std::string>& getModeNames() const override;

  const antlr4::dfa::Vocabulary& getVocabulary() const override;

  antlr4::atn::SerializedATNView getSerializedATN() const override;

  const antlr4::atn::ATN& getATN() const override;

  // By default the static state used to implement the lexer is lazily initialized during the first
  // call to the constructor. You can call this function if you wish to initialize the static state
  // ahead of time.
  static void initialize();

private:

  // Individual action functions triggered by action() above.

  // Individual semantic predicate functions triggered by sempred() above.

};

