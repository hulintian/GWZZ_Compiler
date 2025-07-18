#include "frontend/codegen.hpp"
#include "grammar/Sysy22Lexer.h"
#include "grammar/Sysy22Parser.h"
#include "grammar/Sysy22Visitor.h"
#include "support/Any.h"
#include "antlr4-runtime/ANTLRInputStream.h"
#include "antlr4-runtime/CommonTokenStream.h"
#include <chrono>
#include <iostream>
#include <fstream>
#include "antlr4-runtime/antlr4-runtime.h"
#include "antlr4-runtime/tree/ParseTree.h"
#include <frontend/ASTVisitor.h>
#include <ostream>
#include "frontend/Sema.hpp"

#include <fstream>

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

    frontend::ASTVisitor av;
    av.visit(tree);
    auto &cu = av.compUnit();
    // cu.print(cout, 0);

    frontend::Sema sema;
    sema.visit_compUnits(cu);
    // cu.print(cout, 0);

    frontend::CodeGen* cg = new frontend::CodeGen();
    auto m = cg->gen(cu);
    cout << "====================The ir of " << input_path << " =======================\n";
    m->dump(cout);

    return 0;
}
