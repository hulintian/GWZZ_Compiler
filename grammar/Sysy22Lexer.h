
// Generated from Sysy22.g4 by ANTLR 4.13.2

#pragma once


#include "antlr4-runtime.h"




class  Sysy22Lexer : public antlr4::Lexer {
public:
  enum {
    INT = 1, FLOAT = 2, VOID = 3, CONST = 4, RETURN = 5, IF = 6, ELSE = 7, 
    WHILE = 8, BREAK = 9, CONTINUE = 10, LP = 11, RP = 12, LB = 13, RB = 14, 
    LC = 15, RC = 16, COMMA = 17, SEMICOLON = 18, QUESTION = 19, COLON = 20, 
    MINUS = 21, NOT = 22, ASSIGN = 23, ADD = 24, MUL = 25, DIV = 26, MOD = 27, 
    AND = 28, OR = 29, EQ = 30, NEQ = 31, LT = 32, LE = 33, GT = 34, GE = 35, 
    Zero = 36, INT_LIT = 37, FLOAT_LIT = 38, ID = 39, STRING = 40, WS = 41, 
    LINE_COMMENT = 42, BLOCK_COMMENT = 43
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

