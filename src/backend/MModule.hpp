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
        os << "    .option pic\n";
        os << "    .attribute unaligned_access, 0\n";
        os << "    .attribute stack_align, 16\n";
        os << "    .attribute arch, \"rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0\"\n";
        os << this->dump_gvs();
        os << "\n";
        for(auto f : funcs) {
            f->dump_asm(os); 
        }
    }
};

}
