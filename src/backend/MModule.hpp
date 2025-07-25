#pragma once 

#include "IR/GlobalValue.hpp"
#include <backend/MBasicBlock.hpp>
#include <backend/MFunction.hpp>
#include <ostream>
#include <vector>
namespace backend {

class MachineModule {
public:
    std::string _mname;
    std::vector<MachineFunction*> funcs;
    std::vector<IR::GlobalValue*> global_items;

    std::string dump_gvs() {
        return "gv, waiting to complete";
    }


    void dump_asm(std::ostream& os) {
        os << this->dump_gvs();
        for(auto f : funcs) {
            f->dump_asm(os); 
        }
    }
};

}
