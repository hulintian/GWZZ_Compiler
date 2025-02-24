
// Generated from Sysy22.g4 by ANTLR 4.13.2

#pragma once


#include "antlr4-runtime.h"




class  Sysy22Lexer : public antlr4::Lexer {
public:
  enum {
    T__0 = 1, T__1 = 2, T__2 = 3, T__3 = 4, T__4 = 5, INT = 6, FLOAT = 7, 
    VOID = 8, IF = 9, ELSE = 10, WHILE = 11, BREAK = 12, CONTINUE = 13, 
    RETURN = 14, Ident = 15, IntConst = 16, DecConst = 17, OctConst = 18, 
    HexConst = 19, FloatConst = 20, DecimalFloatingConst = 21, HexFloatingConst = 22, 
    WhiteSpace = 23, LineComment = 24, BlockComment = 25
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

