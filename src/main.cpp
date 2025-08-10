#include "MModule.hpp"
#include "gen_asm.hpp"
#include "codegen.hpp"
#include "Sysy22Lexer.h"
#include "Sysy22Parser.h"
#include <iostream>
#include <fstream>
#include <ASTVisitor.h>
#include <ostream>
#include "frontend/Sema.hpp"
/* User Code Start: Sasara */
#include "pass/PassManager.hpp"
#include "pass/transform/DummyTransform.hpp"
#include "pass/transform/HelloWorld.hpp"
#include "pass/transform/DomTreePrinter.hpp"
#include "pass/transform/AliasTest.hpp"
#include "pass/transform/LoopInfoPrinter.hpp"
#include "pass/transform/PredPrinter.hpp"
#include "pass/transform/LICM.hpp"
#include "pass/transform/DomFrontierPrinter.hpp"
#include "pass/transform/CFGSimplify.hpp"
#include "pass/transform/Mem2Reg.hpp"
#include "pass/transform/DCE.hpp"
#include "pass/transform/PHISimplify.hpp"
/* User Code End: Sasara */
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
    /* User Code Start: Sasara */
    IR::IRBuilder* builder = cg->get_ir_builder();
    pass::PassManager pm(builder);
    //pm.add_module_transform_pass(std::make_unique<pass::HelloWorldPass>());
    //pm.add_module_transform_pass(std::make_unique<pass::DummyTransformPass>());
    pm.add_function_transform_pass(std::make_unique<pass::CFGSimplifyPass>());
    //pm.add_function_transform_pass(std::make_unique<pass::DomTreePrinterPass>());
    //pm.add_function_transform_pass(std::make_unique<pass::DomFrontierPrinterPass>());
    pm.add_function_transform_pass(std::make_unique<pass::Mem2RegPass>());
    pm.add_function_transform_pass(std::make_unique<pass::CFGSimplifyPass>());
    pm.add_function_transform_pass(std::make_unique<pass::DCEPass>());
    pm.add_function_transform_pass(std::make_unique<pass::CFGSimplifyPass>());
    pm.add_function_transform_pass(std::make_unique<pass::PHISimplifyPass>());
    //pm.add_function_transform_pass(std::make_unique<pass::AliasTestPass>());
    //pm.add_function_transform_pass(std::make_unique<pass::LoopInfoPrinterPass>());
    //pm.add_function_transform_pass(std::make_unique<pass::PredPrinterPass>());
    pm.add_function_transform_pass(std::make_unique<pass::LICMPass>());
    cout << "====================Running optimization passes...====================\n";
    pm.run(*m);
    /* User Code End: Sasara */
    cout << "====================The ir of " << input_path << " =======================\n";
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
