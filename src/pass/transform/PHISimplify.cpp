#include "PHISimplify.hpp"
#include "PassManager.hpp"
#include "UseDefAnalysis.hpp"
#include "Function.hpp"
#include "BasicBlock.hpp"
#include "Instructions.hpp"
#include "Value.hpp"

#include <set>
#include <map>
#include <iostream>
#include <vector>
#include <algorithm>
#include <stack>


namespace pass {


bool PHISimplifyPass::run(IR::Function& F,PassManager& pm){
    _func = & F;
    _pm = &pm;
    //_use_def = &_pm->get_analysis_manager().get_function_result<UseDefAnalysisPass>(*_func);
    auto bbs = F.get_bbs();
    for(auto& bb : bbs){
        for(auto &inst : bb->get_intrs()){
            if(!dynamic_cast<IR::PhiInst*>(inst)){
                break;
            }
            auto phi = dynamic_cast<IR::PhiInst*>(inst);
            auto pres = inst->get_parent()->get_predecessors();
            auto incoming_bbs = phi->get_incoming_blocks();
            // step 1
            //std::cout<<"=============step1===============\n";
            if(pres.size() < incoming_bbs.size()){
                for(auto& bb : incoming_bbs){
                    auto it_found = std::find(pres.begin(),pres.end(),bb);
                    if(it_found == pres.end()){
                        phi->remove_incoming_by_block(bb);
                    }
                }
            }


        }
    }
        

    
    return true;
}


}
