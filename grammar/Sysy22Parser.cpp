
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
      "prog", "compUnit", "decl", "constDecl", "bType", "constDef", "constInitVal", 
      "varDecl", "varDef", "initVal", "funcDef", "funcType", "funcFParams", 
      "funcFParam", "block", "blockItem", "stmt", "exp", "cond", "lVal", 
      "primaryExp", "number", "unaryExp", "unaryOp", "funcRParams", "funcRParam", 
      "mulExp", "addExp", "relExp", "eqExp", "lAndExp", "lOrExp", "constExp"
    },
    std::vector<std::string>{
      "", "'int'", "'float'", "'void'", "'const'", "'return'", "'if'", "'else'", 
      "'while'", "'break'", "'continue'", "'('", "')'", "'['", "']'", "'{'", 
      "'}'", "','", "';'", "'\\u003F'", "':'", "'-'", "'!'", "'='", "'+'", 
      "'*'", "'/'", "'%'", "'&&'", "'||'", "'=='", "'!='", "'<'", "'<='", 
      "'>'", "'>='", "'0'"
    },
    std::vector<std::string>{
      "", "INT", "FLOAT", "VOID", "CONST", "RETURN", "IF", "ELSE", "WHILE", 
      "BREAK", "CONTINUE", "LP", "RP", "LB", "RB", "LC", "RC", "COMMA", 
      "SEMICOLON", "QUESTION", "COLON", "MINUS", "NOT", "ASSIGN", "ADD", 
      "MUL", "DIV", "MOD", "AND", "OR", "EQ", "NEQ", "LT", "LE", "GT", "GE", 
      "Zero", "INT_LIT", "FLOAT_LIT", "ID", "STRING", "WS", "LINE_COMMENT", 
      "BLOCK_COMMENT"
    }
  );
  static const int32_t serializedATNSegment[] = {
  	4,1,43,382,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,
  	7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,7,
  	14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,2,21,7,
  	21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,2,27,7,27,2,28,7,
  	28,2,29,7,29,2,30,7,30,2,31,7,31,2,32,7,32,1,0,1,0,1,1,1,1,5,1,71,8,1,
  	10,1,12,1,74,9,1,1,1,1,1,1,2,1,2,3,2,80,8,2,1,3,1,3,1,3,1,3,1,3,5,3,87,
  	8,3,10,3,12,3,90,9,3,1,3,1,3,1,4,1,4,1,5,1,5,1,5,1,5,1,5,5,5,101,8,5,
  	10,5,12,5,104,9,5,1,5,1,5,1,5,1,6,1,6,1,6,1,6,1,6,5,6,114,8,6,10,6,12,
  	6,117,9,6,3,6,119,8,6,1,6,3,6,122,8,6,1,7,1,7,1,7,1,7,5,7,128,8,7,10,
  	7,12,7,131,9,7,1,7,1,7,1,8,1,8,1,8,1,8,1,8,5,8,140,8,8,10,8,12,8,143,
  	9,8,1,8,1,8,1,8,1,8,1,8,5,8,150,8,8,10,8,12,8,153,9,8,1,8,1,8,3,8,157,
  	8,8,1,9,1,9,1,9,1,9,1,9,5,9,164,8,9,10,9,12,9,167,9,9,3,9,169,8,9,1,9,
  	3,9,172,8,9,1,10,1,10,1,10,1,10,3,10,178,8,10,1,10,1,10,1,10,1,11,1,11,
  	1,12,1,12,1,12,5,12,188,8,12,10,12,12,12,191,9,12,1,13,1,13,1,13,1,13,
  	1,13,1,13,1,13,1,13,5,13,201,8,13,10,13,12,13,204,9,13,3,13,206,8,13,
  	1,14,1,14,5,14,210,8,14,10,14,12,14,213,9,14,1,14,1,14,1,15,1,15,3,15,
  	219,8,15,1,16,1,16,1,16,1,16,1,16,1,16,3,16,227,8,16,1,16,1,16,1,16,1,
  	16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,
  	16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,3,16,257,8,16,1,
  	16,3,16,260,8,16,1,17,1,17,1,18,1,18,1,19,1,19,1,19,1,19,1,19,5,19,271,
  	8,19,10,19,12,19,274,9,19,1,20,1,20,1,20,1,20,1,20,1,20,3,20,282,8,20,
  	1,21,1,21,3,21,286,8,21,1,22,1,22,1,22,1,22,3,22,292,8,22,1,22,1,22,1,
  	22,1,22,3,22,298,8,22,1,23,1,23,1,24,1,24,1,24,5,24,305,8,24,10,24,12,
  	24,308,9,24,1,25,1,25,3,25,312,8,25,1,26,1,26,1,26,1,26,1,26,1,26,5,26,
  	320,8,26,10,26,12,26,323,9,26,1,27,1,27,1,27,1,27,1,27,1,27,5,27,331,
  	8,27,10,27,12,27,334,9,27,1,28,1,28,1,28,1,28,1,28,1,28,5,28,342,8,28,
  	10,28,12,28,345,9,28,1,29,1,29,1,29,1,29,1,29,1,29,5,29,353,8,29,10,29,
  	12,29,356,9,29,1,30,1,30,1,30,1,30,1,30,1,30,5,30,364,8,30,10,30,12,30,
  	367,9,30,1,31,1,31,1,31,1,31,1,31,1,31,5,31,375,8,31,10,31,12,31,378,
  	9,31,1,32,1,32,1,32,0,6,52,54,56,58,60,62,33,0,2,4,6,8,10,12,14,16,18,
  	20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,
  	0,7,1,0,1,2,1,0,1,3,2,0,21,22,24,24,1,0,25,27,2,0,21,21,24,24,1,0,32,
  	35,1,0,30,31,394,0,66,1,0,0,0,2,72,1,0,0,0,4,79,1,0,0,0,6,81,1,0,0,0,
  	8,93,1,0,0,0,10,95,1,0,0,0,12,121,1,0,0,0,14,123,1,0,0,0,16,156,1,0,0,
  	0,18,171,1,0,0,0,20,173,1,0,0,0,22,182,1,0,0,0,24,184,1,0,0,0,26,192,
  	1,0,0,0,28,207,1,0,0,0,30,218,1,0,0,0,32,259,1,0,0,0,34,261,1,0,0,0,36,
  	263,1,0,0,0,38,265,1,0,0,0,40,281,1,0,0,0,42,285,1,0,0,0,44,297,1,0,0,
  	0,46,299,1,0,0,0,48,301,1,0,0,0,50,311,1,0,0,0,52,313,1,0,0,0,54,324,
  	1,0,0,0,56,335,1,0,0,0,58,346,1,0,0,0,60,357,1,0,0,0,62,368,1,0,0,0,64,
  	379,1,0,0,0,66,67,3,2,1,0,67,1,1,0,0,0,68,71,3,4,2,0,69,71,3,20,10,0,
  	70,68,1,0,0,0,70,69,1,0,0,0,71,74,1,0,0,0,72,70,1,0,0,0,72,73,1,0,0,0,
  	73,75,1,0,0,0,74,72,1,0,0,0,75,76,5,0,0,1,76,3,1,0,0,0,77,80,3,6,3,0,
  	78,80,3,14,7,0,79,77,1,0,0,0,79,78,1,0,0,0,80,5,1,0,0,0,81,82,5,4,0,0,
  	82,83,3,8,4,0,83,88,3,10,5,0,84,85,5,17,0,0,85,87,3,10,5,0,86,84,1,0,
  	0,0,87,90,1,0,0,0,88,86,1,0,0,0,88,89,1,0,0,0,89,91,1,0,0,0,90,88,1,0,
  	0,0,91,92,5,18,0,0,92,7,1,0,0,0,93,94,7,0,0,0,94,9,1,0,0,0,95,102,5,39,
  	0,0,96,97,5,13,0,0,97,98,3,64,32,0,98,99,5,14,0,0,99,101,1,0,0,0,100,
  	96,1,0,0,0,101,104,1,0,0,0,102,100,1,0,0,0,102,103,1,0,0,0,103,105,1,
  	0,0,0,104,102,1,0,0,0,105,106,5,23,0,0,106,107,3,12,6,0,107,11,1,0,0,
  	0,108,122,3,64,32,0,109,118,5,15,0,0,110,115,3,12,6,0,111,112,5,17,0,
  	0,112,114,3,12,6,0,113,111,1,0,0,0,114,117,1,0,0,0,115,113,1,0,0,0,115,
  	116,1,0,0,0,116,119,1,0,0,0,117,115,1,0,0,0,118,110,1,0,0,0,118,119,1,
  	0,0,0,119,120,1,0,0,0,120,122,5,16,0,0,121,108,1,0,0,0,121,109,1,0,0,
  	0,122,13,1,0,0,0,123,124,3,8,4,0,124,129,3,16,8,0,125,126,5,17,0,0,126,
  	128,3,16,8,0,127,125,1,0,0,0,128,131,1,0,0,0,129,127,1,0,0,0,129,130,
  	1,0,0,0,130,132,1,0,0,0,131,129,1,0,0,0,132,133,5,18,0,0,133,15,1,0,0,
  	0,134,141,5,39,0,0,135,136,5,13,0,0,136,137,3,64,32,0,137,138,5,14,0,
  	0,138,140,1,0,0,0,139,135,1,0,0,0,140,143,1,0,0,0,141,139,1,0,0,0,141,
  	142,1,0,0,0,142,157,1,0,0,0,143,141,1,0,0,0,144,151,5,39,0,0,145,146,
  	5,13,0,0,146,147,3,64,32,0,147,148,5,14,0,0,148,150,1,0,0,0,149,145,1,
  	0,0,0,150,153,1,0,0,0,151,149,1,0,0,0,151,152,1,0,0,0,152,154,1,0,0,0,
  	153,151,1,0,0,0,154,155,5,23,0,0,155,157,3,18,9,0,156,134,1,0,0,0,156,
  	144,1,0,0,0,157,17,1,0,0,0,158,172,3,34,17,0,159,168,5,15,0,0,160,165,
  	3,18,9,0,161,162,5,17,0,0,162,164,3,18,9,0,163,161,1,0,0,0,164,167,1,
  	0,0,0,165,163,1,0,0,0,165,166,1,0,0,0,166,169,1,0,0,0,167,165,1,0,0,0,
  	168,160,1,0,0,0,168,169,1,0,0,0,169,170,1,0,0,0,170,172,5,16,0,0,171,
  	158,1,0,0,0,171,159,1,0,0,0,172,19,1,0,0,0,173,174,3,22,11,0,174,175,
  	5,39,0,0,175,177,5,11,0,0,176,178,3,24,12,0,177,176,1,0,0,0,177,178,1,
  	0,0,0,178,179,1,0,0,0,179,180,5,12,0,0,180,181,3,28,14,0,181,21,1,0,0,
  	0,182,183,7,1,0,0,183,23,1,0,0,0,184,189,3,26,13,0,185,186,5,17,0,0,186,
  	188,3,26,13,0,187,185,1,0,0,0,188,191,1,0,0,0,189,187,1,0,0,0,189,190,
  	1,0,0,0,190,25,1,0,0,0,191,189,1,0,0,0,192,193,3,8,4,0,193,205,5,39,0,
  	0,194,195,5,13,0,0,195,202,5,14,0,0,196,197,5,13,0,0,197,198,3,64,32,
  	0,198,199,5,14,0,0,199,201,1,0,0,0,200,196,1,0,0,0,201,204,1,0,0,0,202,
  	200,1,0,0,0,202,203,1,0,0,0,203,206,1,0,0,0,204,202,1,0,0,0,205,194,1,
  	0,0,0,205,206,1,0,0,0,206,27,1,0,0,0,207,211,5,15,0,0,208,210,3,30,15,
  	0,209,208,1,0,0,0,210,213,1,0,0,0,211,209,1,0,0,0,211,212,1,0,0,0,212,
  	214,1,0,0,0,213,211,1,0,0,0,214,215,5,16,0,0,215,29,1,0,0,0,216,219,3,
  	4,2,0,217,219,3,32,16,0,218,216,1,0,0,0,218,217,1,0,0,0,219,31,1,0,0,
  	0,220,221,3,38,19,0,221,222,5,23,0,0,222,223,3,34,17,0,223,224,5,18,0,
  	0,224,260,1,0,0,0,225,227,3,34,17,0,226,225,1,0,0,0,226,227,1,0,0,0,227,
  	228,1,0,0,0,228,260,5,18,0,0,229,260,3,28,14,0,230,231,5,6,0,0,231,232,
  	5,11,0,0,232,233,3,36,18,0,233,234,5,12,0,0,234,235,3,32,16,0,235,260,
  	1,0,0,0,236,237,5,6,0,0,237,238,5,11,0,0,238,239,3,36,18,0,239,240,5,
  	12,0,0,240,241,3,32,16,0,241,242,5,7,0,0,242,243,3,32,16,0,243,260,1,
  	0,0,0,244,245,5,8,0,0,245,246,5,11,0,0,246,247,3,36,18,0,247,248,5,12,
  	0,0,248,249,3,32,16,0,249,260,1,0,0,0,250,251,5,9,0,0,251,260,5,18,0,
  	0,252,253,5,10,0,0,253,260,5,18,0,0,254,256,5,5,0,0,255,257,3,34,17,0,
  	256,255,1,0,0,0,256,257,1,0,0,0,257,258,1,0,0,0,258,260,5,18,0,0,259,
  	220,1,0,0,0,259,226,1,0,0,0,259,229,1,0,0,0,259,230,1,0,0,0,259,236,1,
  	0,0,0,259,244,1,0,0,0,259,250,1,0,0,0,259,252,1,0,0,0,259,254,1,0,0,0,
  	260,33,1,0,0,0,261,262,3,54,27,0,262,35,1,0,0,0,263,264,3,62,31,0,264,
  	37,1,0,0,0,265,272,5,39,0,0,266,267,5,13,0,0,267,268,3,34,17,0,268,269,
  	5,14,0,0,269,271,1,0,0,0,270,266,1,0,0,0,271,274,1,0,0,0,272,270,1,0,
  	0,0,272,273,1,0,0,0,273,39,1,0,0,0,274,272,1,0,0,0,275,276,5,11,0,0,276,
  	277,3,34,17,0,277,278,5,12,0,0,278,282,1,0,0,0,279,282,3,38,19,0,280,
  	282,3,42,21,0,281,275,1,0,0,0,281,279,1,0,0,0,281,280,1,0,0,0,282,41,
  	1,0,0,0,283,286,5,37,0,0,284,286,5,38,0,0,285,283,1,0,0,0,285,284,1,0,
  	0,0,286,43,1,0,0,0,287,298,3,40,20,0,288,289,5,39,0,0,289,291,5,11,0,
  	0,290,292,3,48,24,0,291,290,1,0,0,0,291,292,1,0,0,0,292,293,1,0,0,0,293,
  	298,5,12,0,0,294,295,3,46,23,0,295,296,3,44,22,0,296,298,1,0,0,0,297,
  	287,1,0,0,0,297,288,1,0,0,0,297,294,1,0,0,0,298,45,1,0,0,0,299,300,7,
  	2,0,0,300,47,1,0,0,0,301,306,3,50,25,0,302,303,5,17,0,0,303,305,3,50,
  	25,0,304,302,1,0,0,0,305,308,1,0,0,0,306,304,1,0,0,0,306,307,1,0,0,0,
  	307,49,1,0,0,0,308,306,1,0,0,0,309,312,3,34,17,0,310,312,5,40,0,0,311,
  	309,1,0,0,0,311,310,1,0,0,0,312,51,1,0,0,0,313,314,6,26,-1,0,314,315,
  	3,44,22,0,315,321,1,0,0,0,316,317,10,1,0,0,317,318,7,3,0,0,318,320,3,
  	44,22,0,319,316,1,0,0,0,320,323,1,0,0,0,321,319,1,0,0,0,321,322,1,0,0,
  	0,322,53,1,0,0,0,323,321,1,0,0,0,324,325,6,27,-1,0,325,326,3,52,26,0,
  	326,332,1,0,0,0,327,328,10,1,0,0,328,329,7,4,0,0,329,331,3,52,26,0,330,
  	327,1,0,0,0,331,334,1,0,0,0,332,330,1,0,0,0,332,333,1,0,0,0,333,55,1,
  	0,0,0,334,332,1,0,0,0,335,336,6,28,-1,0,336,337,3,54,27,0,337,343,1,0,
  	0,0,338,339,10,1,0,0,339,340,7,5,0,0,340,342,3,54,27,0,341,338,1,0,0,
  	0,342,345,1,0,0,0,343,341,1,0,0,0,343,344,1,0,0,0,344,57,1,0,0,0,345,
  	343,1,0,0,0,346,347,6,29,-1,0,347,348,3,56,28,0,348,354,1,0,0,0,349,350,
  	10,1,0,0,350,351,7,6,0,0,351,353,3,56,28,0,352,349,1,0,0,0,353,356,1,
  	0,0,0,354,352,1,0,0,0,354,355,1,0,0,0,355,59,1,0,0,0,356,354,1,0,0,0,
  	357,358,6,30,-1,0,358,359,3,58,29,0,359,365,1,0,0,0,360,361,10,1,0,0,
  	361,362,5,28,0,0,362,364,3,58,29,0,363,360,1,0,0,0,364,367,1,0,0,0,365,
  	363,1,0,0,0,365,366,1,0,0,0,366,61,1,0,0,0,367,365,1,0,0,0,368,369,6,
  	31,-1,0,369,370,3,60,30,0,370,376,1,0,0,0,371,372,10,1,0,0,372,373,5,
  	29,0,0,373,375,3,60,30,0,374,371,1,0,0,0,375,378,1,0,0,0,376,374,1,0,
  	0,0,376,377,1,0,0,0,377,63,1,0,0,0,378,376,1,0,0,0,379,380,3,54,27,0,
  	380,65,1,0,0,0,37,70,72,79,88,102,115,118,121,129,141,151,156,165,168,
  	171,177,189,202,205,211,218,226,256,259,272,281,285,291,297,306,311,321,
  	332,343,354,365,376
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

Sysy22Parser::CompUnitContext* Sysy22Parser::ProgContext::compUnit() {
  return getRuleContext<Sysy22Parser::CompUnitContext>(0);
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
    setState(66);
    compUnit();
   
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

tree::TerminalNode* Sysy22Parser::CompUnitContext::EOF() {
  return getToken(Sysy22Parser::EOF, 0);
}

std::vector<Sysy22Parser::DeclContext *> Sysy22Parser::CompUnitContext::decl() {
  return getRuleContexts<Sysy22Parser::DeclContext>();
}

Sysy22Parser::DeclContext* Sysy22Parser::CompUnitContext::decl(size_t i) {
  return getRuleContext<Sysy22Parser::DeclContext>(i);
}

std::vector<Sysy22Parser::FuncDefContext *> Sysy22Parser::CompUnitContext::funcDef() {
  return getRuleContexts<Sysy22Parser::FuncDefContext>();
}

Sysy22Parser::FuncDefContext* Sysy22Parser::CompUnitContext::funcDef(size_t i) {
  return getRuleContext<Sysy22Parser::FuncDefContext>(i);
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
    setState(72);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while ((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & 30) != 0)) {
      setState(70);
      _errHandler->sync(this);
      switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 0, _ctx)) {
      case 1: {
        setState(68);
        decl();
        break;
      }

      case 2: {
        setState(69);
        funcDef();
        break;
      }

      default:
        break;
      }
      setState(74);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(75);
    match(Sysy22Parser::EOF);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- DeclContext ------------------------------------------------------------------

Sysy22Parser::DeclContext::DeclContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy22Parser::ConstDeclContext* Sysy22Parser::DeclContext::constDecl() {
  return getRuleContext<Sysy22Parser::ConstDeclContext>(0);
}

Sysy22Parser::VarDeclContext* Sysy22Parser::DeclContext::varDecl() {
  return getRuleContext<Sysy22Parser::VarDeclContext>(0);
}


size_t Sysy22Parser::DeclContext::getRuleIndex() const {
  return Sysy22Parser::RuleDecl;
}

void Sysy22Parser::DeclContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterDecl(this);
}

void Sysy22Parser::DeclContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitDecl(this);
}


std::any Sysy22Parser::DeclContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitDecl(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::DeclContext* Sysy22Parser::decl() {
  DeclContext *_localctx = _tracker.createInstance<DeclContext>(_ctx, getState());
  enterRule(_localctx, 4, Sysy22Parser::RuleDecl);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(79);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::CONST: {
        enterOuterAlt(_localctx, 1);
        setState(77);
        constDecl();
        break;
      }

      case Sysy22Parser::INT:
      case Sysy22Parser::FLOAT: {
        enterOuterAlt(_localctx, 2);
        setState(78);
        varDecl();
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ConstDeclContext ------------------------------------------------------------------

Sysy22Parser::ConstDeclContext::ConstDeclContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy22Parser::ConstDeclContext::CONST() {
  return getToken(Sysy22Parser::CONST, 0);
}

Sysy22Parser::BTypeContext* Sysy22Parser::ConstDeclContext::bType() {
  return getRuleContext<Sysy22Parser::BTypeContext>(0);
}

std::vector<Sysy22Parser::ConstDefContext *> Sysy22Parser::ConstDeclContext::constDef() {
  return getRuleContexts<Sysy22Parser::ConstDefContext>();
}

Sysy22Parser::ConstDefContext* Sysy22Parser::ConstDeclContext::constDef(size_t i) {
  return getRuleContext<Sysy22Parser::ConstDefContext>(i);
}

tree::TerminalNode* Sysy22Parser::ConstDeclContext::SEMICOLON() {
  return getToken(Sysy22Parser::SEMICOLON, 0);
}

std::vector<tree::TerminalNode *> Sysy22Parser::ConstDeclContext::COMMA() {
  return getTokens(Sysy22Parser::COMMA);
}

tree::TerminalNode* Sysy22Parser::ConstDeclContext::COMMA(size_t i) {
  return getToken(Sysy22Parser::COMMA, i);
}


size_t Sysy22Parser::ConstDeclContext::getRuleIndex() const {
  return Sysy22Parser::RuleConstDecl;
}

void Sysy22Parser::ConstDeclContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterConstDecl(this);
}

void Sysy22Parser::ConstDeclContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitConstDecl(this);
}


std::any Sysy22Parser::ConstDeclContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitConstDecl(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::ConstDeclContext* Sysy22Parser::constDecl() {
  ConstDeclContext *_localctx = _tracker.createInstance<ConstDeclContext>(_ctx, getState());
  enterRule(_localctx, 6, Sysy22Parser::RuleConstDecl);
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
    setState(81);
    match(Sysy22Parser::CONST);
    setState(82);
    bType();
    setState(83);
    constDef();
    setState(88);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy22Parser::COMMA) {
      setState(84);
      match(Sysy22Parser::COMMA);
      setState(85);
      constDef();
      setState(90);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(91);
    match(Sysy22Parser::SEMICOLON);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- BTypeContext ------------------------------------------------------------------

Sysy22Parser::BTypeContext::BTypeContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy22Parser::BTypeContext::INT() {
  return getToken(Sysy22Parser::INT, 0);
}

tree::TerminalNode* Sysy22Parser::BTypeContext::FLOAT() {
  return getToken(Sysy22Parser::FLOAT, 0);
}


size_t Sysy22Parser::BTypeContext::getRuleIndex() const {
  return Sysy22Parser::RuleBType;
}

void Sysy22Parser::BTypeContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterBType(this);
}

void Sysy22Parser::BTypeContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitBType(this);
}


std::any Sysy22Parser::BTypeContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitBType(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::BTypeContext* Sysy22Parser::bType() {
  BTypeContext *_localctx = _tracker.createInstance<BTypeContext>(_ctx, getState());
  enterRule(_localctx, 8, Sysy22Parser::RuleBType);
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
    setState(93);
    _la = _input->LA(1);
    if (!(_la == Sysy22Parser::INT

    || _la == Sysy22Parser::FLOAT)) {
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

//----------------- ConstDefContext ------------------------------------------------------------------

Sysy22Parser::ConstDefContext::ConstDefContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy22Parser::ConstDefContext::ID() {
  return getToken(Sysy22Parser::ID, 0);
}

tree::TerminalNode* Sysy22Parser::ConstDefContext::ASSIGN() {
  return getToken(Sysy22Parser::ASSIGN, 0);
}

Sysy22Parser::ConstInitValContext* Sysy22Parser::ConstDefContext::constInitVal() {
  return getRuleContext<Sysy22Parser::ConstInitValContext>(0);
}

std::vector<tree::TerminalNode *> Sysy22Parser::ConstDefContext::LB() {
  return getTokens(Sysy22Parser::LB);
}

tree::TerminalNode* Sysy22Parser::ConstDefContext::LB(size_t i) {
  return getToken(Sysy22Parser::LB, i);
}

std::vector<Sysy22Parser::ConstExpContext *> Sysy22Parser::ConstDefContext::constExp() {
  return getRuleContexts<Sysy22Parser::ConstExpContext>();
}

Sysy22Parser::ConstExpContext* Sysy22Parser::ConstDefContext::constExp(size_t i) {
  return getRuleContext<Sysy22Parser::ConstExpContext>(i);
}

std::vector<tree::TerminalNode *> Sysy22Parser::ConstDefContext::RB() {
  return getTokens(Sysy22Parser::RB);
}

tree::TerminalNode* Sysy22Parser::ConstDefContext::RB(size_t i) {
  return getToken(Sysy22Parser::RB, i);
}


size_t Sysy22Parser::ConstDefContext::getRuleIndex() const {
  return Sysy22Parser::RuleConstDef;
}

void Sysy22Parser::ConstDefContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterConstDef(this);
}

void Sysy22Parser::ConstDefContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitConstDef(this);
}


std::any Sysy22Parser::ConstDefContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitConstDef(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::ConstDefContext* Sysy22Parser::constDef() {
  ConstDefContext *_localctx = _tracker.createInstance<ConstDefContext>(_ctx, getState());
  enterRule(_localctx, 10, Sysy22Parser::RuleConstDef);
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
    setState(95);
    match(Sysy22Parser::ID);
    setState(102);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy22Parser::LB) {
      setState(96);
      match(Sysy22Parser::LB);
      setState(97);
      constExp();
      setState(98);
      match(Sysy22Parser::RB);
      setState(104);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(105);
    match(Sysy22Parser::ASSIGN);
    setState(106);
    constInitVal();
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ConstInitValContext ------------------------------------------------------------------

Sysy22Parser::ConstInitValContext::ConstInitValContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::ConstInitValContext::getRuleIndex() const {
  return Sysy22Parser::RuleConstInitVal;
}

void Sysy22Parser::ConstInitValContext::copyFrom(ConstInitValContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- ListConstInitValContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::ListConstInitValContext::LC() {
  return getToken(Sysy22Parser::LC, 0);
}

tree::TerminalNode* Sysy22Parser::ListConstInitValContext::RC() {
  return getToken(Sysy22Parser::RC, 0);
}

std::vector<Sysy22Parser::ConstInitValContext *> Sysy22Parser::ListConstInitValContext::constInitVal() {
  return getRuleContexts<Sysy22Parser::ConstInitValContext>();
}

Sysy22Parser::ConstInitValContext* Sysy22Parser::ListConstInitValContext::constInitVal(size_t i) {
  return getRuleContext<Sysy22Parser::ConstInitValContext>(i);
}

std::vector<tree::TerminalNode *> Sysy22Parser::ListConstInitValContext::COMMA() {
  return getTokens(Sysy22Parser::COMMA);
}

tree::TerminalNode* Sysy22Parser::ListConstInitValContext::COMMA(size_t i) {
  return getToken(Sysy22Parser::COMMA, i);
}

Sysy22Parser::ListConstInitValContext::ListConstInitValContext(ConstInitValContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ListConstInitValContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterListConstInitVal(this);
}
void Sysy22Parser::ListConstInitValContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitListConstInitVal(this);
}

std::any Sysy22Parser::ListConstInitValContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitListConstInitVal(this);
  else
    return visitor->visitChildren(this);
}
//----------------- ScalarConstInitValContext ------------------------------------------------------------------

Sysy22Parser::ConstExpContext* Sysy22Parser::ScalarConstInitValContext::constExp() {
  return getRuleContext<Sysy22Parser::ConstExpContext>(0);
}

Sysy22Parser::ScalarConstInitValContext::ScalarConstInitValContext(ConstInitValContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ScalarConstInitValContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterScalarConstInitVal(this);
}
void Sysy22Parser::ScalarConstInitValContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitScalarConstInitVal(this);
}

std::any Sysy22Parser::ScalarConstInitValContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitScalarConstInitVal(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::ConstInitValContext* Sysy22Parser::constInitVal() {
  ConstInitValContext *_localctx = _tracker.createInstance<ConstInitValContext>(_ctx, getState());
  enterRule(_localctx, 12, Sysy22Parser::RuleConstInitVal);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(121);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::LP:
      case Sysy22Parser::MINUS:
      case Sysy22Parser::NOT:
      case Sysy22Parser::ADD:
      case Sysy22Parser::INT_LIT:
      case Sysy22Parser::FLOAT_LIT:
      case Sysy22Parser::ID: {
        _localctx = _tracker.createInstance<Sysy22Parser::ScalarConstInitValContext>(_localctx);
        enterOuterAlt(_localctx, 1);
        setState(108);
        constExp();
        break;
      }

      case Sysy22Parser::LC: {
        _localctx = _tracker.createInstance<Sysy22Parser::ListConstInitValContext>(_localctx);
        enterOuterAlt(_localctx, 2);
        setState(109);
        match(Sysy22Parser::LC);
        setState(118);
        _errHandler->sync(this);

        _la = _input->LA(1);
        if ((((_la & ~ 0x3fULL) == 0) &&
          ((1ULL << _la) & 962095777792) != 0)) {
          setState(110);
          constInitVal();
          setState(115);
          _errHandler->sync(this);
          _la = _input->LA(1);
          while (_la == Sysy22Parser::COMMA) {
            setState(111);
            match(Sysy22Parser::COMMA);
            setState(112);
            constInitVal();
            setState(117);
            _errHandler->sync(this);
            _la = _input->LA(1);
          }
        }
        setState(120);
        match(Sysy22Parser::RC);
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- VarDeclContext ------------------------------------------------------------------

Sysy22Parser::VarDeclContext::VarDeclContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy22Parser::BTypeContext* Sysy22Parser::VarDeclContext::bType() {
  return getRuleContext<Sysy22Parser::BTypeContext>(0);
}

std::vector<Sysy22Parser::VarDefContext *> Sysy22Parser::VarDeclContext::varDef() {
  return getRuleContexts<Sysy22Parser::VarDefContext>();
}

Sysy22Parser::VarDefContext* Sysy22Parser::VarDeclContext::varDef(size_t i) {
  return getRuleContext<Sysy22Parser::VarDefContext>(i);
}

tree::TerminalNode* Sysy22Parser::VarDeclContext::SEMICOLON() {
  return getToken(Sysy22Parser::SEMICOLON, 0);
}

std::vector<tree::TerminalNode *> Sysy22Parser::VarDeclContext::COMMA() {
  return getTokens(Sysy22Parser::COMMA);
}

tree::TerminalNode* Sysy22Parser::VarDeclContext::COMMA(size_t i) {
  return getToken(Sysy22Parser::COMMA, i);
}


size_t Sysy22Parser::VarDeclContext::getRuleIndex() const {
  return Sysy22Parser::RuleVarDecl;
}

void Sysy22Parser::VarDeclContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterVarDecl(this);
}

void Sysy22Parser::VarDeclContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitVarDecl(this);
}


std::any Sysy22Parser::VarDeclContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitVarDecl(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::VarDeclContext* Sysy22Parser::varDecl() {
  VarDeclContext *_localctx = _tracker.createInstance<VarDeclContext>(_ctx, getState());
  enterRule(_localctx, 14, Sysy22Parser::RuleVarDecl);
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
    setState(123);
    bType();
    setState(124);
    varDef();
    setState(129);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy22Parser::COMMA) {
      setState(125);
      match(Sysy22Parser::COMMA);
      setState(126);
      varDef();
      setState(131);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(132);
    match(Sysy22Parser::SEMICOLON);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- VarDefContext ------------------------------------------------------------------

Sysy22Parser::VarDefContext::VarDefContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::VarDefContext::getRuleIndex() const {
  return Sysy22Parser::RuleVarDef;
}

void Sysy22Parser::VarDefContext::copyFrom(VarDefContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- UninitVarDefContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::UninitVarDefContext::ID() {
  return getToken(Sysy22Parser::ID, 0);
}

std::vector<tree::TerminalNode *> Sysy22Parser::UninitVarDefContext::LB() {
  return getTokens(Sysy22Parser::LB);
}

tree::TerminalNode* Sysy22Parser::UninitVarDefContext::LB(size_t i) {
  return getToken(Sysy22Parser::LB, i);
}

std::vector<Sysy22Parser::ConstExpContext *> Sysy22Parser::UninitVarDefContext::constExp() {
  return getRuleContexts<Sysy22Parser::ConstExpContext>();
}

Sysy22Parser::ConstExpContext* Sysy22Parser::UninitVarDefContext::constExp(size_t i) {
  return getRuleContext<Sysy22Parser::ConstExpContext>(i);
}

std::vector<tree::TerminalNode *> Sysy22Parser::UninitVarDefContext::RB() {
  return getTokens(Sysy22Parser::RB);
}

tree::TerminalNode* Sysy22Parser::UninitVarDefContext::RB(size_t i) {
  return getToken(Sysy22Parser::RB, i);
}

Sysy22Parser::UninitVarDefContext::UninitVarDefContext(VarDefContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::UninitVarDefContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterUninitVarDef(this);
}
void Sysy22Parser::UninitVarDefContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitUninitVarDef(this);
}

std::any Sysy22Parser::UninitVarDefContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitUninitVarDef(this);
  else
    return visitor->visitChildren(this);
}
//----------------- InitVarDefContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::InitVarDefContext::ID() {
  return getToken(Sysy22Parser::ID, 0);
}

tree::TerminalNode* Sysy22Parser::InitVarDefContext::ASSIGN() {
  return getToken(Sysy22Parser::ASSIGN, 0);
}

Sysy22Parser::InitValContext* Sysy22Parser::InitVarDefContext::initVal() {
  return getRuleContext<Sysy22Parser::InitValContext>(0);
}

std::vector<tree::TerminalNode *> Sysy22Parser::InitVarDefContext::LB() {
  return getTokens(Sysy22Parser::LB);
}

tree::TerminalNode* Sysy22Parser::InitVarDefContext::LB(size_t i) {
  return getToken(Sysy22Parser::LB, i);
}

std::vector<Sysy22Parser::ConstExpContext *> Sysy22Parser::InitVarDefContext::constExp() {
  return getRuleContexts<Sysy22Parser::ConstExpContext>();
}

Sysy22Parser::ConstExpContext* Sysy22Parser::InitVarDefContext::constExp(size_t i) {
  return getRuleContext<Sysy22Parser::ConstExpContext>(i);
}

std::vector<tree::TerminalNode *> Sysy22Parser::InitVarDefContext::RB() {
  return getTokens(Sysy22Parser::RB);
}

tree::TerminalNode* Sysy22Parser::InitVarDefContext::RB(size_t i) {
  return getToken(Sysy22Parser::RB, i);
}

Sysy22Parser::InitVarDefContext::InitVarDefContext(VarDefContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::InitVarDefContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterInitVarDef(this);
}
void Sysy22Parser::InitVarDefContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitInitVarDef(this);
}

std::any Sysy22Parser::InitVarDefContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitInitVarDef(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::VarDefContext* Sysy22Parser::varDef() {
  VarDefContext *_localctx = _tracker.createInstance<VarDefContext>(_ctx, getState());
  enterRule(_localctx, 16, Sysy22Parser::RuleVarDef);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(156);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 11, _ctx)) {
    case 1: {
      _localctx = _tracker.createInstance<Sysy22Parser::UninitVarDefContext>(_localctx);
      enterOuterAlt(_localctx, 1);
      setState(134);
      match(Sysy22Parser::ID);
      setState(141);
      _errHandler->sync(this);
      _la = _input->LA(1);
      while (_la == Sysy22Parser::LB) {
        setState(135);
        match(Sysy22Parser::LB);
        setState(136);
        constExp();
        setState(137);
        match(Sysy22Parser::RB);
        setState(143);
        _errHandler->sync(this);
        _la = _input->LA(1);
      }
      break;
    }

    case 2: {
      _localctx = _tracker.createInstance<Sysy22Parser::InitVarDefContext>(_localctx);
      enterOuterAlt(_localctx, 2);
      setState(144);
      match(Sysy22Parser::ID);
      setState(151);
      _errHandler->sync(this);
      _la = _input->LA(1);
      while (_la == Sysy22Parser::LB) {
        setState(145);
        match(Sysy22Parser::LB);
        setState(146);
        constExp();
        setState(147);
        match(Sysy22Parser::RB);
        setState(153);
        _errHandler->sync(this);
        _la = _input->LA(1);
      }
      setState(154);
      match(Sysy22Parser::ASSIGN);
      setState(155);
      initVal();
      break;
    }

    default:
      break;
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- InitValContext ------------------------------------------------------------------

Sysy22Parser::InitValContext::InitValContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::InitValContext::getRuleIndex() const {
  return Sysy22Parser::RuleInitVal;
}

void Sysy22Parser::InitValContext::copyFrom(InitValContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- ScalarInitValContext ------------------------------------------------------------------

Sysy22Parser::ExpContext* Sysy22Parser::ScalarInitValContext::exp() {
  return getRuleContext<Sysy22Parser::ExpContext>(0);
}

Sysy22Parser::ScalarInitValContext::ScalarInitValContext(InitValContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ScalarInitValContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterScalarInitVal(this);
}
void Sysy22Parser::ScalarInitValContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitScalarInitVal(this);
}

std::any Sysy22Parser::ScalarInitValContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitScalarInitVal(this);
  else
    return visitor->visitChildren(this);
}
//----------------- ListInitvalContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::ListInitvalContext::LC() {
  return getToken(Sysy22Parser::LC, 0);
}

tree::TerminalNode* Sysy22Parser::ListInitvalContext::RC() {
  return getToken(Sysy22Parser::RC, 0);
}

std::vector<Sysy22Parser::InitValContext *> Sysy22Parser::ListInitvalContext::initVal() {
  return getRuleContexts<Sysy22Parser::InitValContext>();
}

Sysy22Parser::InitValContext* Sysy22Parser::ListInitvalContext::initVal(size_t i) {
  return getRuleContext<Sysy22Parser::InitValContext>(i);
}

std::vector<tree::TerminalNode *> Sysy22Parser::ListInitvalContext::COMMA() {
  return getTokens(Sysy22Parser::COMMA);
}

tree::TerminalNode* Sysy22Parser::ListInitvalContext::COMMA(size_t i) {
  return getToken(Sysy22Parser::COMMA, i);
}

Sysy22Parser::ListInitvalContext::ListInitvalContext(InitValContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ListInitvalContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterListInitval(this);
}
void Sysy22Parser::ListInitvalContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitListInitval(this);
}

std::any Sysy22Parser::ListInitvalContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitListInitval(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::InitValContext* Sysy22Parser::initVal() {
  InitValContext *_localctx = _tracker.createInstance<InitValContext>(_ctx, getState());
  enterRule(_localctx, 18, Sysy22Parser::RuleInitVal);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(171);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::LP:
      case Sysy22Parser::MINUS:
      case Sysy22Parser::NOT:
      case Sysy22Parser::ADD:
      case Sysy22Parser::INT_LIT:
      case Sysy22Parser::FLOAT_LIT:
      case Sysy22Parser::ID: {
        _localctx = _tracker.createInstance<Sysy22Parser::ScalarInitValContext>(_localctx);
        enterOuterAlt(_localctx, 1);
        setState(158);
        exp();
        break;
      }

      case Sysy22Parser::LC: {
        _localctx = _tracker.createInstance<Sysy22Parser::ListInitvalContext>(_localctx);
        enterOuterAlt(_localctx, 2);
        setState(159);
        match(Sysy22Parser::LC);
        setState(168);
        _errHandler->sync(this);

        _la = _input->LA(1);
        if ((((_la & ~ 0x3fULL) == 0) &&
          ((1ULL << _la) & 962095777792) != 0)) {
          setState(160);
          initVal();
          setState(165);
          _errHandler->sync(this);
          _la = _input->LA(1);
          while (_la == Sysy22Parser::COMMA) {
            setState(161);
            match(Sysy22Parser::COMMA);
            setState(162);
            initVal();
            setState(167);
            _errHandler->sync(this);
            _la = _input->LA(1);
          }
        }
        setState(170);
        match(Sysy22Parser::RC);
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
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

tree::TerminalNode* Sysy22Parser::FuncDefContext::ID() {
  return getToken(Sysy22Parser::ID, 0);
}

tree::TerminalNode* Sysy22Parser::FuncDefContext::LP() {
  return getToken(Sysy22Parser::LP, 0);
}

tree::TerminalNode* Sysy22Parser::FuncDefContext::RP() {
  return getToken(Sysy22Parser::RP, 0);
}

Sysy22Parser::BlockContext* Sysy22Parser::FuncDefContext::block() {
  return getRuleContext<Sysy22Parser::BlockContext>(0);
}

Sysy22Parser::FuncFParamsContext* Sysy22Parser::FuncDefContext::funcFParams() {
  return getRuleContext<Sysy22Parser::FuncFParamsContext>(0);
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
  enterRule(_localctx, 20, Sysy22Parser::RuleFuncDef);
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
    setState(173);
    funcType();
    setState(174);
    match(Sysy22Parser::ID);
    setState(175);
    match(Sysy22Parser::LP);
    setState(177);
    _errHandler->sync(this);

    _la = _input->LA(1);
    if (_la == Sysy22Parser::INT

    || _la == Sysy22Parser::FLOAT) {
      setState(176);
      funcFParams();
    }
    setState(179);
    match(Sysy22Parser::RP);
    setState(180);
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

tree::TerminalNode* Sysy22Parser::FuncTypeContext::VOID() {
  return getToken(Sysy22Parser::VOID, 0);
}

tree::TerminalNode* Sysy22Parser::FuncTypeContext::INT() {
  return getToken(Sysy22Parser::INT, 0);
}

tree::TerminalNode* Sysy22Parser::FuncTypeContext::FLOAT() {
  return getToken(Sysy22Parser::FLOAT, 0);
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
  enterRule(_localctx, 22, Sysy22Parser::RuleFuncType);
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
    setState(182);
    _la = _input->LA(1);
    if (!((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & 14) != 0))) {
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

//----------------- FuncFParamsContext ------------------------------------------------------------------

Sysy22Parser::FuncFParamsContext::FuncFParamsContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

std::vector<Sysy22Parser::FuncFParamContext *> Sysy22Parser::FuncFParamsContext::funcFParam() {
  return getRuleContexts<Sysy22Parser::FuncFParamContext>();
}

Sysy22Parser::FuncFParamContext* Sysy22Parser::FuncFParamsContext::funcFParam(size_t i) {
  return getRuleContext<Sysy22Parser::FuncFParamContext>(i);
}

std::vector<tree::TerminalNode *> Sysy22Parser::FuncFParamsContext::COMMA() {
  return getTokens(Sysy22Parser::COMMA);
}

tree::TerminalNode* Sysy22Parser::FuncFParamsContext::COMMA(size_t i) {
  return getToken(Sysy22Parser::COMMA, i);
}


size_t Sysy22Parser::FuncFParamsContext::getRuleIndex() const {
  return Sysy22Parser::RuleFuncFParams;
}

void Sysy22Parser::FuncFParamsContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterFuncFParams(this);
}

void Sysy22Parser::FuncFParamsContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitFuncFParams(this);
}


std::any Sysy22Parser::FuncFParamsContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitFuncFParams(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::FuncFParamsContext* Sysy22Parser::funcFParams() {
  FuncFParamsContext *_localctx = _tracker.createInstance<FuncFParamsContext>(_ctx, getState());
  enterRule(_localctx, 24, Sysy22Parser::RuleFuncFParams);
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
    setState(184);
    funcFParam();
    setState(189);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy22Parser::COMMA) {
      setState(185);
      match(Sysy22Parser::COMMA);
      setState(186);
      funcFParam();
      setState(191);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FuncFParamContext ------------------------------------------------------------------

Sysy22Parser::FuncFParamContext::FuncFParamContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy22Parser::BTypeContext* Sysy22Parser::FuncFParamContext::bType() {
  return getRuleContext<Sysy22Parser::BTypeContext>(0);
}

tree::TerminalNode* Sysy22Parser::FuncFParamContext::ID() {
  return getToken(Sysy22Parser::ID, 0);
}

std::vector<tree::TerminalNode *> Sysy22Parser::FuncFParamContext::LB() {
  return getTokens(Sysy22Parser::LB);
}

tree::TerminalNode* Sysy22Parser::FuncFParamContext::LB(size_t i) {
  return getToken(Sysy22Parser::LB, i);
}

std::vector<tree::TerminalNode *> Sysy22Parser::FuncFParamContext::RB() {
  return getTokens(Sysy22Parser::RB);
}

tree::TerminalNode* Sysy22Parser::FuncFParamContext::RB(size_t i) {
  return getToken(Sysy22Parser::RB, i);
}

std::vector<Sysy22Parser::ConstExpContext *> Sysy22Parser::FuncFParamContext::constExp() {
  return getRuleContexts<Sysy22Parser::ConstExpContext>();
}

Sysy22Parser::ConstExpContext* Sysy22Parser::FuncFParamContext::constExp(size_t i) {
  return getRuleContext<Sysy22Parser::ConstExpContext>(i);
}


size_t Sysy22Parser::FuncFParamContext::getRuleIndex() const {
  return Sysy22Parser::RuleFuncFParam;
}

void Sysy22Parser::FuncFParamContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterFuncFParam(this);
}

void Sysy22Parser::FuncFParamContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitFuncFParam(this);
}


std::any Sysy22Parser::FuncFParamContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitFuncFParam(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::FuncFParamContext* Sysy22Parser::funcFParam() {
  FuncFParamContext *_localctx = _tracker.createInstance<FuncFParamContext>(_ctx, getState());
  enterRule(_localctx, 26, Sysy22Parser::RuleFuncFParam);
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
    setState(192);
    bType();
    setState(193);
    match(Sysy22Parser::ID);
    setState(205);
    _errHandler->sync(this);

    _la = _input->LA(1);
    if (_la == Sysy22Parser::LB) {
      setState(194);
      match(Sysy22Parser::LB);
      setState(195);
      match(Sysy22Parser::RB);
      setState(202);
      _errHandler->sync(this);
      _la = _input->LA(1);
      while (_la == Sysy22Parser::LB) {
        setState(196);
        match(Sysy22Parser::LB);
        setState(197);
        constExp();
        setState(198);
        match(Sysy22Parser::RB);
        setState(204);
        _errHandler->sync(this);
        _la = _input->LA(1);
      }
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

tree::TerminalNode* Sysy22Parser::BlockContext::LC() {
  return getToken(Sysy22Parser::LC, 0);
}

tree::TerminalNode* Sysy22Parser::BlockContext::RC() {
  return getToken(Sysy22Parser::RC, 0);
}

std::vector<Sysy22Parser::BlockItemContext *> Sysy22Parser::BlockContext::blockItem() {
  return getRuleContexts<Sysy22Parser::BlockItemContext>();
}

Sysy22Parser::BlockItemContext* Sysy22Parser::BlockContext::blockItem(size_t i) {
  return getRuleContext<Sysy22Parser::BlockItemContext>(i);
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
  enterRule(_localctx, 28, Sysy22Parser::RuleBlock);
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
    setState(207);
    match(Sysy22Parser::LC);
    setState(211);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while ((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & 962096041846) != 0)) {
      setState(208);
      blockItem();
      setState(213);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(214);
    match(Sysy22Parser::RC);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- BlockItemContext ------------------------------------------------------------------

Sysy22Parser::BlockItemContext::BlockItemContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy22Parser::DeclContext* Sysy22Parser::BlockItemContext::decl() {
  return getRuleContext<Sysy22Parser::DeclContext>(0);
}

Sysy22Parser::StmtContext* Sysy22Parser::BlockItemContext::stmt() {
  return getRuleContext<Sysy22Parser::StmtContext>(0);
}


size_t Sysy22Parser::BlockItemContext::getRuleIndex() const {
  return Sysy22Parser::RuleBlockItem;
}

void Sysy22Parser::BlockItemContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterBlockItem(this);
}

void Sysy22Parser::BlockItemContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitBlockItem(this);
}


std::any Sysy22Parser::BlockItemContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitBlockItem(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::BlockItemContext* Sysy22Parser::blockItem() {
  BlockItemContext *_localctx = _tracker.createInstance<BlockItemContext>(_ctx, getState());
  enterRule(_localctx, 30, Sysy22Parser::RuleBlockItem);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(218);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::INT:
      case Sysy22Parser::FLOAT:
      case Sysy22Parser::CONST: {
        enterOuterAlt(_localctx, 1);
        setState(216);
        decl();
        break;
      }

      case Sysy22Parser::RETURN:
      case Sysy22Parser::IF:
      case Sysy22Parser::WHILE:
      case Sysy22Parser::BREAK:
      case Sysy22Parser::CONTINUE:
      case Sysy22Parser::LP:
      case Sysy22Parser::LC:
      case Sysy22Parser::SEMICOLON:
      case Sysy22Parser::MINUS:
      case Sysy22Parser::NOT:
      case Sysy22Parser::ADD:
      case Sysy22Parser::INT_LIT:
      case Sysy22Parser::FLOAT_LIT:
      case Sysy22Parser::ID: {
        enterOuterAlt(_localctx, 2);
        setState(217);
        stmt();
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
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


size_t Sysy22Parser::StmtContext::getRuleIndex() const {
  return Sysy22Parser::RuleStmt;
}

void Sysy22Parser::StmtContext::copyFrom(StmtContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- WhileStmtContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::WhileStmtContext::WHILE() {
  return getToken(Sysy22Parser::WHILE, 0);
}

tree::TerminalNode* Sysy22Parser::WhileStmtContext::LP() {
  return getToken(Sysy22Parser::LP, 0);
}

Sysy22Parser::CondContext* Sysy22Parser::WhileStmtContext::cond() {
  return getRuleContext<Sysy22Parser::CondContext>(0);
}

tree::TerminalNode* Sysy22Parser::WhileStmtContext::RP() {
  return getToken(Sysy22Parser::RP, 0);
}

Sysy22Parser::StmtContext* Sysy22Parser::WhileStmtContext::stmt() {
  return getRuleContext<Sysy22Parser::StmtContext>(0);
}

Sysy22Parser::WhileStmtContext::WhileStmtContext(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::WhileStmtContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterWhileStmt(this);
}
void Sysy22Parser::WhileStmtContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitWhileStmt(this);
}

std::any Sysy22Parser::WhileStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitWhileStmt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- BlockStmtContext ------------------------------------------------------------------

Sysy22Parser::BlockContext* Sysy22Parser::BlockStmtContext::block() {
  return getRuleContext<Sysy22Parser::BlockContext>(0);
}

Sysy22Parser::BlockStmtContext::BlockStmtContext(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::BlockStmtContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterBlockStmt(this);
}
void Sysy22Parser::BlockStmtContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitBlockStmt(this);
}

std::any Sysy22Parser::BlockStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitBlockStmt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- AssignmentContext ------------------------------------------------------------------

Sysy22Parser::LValContext* Sysy22Parser::AssignmentContext::lVal() {
  return getRuleContext<Sysy22Parser::LValContext>(0);
}

tree::TerminalNode* Sysy22Parser::AssignmentContext::ASSIGN() {
  return getToken(Sysy22Parser::ASSIGN, 0);
}

Sysy22Parser::ExpContext* Sysy22Parser::AssignmentContext::exp() {
  return getRuleContext<Sysy22Parser::ExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::AssignmentContext::SEMICOLON() {
  return getToken(Sysy22Parser::SEMICOLON, 0);
}

Sysy22Parser::AssignmentContext::AssignmentContext(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::AssignmentContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterAssignment(this);
}
void Sysy22Parser::AssignmentContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitAssignment(this);
}

std::any Sysy22Parser::AssignmentContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitAssignment(this);
  else
    return visitor->visitChildren(this);
}
//----------------- IfStmt1Context ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::IfStmt1Context::IF() {
  return getToken(Sysy22Parser::IF, 0);
}

tree::TerminalNode* Sysy22Parser::IfStmt1Context::LP() {
  return getToken(Sysy22Parser::LP, 0);
}

Sysy22Parser::CondContext* Sysy22Parser::IfStmt1Context::cond() {
  return getRuleContext<Sysy22Parser::CondContext>(0);
}

tree::TerminalNode* Sysy22Parser::IfStmt1Context::RP() {
  return getToken(Sysy22Parser::RP, 0);
}

Sysy22Parser::StmtContext* Sysy22Parser::IfStmt1Context::stmt() {
  return getRuleContext<Sysy22Parser::StmtContext>(0);
}

Sysy22Parser::IfStmt1Context::IfStmt1Context(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::IfStmt1Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterIfStmt1(this);
}
void Sysy22Parser::IfStmt1Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitIfStmt1(this);
}

std::any Sysy22Parser::IfStmt1Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitIfStmt1(this);
  else
    return visitor->visitChildren(this);
}
//----------------- BreakStmtContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::BreakStmtContext::BREAK() {
  return getToken(Sysy22Parser::BREAK, 0);
}

tree::TerminalNode* Sysy22Parser::BreakStmtContext::SEMICOLON() {
  return getToken(Sysy22Parser::SEMICOLON, 0);
}

Sysy22Parser::BreakStmtContext::BreakStmtContext(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::BreakStmtContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterBreakStmt(this);
}
void Sysy22Parser::BreakStmtContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitBreakStmt(this);
}

std::any Sysy22Parser::BreakStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitBreakStmt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- ExpStmtContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::ExpStmtContext::SEMICOLON() {
  return getToken(Sysy22Parser::SEMICOLON, 0);
}

Sysy22Parser::ExpContext* Sysy22Parser::ExpStmtContext::exp() {
  return getRuleContext<Sysy22Parser::ExpContext>(0);
}

Sysy22Parser::ExpStmtContext::ExpStmtContext(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ExpStmtContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterExpStmt(this);
}
void Sysy22Parser::ExpStmtContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitExpStmt(this);
}

std::any Sysy22Parser::ExpStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitExpStmt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- IfStmt2Context ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::IfStmt2Context::IF() {
  return getToken(Sysy22Parser::IF, 0);
}

tree::TerminalNode* Sysy22Parser::IfStmt2Context::LP() {
  return getToken(Sysy22Parser::LP, 0);
}

Sysy22Parser::CondContext* Sysy22Parser::IfStmt2Context::cond() {
  return getRuleContext<Sysy22Parser::CondContext>(0);
}

tree::TerminalNode* Sysy22Parser::IfStmt2Context::RP() {
  return getToken(Sysy22Parser::RP, 0);
}

std::vector<Sysy22Parser::StmtContext *> Sysy22Parser::IfStmt2Context::stmt() {
  return getRuleContexts<Sysy22Parser::StmtContext>();
}

Sysy22Parser::StmtContext* Sysy22Parser::IfStmt2Context::stmt(size_t i) {
  return getRuleContext<Sysy22Parser::StmtContext>(i);
}

tree::TerminalNode* Sysy22Parser::IfStmt2Context::ELSE() {
  return getToken(Sysy22Parser::ELSE, 0);
}

Sysy22Parser::IfStmt2Context::IfStmt2Context(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::IfStmt2Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterIfStmt2(this);
}
void Sysy22Parser::IfStmt2Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitIfStmt2(this);
}

std::any Sysy22Parser::IfStmt2Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitIfStmt2(this);
  else
    return visitor->visitChildren(this);
}
//----------------- ReturnStmtContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::ReturnStmtContext::RETURN() {
  return getToken(Sysy22Parser::RETURN, 0);
}

tree::TerminalNode* Sysy22Parser::ReturnStmtContext::SEMICOLON() {
  return getToken(Sysy22Parser::SEMICOLON, 0);
}

Sysy22Parser::ExpContext* Sysy22Parser::ReturnStmtContext::exp() {
  return getRuleContext<Sysy22Parser::ExpContext>(0);
}

Sysy22Parser::ReturnStmtContext::ReturnStmtContext(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ReturnStmtContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterReturnStmt(this);
}
void Sysy22Parser::ReturnStmtContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitReturnStmt(this);
}

std::any Sysy22Parser::ReturnStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitReturnStmt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- ContinueStmtContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::ContinueStmtContext::CONTINUE() {
  return getToken(Sysy22Parser::CONTINUE, 0);
}

tree::TerminalNode* Sysy22Parser::ContinueStmtContext::SEMICOLON() {
  return getToken(Sysy22Parser::SEMICOLON, 0);
}

Sysy22Parser::ContinueStmtContext::ContinueStmtContext(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ContinueStmtContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterContinueStmt(this);
}
void Sysy22Parser::ContinueStmtContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitContinueStmt(this);
}

std::any Sysy22Parser::ContinueStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitContinueStmt(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::StmtContext* Sysy22Parser::stmt() {
  StmtContext *_localctx = _tracker.createInstance<StmtContext>(_ctx, getState());
  enterRule(_localctx, 32, Sysy22Parser::RuleStmt);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(259);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 23, _ctx)) {
    case 1: {
      _localctx = _tracker.createInstance<Sysy22Parser::AssignmentContext>(_localctx);
      enterOuterAlt(_localctx, 1);
      setState(220);
      lVal();
      setState(221);
      match(Sysy22Parser::ASSIGN);
      setState(222);
      exp();
      setState(223);
      match(Sysy22Parser::SEMICOLON);
      break;
    }

    case 2: {
      _localctx = _tracker.createInstance<Sysy22Parser::ExpStmtContext>(_localctx);
      enterOuterAlt(_localctx, 2);
      setState(226);
      _errHandler->sync(this);

      _la = _input->LA(1);
      if ((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & 962095745024) != 0)) {
        setState(225);
        exp();
      }
      setState(228);
      match(Sysy22Parser::SEMICOLON);
      break;
    }

    case 3: {
      _localctx = _tracker.createInstance<Sysy22Parser::BlockStmtContext>(_localctx);
      enterOuterAlt(_localctx, 3);
      setState(229);
      block();
      break;
    }

    case 4: {
      _localctx = _tracker.createInstance<Sysy22Parser::IfStmt1Context>(_localctx);
      enterOuterAlt(_localctx, 4);
      setState(230);
      match(Sysy22Parser::IF);
      setState(231);
      match(Sysy22Parser::LP);
      setState(232);
      cond();
      setState(233);
      match(Sysy22Parser::RP);
      setState(234);
      stmt();
      break;
    }

    case 5: {
      _localctx = _tracker.createInstance<Sysy22Parser::IfStmt2Context>(_localctx);
      enterOuterAlt(_localctx, 5);
      setState(236);
      match(Sysy22Parser::IF);
      setState(237);
      match(Sysy22Parser::LP);
      setState(238);
      cond();
      setState(239);
      match(Sysy22Parser::RP);
      setState(240);
      stmt();
      setState(241);
      match(Sysy22Parser::ELSE);
      setState(242);
      stmt();
      break;
    }

    case 6: {
      _localctx = _tracker.createInstance<Sysy22Parser::WhileStmtContext>(_localctx);
      enterOuterAlt(_localctx, 6);
      setState(244);
      match(Sysy22Parser::WHILE);
      setState(245);
      match(Sysy22Parser::LP);
      setState(246);
      cond();
      setState(247);
      match(Sysy22Parser::RP);
      setState(248);
      stmt();
      break;
    }

    case 7: {
      _localctx = _tracker.createInstance<Sysy22Parser::BreakStmtContext>(_localctx);
      enterOuterAlt(_localctx, 7);
      setState(250);
      match(Sysy22Parser::BREAK);
      setState(251);
      match(Sysy22Parser::SEMICOLON);
      break;
    }

    case 8: {
      _localctx = _tracker.createInstance<Sysy22Parser::ContinueStmtContext>(_localctx);
      enterOuterAlt(_localctx, 8);
      setState(252);
      match(Sysy22Parser::CONTINUE);
      setState(253);
      match(Sysy22Parser::SEMICOLON);
      break;
    }

    case 9: {
      _localctx = _tracker.createInstance<Sysy22Parser::ReturnStmtContext>(_localctx);
      enterOuterAlt(_localctx, 9);
      setState(254);
      match(Sysy22Parser::RETURN);
      setState(256);
      _errHandler->sync(this);

      _la = _input->LA(1);
      if ((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & 962095745024) != 0)) {
        setState(255);
        exp();
      }
      setState(258);
      match(Sysy22Parser::SEMICOLON);
      break;
    }

    default:
      break;
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ExpContext ------------------------------------------------------------------

Sysy22Parser::ExpContext::ExpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy22Parser::AddExpContext* Sysy22Parser::ExpContext::addExp() {
  return getRuleContext<Sysy22Parser::AddExpContext>(0);
}


size_t Sysy22Parser::ExpContext::getRuleIndex() const {
  return Sysy22Parser::RuleExp;
}

void Sysy22Parser::ExpContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterExp(this);
}

void Sysy22Parser::ExpContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitExp(this);
}


std::any Sysy22Parser::ExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitExp(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::ExpContext* Sysy22Parser::exp() {
  ExpContext *_localctx = _tracker.createInstance<ExpContext>(_ctx, getState());
  enterRule(_localctx, 34, Sysy22Parser::RuleExp);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(261);
    addExp(0);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- CondContext ------------------------------------------------------------------

Sysy22Parser::CondContext::CondContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy22Parser::LOrExpContext* Sysy22Parser::CondContext::lOrExp() {
  return getRuleContext<Sysy22Parser::LOrExpContext>(0);
}


size_t Sysy22Parser::CondContext::getRuleIndex() const {
  return Sysy22Parser::RuleCond;
}

void Sysy22Parser::CondContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterCond(this);
}

void Sysy22Parser::CondContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitCond(this);
}


std::any Sysy22Parser::CondContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitCond(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::CondContext* Sysy22Parser::cond() {
  CondContext *_localctx = _tracker.createInstance<CondContext>(_ctx, getState());
  enterRule(_localctx, 36, Sysy22Parser::RuleCond);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(263);
    lOrExp(0);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- LValContext ------------------------------------------------------------------

Sysy22Parser::LValContext::LValContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy22Parser::LValContext::ID() {
  return getToken(Sysy22Parser::ID, 0);
}

std::vector<tree::TerminalNode *> Sysy22Parser::LValContext::LB() {
  return getTokens(Sysy22Parser::LB);
}

tree::TerminalNode* Sysy22Parser::LValContext::LB(size_t i) {
  return getToken(Sysy22Parser::LB, i);
}

std::vector<Sysy22Parser::ExpContext *> Sysy22Parser::LValContext::exp() {
  return getRuleContexts<Sysy22Parser::ExpContext>();
}

Sysy22Parser::ExpContext* Sysy22Parser::LValContext::exp(size_t i) {
  return getRuleContext<Sysy22Parser::ExpContext>(i);
}

std::vector<tree::TerminalNode *> Sysy22Parser::LValContext::RB() {
  return getTokens(Sysy22Parser::RB);
}

tree::TerminalNode* Sysy22Parser::LValContext::RB(size_t i) {
  return getToken(Sysy22Parser::RB, i);
}


size_t Sysy22Parser::LValContext::getRuleIndex() const {
  return Sysy22Parser::RuleLVal;
}

void Sysy22Parser::LValContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterLVal(this);
}

void Sysy22Parser::LValContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitLVal(this);
}


std::any Sysy22Parser::LValContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitLVal(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::LValContext* Sysy22Parser::lVal() {
  LValContext *_localctx = _tracker.createInstance<LValContext>(_ctx, getState());
  enterRule(_localctx, 38, Sysy22Parser::RuleLVal);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    setState(265);
    match(Sysy22Parser::ID);
    setState(272);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 24, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        setState(266);
        match(Sysy22Parser::LB);
        setState(267);
        exp();
        setState(268);
        match(Sysy22Parser::RB); 
      }
      setState(274);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 24, _ctx);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- PrimaryExpContext ------------------------------------------------------------------

Sysy22Parser::PrimaryExpContext::PrimaryExpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::PrimaryExpContext::getRuleIndex() const {
  return Sysy22Parser::RulePrimaryExp;
}

void Sysy22Parser::PrimaryExpContext::copyFrom(PrimaryExpContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- PrimaryExp2Context ------------------------------------------------------------------

Sysy22Parser::LValContext* Sysy22Parser::PrimaryExp2Context::lVal() {
  return getRuleContext<Sysy22Parser::LValContext>(0);
}

Sysy22Parser::PrimaryExp2Context::PrimaryExp2Context(PrimaryExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::PrimaryExp2Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterPrimaryExp2(this);
}
void Sysy22Parser::PrimaryExp2Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitPrimaryExp2(this);
}

std::any Sysy22Parser::PrimaryExp2Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitPrimaryExp2(this);
  else
    return visitor->visitChildren(this);
}
//----------------- PrimaryExp1Context ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::PrimaryExp1Context::LP() {
  return getToken(Sysy22Parser::LP, 0);
}

Sysy22Parser::ExpContext* Sysy22Parser::PrimaryExp1Context::exp() {
  return getRuleContext<Sysy22Parser::ExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::PrimaryExp1Context::RP() {
  return getToken(Sysy22Parser::RP, 0);
}

Sysy22Parser::PrimaryExp1Context::PrimaryExp1Context(PrimaryExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::PrimaryExp1Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterPrimaryExp1(this);
}
void Sysy22Parser::PrimaryExp1Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitPrimaryExp1(this);
}

std::any Sysy22Parser::PrimaryExp1Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitPrimaryExp1(this);
  else
    return visitor->visitChildren(this);
}
//----------------- PrimaryExp3Context ------------------------------------------------------------------

Sysy22Parser::NumberContext* Sysy22Parser::PrimaryExp3Context::number() {
  return getRuleContext<Sysy22Parser::NumberContext>(0);
}

Sysy22Parser::PrimaryExp3Context::PrimaryExp3Context(PrimaryExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::PrimaryExp3Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterPrimaryExp3(this);
}
void Sysy22Parser::PrimaryExp3Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitPrimaryExp3(this);
}

std::any Sysy22Parser::PrimaryExp3Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitPrimaryExp3(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::PrimaryExpContext* Sysy22Parser::primaryExp() {
  PrimaryExpContext *_localctx = _tracker.createInstance<PrimaryExpContext>(_ctx, getState());
  enterRule(_localctx, 40, Sysy22Parser::RulePrimaryExp);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(281);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::LP: {
        _localctx = _tracker.createInstance<Sysy22Parser::PrimaryExp1Context>(_localctx);
        enterOuterAlt(_localctx, 1);
        setState(275);
        match(Sysy22Parser::LP);
        setState(276);
        exp();
        setState(277);
        match(Sysy22Parser::RP);
        break;
      }

      case Sysy22Parser::ID: {
        _localctx = _tracker.createInstance<Sysy22Parser::PrimaryExp2Context>(_localctx);
        enterOuterAlt(_localctx, 2);
        setState(279);
        lVal();
        break;
      }

      case Sysy22Parser::INT_LIT:
      case Sysy22Parser::FLOAT_LIT: {
        _localctx = _tracker.createInstance<Sysy22Parser::PrimaryExp3Context>(_localctx);
        enterOuterAlt(_localctx, 3);
        setState(280);
        number();
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
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


size_t Sysy22Parser::NumberContext::getRuleIndex() const {
  return Sysy22Parser::RuleNumber;
}

void Sysy22Parser::NumberContext::copyFrom(NumberContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- Float_LiteralContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::Float_LiteralContext::FLOAT_LIT() {
  return getToken(Sysy22Parser::FLOAT_LIT, 0);
}

Sysy22Parser::Float_LiteralContext::Float_LiteralContext(NumberContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::Float_LiteralContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterFloat_Literal(this);
}
void Sysy22Parser::Float_LiteralContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitFloat_Literal(this);
}

std::any Sysy22Parser::Float_LiteralContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitFloat_Literal(this);
  else
    return visitor->visitChildren(this);
}
//----------------- Int_LiteralContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::Int_LiteralContext::INT_LIT() {
  return getToken(Sysy22Parser::INT_LIT, 0);
}

Sysy22Parser::Int_LiteralContext::Int_LiteralContext(NumberContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::Int_LiteralContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterInt_Literal(this);
}
void Sysy22Parser::Int_LiteralContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitInt_Literal(this);
}

std::any Sysy22Parser::Int_LiteralContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitInt_Literal(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::NumberContext* Sysy22Parser::number() {
  NumberContext *_localctx = _tracker.createInstance<NumberContext>(_ctx, getState());
  enterRule(_localctx, 42, Sysy22Parser::RuleNumber);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(285);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::INT_LIT: {
        _localctx = _tracker.createInstance<Sysy22Parser::Int_LiteralContext>(_localctx);
        enterOuterAlt(_localctx, 1);
        setState(283);
        match(Sysy22Parser::INT_LIT);
        break;
      }

      case Sysy22Parser::FLOAT_LIT: {
        _localctx = _tracker.createInstance<Sysy22Parser::Float_LiteralContext>(_localctx);
        enterOuterAlt(_localctx, 2);
        setState(284);
        match(Sysy22Parser::FLOAT_LIT);
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- UnaryExpContext ------------------------------------------------------------------

Sysy22Parser::UnaryExpContext::UnaryExpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::UnaryExpContext::getRuleIndex() const {
  return Sysy22Parser::RuleUnaryExp;
}

void Sysy22Parser::UnaryExpContext::copyFrom(UnaryExpContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- Unary1Context ------------------------------------------------------------------

Sysy22Parser::PrimaryExpContext* Sysy22Parser::Unary1Context::primaryExp() {
  return getRuleContext<Sysy22Parser::PrimaryExpContext>(0);
}

Sysy22Parser::Unary1Context::Unary1Context(UnaryExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::Unary1Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterUnary1(this);
}
void Sysy22Parser::Unary1Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitUnary1(this);
}

std::any Sysy22Parser::Unary1Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitUnary1(this);
  else
    return visitor->visitChildren(this);
}
//----------------- Unary2Context ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::Unary2Context::ID() {
  return getToken(Sysy22Parser::ID, 0);
}

tree::TerminalNode* Sysy22Parser::Unary2Context::LP() {
  return getToken(Sysy22Parser::LP, 0);
}

tree::TerminalNode* Sysy22Parser::Unary2Context::RP() {
  return getToken(Sysy22Parser::RP, 0);
}

Sysy22Parser::FuncRParamsContext* Sysy22Parser::Unary2Context::funcRParams() {
  return getRuleContext<Sysy22Parser::FuncRParamsContext>(0);
}

Sysy22Parser::Unary2Context::Unary2Context(UnaryExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::Unary2Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterUnary2(this);
}
void Sysy22Parser::Unary2Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitUnary2(this);
}

std::any Sysy22Parser::Unary2Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitUnary2(this);
  else
    return visitor->visitChildren(this);
}
//----------------- Unary3Context ------------------------------------------------------------------

Sysy22Parser::UnaryOpContext* Sysy22Parser::Unary3Context::unaryOp() {
  return getRuleContext<Sysy22Parser::UnaryOpContext>(0);
}

Sysy22Parser::UnaryExpContext* Sysy22Parser::Unary3Context::unaryExp() {
  return getRuleContext<Sysy22Parser::UnaryExpContext>(0);
}

Sysy22Parser::Unary3Context::Unary3Context(UnaryExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::Unary3Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterUnary3(this);
}
void Sysy22Parser::Unary3Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitUnary3(this);
}

std::any Sysy22Parser::Unary3Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitUnary3(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::UnaryExpContext* Sysy22Parser::unaryExp() {
  UnaryExpContext *_localctx = _tracker.createInstance<UnaryExpContext>(_ctx, getState());
  enterRule(_localctx, 44, Sysy22Parser::RuleUnaryExp);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(297);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 28, _ctx)) {
    case 1: {
      _localctx = _tracker.createInstance<Sysy22Parser::Unary1Context>(_localctx);
      enterOuterAlt(_localctx, 1);
      setState(287);
      primaryExp();
      break;
    }

    case 2: {
      _localctx = _tracker.createInstance<Sysy22Parser::Unary2Context>(_localctx);
      enterOuterAlt(_localctx, 2);
      setState(288);
      match(Sysy22Parser::ID);
      setState(289);
      match(Sysy22Parser::LP);
      setState(291);
      _errHandler->sync(this);

      _la = _input->LA(1);
      if ((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & 2061607372800) != 0)) {
        setState(290);
        funcRParams();
      }
      setState(293);
      match(Sysy22Parser::RP);
      break;
    }

    case 3: {
      _localctx = _tracker.createInstance<Sysy22Parser::Unary3Context>(_localctx);
      enterOuterAlt(_localctx, 3);
      setState(294);
      unaryOp();
      setState(295);
      unaryExp();
      break;
    }

    default:
      break;
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- UnaryOpContext ------------------------------------------------------------------

Sysy22Parser::UnaryOpContext::UnaryOpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy22Parser::UnaryOpContext::ADD() {
  return getToken(Sysy22Parser::ADD, 0);
}

tree::TerminalNode* Sysy22Parser::UnaryOpContext::MINUS() {
  return getToken(Sysy22Parser::MINUS, 0);
}

tree::TerminalNode* Sysy22Parser::UnaryOpContext::NOT() {
  return getToken(Sysy22Parser::NOT, 0);
}


size_t Sysy22Parser::UnaryOpContext::getRuleIndex() const {
  return Sysy22Parser::RuleUnaryOp;
}

void Sysy22Parser::UnaryOpContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterUnaryOp(this);
}

void Sysy22Parser::UnaryOpContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitUnaryOp(this);
}


std::any Sysy22Parser::UnaryOpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitUnaryOp(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::UnaryOpContext* Sysy22Parser::unaryOp() {
  UnaryOpContext *_localctx = _tracker.createInstance<UnaryOpContext>(_ctx, getState());
  enterRule(_localctx, 46, Sysy22Parser::RuleUnaryOp);
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
    setState(299);
    _la = _input->LA(1);
    if (!((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & 23068672) != 0))) {
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

//----------------- FuncRParamsContext ------------------------------------------------------------------

Sysy22Parser::FuncRParamsContext::FuncRParamsContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

std::vector<Sysy22Parser::FuncRParamContext *> Sysy22Parser::FuncRParamsContext::funcRParam() {
  return getRuleContexts<Sysy22Parser::FuncRParamContext>();
}

Sysy22Parser::FuncRParamContext* Sysy22Parser::FuncRParamsContext::funcRParam(size_t i) {
  return getRuleContext<Sysy22Parser::FuncRParamContext>(i);
}

std::vector<tree::TerminalNode *> Sysy22Parser::FuncRParamsContext::COMMA() {
  return getTokens(Sysy22Parser::COMMA);
}

tree::TerminalNode* Sysy22Parser::FuncRParamsContext::COMMA(size_t i) {
  return getToken(Sysy22Parser::COMMA, i);
}


size_t Sysy22Parser::FuncRParamsContext::getRuleIndex() const {
  return Sysy22Parser::RuleFuncRParams;
}

void Sysy22Parser::FuncRParamsContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterFuncRParams(this);
}

void Sysy22Parser::FuncRParamsContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitFuncRParams(this);
}


std::any Sysy22Parser::FuncRParamsContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitFuncRParams(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::FuncRParamsContext* Sysy22Parser::funcRParams() {
  FuncRParamsContext *_localctx = _tracker.createInstance<FuncRParamsContext>(_ctx, getState());
  enterRule(_localctx, 48, Sysy22Parser::RuleFuncRParams);
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
    setState(301);
    funcRParam();
    setState(306);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy22Parser::COMMA) {
      setState(302);
      match(Sysy22Parser::COMMA);
      setState(303);
      funcRParam();
      setState(308);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FuncRParamContext ------------------------------------------------------------------

Sysy22Parser::FuncRParamContext::FuncRParamContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::FuncRParamContext::getRuleIndex() const {
  return Sysy22Parser::RuleFuncRParam;
}

void Sysy22Parser::FuncRParamContext::copyFrom(FuncRParamContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- StringAsRParamContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::StringAsRParamContext::STRING() {
  return getToken(Sysy22Parser::STRING, 0);
}

Sysy22Parser::StringAsRParamContext::StringAsRParamContext(FuncRParamContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::StringAsRParamContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterStringAsRParam(this);
}
void Sysy22Parser::StringAsRParamContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitStringAsRParam(this);
}

std::any Sysy22Parser::StringAsRParamContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitStringAsRParam(this);
  else
    return visitor->visitChildren(this);
}
//----------------- ExpAsRParamContext ------------------------------------------------------------------

Sysy22Parser::ExpContext* Sysy22Parser::ExpAsRParamContext::exp() {
  return getRuleContext<Sysy22Parser::ExpContext>(0);
}

Sysy22Parser::ExpAsRParamContext::ExpAsRParamContext(FuncRParamContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ExpAsRParamContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterExpAsRParam(this);
}
void Sysy22Parser::ExpAsRParamContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitExpAsRParam(this);
}

std::any Sysy22Parser::ExpAsRParamContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitExpAsRParam(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::FuncRParamContext* Sysy22Parser::funcRParam() {
  FuncRParamContext *_localctx = _tracker.createInstance<FuncRParamContext>(_ctx, getState());
  enterRule(_localctx, 50, Sysy22Parser::RuleFuncRParam);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(311);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::LP:
      case Sysy22Parser::MINUS:
      case Sysy22Parser::NOT:
      case Sysy22Parser::ADD:
      case Sysy22Parser::INT_LIT:
      case Sysy22Parser::FLOAT_LIT:
      case Sysy22Parser::ID: {
        _localctx = _tracker.createInstance<Sysy22Parser::ExpAsRParamContext>(_localctx);
        enterOuterAlt(_localctx, 1);
        setState(309);
        exp();
        break;
      }

      case Sysy22Parser::STRING: {
        _localctx = _tracker.createInstance<Sysy22Parser::StringAsRParamContext>(_localctx);
        enterOuterAlt(_localctx, 2);
        setState(310);
        match(Sysy22Parser::STRING);
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- MulExpContext ------------------------------------------------------------------

Sysy22Parser::MulExpContext::MulExpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::MulExpContext::getRuleIndex() const {
  return Sysy22Parser::RuleMulExp;
}

void Sysy22Parser::MulExpContext::copyFrom(MulExpContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- Mul2Context ------------------------------------------------------------------

Sysy22Parser::MulExpContext* Sysy22Parser::Mul2Context::mulExp() {
  return getRuleContext<Sysy22Parser::MulExpContext>(0);
}

Sysy22Parser::UnaryExpContext* Sysy22Parser::Mul2Context::unaryExp() {
  return getRuleContext<Sysy22Parser::UnaryExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::Mul2Context::MUL() {
  return getToken(Sysy22Parser::MUL, 0);
}

tree::TerminalNode* Sysy22Parser::Mul2Context::DIV() {
  return getToken(Sysy22Parser::DIV, 0);
}

tree::TerminalNode* Sysy22Parser::Mul2Context::MOD() {
  return getToken(Sysy22Parser::MOD, 0);
}

Sysy22Parser::Mul2Context::Mul2Context(MulExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::Mul2Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterMul2(this);
}
void Sysy22Parser::Mul2Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitMul2(this);
}

std::any Sysy22Parser::Mul2Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitMul2(this);
  else
    return visitor->visitChildren(this);
}
//----------------- Mul1Context ------------------------------------------------------------------

Sysy22Parser::UnaryExpContext* Sysy22Parser::Mul1Context::unaryExp() {
  return getRuleContext<Sysy22Parser::UnaryExpContext>(0);
}

Sysy22Parser::Mul1Context::Mul1Context(MulExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::Mul1Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterMul1(this);
}
void Sysy22Parser::Mul1Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitMul1(this);
}

std::any Sysy22Parser::Mul1Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitMul1(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::MulExpContext* Sysy22Parser::mulExp() {
   return mulExp(0);
}

Sysy22Parser::MulExpContext* Sysy22Parser::mulExp(int precedence) {
  ParserRuleContext *parentContext = _ctx;
  size_t parentState = getState();
  Sysy22Parser::MulExpContext *_localctx = _tracker.createInstance<MulExpContext>(_ctx, parentState);
  Sysy22Parser::MulExpContext *previousContext = _localctx;
  (void)previousContext; // Silence compiler, in case the context is not used by generated code.
  size_t startState = 52;
  enterRecursionRule(_localctx, 52, Sysy22Parser::RuleMulExp, precedence);

    size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    unrollRecursionContexts(parentContext);
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    _localctx = _tracker.createInstance<Mul1Context>(_localctx);
    _ctx = _localctx;
    previousContext = _localctx;

    setState(314);
    unaryExp();
    _ctx->stop = _input->LT(-1);
    setState(321);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 31, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        auto newContext = _tracker.createInstance<Mul2Context>(_tracker.createInstance<MulExpContext>(parentContext, parentState));
        _localctx = newContext;
        pushNewRecursionContext(newContext, startState, RuleMulExp);
        setState(316);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(317);
        _la = _input->LA(1);
        if (!((((_la & ~ 0x3fULL) == 0) &&
          ((1ULL << _la) & 234881024) != 0))) {
        _errHandler->recoverInline(this);
        }
        else {
          _errHandler->reportMatch(this);
          consume();
        }
        setState(318);
        unaryExp(); 
      }
      setState(323);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 31, _ctx);
    }
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }
  return _localctx;
}

//----------------- AddExpContext ------------------------------------------------------------------

Sysy22Parser::AddExpContext::AddExpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::AddExpContext::getRuleIndex() const {
  return Sysy22Parser::RuleAddExp;
}

void Sysy22Parser::AddExpContext::copyFrom(AddExpContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- Add2Context ------------------------------------------------------------------

Sysy22Parser::AddExpContext* Sysy22Parser::Add2Context::addExp() {
  return getRuleContext<Sysy22Parser::AddExpContext>(0);
}

Sysy22Parser::MulExpContext* Sysy22Parser::Add2Context::mulExp() {
  return getRuleContext<Sysy22Parser::MulExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::Add2Context::ADD() {
  return getToken(Sysy22Parser::ADD, 0);
}

tree::TerminalNode* Sysy22Parser::Add2Context::MINUS() {
  return getToken(Sysy22Parser::MINUS, 0);
}

Sysy22Parser::Add2Context::Add2Context(AddExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::Add2Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterAdd2(this);
}
void Sysy22Parser::Add2Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitAdd2(this);
}

std::any Sysy22Parser::Add2Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitAdd2(this);
  else
    return visitor->visitChildren(this);
}
//----------------- Add1Context ------------------------------------------------------------------

Sysy22Parser::MulExpContext* Sysy22Parser::Add1Context::mulExp() {
  return getRuleContext<Sysy22Parser::MulExpContext>(0);
}

Sysy22Parser::Add1Context::Add1Context(AddExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::Add1Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterAdd1(this);
}
void Sysy22Parser::Add1Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitAdd1(this);
}

std::any Sysy22Parser::Add1Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitAdd1(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::AddExpContext* Sysy22Parser::addExp() {
   return addExp(0);
}

Sysy22Parser::AddExpContext* Sysy22Parser::addExp(int precedence) {
  ParserRuleContext *parentContext = _ctx;
  size_t parentState = getState();
  Sysy22Parser::AddExpContext *_localctx = _tracker.createInstance<AddExpContext>(_ctx, parentState);
  Sysy22Parser::AddExpContext *previousContext = _localctx;
  (void)previousContext; // Silence compiler, in case the context is not used by generated code.
  size_t startState = 54;
  enterRecursionRule(_localctx, 54, Sysy22Parser::RuleAddExp, precedence);

    size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    unrollRecursionContexts(parentContext);
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    _localctx = _tracker.createInstance<Add1Context>(_localctx);
    _ctx = _localctx;
    previousContext = _localctx;

    setState(325);
    mulExp(0);
    _ctx->stop = _input->LT(-1);
    setState(332);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 32, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        auto newContext = _tracker.createInstance<Add2Context>(_tracker.createInstance<AddExpContext>(parentContext, parentState));
        _localctx = newContext;
        pushNewRecursionContext(newContext, startState, RuleAddExp);
        setState(327);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(328);
        _la = _input->LA(1);
        if (!(_la == Sysy22Parser::MINUS

        || _la == Sysy22Parser::ADD)) {
        _errHandler->recoverInline(this);
        }
        else {
          _errHandler->reportMatch(this);
          consume();
        }
        setState(329);
        mulExp(0); 
      }
      setState(334);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 32, _ctx);
    }
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }
  return _localctx;
}

//----------------- RelExpContext ------------------------------------------------------------------

Sysy22Parser::RelExpContext::RelExpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::RelExpContext::getRuleIndex() const {
  return Sysy22Parser::RuleRelExp;
}

void Sysy22Parser::RelExpContext::copyFrom(RelExpContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- Rel2Context ------------------------------------------------------------------

Sysy22Parser::RelExpContext* Sysy22Parser::Rel2Context::relExp() {
  return getRuleContext<Sysy22Parser::RelExpContext>(0);
}

Sysy22Parser::AddExpContext* Sysy22Parser::Rel2Context::addExp() {
  return getRuleContext<Sysy22Parser::AddExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::Rel2Context::LT() {
  return getToken(Sysy22Parser::LT, 0);
}

tree::TerminalNode* Sysy22Parser::Rel2Context::GT() {
  return getToken(Sysy22Parser::GT, 0);
}

tree::TerminalNode* Sysy22Parser::Rel2Context::LE() {
  return getToken(Sysy22Parser::LE, 0);
}

tree::TerminalNode* Sysy22Parser::Rel2Context::GE() {
  return getToken(Sysy22Parser::GE, 0);
}

Sysy22Parser::Rel2Context::Rel2Context(RelExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::Rel2Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterRel2(this);
}
void Sysy22Parser::Rel2Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitRel2(this);
}

std::any Sysy22Parser::Rel2Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitRel2(this);
  else
    return visitor->visitChildren(this);
}
//----------------- Rel1Context ------------------------------------------------------------------

Sysy22Parser::AddExpContext* Sysy22Parser::Rel1Context::addExp() {
  return getRuleContext<Sysy22Parser::AddExpContext>(0);
}

Sysy22Parser::Rel1Context::Rel1Context(RelExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::Rel1Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterRel1(this);
}
void Sysy22Parser::Rel1Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitRel1(this);
}

std::any Sysy22Parser::Rel1Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitRel1(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::RelExpContext* Sysy22Parser::relExp() {
   return relExp(0);
}

Sysy22Parser::RelExpContext* Sysy22Parser::relExp(int precedence) {
  ParserRuleContext *parentContext = _ctx;
  size_t parentState = getState();
  Sysy22Parser::RelExpContext *_localctx = _tracker.createInstance<RelExpContext>(_ctx, parentState);
  Sysy22Parser::RelExpContext *previousContext = _localctx;
  (void)previousContext; // Silence compiler, in case the context is not used by generated code.
  size_t startState = 56;
  enterRecursionRule(_localctx, 56, Sysy22Parser::RuleRelExp, precedence);

    size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    unrollRecursionContexts(parentContext);
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    _localctx = _tracker.createInstance<Rel1Context>(_localctx);
    _ctx = _localctx;
    previousContext = _localctx;

    setState(336);
    addExp(0);
    _ctx->stop = _input->LT(-1);
    setState(343);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 33, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        auto newContext = _tracker.createInstance<Rel2Context>(_tracker.createInstance<RelExpContext>(parentContext, parentState));
        _localctx = newContext;
        pushNewRecursionContext(newContext, startState, RuleRelExp);
        setState(338);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(339);
        _la = _input->LA(1);
        if (!((((_la & ~ 0x3fULL) == 0) &&
          ((1ULL << _la) & 64424509440) != 0))) {
        _errHandler->recoverInline(this);
        }
        else {
          _errHandler->reportMatch(this);
          consume();
        }
        setState(340);
        addExp(0); 
      }
      setState(345);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 33, _ctx);
    }
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }
  return _localctx;
}

//----------------- EqExpContext ------------------------------------------------------------------

Sysy22Parser::EqExpContext::EqExpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::EqExpContext::getRuleIndex() const {
  return Sysy22Parser::RuleEqExp;
}

void Sysy22Parser::EqExpContext::copyFrom(EqExpContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- Eq1Context ------------------------------------------------------------------

Sysy22Parser::RelExpContext* Sysy22Parser::Eq1Context::relExp() {
  return getRuleContext<Sysy22Parser::RelExpContext>(0);
}

Sysy22Parser::Eq1Context::Eq1Context(EqExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::Eq1Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterEq1(this);
}
void Sysy22Parser::Eq1Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitEq1(this);
}

std::any Sysy22Parser::Eq1Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitEq1(this);
  else
    return visitor->visitChildren(this);
}
//----------------- Eq2Context ------------------------------------------------------------------

Sysy22Parser::EqExpContext* Sysy22Parser::Eq2Context::eqExp() {
  return getRuleContext<Sysy22Parser::EqExpContext>(0);
}

Sysy22Parser::RelExpContext* Sysy22Parser::Eq2Context::relExp() {
  return getRuleContext<Sysy22Parser::RelExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::Eq2Context::EQ() {
  return getToken(Sysy22Parser::EQ, 0);
}

tree::TerminalNode* Sysy22Parser::Eq2Context::NEQ() {
  return getToken(Sysy22Parser::NEQ, 0);
}

Sysy22Parser::Eq2Context::Eq2Context(EqExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::Eq2Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterEq2(this);
}
void Sysy22Parser::Eq2Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitEq2(this);
}

std::any Sysy22Parser::Eq2Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitEq2(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::EqExpContext* Sysy22Parser::eqExp() {
   return eqExp(0);
}

Sysy22Parser::EqExpContext* Sysy22Parser::eqExp(int precedence) {
  ParserRuleContext *parentContext = _ctx;
  size_t parentState = getState();
  Sysy22Parser::EqExpContext *_localctx = _tracker.createInstance<EqExpContext>(_ctx, parentState);
  Sysy22Parser::EqExpContext *previousContext = _localctx;
  (void)previousContext; // Silence compiler, in case the context is not used by generated code.
  size_t startState = 58;
  enterRecursionRule(_localctx, 58, Sysy22Parser::RuleEqExp, precedence);

    size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    unrollRecursionContexts(parentContext);
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    _localctx = _tracker.createInstance<Eq1Context>(_localctx);
    _ctx = _localctx;
    previousContext = _localctx;

    setState(347);
    relExp(0);
    _ctx->stop = _input->LT(-1);
    setState(354);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 34, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        auto newContext = _tracker.createInstance<Eq2Context>(_tracker.createInstance<EqExpContext>(parentContext, parentState));
        _localctx = newContext;
        pushNewRecursionContext(newContext, startState, RuleEqExp);
        setState(349);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(350);
        _la = _input->LA(1);
        if (!(_la == Sysy22Parser::EQ

        || _la == Sysy22Parser::NEQ)) {
        _errHandler->recoverInline(this);
        }
        else {
          _errHandler->reportMatch(this);
          consume();
        }
        setState(351);
        relExp(0); 
      }
      setState(356);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 34, _ctx);
    }
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }
  return _localctx;
}

//----------------- LAndExpContext ------------------------------------------------------------------

Sysy22Parser::LAndExpContext::LAndExpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::LAndExpContext::getRuleIndex() const {
  return Sysy22Parser::RuleLAndExp;
}

void Sysy22Parser::LAndExpContext::copyFrom(LAndExpContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- LAnd2Context ------------------------------------------------------------------

Sysy22Parser::LAndExpContext* Sysy22Parser::LAnd2Context::lAndExp() {
  return getRuleContext<Sysy22Parser::LAndExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::LAnd2Context::AND() {
  return getToken(Sysy22Parser::AND, 0);
}

Sysy22Parser::EqExpContext* Sysy22Parser::LAnd2Context::eqExp() {
  return getRuleContext<Sysy22Parser::EqExpContext>(0);
}

Sysy22Parser::LAnd2Context::LAnd2Context(LAndExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::LAnd2Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterLAnd2(this);
}
void Sysy22Parser::LAnd2Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitLAnd2(this);
}

std::any Sysy22Parser::LAnd2Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitLAnd2(this);
  else
    return visitor->visitChildren(this);
}
//----------------- LAnd1Context ------------------------------------------------------------------

Sysy22Parser::EqExpContext* Sysy22Parser::LAnd1Context::eqExp() {
  return getRuleContext<Sysy22Parser::EqExpContext>(0);
}

Sysy22Parser::LAnd1Context::LAnd1Context(LAndExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::LAnd1Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterLAnd1(this);
}
void Sysy22Parser::LAnd1Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitLAnd1(this);
}

std::any Sysy22Parser::LAnd1Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitLAnd1(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::LAndExpContext* Sysy22Parser::lAndExp() {
   return lAndExp(0);
}

Sysy22Parser::LAndExpContext* Sysy22Parser::lAndExp(int precedence) {
  ParserRuleContext *parentContext = _ctx;
  size_t parentState = getState();
  Sysy22Parser::LAndExpContext *_localctx = _tracker.createInstance<LAndExpContext>(_ctx, parentState);
  Sysy22Parser::LAndExpContext *previousContext = _localctx;
  (void)previousContext; // Silence compiler, in case the context is not used by generated code.
  size_t startState = 60;
  enterRecursionRule(_localctx, 60, Sysy22Parser::RuleLAndExp, precedence);

    

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    unrollRecursionContexts(parentContext);
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    _localctx = _tracker.createInstance<LAnd1Context>(_localctx);
    _ctx = _localctx;
    previousContext = _localctx;

    setState(358);
    eqExp(0);
    _ctx->stop = _input->LT(-1);
    setState(365);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 35, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        auto newContext = _tracker.createInstance<LAnd2Context>(_tracker.createInstance<LAndExpContext>(parentContext, parentState));
        _localctx = newContext;
        pushNewRecursionContext(newContext, startState, RuleLAndExp);
        setState(360);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(361);
        match(Sysy22Parser::AND);
        setState(362);
        eqExp(0); 
      }
      setState(367);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 35, _ctx);
    }
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }
  return _localctx;
}

//----------------- LOrExpContext ------------------------------------------------------------------

Sysy22Parser::LOrExpContext::LOrExpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::LOrExpContext::getRuleIndex() const {
  return Sysy22Parser::RuleLOrExp;
}

void Sysy22Parser::LOrExpContext::copyFrom(LOrExpContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- LOr1Context ------------------------------------------------------------------

Sysy22Parser::LAndExpContext* Sysy22Parser::LOr1Context::lAndExp() {
  return getRuleContext<Sysy22Parser::LAndExpContext>(0);
}

Sysy22Parser::LOr1Context::LOr1Context(LOrExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::LOr1Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterLOr1(this);
}
void Sysy22Parser::LOr1Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitLOr1(this);
}

std::any Sysy22Parser::LOr1Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitLOr1(this);
  else
    return visitor->visitChildren(this);
}
//----------------- LOr2Context ------------------------------------------------------------------

Sysy22Parser::LOrExpContext* Sysy22Parser::LOr2Context::lOrExp() {
  return getRuleContext<Sysy22Parser::LOrExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::LOr2Context::OR() {
  return getToken(Sysy22Parser::OR, 0);
}

Sysy22Parser::LAndExpContext* Sysy22Parser::LOr2Context::lAndExp() {
  return getRuleContext<Sysy22Parser::LAndExpContext>(0);
}

Sysy22Parser::LOr2Context::LOr2Context(LOrExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::LOr2Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterLOr2(this);
}
void Sysy22Parser::LOr2Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitLOr2(this);
}

std::any Sysy22Parser::LOr2Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitLOr2(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::LOrExpContext* Sysy22Parser::lOrExp() {
   return lOrExp(0);
}

Sysy22Parser::LOrExpContext* Sysy22Parser::lOrExp(int precedence) {
  ParserRuleContext *parentContext = _ctx;
  size_t parentState = getState();
  Sysy22Parser::LOrExpContext *_localctx = _tracker.createInstance<LOrExpContext>(_ctx, parentState);
  Sysy22Parser::LOrExpContext *previousContext = _localctx;
  (void)previousContext; // Silence compiler, in case the context is not used by generated code.
  size_t startState = 62;
  enterRecursionRule(_localctx, 62, Sysy22Parser::RuleLOrExp, precedence);

    

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    unrollRecursionContexts(parentContext);
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    _localctx = _tracker.createInstance<LOr1Context>(_localctx);
    _ctx = _localctx;
    previousContext = _localctx;

    setState(369);
    lAndExp(0);
    _ctx->stop = _input->LT(-1);
    setState(376);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 36, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        auto newContext = _tracker.createInstance<LOr2Context>(_tracker.createInstance<LOrExpContext>(parentContext, parentState));
        _localctx = newContext;
        pushNewRecursionContext(newContext, startState, RuleLOrExp);
        setState(371);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(372);
        match(Sysy22Parser::OR);
        setState(373);
        lAndExp(0); 
      }
      setState(378);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 36, _ctx);
    }
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }
  return _localctx;
}

//----------------- ConstExpContext ------------------------------------------------------------------

Sysy22Parser::ConstExpContext::ConstExpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy22Parser::AddExpContext* Sysy22Parser::ConstExpContext::addExp() {
  return getRuleContext<Sysy22Parser::AddExpContext>(0);
}


size_t Sysy22Parser::ConstExpContext::getRuleIndex() const {
  return Sysy22Parser::RuleConstExp;
}

void Sysy22Parser::ConstExpContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterConstExp(this);
}

void Sysy22Parser::ConstExpContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitConstExp(this);
}


std::any Sysy22Parser::ConstExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitConstExp(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::ConstExpContext* Sysy22Parser::constExp() {
  ConstExpContext *_localctx = _tracker.createInstance<ConstExpContext>(_ctx, getState());
  enterRule(_localctx, 64, Sysy22Parser::RuleConstExp);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(379);
    addExp(0);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

bool Sysy22Parser::sempred(RuleContext *context, size_t ruleIndex, size_t predicateIndex) {
  switch (ruleIndex) {
    case 26: return mulExpSempred(antlrcpp::downCast<MulExpContext *>(context), predicateIndex);
    case 27: return addExpSempred(antlrcpp::downCast<AddExpContext *>(context), predicateIndex);
    case 28: return relExpSempred(antlrcpp::downCast<RelExpContext *>(context), predicateIndex);
    case 29: return eqExpSempred(antlrcpp::downCast<EqExpContext *>(context), predicateIndex);
    case 30: return lAndExpSempred(antlrcpp::downCast<LAndExpContext *>(context), predicateIndex);
    case 31: return lOrExpSempred(antlrcpp::downCast<LOrExpContext *>(context), predicateIndex);

  default:
    break;
  }
  return true;
}

bool Sysy22Parser::mulExpSempred(MulExpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 0: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy22Parser::addExpSempred(AddExpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 1: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy22Parser::relExpSempred(RelExpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 2: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy22Parser::eqExpSempred(EqExpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 3: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy22Parser::lAndExpSempred(LAndExpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 4: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy22Parser::lOrExpSempred(LOrExpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 5: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

void Sysy22Parser::initialize() {
#if ANTLR4_USE_THREAD_LOCAL_CACHE
  sysy22ParserInitialize();
#else
  ::antlr4::internal::call_once(sysy22ParserOnceFlag, sysy22ParserInitialize);
#endif
}
