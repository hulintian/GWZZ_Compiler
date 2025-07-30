#pragma once 

#include "IR/GlobalValue.hpp"
#include <backend/MBasicBlock.hpp>
#include <backend/MFunction.hpp>
#include <cassert>
#include <ostream>
#include <sstream>
#include <string>
#include <unordered_map>
#include <vector>
namespace backend {

class MachineModule {
public:
    std::string _mname;
    std::vector<MachineFunction*> funcs;
    std::vector<IR::GlobalValue*> global_items;
    std::vector<IR::GlobalValue*> data_items;
    std::vector<IR::GlobalValue*> bss_items;

    std::unordered_map<std::string, MachineFunction*> n2fmap;

    bool has_func(std::string fn) {
        return n2fmap.find(fn) != n2fmap.end();
    }

    MachineFunction* get_func(std::string fn) {
        assert(has_func(fn) && "func not exists");
        return n2fmap[fn];
    }

    void addfuncs(MachineFunction* nmfunc) {
        assert(!has_func(nmfunc->_name) && "Already has func" );
        this->funcs.push_back(nmfunc) ;
        n2fmap[nmfunc->_name] = nmfunc;
    }

    std::string dump_gvs() {
        // return "gv, waiting to complete";
        std::stringstream oss;
        
        // has data gvs 
        if(this->data_items.size() > 0) {
            oss << "    .data\n";
            oss << "    .align 3\n";
        }
        for(auto gv : this->data_items) {
            if(gv->get_type().is_array()) {
                int n = gv->get_type().nr_elems();
                auto &arr_val = gv->get_var()->arr_val;
                oss << gv->get_symbol() << ":" << "\n";
                for(int i=0; i<n; i++) {
                    if(arr_val->find(i) != arr_val->end()) {
                        unsigned agv = (unsigned)(*arr_val)[i].iv;
                        oss << "    .word " << agv << "\n";
                    } else {
                        oss << "    .word 0\n";
                    }
                }

            } else {
                unsigned gv_val = (unsigned)gv->get_var()->val->iv;
                oss << gv->get_symbol() << ":" << "\n";
                oss << "    .word " << gv_val << "\n";
            }
        }

        // has bss gvs
        if(this->bss_items.size() > 0) {
            oss << "    .bss\n";
            oss << "    .align 3\n";
        }
        for(auto bss_gv : this->bss_items) {
            oss << bss_gv->get_symbol() << ":\n";
            oss << "    .skip ";
            if(bss_gv->get_type().is_array()) {
                int size = bss_gv->get_type().nr_elems() << 2;
                oss << size << "\n";
            }else {
                oss << "4\n";
            }
        }

        return oss.str();
    }

    void dump_asm(std::ostream& os) {
        os << "    .option pic\n";
        os << "    .attribute unaligned_access, 0\n";
        os << "    .attribute stack_align, 16\n";
        os << "    .attribute arch, \"rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0\"\n";
        os << this->dump_gvs();
        os << "    .align 3\n";
        os << "    .globl main\n";
        os << "    .text\n";
         os << "\n";
        for(auto f : funcs) {
            f->dump_asm(os); 
        }
    }
};

}
