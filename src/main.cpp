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
#include <antlr4-runtime/tree/ParseTree.h>
#include <frontend/ASTVisitor.h>

using namespace std;
using namespace antlr4;

int main(int argc, char** argv) {
    const char* input_path = argv[1];
    std::ifstream ipf;
    ipf.open(input_path);
    ANTLRInputStream input(ipf);
    Sysy22Lexer lexer(&input);
    CommonTokenStream tokens(&lexer);
    Sysy22Parser parser(&tokens);

    auto tree = parser.compUnits();
//     cout << tree->toStringTree() << endl;
//    auto tree = parser.prog();
    frontend::ASTVisitor av;
    av.visit(tree);
    auto &cu = av.compUnit();
    cu.print(cout, 0);


    return 0;
}
