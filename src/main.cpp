#include "MModule.hpp"
#include "gen_asm.hpp"
#include "codegen.hpp"
#include "Sysy22Lexer.h"
#include "Sysy22Parser.h"
#include "Sysy22Visitor.h"
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
#include "Sema.hpp"

#include <fstream>

using namespace std;
using namespace antlr4;

struct CompilerOptions {
    std::string input_file;
    std::string output_file;
    bool emit_asm = false;
    bool opt_O1 = false;
};

bool ends_with(const std::string& str, const std::string& suffix) {
    return str.size() >= suffix.size() &&
           str.compare(str.size() - suffix.size(), suffix.size(), suffix) == 0;
}

std::ostream& parse_args(int argc, char** argv, CompilerOptions& opts) {
    for (int i = 1; i < argc; ++i) {
        std::string arg(argv[i]);
        if (arg == "-S") {
            opts.emit_asm = true;
        } else if (arg == "-o") {
            if (i + 1 < argc) {
                opts.output_file = argv[i];
            } else {
                std::cerr << "Error: -o must be followed by a file name.\n";
                return std::cout;
            }
        } else if (arg == "-O1") {
            opts.opt_O1 = true;
        } else if (ends_with(arg,".sy")) {
            opts.input_file = arg;
        } else if (ends_with(arg,".s")) {
            opts.output_file = arg;
        }
        else {
            std::cerr << "Unknown option: " << arg << "\n";
            return std::cout;
        }
    }

    return std::cout;
}

int main(int argc, char** argv) {
    // const char* input_path = argv[1];

    CompilerOptions opts;
    std::ostream& out = parse_args(argc, argv, opts);
    std::ifstream ipf;
    ipf.open(opts.input_file);

    std::ofstream opf;
    opf.open(opts.output_file);

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
    // cout << "====================The ir of " << input_path << " =======================\n";
    // m->dump(cout);

    // cout << "====================The asm of " << input_path << " =======================\n";
    backend::ASMGen* asmg = new backend::ASMGen();
    backend::MachineModule *mm = asmg->translate(m);
#ifdef SHOW_ASM
    mm->dump_asm(cout);
#endif
    mm->dump_asm(opf);
    opf.close();

    return 0;
}
