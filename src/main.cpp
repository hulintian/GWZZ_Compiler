#include "MModule.hpp"
#include "gen_asm.hpp"
#include "codegen.hpp"
#include "Sysy22Lexer.h"
#include "Sysy22Parser.h"
#include <iostream>
#include <fstream>
#include <ASTVisitor.h>
#include <ostream>
//#include "frontend/Sema.hpp"
#include "Sema.hpp"
#include "opt.hpp"

#include <fstream>
#include <string>

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

    // if(opts.input_file.find("39_fp_params.sy") != std::string::npos )  {
    //     cout << "Find substr in " << opts.input_file << endl;
    //     return 0;
    // }

    ANTLRInputStream input(ipf);
    Sysy22Lexer lexer(&input);
    CommonTokenStream tokens(&lexer);
    Sysy22Parser parser(&tokens);

    auto tree = parser.compUnits();

    frontend::ASTVisitor av;
    av.visit(tree);
    auto &cu = av.compUnit();
    // cu.print(cout, 0);
#ifdef SHOW_AST
    cu.print(cout, 0);
#endif

    frontend::Sema sema;
    sema.visit_compUnits(cu);
    // cu.print(cout, 0);

    frontend::CodeGen* cg = new frontend::CodeGen();
    auto m = cg->gen(cu);

#ifdef SHOW_IR
    cout << "====================The ir of " << opts.input_file << " =======================\n";
    std::ofstream f_out;
    f_out.open(opts.input_file + ".ir");
    m->dump(f_out);
    f_out.close();
    // m->dump(cout);
#endif



#ifdef O1
    // TODO 这些放到codegen里面，或则在ir里独立出来一个opt的文件
#endif
     if(opts.opt_O1){
        IR::IRBuilder* builder = cg->get_ir_builder();  
        opt::run_passes(m,builder);  
    }
    //同步CFG
    for (auto& func : m->get_functions()) {
        if (!func->is_lib()) {
            func->get_cfg()->regen_cfg();
            //func->get_cfg()->dump_cfg("Final CFG for Backend");
        }
    }

#ifdef SHOW_IR
    cout << "====================The ir of " << opts.input_file << " =======================\n";

    std::ofstream f_out2;
    f_out2.open(opts.input_file + ".opt.ir");
    m->dump(f_out2);
    f_out2.close();
    m->dump(cout);
#endif

    backend::ASMGen* asmg = new backend::ASMGen();
    backend::MachineModule *mm = asmg->translate(m);
#ifdef SHOW_ASM
    cout << "====================The asm of " << opts.input_file << " =======================\n";
    mm->dump_asm(cout);
#endif
    mm->dump_asm(opf);
    opf.close();

    return 0;
}
