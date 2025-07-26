#pragma once 

#include "IR/GlobalValue.hpp"
#include <backend/MBasicBlock.hpp>
#include <backend/MFunction.hpp>
#include <cassert>
#include <ostream>
#include <string>
#include <unordered_map>
#include <vector>
namespace backend {

class MachineModule {
public:
    std::string _mname;
    std::vector<MachineFunction*> funcs;
    std::vector<IR::GlobalValue*> global_items;

    std::unordered_map<std::string, MachineFunction*> n2fmap;

    bool has_func(std::string fn) {
        return n2fmap.find(fn) != n2fmap.end();
    }

    void addfuncs(MachineFunction* nmfunc) {
        assert(!has_func(nmfunc->_name) && "Already has func" );
        this->funcs.push_back(nmfunc) ;
        n2fmap[nmfunc->_name] = nmfunc;
    }

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
