
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
      "compUnits", "compUnit", "decl", "constDecl", "constDef", "varDecl", 
      "varDef", "initVal", "bType", "funcDef", "funcType", "funcFParams", 
      "funcFParam", "block", "blockItem", "stmt", "exp", "cond", "lVal", 
      "primaryExp", "intConst", "floatConst", "number", "unaryExp", "stringConst", 
      "funcRParam", "funcRParams", "mulExp", "addExp", "relExp", "eqExp", 
      "lAndExp", "lOrExp"
    },
    std::vector<std::string>{
      "", "','", "';'", "'['", "']'", "'{'", "'}'", "'('", "')'", "'int'", 
      "'float'", "'void'", "'if'", "'else'", "'while'", "'break'", "'continue'", 
      "'return'", "'const'", "'='", "'+'", "'-'", "'*'", "'/'", "'%'", "'=='", 
      "'!='", "'<'", "'>'", "'<='", "'>='", "'!'", "'&&'", "'||'"
    },
    std::vector<std::string>{
      "", "", "", "", "", "", "", "", "", "INT", "FLOAT", "VOID", "IF", 
      "ELSE", "WHILE", "BREAK", "CONTINUE", "RETURN", "CONST", "Assign", 
      "Add", "Sub", "Mul", "Div", "Mod", "Eq", "Neq", "Lt", "Gt", "Leq", 
      "Geq", "Not", "And", "Or", "Ident", "DecConst", "OctConst", "HexConst", 
      "DecimalFloatingConst", "HexFloatingConst", "StringConst", "WhiteSpace", 
      "LineComment", "BlockComment"
    }
  );
  static const int32_t serializedATNSegment[] = {
  	4,1,43,391,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,
  	7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,7,
  	14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,2,21,7,
  	21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,2,27,7,27,2,28,7,
  	28,2,29,7,29,2,30,7,30,2,31,7,31,2,32,7,32,1,0,5,0,68,8,0,10,0,12,0,71,
  	9,0,1,0,1,0,1,1,1,1,3,1,77,8,1,1,2,1,2,3,2,81,8,2,1,3,1,3,1,3,1,3,1,3,
  	5,3,88,8,3,10,3,12,3,91,9,3,1,3,1,3,1,4,1,4,1,4,1,4,1,4,5,4,100,8,4,10,
  	4,12,4,103,9,4,1,4,1,4,1,4,1,5,1,5,1,5,1,5,5,5,112,8,5,10,5,12,5,115,
  	9,5,1,5,1,5,1,6,1,6,1,6,1,6,1,6,5,6,124,8,6,10,6,12,6,127,9,6,1,6,1,6,
  	3,6,131,8,6,1,7,1,7,1,7,1,7,1,7,5,7,138,8,7,10,7,12,7,141,9,7,3,7,143,
  	8,7,1,7,3,7,146,8,7,1,8,1,8,3,8,150,8,8,1,9,1,9,1,9,1,9,3,9,156,8,9,1,
  	9,1,9,1,9,1,10,1,10,3,10,163,8,10,1,11,1,11,1,11,5,11,168,8,11,10,11,
  	12,11,171,9,11,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,
  	5,12,184,8,12,10,12,12,12,187,9,12,3,12,189,8,12,1,13,1,13,5,13,193,8,
  	13,10,13,12,13,196,9,13,1,13,1,13,1,14,1,14,3,14,202,8,14,1,15,1,15,1,
  	15,1,15,1,15,1,15,3,15,210,8,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,
  	15,1,15,3,15,221,8,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,
  	15,1,15,1,15,3,15,235,8,15,1,15,3,15,238,8,15,1,16,1,16,1,17,1,17,1,18,
  	1,18,1,18,1,18,1,18,5,18,249,8,18,10,18,12,18,252,9,18,1,19,1,19,1,19,
  	1,19,1,19,1,19,3,19,260,8,19,1,20,1,20,1,20,3,20,265,8,20,1,21,1,21,3,
  	21,269,8,21,1,22,1,22,3,22,273,8,22,1,23,1,23,1,23,1,23,3,23,279,8,23,
  	1,23,1,23,1,23,1,23,1,23,1,23,1,23,3,23,288,8,23,1,24,1,24,1,25,1,25,
  	3,25,294,8,25,1,26,1,26,1,26,5,26,299,8,26,10,26,12,26,302,9,26,1,27,
  	1,27,1,27,1,27,1,27,1,27,1,27,1,27,1,27,1,27,1,27,1,27,5,27,316,8,27,
  	10,27,12,27,319,9,27,1,28,1,28,1,28,1,28,1,28,1,28,1,28,1,28,1,28,5,28,
  	330,8,28,10,28,12,28,333,9,28,1,29,1,29,1,29,1,29,1,29,1,29,1,29,1,29,
  	1,29,1,29,1,29,1,29,1,29,1,29,1,29,5,29,350,8,29,10,29,12,29,353,9,29,
  	1,30,1,30,1,30,1,30,1,30,1,30,1,30,1,30,1,30,5,30,364,8,30,10,30,12,30,
  	367,9,30,1,31,1,31,1,31,1,31,1,31,1,31,5,31,375,8,31,10,31,12,31,378,
  	9,31,1,32,1,32,1,32,1,32,1,32,1,32,5,32,386,8,32,10,32,12,32,389,9,32,
  	1,32,0,6,54,56,58,60,62,64,33,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,
  	30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,0,0,413,0,69,1,
  	0,0,0,2,76,1,0,0,0,4,80,1,0,0,0,6,82,1,0,0,0,8,94,1,0,0,0,10,107,1,0,
  	0,0,12,118,1,0,0,0,14,145,1,0,0,0,16,149,1,0,0,0,18,151,1,0,0,0,20,162,
  	1,0,0,0,22,164,1,0,0,0,24,188,1,0,0,0,26,190,1,0,0,0,28,201,1,0,0,0,30,
  	237,1,0,0,0,32,239,1,0,0,0,34,241,1,0,0,0,36,243,1,0,0,0,38,259,1,0,0,
  	0,40,264,1,0,0,0,42,268,1,0,0,0,44,272,1,0,0,0,46,287,1,0,0,0,48,289,
  	1,0,0,0,50,293,1,0,0,0,52,295,1,0,0,0,54,303,1,0,0,0,56,320,1,0,0,0,58,
  	334,1,0,0,0,60,354,1,0,0,0,62,368,1,0,0,0,64,379,1,0,0,0,66,68,3,2,1,
  	0,67,66,1,0,0,0,68,71,1,0,0,0,69,67,1,0,0,0,69,70,1,0,0,0,70,72,1,0,0,
  	0,71,69,1,0,0,0,72,73,5,0,0,1,73,1,1,0,0,0,74,77,3,18,9,0,75,77,3,4,2,
  	0,76,74,1,0,0,0,76,75,1,0,0,0,77,3,1,0,0,0,78,81,3,6,3,0,79,81,3,10,5,
  	0,80,78,1,0,0,0,80,79,1,0,0,0,81,5,1,0,0,0,82,83,5,18,0,0,83,84,3,16,
  	8,0,84,89,3,8,4,0,85,86,5,1,0,0,86,88,3,8,4,0,87,85,1,0,0,0,88,91,1,0,
  	0,0,89,87,1,0,0,0,89,90,1,0,0,0,90,92,1,0,0,0,91,89,1,0,0,0,92,93,5,2,
  	0,0,93,7,1,0,0,0,94,101,5,34,0,0,95,96,5,3,0,0,96,97,3,32,16,0,97,98,
  	5,4,0,0,98,100,1,0,0,0,99,95,1,0,0,0,100,103,1,0,0,0,101,99,1,0,0,0,101,
  	102,1,0,0,0,102,104,1,0,0,0,103,101,1,0,0,0,104,105,5,19,0,0,105,106,
  	3,14,7,0,106,9,1,0,0,0,107,108,3,16,8,0,108,113,3,12,6,0,109,110,5,1,
  	0,0,110,112,3,12,6,0,111,109,1,0,0,0,112,115,1,0,0,0,113,111,1,0,0,0,
  	113,114,1,0,0,0,114,116,1,0,0,0,115,113,1,0,0,0,116,117,5,2,0,0,117,11,
  	1,0,0,0,118,125,5,34,0,0,119,120,5,3,0,0,120,121,3,32,16,0,121,122,5,
  	4,0,0,122,124,1,0,0,0,123,119,1,0,0,0,124,127,1,0,0,0,125,123,1,0,0,0,
  	125,126,1,0,0,0,126,130,1,0,0,0,127,125,1,0,0,0,128,129,5,19,0,0,129,
  	131,3,14,7,0,130,128,1,0,0,0,130,131,1,0,0,0,131,13,1,0,0,0,132,146,3,
  	32,16,0,133,142,5,5,0,0,134,139,3,14,7,0,135,136,5,1,0,0,136,138,3,14,
  	7,0,137,135,1,0,0,0,138,141,1,0,0,0,139,137,1,0,0,0,139,140,1,0,0,0,140,
  	143,1,0,0,0,141,139,1,0,0,0,142,134,1,0,0,0,142,143,1,0,0,0,143,144,1,
  	0,0,0,144,146,5,6,0,0,145,132,1,0,0,0,145,133,1,0,0,0,146,15,1,0,0,0,
  	147,150,5,9,0,0,148,150,5,10,0,0,149,147,1,0,0,0,149,148,1,0,0,0,150,
  	17,1,0,0,0,151,152,3,20,10,0,152,153,5,34,0,0,153,155,5,7,0,0,154,156,
  	3,22,11,0,155,154,1,0,0,0,155,156,1,0,0,0,156,157,1,0,0,0,157,158,5,8,
  	0,0,158,159,3,26,13,0,159,19,1,0,0,0,160,163,3,16,8,0,161,163,5,11,0,
  	0,162,160,1,0,0,0,162,161,1,0,0,0,163,21,1,0,0,0,164,169,3,24,12,0,165,
  	166,5,1,0,0,166,168,3,24,12,0,167,165,1,0,0,0,168,171,1,0,0,0,169,167,
  	1,0,0,0,169,170,1,0,0,0,170,23,1,0,0,0,171,169,1,0,0,0,172,173,3,16,8,
  	0,173,174,5,34,0,0,174,189,1,0,0,0,175,176,3,16,8,0,176,177,5,34,0,0,
  	177,178,5,3,0,0,178,185,5,4,0,0,179,180,5,3,0,0,180,181,3,32,16,0,181,
  	182,5,4,0,0,182,184,1,0,0,0,183,179,1,0,0,0,184,187,1,0,0,0,185,183,1,
  	0,0,0,185,186,1,0,0,0,186,189,1,0,0,0,187,185,1,0,0,0,188,172,1,0,0,0,
  	188,175,1,0,0,0,189,25,1,0,0,0,190,194,5,5,0,0,191,193,3,28,14,0,192,
  	191,1,0,0,0,193,196,1,0,0,0,194,192,1,0,0,0,194,195,1,0,0,0,195,197,1,
  	0,0,0,196,194,1,0,0,0,197,198,5,6,0,0,198,27,1,0,0,0,199,202,3,4,2,0,
  	200,202,3,30,15,0,201,199,1,0,0,0,201,200,1,0,0,0,202,29,1,0,0,0,203,
  	204,3,36,18,0,204,205,5,19,0,0,205,206,3,32,16,0,206,207,5,2,0,0,207,
  	238,1,0,0,0,208,210,3,32,16,0,209,208,1,0,0,0,209,210,1,0,0,0,210,211,
  	1,0,0,0,211,238,5,2,0,0,212,238,3,26,13,0,213,214,5,12,0,0,214,215,5,
  	7,0,0,215,216,3,34,17,0,216,217,5,8,0,0,217,220,3,30,15,0,218,219,5,13,
  	0,0,219,221,3,30,15,0,220,218,1,0,0,0,220,221,1,0,0,0,221,238,1,0,0,0,
  	222,223,5,14,0,0,223,224,5,7,0,0,224,225,3,34,17,0,225,226,5,8,0,0,226,
  	227,3,30,15,0,227,238,1,0,0,0,228,229,5,15,0,0,229,238,5,2,0,0,230,231,
  	5,16,0,0,231,238,5,2,0,0,232,234,5,17,0,0,233,235,3,32,16,0,234,233,1,
  	0,0,0,234,235,1,0,0,0,235,236,1,0,0,0,236,238,5,2,0,0,237,203,1,0,0,0,
  	237,209,1,0,0,0,237,212,1,0,0,0,237,213,1,0,0,0,237,222,1,0,0,0,237,228,
  	1,0,0,0,237,230,1,0,0,0,237,232,1,0,0,0,238,31,1,0,0,0,239,240,3,56,28,
  	0,240,33,1,0,0,0,241,242,3,64,32,0,242,35,1,0,0,0,243,250,5,34,0,0,244,
  	245,5,3,0,0,245,246,3,32,16,0,246,247,5,4,0,0,247,249,1,0,0,0,248,244,
  	1,0,0,0,249,252,1,0,0,0,250,248,1,0,0,0,250,251,1,0,0,0,251,37,1,0,0,
  	0,252,250,1,0,0,0,253,254,5,7,0,0,254,255,3,32,16,0,255,256,5,8,0,0,256,
  	260,1,0,0,0,257,260,3,36,18,0,258,260,3,44,22,0,259,253,1,0,0,0,259,257,
  	1,0,0,0,259,258,1,0,0,0,260,39,1,0,0,0,261,265,5,35,0,0,262,265,5,36,
  	0,0,263,265,5,37,0,0,264,261,1,0,0,0,264,262,1,0,0,0,264,263,1,0,0,0,
  	265,41,1,0,0,0,266,269,5,38,0,0,267,269,5,39,0,0,268,266,1,0,0,0,268,
  	267,1,0,0,0,269,43,1,0,0,0,270,273,3,40,20,0,271,273,3,42,21,0,272,270,
  	1,0,0,0,272,271,1,0,0,0,273,45,1,0,0,0,274,288,3,38,19,0,275,276,5,34,
  	0,0,276,278,5,7,0,0,277,279,3,52,26,0,278,277,1,0,0,0,278,279,1,0,0,0,
  	279,280,1,0,0,0,280,288,5,8,0,0,281,282,5,20,0,0,282,288,3,46,23,0,283,
  	284,5,21,0,0,284,288,3,46,23,0,285,286,5,31,0,0,286,288,3,46,23,0,287,
  	274,1,0,0,0,287,275,1,0,0,0,287,281,1,0,0,0,287,283,1,0,0,0,287,285,1,
  	0,0,0,288,47,1,0,0,0,289,290,5,40,0,0,290,49,1,0,0,0,291,294,3,32,16,
  	0,292,294,3,48,24,0,293,291,1,0,0,0,293,292,1,0,0,0,294,51,1,0,0,0,295,
  	300,3,50,25,0,296,297,5,1,0,0,297,299,3,50,25,0,298,296,1,0,0,0,299,302,
  	1,0,0,0,300,298,1,0,0,0,300,301,1,0,0,0,301,53,1,0,0,0,302,300,1,0,0,
  	0,303,304,6,27,-1,0,304,305,3,46,23,0,305,317,1,0,0,0,306,307,10,3,0,
  	0,307,308,5,22,0,0,308,316,3,46,23,0,309,310,10,2,0,0,310,311,5,23,0,
  	0,311,316,3,46,23,0,312,313,10,1,0,0,313,314,5,24,0,0,314,316,3,46,23,
  	0,315,306,1,0,0,0,315,309,1,0,0,0,315,312,1,0,0,0,316,319,1,0,0,0,317,
  	315,1,0,0,0,317,318,1,0,0,0,318,55,1,0,0,0,319,317,1,0,0,0,320,321,6,
  	28,-1,0,321,322,3,54,27,0,322,331,1,0,0,0,323,324,10,2,0,0,324,325,5,
  	20,0,0,325,330,3,54,27,0,326,327,10,1,0,0,327,328,5,21,0,0,328,330,3,
  	54,27,0,329,323,1,0,0,0,329,326,1,0,0,0,330,333,1,0,0,0,331,329,1,0,0,
  	0,331,332,1,0,0,0,332,57,1,0,0,0,333,331,1,0,0,0,334,335,6,29,-1,0,335,
  	336,3,56,28,0,336,351,1,0,0,0,337,338,10,4,0,0,338,339,5,27,0,0,339,350,
  	3,56,28,0,340,341,10,3,0,0,341,342,5,28,0,0,342,350,3,56,28,0,343,344,
  	10,2,0,0,344,345,5,29,0,0,345,350,3,56,28,0,346,347,10,1,0,0,347,348,
  	5,30,0,0,348,350,3,56,28,0,349,337,1,0,0,0,349,340,1,0,0,0,349,343,1,
  	0,0,0,349,346,1,0,0,0,350,353,1,0,0,0,351,349,1,0,0,0,351,352,1,0,0,0,
  	352,59,1,0,0,0,353,351,1,0,0,0,354,355,6,30,-1,0,355,356,3,58,29,0,356,
  	365,1,0,0,0,357,358,10,2,0,0,358,359,5,25,0,0,359,364,3,58,29,0,360,361,
  	10,1,0,0,361,362,5,26,0,0,362,364,3,58,29,0,363,357,1,0,0,0,363,360,1,
  	0,0,0,364,367,1,0,0,0,365,363,1,0,0,0,365,366,1,0,0,0,366,61,1,0,0,0,
  	367,365,1,0,0,0,368,369,6,31,-1,0,369,370,3,60,30,0,370,376,1,0,0,0,371,
  	372,10,1,0,0,372,373,5,32,0,0,373,375,3,60,30,0,374,371,1,0,0,0,375,378,
  	1,0,0,0,376,374,1,0,0,0,376,377,1,0,0,0,377,63,1,0,0,0,378,376,1,0,0,
  	0,379,380,6,32,-1,0,380,381,3,62,31,0,381,387,1,0,0,0,382,383,10,1,0,
  	0,383,384,5,33,0,0,384,386,3,62,31,0,385,382,1,0,0,0,386,389,1,0,0,0,
  	387,385,1,0,0,0,387,388,1,0,0,0,388,65,1,0,0,0,389,387,1,0,0,0,42,69,
  	76,80,89,101,113,125,130,139,142,145,149,155,162,169,185,188,194,201,
  	209,220,234,237,250,259,264,268,272,278,287,293,300,315,317,329,331,349,
  	351,363,365,376,387
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


//----------------- CompUnitsContext ------------------------------------------------------------------

Sysy22Parser::CompUnitsContext::CompUnitsContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy22Parser::CompUnitsContext::EOF() {
  return getToken(Sysy22Parser::EOF, 0);
}

std::vector<Sysy22Parser::CompUnitContext *> Sysy22Parser::CompUnitsContext::compUnit() {
  return getRuleContexts<Sysy22Parser::CompUnitContext>();
}

Sysy22Parser::CompUnitContext* Sysy22Parser::CompUnitsContext::compUnit(size_t i) {
  return getRuleContext<Sysy22Parser::CompUnitContext>(i);
}


size_t Sysy22Parser::CompUnitsContext::getRuleIndex() const {
  return Sysy22Parser::RuleCompUnits;
}

void Sysy22Parser::CompUnitsContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterCompUnits(this);
}

void Sysy22Parser::CompUnitsContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitCompUnits(this);
}


std::any Sysy22Parser::CompUnitsContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitCompUnits(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::CompUnitsContext* Sysy22Parser::compUnits() {
  CompUnitsContext *_localctx = _tracker.createInstance<CompUnitsContext>(_ctx, getState());
  enterRule(_localctx, 0, Sysy22Parser::RuleCompUnits);
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
    setState(69);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while ((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & 265728) != 0)) {
      setState(66);
      compUnit();
      setState(71);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(72);
    match(Sysy22Parser::EOF);
   
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

Sysy22Parser::DeclContext* Sysy22Parser::CompUnitContext::decl() {
  return getRuleContext<Sysy22Parser::DeclContext>(0);
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
    setState(76);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 1, _ctx)) {
    case 1: {
      enterOuterAlt(_localctx, 1);
      setState(74);
      funcDef();
      break;
    }

    case 2: {
      enterOuterAlt(_localctx, 2);
      setState(75);
      decl();
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
    setState(80);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::CONST: {
        enterOuterAlt(_localctx, 1);
        setState(78);
        constDecl();
        break;
      }

      case Sysy22Parser::INT:
      case Sysy22Parser::FLOAT: {
        enterOuterAlt(_localctx, 2);
        setState(79);
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
    setState(82);
    match(Sysy22Parser::CONST);
    setState(83);
    bType();
    setState(84);
    constDef();
    setState(89);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy22Parser::T__0) {
      setState(85);
      match(Sysy22Parser::T__0);
      setState(86);
      constDef();
      setState(91);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(92);
    match(Sysy22Parser::T__1);
   
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

tree::TerminalNode* Sysy22Parser::ConstDefContext::Ident() {
  return getToken(Sysy22Parser::Ident, 0);
}

tree::TerminalNode* Sysy22Parser::ConstDefContext::Assign() {
  return getToken(Sysy22Parser::Assign, 0);
}

Sysy22Parser::InitValContext* Sysy22Parser::ConstDefContext::initVal() {
  return getRuleContext<Sysy22Parser::InitValContext>(0);
}

std::vector<Sysy22Parser::ExpContext *> Sysy22Parser::ConstDefContext::exp() {
  return getRuleContexts<Sysy22Parser::ExpContext>();
}

Sysy22Parser::ExpContext* Sysy22Parser::ConstDefContext::exp(size_t i) {
  return getRuleContext<Sysy22Parser::ExpContext>(i);
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
  enterRule(_localctx, 8, Sysy22Parser::RuleConstDef);
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
    setState(94);
    match(Sysy22Parser::Ident);
    setState(101);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy22Parser::T__2) {
      setState(95);
      match(Sysy22Parser::T__2);
      setState(96);
      exp();
      setState(97);
      match(Sysy22Parser::T__3);
      setState(103);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(104);
    match(Sysy22Parser::Assign);
    setState(105);
    initVal();
   
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
  enterRule(_localctx, 10, Sysy22Parser::RuleVarDecl);
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
    setState(107);
    bType();
    setState(108);
    varDef();
    setState(113);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy22Parser::T__0) {
      setState(109);
      match(Sysy22Parser::T__0);
      setState(110);
      varDef();
      setState(115);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(116);
    match(Sysy22Parser::T__1);
   
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

tree::TerminalNode* Sysy22Parser::VarDefContext::Ident() {
  return getToken(Sysy22Parser::Ident, 0);
}

std::vector<Sysy22Parser::ExpContext *> Sysy22Parser::VarDefContext::exp() {
  return getRuleContexts<Sysy22Parser::ExpContext>();
}

Sysy22Parser::ExpContext* Sysy22Parser::VarDefContext::exp(size_t i) {
  return getRuleContext<Sysy22Parser::ExpContext>(i);
}

tree::TerminalNode* Sysy22Parser::VarDefContext::Assign() {
  return getToken(Sysy22Parser::Assign, 0);
}

Sysy22Parser::InitValContext* Sysy22Parser::VarDefContext::initVal() {
  return getRuleContext<Sysy22Parser::InitValContext>(0);
}


size_t Sysy22Parser::VarDefContext::getRuleIndex() const {
  return Sysy22Parser::RuleVarDef;
}

void Sysy22Parser::VarDefContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterVarDef(this);
}

void Sysy22Parser::VarDefContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitVarDef(this);
}


std::any Sysy22Parser::VarDefContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitVarDef(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::VarDefContext* Sysy22Parser::varDef() {
  VarDefContext *_localctx = _tracker.createInstance<VarDefContext>(_ctx, getState());
  enterRule(_localctx, 12, Sysy22Parser::RuleVarDef);
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
    setState(118);
    match(Sysy22Parser::Ident);
    setState(125);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy22Parser::T__2) {
      setState(119);
      match(Sysy22Parser::T__2);
      setState(120);
      exp();
      setState(121);
      match(Sysy22Parser::T__3);
      setState(127);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(130);
    _errHandler->sync(this);

    _la = _input->LA(1);
    if (_la == Sysy22Parser::Assign) {
      setState(128);
      match(Sysy22Parser::Assign);
      setState(129);
      initVal();
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

//----------------- InitContext ------------------------------------------------------------------

Sysy22Parser::ExpContext* Sysy22Parser::InitContext::exp() {
  return getRuleContext<Sysy22Parser::ExpContext>(0);
}

Sysy22Parser::InitContext::InitContext(InitValContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::InitContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterInit(this);
}
void Sysy22Parser::InitContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitInit(this);
}

std::any Sysy22Parser::InitContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitInit(this);
  else
    return visitor->visitChildren(this);
}
//----------------- InitListContext ------------------------------------------------------------------

std::vector<Sysy22Parser::InitValContext *> Sysy22Parser::InitListContext::initVal() {
  return getRuleContexts<Sysy22Parser::InitValContext>();
}

Sysy22Parser::InitValContext* Sysy22Parser::InitListContext::initVal(size_t i) {
  return getRuleContext<Sysy22Parser::InitValContext>(i);
}

Sysy22Parser::InitListContext::InitListContext(InitValContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::InitListContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterInitList(this);
}
void Sysy22Parser::InitListContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitInitList(this);
}

std::any Sysy22Parser::InitListContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitInitList(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::InitValContext* Sysy22Parser::initVal() {
  InitValContext *_localctx = _tracker.createInstance<InitValContext>(_ctx, getState());
  enterRule(_localctx, 14, Sysy22Parser::RuleInitVal);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(145);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::T__6:
      case Sysy22Parser::Add:
      case Sysy22Parser::Sub:
      case Sysy22Parser::Not:
      case Sysy22Parser::Ident:
      case Sysy22Parser::DecConst:
      case Sysy22Parser::OctConst:
      case Sysy22Parser::HexConst:
      case Sysy22Parser::DecimalFloatingConst:
      case Sysy22Parser::HexFloatingConst: {
        _localctx = _tracker.createInstance<Sysy22Parser::InitContext>(_localctx);
        enterOuterAlt(_localctx, 1);
        setState(132);
        exp();
        break;
      }

      case Sysy22Parser::T__4: {
        _localctx = _tracker.createInstance<Sysy22Parser::InitListContext>(_localctx);
        enterOuterAlt(_localctx, 2);
        setState(133);
        match(Sysy22Parser::T__4);
        setState(142);
        _errHandler->sync(this);

        _la = _input->LA(1);
        if ((((_la & ~ 0x3fULL) == 0) &&
          ((1ULL << _la) & 1084482388128) != 0)) {
          setState(134);
          initVal();
          setState(139);
          _errHandler->sync(this);
          _la = _input->LA(1);
          while (_la == Sysy22Parser::T__0) {
            setState(135);
            match(Sysy22Parser::T__0);
            setState(136);
            initVal();
            setState(141);
            _errHandler->sync(this);
            _la = _input->LA(1);
          }
        }
        setState(144);
        match(Sysy22Parser::T__5);
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

//----------------- BTypeContext ------------------------------------------------------------------

Sysy22Parser::BTypeContext::BTypeContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::BTypeContext::getRuleIndex() const {
  return Sysy22Parser::RuleBType;
}

void Sysy22Parser::BTypeContext::copyFrom(BTypeContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- FloatContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::FloatContext::FLOAT() {
  return getToken(Sysy22Parser::FLOAT, 0);
}

Sysy22Parser::FloatContext::FloatContext(BTypeContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::FloatContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterFloat(this);
}
void Sysy22Parser::FloatContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitFloat(this);
}

std::any Sysy22Parser::FloatContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitFloat(this);
  else
    return visitor->visitChildren(this);
}
//----------------- IntContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::IntContext::INT() {
  return getToken(Sysy22Parser::INT, 0);
}

Sysy22Parser::IntContext::IntContext(BTypeContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::IntContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterInt(this);
}
void Sysy22Parser::IntContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitInt(this);
}

std::any Sysy22Parser::IntContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitInt(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::BTypeContext* Sysy22Parser::bType() {
  BTypeContext *_localctx = _tracker.createInstance<BTypeContext>(_ctx, getState());
  enterRule(_localctx, 16, Sysy22Parser::RuleBType);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(149);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::INT: {
        _localctx = _tracker.createInstance<Sysy22Parser::IntContext>(_localctx);
        enterOuterAlt(_localctx, 1);
        setState(147);
        match(Sysy22Parser::INT);
        break;
      }

      case Sysy22Parser::FLOAT: {
        _localctx = _tracker.createInstance<Sysy22Parser::FloatContext>(_localctx);
        enterOuterAlt(_localctx, 2);
        setState(148);
        match(Sysy22Parser::FLOAT);
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

tree::TerminalNode* Sysy22Parser::FuncDefContext::Ident() {
  return getToken(Sysy22Parser::Ident, 0);
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
  enterRule(_localctx, 18, Sysy22Parser::RuleFuncDef);
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
    setState(151);
    funcType();
    setState(152);
    match(Sysy22Parser::Ident);
    setState(153);
    match(Sysy22Parser::T__6);
    setState(155);
    _errHandler->sync(this);

    _la = _input->LA(1);
    if (_la == Sysy22Parser::INT

    || _la == Sysy22Parser::FLOAT) {
      setState(154);
      funcFParams();
    }
    setState(157);
    match(Sysy22Parser::T__7);
    setState(158);
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


size_t Sysy22Parser::FuncTypeContext::getRuleIndex() const {
  return Sysy22Parser::RuleFuncType;
}

void Sysy22Parser::FuncTypeContext::copyFrom(FuncTypeContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- FuncType_Context ------------------------------------------------------------------

Sysy22Parser::BTypeContext* Sysy22Parser::FuncType_Context::bType() {
  return getRuleContext<Sysy22Parser::BTypeContext>(0);
}

Sysy22Parser::FuncType_Context::FuncType_Context(FuncTypeContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::FuncType_Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterFuncType_(this);
}
void Sysy22Parser::FuncType_Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitFuncType_(this);
}

std::any Sysy22Parser::FuncType_Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitFuncType_(this);
  else
    return visitor->visitChildren(this);
}
//----------------- VoidContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::VoidContext::VOID() {
  return getToken(Sysy22Parser::VOID, 0);
}

Sysy22Parser::VoidContext::VoidContext(FuncTypeContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::VoidContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterVoid(this);
}
void Sysy22Parser::VoidContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitVoid(this);
}

std::any Sysy22Parser::VoidContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitVoid(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::FuncTypeContext* Sysy22Parser::funcType() {
  FuncTypeContext *_localctx = _tracker.createInstance<FuncTypeContext>(_ctx, getState());
  enterRule(_localctx, 20, Sysy22Parser::RuleFuncType);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(162);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::INT:
      case Sysy22Parser::FLOAT: {
        _localctx = _tracker.createInstance<Sysy22Parser::FuncType_Context>(_localctx);
        enterOuterAlt(_localctx, 1);
        setState(160);
        bType();
        break;
      }

      case Sysy22Parser::VOID: {
        _localctx = _tracker.createInstance<Sysy22Parser::VoidContext>(_localctx);
        enterOuterAlt(_localctx, 2);
        setState(161);
        match(Sysy22Parser::VOID);
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
  enterRule(_localctx, 22, Sysy22Parser::RuleFuncFParams);
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
    setState(164);
    funcFParam();
    setState(169);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy22Parser::T__0) {
      setState(165);
      match(Sysy22Parser::T__0);
      setState(166);
      funcFParam();
      setState(171);
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


size_t Sysy22Parser::FuncFParamContext::getRuleIndex() const {
  return Sysy22Parser::RuleFuncFParam;
}

void Sysy22Parser::FuncFParamContext::copyFrom(FuncFParamContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- ScalarParamContext ------------------------------------------------------------------

Sysy22Parser::BTypeContext* Sysy22Parser::ScalarParamContext::bType() {
  return getRuleContext<Sysy22Parser::BTypeContext>(0);
}

tree::TerminalNode* Sysy22Parser::ScalarParamContext::Ident() {
  return getToken(Sysy22Parser::Ident, 0);
}

Sysy22Parser::ScalarParamContext::ScalarParamContext(FuncFParamContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ScalarParamContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterScalarParam(this);
}
void Sysy22Parser::ScalarParamContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitScalarParam(this);
}

std::any Sysy22Parser::ScalarParamContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitScalarParam(this);
  else
    return visitor->visitChildren(this);
}
//----------------- ArrayParamContext ------------------------------------------------------------------

Sysy22Parser::BTypeContext* Sysy22Parser::ArrayParamContext::bType() {
  return getRuleContext<Sysy22Parser::BTypeContext>(0);
}

tree::TerminalNode* Sysy22Parser::ArrayParamContext::Ident() {
  return getToken(Sysy22Parser::Ident, 0);
}

std::vector<Sysy22Parser::ExpContext *> Sysy22Parser::ArrayParamContext::exp() {
  return getRuleContexts<Sysy22Parser::ExpContext>();
}

Sysy22Parser::ExpContext* Sysy22Parser::ArrayParamContext::exp(size_t i) {
  return getRuleContext<Sysy22Parser::ExpContext>(i);
}

Sysy22Parser::ArrayParamContext::ArrayParamContext(FuncFParamContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ArrayParamContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterArrayParam(this);
}
void Sysy22Parser::ArrayParamContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitArrayParam(this);
}

std::any Sysy22Parser::ArrayParamContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitArrayParam(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::FuncFParamContext* Sysy22Parser::funcFParam() {
  FuncFParamContext *_localctx = _tracker.createInstance<FuncFParamContext>(_ctx, getState());
  enterRule(_localctx, 24, Sysy22Parser::RuleFuncFParam);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(188);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 16, _ctx)) {
    case 1: {
      _localctx = _tracker.createInstance<Sysy22Parser::ScalarParamContext>(_localctx);
      enterOuterAlt(_localctx, 1);
      setState(172);
      bType();
      setState(173);
      match(Sysy22Parser::Ident);
      break;
    }

    case 2: {
      _localctx = _tracker.createInstance<Sysy22Parser::ArrayParamContext>(_localctx);
      enterOuterAlt(_localctx, 2);
      setState(175);
      bType();
      setState(176);
      match(Sysy22Parser::Ident);
      setState(177);
      match(Sysy22Parser::T__2);
      setState(178);
      match(Sysy22Parser::T__3);
      setState(185);
      _errHandler->sync(this);
      _la = _input->LA(1);
      while (_la == Sysy22Parser::T__2) {
        setState(179);
        match(Sysy22Parser::T__2);
        setState(180);
        exp();
        setState(181);
        match(Sysy22Parser::T__3);
        setState(187);
        _errHandler->sync(this);
        _la = _input->LA(1);
      }
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

//----------------- BlockContext ------------------------------------------------------------------

Sysy22Parser::BlockContext::BlockContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
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
  enterRule(_localctx, 26, Sysy22Parser::RuleBlock);
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
    setState(190);
    match(Sysy22Parser::T__4);
    setState(194);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while ((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & 1084482901668) != 0)) {
      setState(191);
      blockItem();
      setState(196);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(197);
    match(Sysy22Parser::T__5);
   
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
  enterRule(_localctx, 28, Sysy22Parser::RuleBlockItem);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(201);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::INT:
      case Sysy22Parser::FLOAT:
      case Sysy22Parser::CONST: {
        enterOuterAlt(_localctx, 1);
        setState(199);
        decl();
        break;
      }

      case Sysy22Parser::T__1:
      case Sysy22Parser::T__4:
      case Sysy22Parser::T__6:
      case Sysy22Parser::IF:
      case Sysy22Parser::WHILE:
      case Sysy22Parser::BREAK:
      case Sysy22Parser::CONTINUE:
      case Sysy22Parser::RETURN:
      case Sysy22Parser::Add:
      case Sysy22Parser::Sub:
      case Sysy22Parser::Not:
      case Sysy22Parser::Ident:
      case Sysy22Parser::DecConst:
      case Sysy22Parser::OctConst:
      case Sysy22Parser::HexConst:
      case Sysy22Parser::DecimalFloatingConst:
      case Sysy22Parser::HexFloatingConst: {
        enterOuterAlt(_localctx, 2);
        setState(200);
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

//----------------- ExprStmtContext ------------------------------------------------------------------

Sysy22Parser::ExpContext* Sysy22Parser::ExprStmtContext::exp() {
  return getRuleContext<Sysy22Parser::ExpContext>(0);
}

Sysy22Parser::ExprStmtContext::ExprStmtContext(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ExprStmtContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterExprStmt(this);
}
void Sysy22Parser::ExprStmtContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitExprStmt(this);
}

std::any Sysy22Parser::ExprStmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitExprStmt(this);
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
//----------------- BreakContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::BreakContext::BREAK() {
  return getToken(Sysy22Parser::BREAK, 0);
}

Sysy22Parser::BreakContext::BreakContext(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::BreakContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterBreak(this);
}
void Sysy22Parser::BreakContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitBreak(this);
}

std::any Sysy22Parser::BreakContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitBreak(this);
  else
    return visitor->visitChildren(this);
}
//----------------- AssignmentContext ------------------------------------------------------------------

Sysy22Parser::LValContext* Sysy22Parser::AssignmentContext::lVal() {
  return getRuleContext<Sysy22Parser::LValContext>(0);
}

tree::TerminalNode* Sysy22Parser::AssignmentContext::Assign() {
  return getToken(Sysy22Parser::Assign, 0);
}

Sysy22Parser::ExpContext* Sysy22Parser::AssignmentContext::exp() {
  return getRuleContext<Sysy22Parser::ExpContext>(0);
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
//----------------- ContinueContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::ContinueContext::CONTINUE() {
  return getToken(Sysy22Parser::CONTINUE, 0);
}

Sysy22Parser::ContinueContext::ContinueContext(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ContinueContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterContinue(this);
}
void Sysy22Parser::ContinueContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitContinue(this);
}

std::any Sysy22Parser::ContinueContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitContinue(this);
  else
    return visitor->visitChildren(this);
}
//----------------- WhileContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::WhileContext::WHILE() {
  return getToken(Sysy22Parser::WHILE, 0);
}

Sysy22Parser::CondContext* Sysy22Parser::WhileContext::cond() {
  return getRuleContext<Sysy22Parser::CondContext>(0);
}

Sysy22Parser::StmtContext* Sysy22Parser::WhileContext::stmt() {
  return getRuleContext<Sysy22Parser::StmtContext>(0);
}

Sysy22Parser::WhileContext::WhileContext(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::WhileContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterWhile(this);
}
void Sysy22Parser::WhileContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitWhile(this);
}

std::any Sysy22Parser::WhileContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitWhile(this);
  else
    return visitor->visitChildren(this);
}
//----------------- IfElseContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::IfElseContext::IF() {
  return getToken(Sysy22Parser::IF, 0);
}

Sysy22Parser::CondContext* Sysy22Parser::IfElseContext::cond() {
  return getRuleContext<Sysy22Parser::CondContext>(0);
}

std::vector<Sysy22Parser::StmtContext *> Sysy22Parser::IfElseContext::stmt() {
  return getRuleContexts<Sysy22Parser::StmtContext>();
}

Sysy22Parser::StmtContext* Sysy22Parser::IfElseContext::stmt(size_t i) {
  return getRuleContext<Sysy22Parser::StmtContext>(i);
}

tree::TerminalNode* Sysy22Parser::IfElseContext::ELSE() {
  return getToken(Sysy22Parser::ELSE, 0);
}

Sysy22Parser::IfElseContext::IfElseContext(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::IfElseContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterIfElse(this);
}
void Sysy22Parser::IfElseContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitIfElse(this);
}

std::any Sysy22Parser::IfElseContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitIfElse(this);
  else
    return visitor->visitChildren(this);
}
//----------------- ReturnContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::ReturnContext::RETURN() {
  return getToken(Sysy22Parser::RETURN, 0);
}

Sysy22Parser::ExpContext* Sysy22Parser::ReturnContext::exp() {
  return getRuleContext<Sysy22Parser::ExpContext>(0);
}

Sysy22Parser::ReturnContext::ReturnContext(StmtContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ReturnContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterReturn(this);
}
void Sysy22Parser::ReturnContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitReturn(this);
}

std::any Sysy22Parser::ReturnContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitReturn(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::StmtContext* Sysy22Parser::stmt() {
  StmtContext *_localctx = _tracker.createInstance<StmtContext>(_ctx, getState());
  enterRule(_localctx, 30, Sysy22Parser::RuleStmt);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(237);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 22, _ctx)) {
    case 1: {
      _localctx = _tracker.createInstance<Sysy22Parser::AssignmentContext>(_localctx);
      enterOuterAlt(_localctx, 1);
      setState(203);
      lVal();
      setState(204);
      match(Sysy22Parser::Assign);
      setState(205);
      exp();
      setState(206);
      match(Sysy22Parser::T__1);
      break;
    }

    case 2: {
      _localctx = _tracker.createInstance<Sysy22Parser::ExprStmtContext>(_localctx);
      enterOuterAlt(_localctx, 2);
      setState(209);
      _errHandler->sync(this);

      _la = _input->LA(1);
      if ((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & 1084482388096) != 0)) {
        setState(208);
        exp();
      }
      setState(211);
      match(Sysy22Parser::T__1);
      break;
    }

    case 3: {
      _localctx = _tracker.createInstance<Sysy22Parser::BlockStmtContext>(_localctx);
      enterOuterAlt(_localctx, 3);
      setState(212);
      block();
      break;
    }

    case 4: {
      _localctx = _tracker.createInstance<Sysy22Parser::IfElseContext>(_localctx);
      enterOuterAlt(_localctx, 4);
      setState(213);
      match(Sysy22Parser::IF);
      setState(214);
      match(Sysy22Parser::T__6);
      setState(215);
      cond();
      setState(216);
      match(Sysy22Parser::T__7);
      setState(217);
      stmt();
      setState(220);
      _errHandler->sync(this);

      switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 20, _ctx)) {
      case 1: {
        setState(218);
        match(Sysy22Parser::ELSE);
        setState(219);
        stmt();
        break;
      }

      default:
        break;
      }
      break;
    }

    case 5: {
      _localctx = _tracker.createInstance<Sysy22Parser::WhileContext>(_localctx);
      enterOuterAlt(_localctx, 5);
      setState(222);
      match(Sysy22Parser::WHILE);
      setState(223);
      match(Sysy22Parser::T__6);
      setState(224);
      cond();
      setState(225);
      match(Sysy22Parser::T__7);
      setState(226);
      stmt();
      break;
    }

    case 6: {
      _localctx = _tracker.createInstance<Sysy22Parser::BreakContext>(_localctx);
      enterOuterAlt(_localctx, 6);
      setState(228);
      match(Sysy22Parser::BREAK);
      setState(229);
      match(Sysy22Parser::T__1);
      break;
    }

    case 7: {
      _localctx = _tracker.createInstance<Sysy22Parser::ContinueContext>(_localctx);
      enterOuterAlt(_localctx, 7);
      setState(230);
      match(Sysy22Parser::CONTINUE);
      setState(231);
      match(Sysy22Parser::T__1);
      break;
    }

    case 8: {
      _localctx = _tracker.createInstance<Sysy22Parser::ReturnContext>(_localctx);
      enterOuterAlt(_localctx, 8);
      setState(232);
      match(Sysy22Parser::RETURN);
      setState(234);
      _errHandler->sync(this);

      _la = _input->LA(1);
      if ((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & 1084482388096) != 0)) {
        setState(233);
        exp();
      }
      setState(236);
      match(Sysy22Parser::T__1);
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
  enterRule(_localctx, 32, Sysy22Parser::RuleExp);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(239);
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
  enterRule(_localctx, 34, Sysy22Parser::RuleCond);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(241);
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

tree::TerminalNode* Sysy22Parser::LValContext::Ident() {
  return getToken(Sysy22Parser::Ident, 0);
}

std::vector<Sysy22Parser::ExpContext *> Sysy22Parser::LValContext::exp() {
  return getRuleContexts<Sysy22Parser::ExpContext>();
}

Sysy22Parser::ExpContext* Sysy22Parser::LValContext::exp(size_t i) {
  return getRuleContext<Sysy22Parser::ExpContext>(i);
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
  enterRule(_localctx, 36, Sysy22Parser::RuleLVal);

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
    setState(243);
    match(Sysy22Parser::Ident);
    setState(250);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 23, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        setState(244);
        match(Sysy22Parser::T__2);
        setState(245);
        exp();
        setState(246);
        match(Sysy22Parser::T__3); 
      }
      setState(252);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 23, _ctx);
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

//----------------- PrimaryExp_Context ------------------------------------------------------------------

Sysy22Parser::ExpContext* Sysy22Parser::PrimaryExp_Context::exp() {
  return getRuleContext<Sysy22Parser::ExpContext>(0);
}

Sysy22Parser::NumberContext* Sysy22Parser::PrimaryExp_Context::number() {
  return getRuleContext<Sysy22Parser::NumberContext>(0);
}

Sysy22Parser::PrimaryExp_Context::PrimaryExp_Context(PrimaryExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::PrimaryExp_Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterPrimaryExp_(this);
}
void Sysy22Parser::PrimaryExp_Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitPrimaryExp_(this);
}

std::any Sysy22Parser::PrimaryExp_Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitPrimaryExp_(this);
  else
    return visitor->visitChildren(this);
}
//----------------- LValExprContext ------------------------------------------------------------------

Sysy22Parser::LValContext* Sysy22Parser::LValExprContext::lVal() {
  return getRuleContext<Sysy22Parser::LValContext>(0);
}

Sysy22Parser::LValExprContext::LValExprContext(PrimaryExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::LValExprContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterLValExpr(this);
}
void Sysy22Parser::LValExprContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitLValExpr(this);
}

std::any Sysy22Parser::LValExprContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitLValExpr(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::PrimaryExpContext* Sysy22Parser::primaryExp() {
  PrimaryExpContext *_localctx = _tracker.createInstance<PrimaryExpContext>(_ctx, getState());
  enterRule(_localctx, 38, Sysy22Parser::RulePrimaryExp);

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
    switch (_input->LA(1)) {
      case Sysy22Parser::T__6: {
        _localctx = _tracker.createInstance<Sysy22Parser::PrimaryExp_Context>(_localctx);
        enterOuterAlt(_localctx, 1);
        setState(253);
        match(Sysy22Parser::T__6);
        setState(254);
        exp();
        setState(255);
        match(Sysy22Parser::T__7);
        break;
      }

      case Sysy22Parser::Ident: {
        _localctx = _tracker.createInstance<Sysy22Parser::LValExprContext>(_localctx);
        enterOuterAlt(_localctx, 2);
        setState(257);
        lVal();
        break;
      }

      case Sysy22Parser::DecConst:
      case Sysy22Parser::OctConst:
      case Sysy22Parser::HexConst:
      case Sysy22Parser::DecimalFloatingConst:
      case Sysy22Parser::HexFloatingConst: {
        _localctx = _tracker.createInstance<Sysy22Parser::PrimaryExp_Context>(_localctx);
        enterOuterAlt(_localctx, 3);
        setState(258);
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

//----------------- IntConstContext ------------------------------------------------------------------

Sysy22Parser::IntConstContext::IntConstContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::IntConstContext::getRuleIndex() const {
  return Sysy22Parser::RuleIntConst;
}

void Sysy22Parser::IntConstContext::copyFrom(IntConstContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- HexConstContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::HexConstContext::HexConst() {
  return getToken(Sysy22Parser::HexConst, 0);
}

Sysy22Parser::HexConstContext::HexConstContext(IntConstContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::HexConstContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterHexConst(this);
}
void Sysy22Parser::HexConstContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitHexConst(this);
}

std::any Sysy22Parser::HexConstContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitHexConst(this);
  else
    return visitor->visitChildren(this);
}
//----------------- OctConstContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::OctConstContext::OctConst() {
  return getToken(Sysy22Parser::OctConst, 0);
}

Sysy22Parser::OctConstContext::OctConstContext(IntConstContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::OctConstContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterOctConst(this);
}
void Sysy22Parser::OctConstContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitOctConst(this);
}

std::any Sysy22Parser::OctConstContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitOctConst(this);
  else
    return visitor->visitChildren(this);
}
//----------------- DecConstContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::DecConstContext::DecConst() {
  return getToken(Sysy22Parser::DecConst, 0);
}

Sysy22Parser::DecConstContext::DecConstContext(IntConstContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::DecConstContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterDecConst(this);
}
void Sysy22Parser::DecConstContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitDecConst(this);
}

std::any Sysy22Parser::DecConstContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitDecConst(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::IntConstContext* Sysy22Parser::intConst() {
  IntConstContext *_localctx = _tracker.createInstance<IntConstContext>(_ctx, getState());
  enterRule(_localctx, 40, Sysy22Parser::RuleIntConst);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(264);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::DecConst: {
        _localctx = _tracker.createInstance<Sysy22Parser::DecConstContext>(_localctx);
        enterOuterAlt(_localctx, 1);
        setState(261);
        match(Sysy22Parser::DecConst);
        break;
      }

      case Sysy22Parser::OctConst: {
        _localctx = _tracker.createInstance<Sysy22Parser::OctConstContext>(_localctx);
        enterOuterAlt(_localctx, 2);
        setState(262);
        match(Sysy22Parser::OctConst);
        break;
      }

      case Sysy22Parser::HexConst: {
        _localctx = _tracker.createInstance<Sysy22Parser::HexConstContext>(_localctx);
        enterOuterAlt(_localctx, 3);
        setState(263);
        match(Sysy22Parser::HexConst);
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

//----------------- FloatConstContext ------------------------------------------------------------------

Sysy22Parser::FloatConstContext::FloatConstContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}


size_t Sysy22Parser::FloatConstContext::getRuleIndex() const {
  return Sysy22Parser::RuleFloatConst;
}

void Sysy22Parser::FloatConstContext::copyFrom(FloatConstContext *ctx) {
  ParserRuleContext::copyFrom(ctx);
}

//----------------- DecFloatConstContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::DecFloatConstContext::DecimalFloatingConst() {
  return getToken(Sysy22Parser::DecimalFloatingConst, 0);
}

Sysy22Parser::DecFloatConstContext::DecFloatConstContext(FloatConstContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::DecFloatConstContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterDecFloatConst(this);
}
void Sysy22Parser::DecFloatConstContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitDecFloatConst(this);
}

std::any Sysy22Parser::DecFloatConstContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitDecFloatConst(this);
  else
    return visitor->visitChildren(this);
}
//----------------- HexFloatConstContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::HexFloatConstContext::HexFloatingConst() {
  return getToken(Sysy22Parser::HexFloatingConst, 0);
}

Sysy22Parser::HexFloatConstContext::HexFloatConstContext(FloatConstContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::HexFloatConstContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterHexFloatConst(this);
}
void Sysy22Parser::HexFloatConstContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitHexFloatConst(this);
}

std::any Sysy22Parser::HexFloatConstContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitHexFloatConst(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::FloatConstContext* Sysy22Parser::floatConst() {
  FloatConstContext *_localctx = _tracker.createInstance<FloatConstContext>(_ctx, getState());
  enterRule(_localctx, 42, Sysy22Parser::RuleFloatConst);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(268);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::DecimalFloatingConst: {
        _localctx = _tracker.createInstance<Sysy22Parser::DecFloatConstContext>(_localctx);
        enterOuterAlt(_localctx, 1);
        setState(266);
        match(Sysy22Parser::DecimalFloatingConst);
        break;
      }

      case Sysy22Parser::HexFloatingConst: {
        _localctx = _tracker.createInstance<Sysy22Parser::HexFloatConstContext>(_localctx);
        enterOuterAlt(_localctx, 2);
        setState(267);
        match(Sysy22Parser::HexFloatingConst);
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

Sysy22Parser::IntConstContext* Sysy22Parser::NumberContext::intConst() {
  return getRuleContext<Sysy22Parser::IntConstContext>(0);
}

Sysy22Parser::FloatConstContext* Sysy22Parser::NumberContext::floatConst() {
  return getRuleContext<Sysy22Parser::FloatConstContext>(0);
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
  enterRule(_localctx, 44, Sysy22Parser::RuleNumber);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(272);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::DecConst:
      case Sysy22Parser::OctConst:
      case Sysy22Parser::HexConst: {
        enterOuterAlt(_localctx, 1);
        setState(270);
        intConst();
        break;
      }

      case Sysy22Parser::DecimalFloatingConst:
      case Sysy22Parser::HexFloatingConst: {
        enterOuterAlt(_localctx, 2);
        setState(271);
        floatConst();
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

//----------------- CallContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::CallContext::Ident() {
  return getToken(Sysy22Parser::Ident, 0);
}

Sysy22Parser::FuncRParamsContext* Sysy22Parser::CallContext::funcRParams() {
  return getRuleContext<Sysy22Parser::FuncRParamsContext>(0);
}

Sysy22Parser::CallContext::CallContext(UnaryExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::CallContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterCall(this);
}
void Sysy22Parser::CallContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitCall(this);
}

std::any Sysy22Parser::CallContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitCall(this);
  else
    return visitor->visitChildren(this);
}
//----------------- NotContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::NotContext::Not() {
  return getToken(Sysy22Parser::Not, 0);
}

Sysy22Parser::UnaryExpContext* Sysy22Parser::NotContext::unaryExp() {
  return getRuleContext<Sysy22Parser::UnaryExpContext>(0);
}

Sysy22Parser::NotContext::NotContext(UnaryExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::NotContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterNot(this);
}
void Sysy22Parser::NotContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitNot(this);
}

std::any Sysy22Parser::NotContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitNot(this);
  else
    return visitor->visitChildren(this);
}
//----------------- UnaryExp_Context ------------------------------------------------------------------

Sysy22Parser::PrimaryExpContext* Sysy22Parser::UnaryExp_Context::primaryExp() {
  return getRuleContext<Sysy22Parser::PrimaryExpContext>(0);
}

Sysy22Parser::UnaryExp_Context::UnaryExp_Context(UnaryExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::UnaryExp_Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterUnaryExp_(this);
}
void Sysy22Parser::UnaryExp_Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitUnaryExp_(this);
}

std::any Sysy22Parser::UnaryExp_Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitUnaryExp_(this);
  else
    return visitor->visitChildren(this);
}
//----------------- UnaryAddContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::UnaryAddContext::Add() {
  return getToken(Sysy22Parser::Add, 0);
}

Sysy22Parser::UnaryExpContext* Sysy22Parser::UnaryAddContext::unaryExp() {
  return getRuleContext<Sysy22Parser::UnaryExpContext>(0);
}

Sysy22Parser::UnaryAddContext::UnaryAddContext(UnaryExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::UnaryAddContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterUnaryAdd(this);
}
void Sysy22Parser::UnaryAddContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitUnaryAdd(this);
}

std::any Sysy22Parser::UnaryAddContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitUnaryAdd(this);
  else
    return visitor->visitChildren(this);
}
//----------------- UnarySubContext ------------------------------------------------------------------

tree::TerminalNode* Sysy22Parser::UnarySubContext::Sub() {
  return getToken(Sysy22Parser::Sub, 0);
}

Sysy22Parser::UnaryExpContext* Sysy22Parser::UnarySubContext::unaryExp() {
  return getRuleContext<Sysy22Parser::UnaryExpContext>(0);
}

Sysy22Parser::UnarySubContext::UnarySubContext(UnaryExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::UnarySubContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterUnarySub(this);
}
void Sysy22Parser::UnarySubContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitUnarySub(this);
}

std::any Sysy22Parser::UnarySubContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitUnarySub(this);
  else
    return visitor->visitChildren(this);
}
Sysy22Parser::UnaryExpContext* Sysy22Parser::unaryExp() {
  UnaryExpContext *_localctx = _tracker.createInstance<UnaryExpContext>(_ctx, getState());
  enterRule(_localctx, 46, Sysy22Parser::RuleUnaryExp);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    setState(287);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 29, _ctx)) {
    case 1: {
      _localctx = _tracker.createInstance<Sysy22Parser::UnaryExp_Context>(_localctx);
      enterOuterAlt(_localctx, 1);
      setState(274);
      primaryExp();
      break;
    }

    case 2: {
      _localctx = _tracker.createInstance<Sysy22Parser::CallContext>(_localctx);
      enterOuterAlt(_localctx, 2);
      setState(275);
      match(Sysy22Parser::Ident);
      setState(276);
      match(Sysy22Parser::T__6);
      setState(278);
      _errHandler->sync(this);

      _la = _input->LA(1);
      if ((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & 2183994015872) != 0)) {
        setState(277);
        funcRParams();
      }
      setState(280);
      match(Sysy22Parser::T__7);
      break;
    }

    case 3: {
      _localctx = _tracker.createInstance<Sysy22Parser::UnaryAddContext>(_localctx);
      enterOuterAlt(_localctx, 3);
      setState(281);
      match(Sysy22Parser::Add);
      setState(282);
      unaryExp();
      break;
    }

    case 4: {
      _localctx = _tracker.createInstance<Sysy22Parser::UnarySubContext>(_localctx);
      enterOuterAlt(_localctx, 4);
      setState(283);
      match(Sysy22Parser::Sub);
      setState(284);
      unaryExp();
      break;
    }

    case 5: {
      _localctx = _tracker.createInstance<Sysy22Parser::NotContext>(_localctx);
      enterOuterAlt(_localctx, 5);
      setState(285);
      match(Sysy22Parser::Not);
      setState(286);
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

//----------------- StringConstContext ------------------------------------------------------------------

Sysy22Parser::StringConstContext::StringConstContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy22Parser::StringConstContext::StringConst() {
  return getToken(Sysy22Parser::StringConst, 0);
}


size_t Sysy22Parser::StringConstContext::getRuleIndex() const {
  return Sysy22Parser::RuleStringConst;
}

void Sysy22Parser::StringConstContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterStringConst(this);
}

void Sysy22Parser::StringConstContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitStringConst(this);
}


std::any Sysy22Parser::StringConstContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitStringConst(this);
  else
    return visitor->visitChildren(this);
}

Sysy22Parser::StringConstContext* Sysy22Parser::stringConst() {
  StringConstContext *_localctx = _tracker.createInstance<StringConstContext>(_ctx, getState());
  enterRule(_localctx, 48, Sysy22Parser::RuleStringConst);

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(289);
    match(Sysy22Parser::StringConst);
   
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

Sysy22Parser::ExpContext* Sysy22Parser::FuncRParamContext::exp() {
  return getRuleContext<Sysy22Parser::ExpContext>(0);
}

Sysy22Parser::StringConstContext* Sysy22Parser::FuncRParamContext::stringConst() {
  return getRuleContext<Sysy22Parser::StringConstContext>(0);
}


size_t Sysy22Parser::FuncRParamContext::getRuleIndex() const {
  return Sysy22Parser::RuleFuncRParam;
}

void Sysy22Parser::FuncRParamContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterFuncRParam(this);
}

void Sysy22Parser::FuncRParamContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitFuncRParam(this);
}


std::any Sysy22Parser::FuncRParamContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitFuncRParam(this);
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
    setState(293);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy22Parser::T__6:
      case Sysy22Parser::Add:
      case Sysy22Parser::Sub:
      case Sysy22Parser::Not:
      case Sysy22Parser::Ident:
      case Sysy22Parser::DecConst:
      case Sysy22Parser::OctConst:
      case Sysy22Parser::HexConst:
      case Sysy22Parser::DecimalFloatingConst:
      case Sysy22Parser::HexFloatingConst: {
        enterOuterAlt(_localctx, 1);
        setState(291);
        exp();
        break;
      }

      case Sysy22Parser::StringConst: {
        enterOuterAlt(_localctx, 2);
        setState(292);
        stringConst();
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
  enterRule(_localctx, 52, Sysy22Parser::RuleFuncRParams);
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
    setState(295);
    funcRParam();
    setState(300);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy22Parser::T__0) {
      setState(296);
      match(Sysy22Parser::T__0);
      setState(297);
      funcRParam();
      setState(302);
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

//----------------- DivContext ------------------------------------------------------------------

Sysy22Parser::MulExpContext* Sysy22Parser::DivContext::mulExp() {
  return getRuleContext<Sysy22Parser::MulExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::DivContext::Div() {
  return getToken(Sysy22Parser::Div, 0);
}

Sysy22Parser::UnaryExpContext* Sysy22Parser::DivContext::unaryExp() {
  return getRuleContext<Sysy22Parser::UnaryExpContext>(0);
}

Sysy22Parser::DivContext::DivContext(MulExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::DivContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterDiv(this);
}
void Sysy22Parser::DivContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitDiv(this);
}

std::any Sysy22Parser::DivContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitDiv(this);
  else
    return visitor->visitChildren(this);
}
//----------------- ModContext ------------------------------------------------------------------

Sysy22Parser::MulExpContext* Sysy22Parser::ModContext::mulExp() {
  return getRuleContext<Sysy22Parser::MulExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::ModContext::Mod() {
  return getToken(Sysy22Parser::Mod, 0);
}

Sysy22Parser::UnaryExpContext* Sysy22Parser::ModContext::unaryExp() {
  return getRuleContext<Sysy22Parser::UnaryExpContext>(0);
}

Sysy22Parser::ModContext::ModContext(MulExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::ModContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterMod(this);
}
void Sysy22Parser::ModContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitMod(this);
}

std::any Sysy22Parser::ModContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitMod(this);
  else
    return visitor->visitChildren(this);
}
//----------------- MulContext ------------------------------------------------------------------

Sysy22Parser::MulExpContext* Sysy22Parser::MulContext::mulExp() {
  return getRuleContext<Sysy22Parser::MulExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::MulContext::Mul() {
  return getToken(Sysy22Parser::Mul, 0);
}

Sysy22Parser::UnaryExpContext* Sysy22Parser::MulContext::unaryExp() {
  return getRuleContext<Sysy22Parser::UnaryExpContext>(0);
}

Sysy22Parser::MulContext::MulContext(MulExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::MulContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterMul(this);
}
void Sysy22Parser::MulContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitMul(this);
}

std::any Sysy22Parser::MulContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitMul(this);
  else
    return visitor->visitChildren(this);
}
//----------------- MulExp_Context ------------------------------------------------------------------

Sysy22Parser::UnaryExpContext* Sysy22Parser::MulExp_Context::unaryExp() {
  return getRuleContext<Sysy22Parser::UnaryExpContext>(0);
}

Sysy22Parser::MulExp_Context::MulExp_Context(MulExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::MulExp_Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterMulExp_(this);
}
void Sysy22Parser::MulExp_Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitMulExp_(this);
}

std::any Sysy22Parser::MulExp_Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitMulExp_(this);
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
  size_t startState = 54;
  enterRecursionRule(_localctx, 54, Sysy22Parser::RuleMulExp, precedence);

    

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
    _localctx = _tracker.createInstance<MulExp_Context>(_localctx);
    _ctx = _localctx;
    previousContext = _localctx;

    setState(304);
    unaryExp();
    _ctx->stop = _input->LT(-1);
    setState(317);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 33, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        setState(315);
        _errHandler->sync(this);
        switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 32, _ctx)) {
        case 1: {
          auto newContext = _tracker.createInstance<MulContext>(_tracker.createInstance<MulExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleMulExp);
          setState(306);

          if (!(precpred(_ctx, 3))) throw FailedPredicateException(this, "precpred(_ctx, 3)");
          setState(307);
          match(Sysy22Parser::Mul);
          setState(308);
          unaryExp();
          break;
        }

        case 2: {
          auto newContext = _tracker.createInstance<DivContext>(_tracker.createInstance<MulExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleMulExp);
          setState(309);

          if (!(precpred(_ctx, 2))) throw FailedPredicateException(this, "precpred(_ctx, 2)");
          setState(310);
          match(Sysy22Parser::Div);
          setState(311);
          unaryExp();
          break;
        }

        case 3: {
          auto newContext = _tracker.createInstance<ModContext>(_tracker.createInstance<MulExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleMulExp);
          setState(312);

          if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
          setState(313);
          match(Sysy22Parser::Mod);
          setState(314);
          unaryExp();
          break;
        }

        default:
          break;
        } 
      }
      setState(319);
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

//----------------- AddExp_Context ------------------------------------------------------------------

Sysy22Parser::MulExpContext* Sysy22Parser::AddExp_Context::mulExp() {
  return getRuleContext<Sysy22Parser::MulExpContext>(0);
}

Sysy22Parser::AddExp_Context::AddExp_Context(AddExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::AddExp_Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterAddExp_(this);
}
void Sysy22Parser::AddExp_Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitAddExp_(this);
}

std::any Sysy22Parser::AddExp_Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitAddExp_(this);
  else
    return visitor->visitChildren(this);
}
//----------------- AddContext ------------------------------------------------------------------

Sysy22Parser::AddExpContext* Sysy22Parser::AddContext::addExp() {
  return getRuleContext<Sysy22Parser::AddExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::AddContext::Add() {
  return getToken(Sysy22Parser::Add, 0);
}

Sysy22Parser::MulExpContext* Sysy22Parser::AddContext::mulExp() {
  return getRuleContext<Sysy22Parser::MulExpContext>(0);
}

Sysy22Parser::AddContext::AddContext(AddExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::AddContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterAdd(this);
}
void Sysy22Parser::AddContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitAdd(this);
}

std::any Sysy22Parser::AddContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitAdd(this);
  else
    return visitor->visitChildren(this);
}
//----------------- SubContext ------------------------------------------------------------------

Sysy22Parser::AddExpContext* Sysy22Parser::SubContext::addExp() {
  return getRuleContext<Sysy22Parser::AddExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::SubContext::Sub() {
  return getToken(Sysy22Parser::Sub, 0);
}

Sysy22Parser::MulExpContext* Sysy22Parser::SubContext::mulExp() {
  return getRuleContext<Sysy22Parser::MulExpContext>(0);
}

Sysy22Parser::SubContext::SubContext(AddExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::SubContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterSub(this);
}
void Sysy22Parser::SubContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitSub(this);
}

std::any Sysy22Parser::SubContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitSub(this);
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
  size_t startState = 56;
  enterRecursionRule(_localctx, 56, Sysy22Parser::RuleAddExp, precedence);

    

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
    _localctx = _tracker.createInstance<AddExp_Context>(_localctx);
    _ctx = _localctx;
    previousContext = _localctx;

    setState(321);
    mulExp(0);
    _ctx->stop = _input->LT(-1);
    setState(331);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 35, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        setState(329);
        _errHandler->sync(this);
        switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 34, _ctx)) {
        case 1: {
          auto newContext = _tracker.createInstance<AddContext>(_tracker.createInstance<AddExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleAddExp);
          setState(323);

          if (!(precpred(_ctx, 2))) throw FailedPredicateException(this, "precpred(_ctx, 2)");
          setState(324);
          match(Sysy22Parser::Add);
          setState(325);
          mulExp(0);
          break;
        }

        case 2: {
          auto newContext = _tracker.createInstance<SubContext>(_tracker.createInstance<AddExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleAddExp);
          setState(326);

          if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
          setState(327);
          match(Sysy22Parser::Sub);
          setState(328);
          mulExp(0);
          break;
        }

        default:
          break;
        } 
      }
      setState(333);
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

//----------------- GeqContext ------------------------------------------------------------------

Sysy22Parser::RelExpContext* Sysy22Parser::GeqContext::relExp() {
  return getRuleContext<Sysy22Parser::RelExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::GeqContext::Geq() {
  return getToken(Sysy22Parser::Geq, 0);
}

Sysy22Parser::AddExpContext* Sysy22Parser::GeqContext::addExp() {
  return getRuleContext<Sysy22Parser::AddExpContext>(0);
}

Sysy22Parser::GeqContext::GeqContext(RelExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::GeqContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterGeq(this);
}
void Sysy22Parser::GeqContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitGeq(this);
}

std::any Sysy22Parser::GeqContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitGeq(this);
  else
    return visitor->visitChildren(this);
}
//----------------- LtContext ------------------------------------------------------------------

Sysy22Parser::RelExpContext* Sysy22Parser::LtContext::relExp() {
  return getRuleContext<Sysy22Parser::RelExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::LtContext::Lt() {
  return getToken(Sysy22Parser::Lt, 0);
}

Sysy22Parser::AddExpContext* Sysy22Parser::LtContext::addExp() {
  return getRuleContext<Sysy22Parser::AddExpContext>(0);
}

Sysy22Parser::LtContext::LtContext(RelExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::LtContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterLt(this);
}
void Sysy22Parser::LtContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitLt(this);
}

std::any Sysy22Parser::LtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitLt(this);
  else
    return visitor->visitChildren(this);
}
//----------------- RelExp_Context ------------------------------------------------------------------

Sysy22Parser::AddExpContext* Sysy22Parser::RelExp_Context::addExp() {
  return getRuleContext<Sysy22Parser::AddExpContext>(0);
}

Sysy22Parser::RelExp_Context::RelExp_Context(RelExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::RelExp_Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterRelExp_(this);
}
void Sysy22Parser::RelExp_Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitRelExp_(this);
}

std::any Sysy22Parser::RelExp_Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitRelExp_(this);
  else
    return visitor->visitChildren(this);
}
//----------------- LeqContext ------------------------------------------------------------------

Sysy22Parser::RelExpContext* Sysy22Parser::LeqContext::relExp() {
  return getRuleContext<Sysy22Parser::RelExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::LeqContext::Leq() {
  return getToken(Sysy22Parser::Leq, 0);
}

Sysy22Parser::AddExpContext* Sysy22Parser::LeqContext::addExp() {
  return getRuleContext<Sysy22Parser::AddExpContext>(0);
}

Sysy22Parser::LeqContext::LeqContext(RelExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::LeqContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterLeq(this);
}
void Sysy22Parser::LeqContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitLeq(this);
}

std::any Sysy22Parser::LeqContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitLeq(this);
  else
    return visitor->visitChildren(this);
}
//----------------- GtContext ------------------------------------------------------------------

Sysy22Parser::RelExpContext* Sysy22Parser::GtContext::relExp() {
  return getRuleContext<Sysy22Parser::RelExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::GtContext::Gt() {
  return getToken(Sysy22Parser::Gt, 0);
}

Sysy22Parser::AddExpContext* Sysy22Parser::GtContext::addExp() {
  return getRuleContext<Sysy22Parser::AddExpContext>(0);
}

Sysy22Parser::GtContext::GtContext(RelExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::GtContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterGt(this);
}
void Sysy22Parser::GtContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitGt(this);
}

std::any Sysy22Parser::GtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitGt(this);
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
  size_t startState = 58;
  enterRecursionRule(_localctx, 58, Sysy22Parser::RuleRelExp, precedence);

    

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
    _localctx = _tracker.createInstance<RelExp_Context>(_localctx);
    _ctx = _localctx;
    previousContext = _localctx;

    setState(335);
    addExp(0);
    _ctx->stop = _input->LT(-1);
    setState(351);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 37, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        setState(349);
        _errHandler->sync(this);
        switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 36, _ctx)) {
        case 1: {
          auto newContext = _tracker.createInstance<LtContext>(_tracker.createInstance<RelExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleRelExp);
          setState(337);

          if (!(precpred(_ctx, 4))) throw FailedPredicateException(this, "precpred(_ctx, 4)");
          setState(338);
          match(Sysy22Parser::Lt);
          setState(339);
          addExp(0);
          break;
        }

        case 2: {
          auto newContext = _tracker.createInstance<GtContext>(_tracker.createInstance<RelExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleRelExp);
          setState(340);

          if (!(precpred(_ctx, 3))) throw FailedPredicateException(this, "precpred(_ctx, 3)");
          setState(341);
          match(Sysy22Parser::Gt);
          setState(342);
          addExp(0);
          break;
        }

        case 3: {
          auto newContext = _tracker.createInstance<LeqContext>(_tracker.createInstance<RelExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleRelExp);
          setState(343);

          if (!(precpred(_ctx, 2))) throw FailedPredicateException(this, "precpred(_ctx, 2)");
          setState(344);
          match(Sysy22Parser::Leq);
          setState(345);
          addExp(0);
          break;
        }

        case 4: {
          auto newContext = _tracker.createInstance<GeqContext>(_tracker.createInstance<RelExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleRelExp);
          setState(346);

          if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
          setState(347);
          match(Sysy22Parser::Geq);
          setState(348);
          addExp(0);
          break;
        }

        default:
          break;
        } 
      }
      setState(353);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 37, _ctx);
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

//----------------- NeqContext ------------------------------------------------------------------

Sysy22Parser::EqExpContext* Sysy22Parser::NeqContext::eqExp() {
  return getRuleContext<Sysy22Parser::EqExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::NeqContext::Neq() {
  return getToken(Sysy22Parser::Neq, 0);
}

Sysy22Parser::RelExpContext* Sysy22Parser::NeqContext::relExp() {
  return getRuleContext<Sysy22Parser::RelExpContext>(0);
}

Sysy22Parser::NeqContext::NeqContext(EqExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::NeqContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterNeq(this);
}
void Sysy22Parser::NeqContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitNeq(this);
}

std::any Sysy22Parser::NeqContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitNeq(this);
  else
    return visitor->visitChildren(this);
}
//----------------- EqContext ------------------------------------------------------------------

Sysy22Parser::EqExpContext* Sysy22Parser::EqContext::eqExp() {
  return getRuleContext<Sysy22Parser::EqExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::EqContext::Eq() {
  return getToken(Sysy22Parser::Eq, 0);
}

Sysy22Parser::RelExpContext* Sysy22Parser::EqContext::relExp() {
  return getRuleContext<Sysy22Parser::RelExpContext>(0);
}

Sysy22Parser::EqContext::EqContext(EqExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::EqContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterEq(this);
}
void Sysy22Parser::EqContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitEq(this);
}

std::any Sysy22Parser::EqContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitEq(this);
  else
    return visitor->visitChildren(this);
}
//----------------- EqExp_Context ------------------------------------------------------------------

Sysy22Parser::RelExpContext* Sysy22Parser::EqExp_Context::relExp() {
  return getRuleContext<Sysy22Parser::RelExpContext>(0);
}

Sysy22Parser::EqExp_Context::EqExp_Context(EqExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::EqExp_Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterEqExp_(this);
}
void Sysy22Parser::EqExp_Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitEqExp_(this);
}

std::any Sysy22Parser::EqExp_Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitEqExp_(this);
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
  size_t startState = 60;
  enterRecursionRule(_localctx, 60, Sysy22Parser::RuleEqExp, precedence);

    

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
    _localctx = _tracker.createInstance<EqExp_Context>(_localctx);
    _ctx = _localctx;
    previousContext = _localctx;

    setState(355);
    relExp(0);
    _ctx->stop = _input->LT(-1);
    setState(365);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 39, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        setState(363);
        _errHandler->sync(this);
        switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 38, _ctx)) {
        case 1: {
          auto newContext = _tracker.createInstance<EqContext>(_tracker.createInstance<EqExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleEqExp);
          setState(357);

          if (!(precpred(_ctx, 2))) throw FailedPredicateException(this, "precpred(_ctx, 2)");
          setState(358);
          match(Sysy22Parser::Eq);
          setState(359);
          relExp(0);
          break;
        }

        case 2: {
          auto newContext = _tracker.createInstance<NeqContext>(_tracker.createInstance<EqExpContext>(parentContext, parentState));
          _localctx = newContext;
          pushNewRecursionContext(newContext, startState, RuleEqExp);
          setState(360);

          if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
          setState(361);
          match(Sysy22Parser::Neq);
          setState(362);
          relExp(0);
          break;
        }

        default:
          break;
        } 
      }
      setState(367);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 39, _ctx);
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

//----------------- LAndExp_Context ------------------------------------------------------------------

Sysy22Parser::EqExpContext* Sysy22Parser::LAndExp_Context::eqExp() {
  return getRuleContext<Sysy22Parser::EqExpContext>(0);
}

Sysy22Parser::LAndExp_Context::LAndExp_Context(LAndExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::LAndExp_Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterLAndExp_(this);
}
void Sysy22Parser::LAndExp_Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitLAndExp_(this);
}

std::any Sysy22Parser::LAndExp_Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitLAndExp_(this);
  else
    return visitor->visitChildren(this);
}
//----------------- AndContext ------------------------------------------------------------------

Sysy22Parser::LAndExpContext* Sysy22Parser::AndContext::lAndExp() {
  return getRuleContext<Sysy22Parser::LAndExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::AndContext::And() {
  return getToken(Sysy22Parser::And, 0);
}

Sysy22Parser::EqExpContext* Sysy22Parser::AndContext::eqExp() {
  return getRuleContext<Sysy22Parser::EqExpContext>(0);
}

Sysy22Parser::AndContext::AndContext(LAndExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::AndContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterAnd(this);
}
void Sysy22Parser::AndContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitAnd(this);
}

std::any Sysy22Parser::AndContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitAnd(this);
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
  size_t startState = 62;
  enterRecursionRule(_localctx, 62, Sysy22Parser::RuleLAndExp, precedence);

    

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
    _localctx = _tracker.createInstance<LAndExp_Context>(_localctx);
    _ctx = _localctx;
    previousContext = _localctx;

    setState(369);
    eqExp(0);
    _ctx->stop = _input->LT(-1);
    setState(376);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 40, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        auto newContext = _tracker.createInstance<AndContext>(_tracker.createInstance<LAndExpContext>(parentContext, parentState));
        _localctx = newContext;
        pushNewRecursionContext(newContext, startState, RuleLAndExp);
        setState(371);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(372);
        match(Sysy22Parser::And);
        setState(373);
        eqExp(0); 
      }
      setState(378);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 40, _ctx);
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

//----------------- OrContext ------------------------------------------------------------------

Sysy22Parser::LOrExpContext* Sysy22Parser::OrContext::lOrExp() {
  return getRuleContext<Sysy22Parser::LOrExpContext>(0);
}

tree::TerminalNode* Sysy22Parser::OrContext::Or() {
  return getToken(Sysy22Parser::Or, 0);
}

Sysy22Parser::LAndExpContext* Sysy22Parser::OrContext::lAndExp() {
  return getRuleContext<Sysy22Parser::LAndExpContext>(0);
}

Sysy22Parser::OrContext::OrContext(LOrExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::OrContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterOr(this);
}
void Sysy22Parser::OrContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitOr(this);
}

std::any Sysy22Parser::OrContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitOr(this);
  else
    return visitor->visitChildren(this);
}
//----------------- LOrExp_Context ------------------------------------------------------------------

Sysy22Parser::LAndExpContext* Sysy22Parser::LOrExp_Context::lAndExp() {
  return getRuleContext<Sysy22Parser::LAndExpContext>(0);
}

Sysy22Parser::LOrExp_Context::LOrExp_Context(LOrExpContext *ctx) { copyFrom(ctx); }

void Sysy22Parser::LOrExp_Context::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterLOrExp_(this);
}
void Sysy22Parser::LOrExp_Context::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<Sysy22Listener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitLOrExp_(this);
}

std::any Sysy22Parser::LOrExp_Context::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy22Visitor*>(visitor))
    return parserVisitor->visitLOrExp_(this);
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
  size_t startState = 64;
  enterRecursionRule(_localctx, 64, Sysy22Parser::RuleLOrExp, precedence);

    

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
    _localctx = _tracker.createInstance<LOrExp_Context>(_localctx);
    _ctx = _localctx;
    previousContext = _localctx;

    setState(380);
    lAndExp(0);
    _ctx->stop = _input->LT(-1);
    setState(387);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 41, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        auto newContext = _tracker.createInstance<OrContext>(_tracker.createInstance<LOrExpContext>(parentContext, parentState));
        _localctx = newContext;
        pushNewRecursionContext(newContext, startState, RuleLOrExp);
        setState(382);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(383);
        match(Sysy22Parser::Or);
        setState(384);
        lAndExp(0); 
      }
      setState(389);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 41, _ctx);
    }
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
    case 27: return mulExpSempred(antlrcpp::downCast<MulExpContext *>(context), predicateIndex);
    case 28: return addExpSempred(antlrcpp::downCast<AddExpContext *>(context), predicateIndex);
    case 29: return relExpSempred(antlrcpp::downCast<RelExpContext *>(context), predicateIndex);
    case 30: return eqExpSempred(antlrcpp::downCast<EqExpContext *>(context), predicateIndex);
    case 31: return lAndExpSempred(antlrcpp::downCast<LAndExpContext *>(context), predicateIndex);
    case 32: return lOrExpSempred(antlrcpp::downCast<LOrExpContext *>(context), predicateIndex);

  default:
    break;
  }
  return true;
}

bool Sysy22Parser::mulExpSempred(MulExpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 0: return precpred(_ctx, 3);
    case 1: return precpred(_ctx, 2);
    case 2: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy22Parser::addExpSempred(AddExpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 3: return precpred(_ctx, 2);
    case 4: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy22Parser::relExpSempred(RelExpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 5: return precpred(_ctx, 4);
    case 6: return precpred(_ctx, 3);
    case 7: return precpred(_ctx, 2);
    case 8: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy22Parser::eqExpSempred(EqExpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 9: return precpred(_ctx, 2);
    case 10: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy22Parser::lAndExpSempred(LAndExpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 11: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy22Parser::lOrExpSempred(LOrExpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 12: return precpred(_ctx, 1);

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
