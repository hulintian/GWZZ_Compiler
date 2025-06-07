#include "IR/IR.hpp"
#include "frontend/emit_ir.hpp"
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
#include <ostream>
#include "frontend/Sema.hpp"
#include "IR/IR.hpp"
#include "backend/program.hpp"
// #include "backend/passes.hpp"

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
//     cout << tree->toStringTree() << endl;
//    auto tree = parser.prog();
    frontend::ASTVisitor av;
    av.visit(tree);
    auto &cu = av.compUnit();
    cu.print(cout, 0);

    frontend::Sema sema;
    sema.visit_compUnits(cu);

    frontend::GenIr *genIr = new frontend::GenIr();
    midend::ir::Module *module = genIr->transform(cu);

    module->print(cout);

    // get file name 
    const char* dot = std::strchr(input_path, '.');
    std::string before_dot;
    if(dot) {
        before_dot = std::string(input_path, dot);
    }

    std::ofstream out(before_dot+".s");

    backend::riscv::Program *prog = new backend::riscv::Program(module);
    // backend::riscv::backend_passes(prog);

    cout << endl;
    prog->gen_asm(cout);
    prog->gen_asm(out);
    out.close();

    return 0;
}
