#include "grammar/Sysy22Lexer.h"
#include "grammar/Sysy22Parser.h"
#include "grammar/Sysy22Visitor.h"
#include "support/Any.h"


#include <antlr4-runtime/ANTLRInputStream.h>
#include <antlr4-runtime/CommonTokenStream.h>
#include <chrono>
#include <iostream>
#include <fstream>

#include <antlr4-runtime/antlr4-runtime.h>

using namespace std;
using namespace antlr4;

class ParsePrintVisitor : public Sysy22Visitor {
public :
    std::any visitProg(Sysy22Parser::ProgContext *context) override {
        cout << "In the Prog Visitor" << endl;
        return nullptr;
    } 

    std::any visitCompUnit(Sysy22Parser::CompUnitContext *context)override{
        cout << "In the CU Visitor" << endl;
        return nullptr;
    }

    std::any visitFuncDef(Sysy22Parser::FuncDefContext *context) override{
        cout << "In the FD Visitor" << endl;

        return nullptr;
    }

    std::any visitFuncType(Sysy22Parser::FuncTypeContext *context) override{
        cout << "In the FT Visitor" << endl;
        
        return nullptr;
    }

    std::any visitBlock(Sysy22Parser::BlockContext *context) override {
        cout << "In the Block Visitor" << endl;
        
        return nullptr;
    }

    std::any visitStmt(Sysy22Parser::StmtContext *context) override {
        cout << "In the Stmt Visitor" << endl;

        return nullptr;
    }

    std::any visitNumber(Sysy22Parser::NumberContext *context) override {
        cout << "In the Number Visitor" << endl;

        return nullptr;
    }
};


int main(int argc, char** argv) {
    const char* input_path = argv[1];
    std::ifstream ipf;
    ipf.open(input_path);
    ANTLRInputStream input(ipf);
    Sysy22Lexer lexer(&input);
    CommonTokenStream tokens(&lexer);
    Sysy22Parser parser(&tokens);

    auto tree = parser.prog();

    ParsePrintVisitor v;
    v.visitProg(tree);

    return 0;
}
