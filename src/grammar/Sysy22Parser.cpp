
// Generated from Sysy22.g4 by ANTLR 4.13.2


#include "Sysy22Listener.h"
#include "Sysy22Visitor.h"

#include "Sysy22Parser.h"


using namespace antlrcpp;

using namespace antlr4;

namespace {

struct Sysy22ParserStaticData final {
  Sysy22ParserStaticData(std::vector<std::string> ruleNames,
                        std::vector<std::string> literalNames,
                        std::vector<std::string> symbolicNames)
      : ruleNames(std::move(ruleNames)), literalNames(std::move(literalNames)),
        symbolicNames(std::move(symbolicNames)),
        vocabulary(this->literalNames, this->symbolicNames) {}

  Sysy22ParserStaticData(const Sysy22ParserStaticData&) = delete;
  Sysy22ParserStaticData(Sysy22ParserStaticData&&) = delete;
  Sysy22ParserStaticData& operator=(const Sysy22ParserStaticData&) = delete;
  Sysy22ParserStaticData& operator=(Sysy22ParserStaticData&&) = delete;

  std::vector<antlr4::dfa::DFA> decisionToDFA;
  antlr4::atn::PredictionContextCache sharedContextCache;
  const std::vector<std::string> ruleNames;
  const std::vector<std::string> literalNames;
  const std::vector<std::string> symbolicNames;
  const antlr4::dfa::Vocabulary vocabulary;
  antlr4::atn::SerializedATNView serializedATN;
  std::unique_ptr<antlr4::atn::ATN> atn;
};

::antlr4::internal::OnceFlag sysy22ParserOnceFlag;
#if ANTLR4_USE_THREAD_LOCAL_CACHE
static thread_local
#endif
std::unique_ptr<Sysy22ParserStaticData> sysy22ParserStaticData = nullptr;

void sysy22ParserInitialize() {
#if ANTLR4_USE_THREAD_LOCAL_CACHE
  if (sysy22ParserStaticData != nullptr) {
    return;
  }
#else
  assert(sysy22ParserStaticData == nullptr);
#endif
  auto staticData = std::make_unique<Sysy22ParserStaticData>(
    std::vector<std::string>{
      "prog", "compUnit", "funcDef", "funcType", "block", "stmt", "number"
    },
    std::vector<std::string>{
      "", "'('", "')'", "'{'", "'}'", "';'", "'int'", "'float'", "'void'", 
      "'if'", "'else'", "'while'", "'break'", "'continue'", "'return'"
    },
    std::vector<std::string>{
      "", "", "", "", "", "", "INT", "FLOAT", "VOID", "IF", "ELSE", "WHILE", 
      "BREAK", "CONTINUE", "RETURN", "Ident", "IntConst", "DecConst", "OctConst", 
      "HexConst", "FloatConst", "DecimalFloatingConst", "HexFloatingConst", 
      "WhiteSpace", "LineComment", "BlockComment"
    }
  );
  static const int32_t serializedATNSegment[] = {
  	4,1,25,37,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,1,0,
  	1,0,1,1,1,1,1,2,1,2,1,2,1,2,1,2,1,2,1,3,1,3,1,4,1,4,1,4,1,4,1,5,1,5,1,
  	5,1,5,1,6,1,6,1,6,0,0,7,0,2,4,6,8,10,12,0,2,1,0,6,8,2,0,16,16,20,20,29,
  	0,14,1,0,0,0,2,16,1,0,0,0,4,18,1,0,0,0,6,24,1,0,0,0,8,26,1,0,0,0,10,30,
  	1,0,0,0,12,34,1,0,0,0,14,15,3,4,2,0,15,1,1,0,0,0,16,17,3,4,2,0,17,3,1,
  	0,0,0,18,19,3,6,3,0,19,20,5,15,0,0,20,21,5,1,0,0,21,22,5,2,0,0,22,23,
  	3,8,4,0,23,5,1,0,0,0,24,25,7,0,0,0,25,7,1,0,0,0,26,27,5,3,0,0,27,28,3,
  	10,5,0,28,29,5,4,0,0,29,9,1,0,0,0,30,31,5,14,0,0,31,32,3,12,6,0,32,33,
  	5,5,0,0,33,11,1,0,0,0,34,35,7,1,0,0,35,13,1,0,0,0,0
  };
  staticData->serializedATN = antlr4::atn::SerializedATNView(serializedATNSegment, sizeof(serializedATNSegment) / sizeof(serializedATNSegment[0]));

  antlr4::atn::ATNDeserializer deserializer;
  staticData->atn = deserializer.deserialize(staticData->serializedATN);

  const size_t count = staticData->atn->getNumberOfDecisions();
  staticData->decisionToDFA.reserve(count);
  for (size_t i = 0; i < count; i++) { 
    staticData->decisionToDFA.emplace_back(staticData->atn->getDecisionState(i), i);
  }
  sysy22ParserStaticData = std::move(staticData);
}

}

Sysy22Parser::Sysy22Parser(TokenStream *input) : Sysy22Parser(input, antlr4::atn::ParserATNSimulatorOptions()) {}

Sysy22Parser::Sysy22Parser(TokenStream *input, const antlr4::atn::ParserATNSimulatorOptions &options) : Parser(input) {
  Sysy22Parser::initialize();
  _interpreter = new atn::ParserATNSimulator(this, *sysy22ParserStaticData->atn, sysy22ParserStaticData->decisionToDFA, sysy22ParserStaticData->sharedContextCache, options);
}

Sysy22Parser::~Sysy22Parser() {
  delete _interpreter;
}

const atn::ATN& Sysy22Parser::getATN() const {
  return *sysy22ParserStaticData->atn;
}

std::string Sysy22Parser::getGrammarFileName() const {
  return "Sysy22.g4";
}

const std::vector<std::string>& Sysy22Parser::getRuleNames() const {
  return sysy22ParserStaticData->ruleNames;
}

const dfa::Vocabulary& Sysy22Parser::getVocabulary() const {
  return sysy22ParserStaticData->vocabulary;
}

antlr4::atn::SerializedATNView Sysy22Parser::getSerializedATN() const {
  return sysy22ParserStaticData->serializedATN;
}


//----------------- ProgContext ------------------------------------------------------------------

Sysy22Parser::ProgContext::ProgContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy22Parser::FuncDefContext* Sysy22Parser::ProgContext::funcDef() {
  return getRuleContext<Sysy22Parser::FuncDefContext>(0);
}


size_t Sysy22Parser::ProgContext::getRuleIndex() const {
  return Sysy22Parser::RuleProg;
}

void Sysy22Parser::ProgContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterProg(this);
}

void Sysy22Parser::ProgContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitProg(this);
}


std::any Sysy22Parser::ProgContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitProg(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::ProgContext* Sysy22Parser::prog() {
  ProgContext *_localctx = _tracker.createInstance<ProgContext>(_ctx, getState());
  enterRule(_localctx, 0, Sysy22Parser::RuleProg);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(14);
    funcDef();
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- CompUnitContext ------------------------------------------------------------------

Sysy22Parser::CompUnitContext::CompUnitContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy22Parser::FuncDefContext* Sysy22Parser::CompUnitContext::funcDef() {
  return getRuleContext<Sysy22Parser::FuncDefContext>(0);
}


size_t Sysy22Parser::CompUnitContext::getRuleIndex() const {
  return Sysy22Parser::RuleCompUnit;
}

void Sysy22Parser::CompUnitContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterCompUnit(this);
}

void Sysy22Parser::CompUnitContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitCompUnit(this);
}


std::any Sysy22Parser::CompUnitContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitCompUnit(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::CompUnitContext* Sysy22Parser::compUnit() {
  CompUnitContext *_localctx = _tracker.createInstance<CompUnitContext>(_ctx, getState());
  enterRule(_localctx, 2, Sysy22Parser::RuleCompUnit);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(16);
    funcDef();
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FuncDefContext ------------------------------------------------------------------

Sysy22Parser::FuncDefContext::FuncDefContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy22Parser::FuncTypeContext* Sysy22Parser::FuncDefContext::funcType() {
  return getRuleContext<Sysy22Parser::FuncTypeContext>(0);
}

tree::TerminalNode* Sysy22Parser::FuncDefContext::Ident() {
  return getToken(Sysy22Parser::Ident, 0);
}

Sysy22Parser::BlockContext* Sysy22Parser::FuncDefContext::block() {
  return getRuleContext<Sysy22Parser::BlockContext>(0);
}


size_t Sysy22Parser::FuncDefContext::getRuleIndex() const {
  return Sysy22Parser::RuleFuncDef;
}

void Sysy22Parser::FuncDefContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterFuncDef(this);
}

void Sysy22Parser::FuncDefContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitFuncDef(this);
}


std::any Sysy22Parser::FuncDefContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitFuncDef(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::FuncDefContext* Sysy22Parser::funcDef() {
  FuncDefContext *_localctx = _tracker.createInstance<FuncDefContext>(_ctx, getState());
  enterRule(_localctx, 4, Sysy22Parser::RuleFuncDef);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(18);
    funcType();
    setState(19);
    match(Sysy22Parser::Ident);
    setState(20);
    match(Sysy22Parser::T__0);
    setState(21);
    match(Sysy22Parser::T__1);
    setState(22);
    block();
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FuncTypeContext ------------------------------------------------------------------

Sysy22Parser::FuncTypeContext::FuncTypeContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy22Parser::FuncTypeContext::INT() {
  return getToken(Sysy22Parser::INT, 0);
}

tree::TerminalNode* Sysy22Parser::FuncTypeContext::FLOAT() {
  return getToken(Sysy22Parser::FLOAT, 0);
}

tree::TerminalNode* Sysy22Parser::FuncTypeContext::VOID() {
  return getToken(Sysy22Parser::VOID, 0);
}


size_t Sysy22Parser::FuncTypeContext::getRuleIndex() const {
  return Sysy22Parser::RuleFuncType;
}

void Sysy22Parser::FuncTypeContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterFuncType(this);
}

void Sysy22Parser::FuncTypeContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitFuncType(this);
}


std::any Sysy22Parser::FuncTypeContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitFuncType(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::FuncTypeContext* Sysy22Parser::funcType() {
  FuncTypeContext *_localctx = _tracker.createInstance<FuncTypeContext>(_ctx, getState());
  enterRule(_localctx, 6, Sysy22Parser::RuleFuncType);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(24);
    _la = _input->LA(1);
    if (!((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & 448) != 0))) {
    _errHandler->recoverInline(this);
    }
    else {
      _errHandler->reportMatch(this);
      consume();
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- BlockContext ------------------------------------------------------------------

Sysy22Parser::BlockContext::BlockContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy22Parser::StmtContext* Sysy22Parser::BlockContext::stmt() {
  return getRuleContext<Sysy22Parser::StmtContext>(0);
}


size_t Sysy22Parser::BlockContext::getRuleIndex() const {
  return Sysy22Parser::RuleBlock;
}

void Sysy22Parser::BlockContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterBlock(this);
}

void Sysy22Parser::BlockContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitBlock(this);
}


std::any Sysy22Parser::BlockContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitBlock(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::BlockContext* Sysy22Parser::block() {
  BlockContext *_localctx = _tracker.createInstance<BlockContext>(_ctx, getState());
  enterRule(_localctx, 8, Sysy22Parser::RuleBlock);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(26);
    match(Sysy22Parser::T__2);
    setState(27);
    stmt();
    setState(28);
    match(Sysy22Parser::T__3);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- StmtContext ------------------------------------------------------------------

Sysy22Parser::StmtContext::StmtContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy22Parser::StmtContext::RETURN() {
  return getToken(Sysy22Parser::RETURN, 0);
}

Sysy22Parser::NumberContext* Sysy22Parser::StmtContext::number() {
  return getRuleContext<Sysy22Parser::NumberContext>(0);
}


size_t Sysy22Parser::StmtContext::getRuleIndex() const {
  return Sysy22Parser::RuleStmt;
}

void Sysy22Parser::StmtContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterStmt(this);
}

void Sysy22Parser::StmtContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitStmt(this);
}


std::any Sysy22Parser::StmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitStmt(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::StmtContext* Sysy22Parser::stmt() {
  StmtContext *_localctx = _tracker.createInstance<StmtContext>(_ctx, getState());
  enterRule(_localctx, 10, Sysy22Parser::RuleStmt);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(30);
    match(Sysy22Parser::RETURN);
    setState(31);
    number();
    setState(32);
    match(Sysy22Parser::T__4);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- NumberContext ------------------------------------------------------------------

Sysy22Parser::NumberContext::NumberContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy22Parser::NumberContext::IntConst() {
  return getToken(Sysy22Parser::IntConst, 0);
}

tree::TerminalNode* Sysy22Parser::NumberContext::FloatConst() {
  return getToken(Sysy22Parser::FloatConst, 0);
}


size_t Sysy22Parser::NumberContext::getRuleIndex() const {
  return Sysy22Parser::RuleNumber;
}

void Sysy22Parser::NumberContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterNumber(this);
}

void Sysy22Parser::NumberContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitNumber(this);
}


std::any Sysy22Parser::NumberContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitNumber(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::NumberContext* Sysy22Parser::number() {
  NumberContext *_localctx = _tracker.createInstance<NumberContext>(_ctx, getState());
  enterRule(_localctx, 12, Sysy22Parser::RuleNumber);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(34);
    _la = _input->LA(1);
    if (!(_la == Sysy22Parser::IntConst

    || _la == Sysy22Parser::FloatConst)) {
    _errHandler->recoverInline(this);
    }
    else {
      _errHandler->reportMatch(this);
      consume();
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

void Sysy22Parser::initialize() {
#if ANTLR4_USE_THREAD_LOCAL_CACHE
  sysy22ParserInitialize();
#else
  ::antlr4::internal::call_once(sysy22ParserOnceFlag, sysy22ParserInitialize);
#endif
}
