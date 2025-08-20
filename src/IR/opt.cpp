#include "opt.hpp"
#include "PassManager.hpp"
#include "DummyTransform.hpp"
#include "HelloWorld.hpp"
#include "DomTreePrinter.hpp"
#include "AliasTest.hpp"
#include "LoopInfoPrinter.hpp"
#include "PredPrinter.hpp"
#include "LICM.hpp"
#include "DomFrontierPrinter.hpp"
#include "CFGSimplify.hpp"
#include "Mem2Reg.hpp"
#include "DCE.hpp"
#include "PHISimplify.hpp"
#include "FunctionInline.hpp"
#include "Reg2Mem.hpp"
#include "ConstantFolding.hpp"
#include "PHIEliminate.hpp"

#include <iostream>
#include <memory>

#include "CFG_Dump.hpp"

namespace opt
{
    void run_passes(IR::Module* m,IR::IRBuilder* builder){
        /* User Code Start: Sasara */    
        pass::PassManager pm(builder);
        pm.add_module_transform_pass(std::make_unique<pass::HelloWorldPass>());
        pm.add_module_transform_pass(std::make_unique<pass::DummyTransformPass>());
        pm.add_function_transform_pass(std::make_unique<pass::CFGSimplifyPass>());
        //pm.add_function_transform_pass(std::make_unique<pass::DomTreePrinterPass>());
        //pm.add_function_transform_pass(std::make_unique<pass::DomFrontierPrinterPass>());
        
        //pm.add_module_transform_pass(std::make_unique<pass::FunctionInline>());

        pm.add_function_transform_pass(std::make_unique<pass::Mem2RegPass>());

        pm.add_function_transform_pass(std::make_unique<pass::CFGSimplifyPass>());
        pm.add_function_transform_pass(std::make_unique<pass::ConstantFoldingPass>());

        //pm.add_function_transform_pass(std::make_unique<pass::PHIEliminatePass>());
        // pm.add_function_transform_pass(std::make_unique<pass::DCEPass>());
        pm.add_function_transform_pass(std::make_unique<pass::CFGSimplifyPass>());

        pm.add_function_transform_pass(std::make_unique<pass::PHIEliminatePass>());
        //pm.add_function_transform_pass(std::make_unique<pass::PHISimplifyPass>());
        //pm.add_function_transform_pass(std::make_unique<pass::AliasTestPass>());
        //pm.add_function_transform_pass(std::make_unique<pass::LoopInfoPrinterPass>());
        //pm.add_function_transform_pass(std::make_unique<pass::PredPrinterPass>());
        //pm.add_function_transform_pass(std::make_unique<pass::LICMPass>());
        // pm.add_function_transform_pass(std::make_unique<pass::Reg2MemPass>());
        std::cout << "====================Running optimization passes...====================\n";
        pm.run(*m);
        /* User Code End: Sasara */

#ifdef DUMP_CFG
        auto cfg_dumper = std::make_unique<pass::CFG_Dump>();
        cfg_dumper->run(*m, pm);
#endif

    }
} // namespace opt
