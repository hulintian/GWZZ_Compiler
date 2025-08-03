#pragma once 

#include "Function.hpp"
#include "GlobalValue.hpp"
#include "MBasicBlock.hpp"
#include "MFunction.hpp"
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

    std::vector<IR::Function*> lib_funcs;

    std::unordered_map<std::string, MachineFunction*> n2fmap;
    std::map<std::string, IR::Function*> _name2lib_func;
    std::map<std::string, MachineFunction*> _name2lib_m_func;

    bool has_func(std::string fn) {
        return n2fmap.find(fn) != n2fmap.end();
    }

    MachineFunction* get_func(std::string fn) {
        assert(has_func(fn) && "func not exists");
        return n2fmap[fn];
    }

    void addfuncs(MachineFunction* nmfunc) {
        assert(!has_func(nmfunc->_name) && "Already has func" );
        this->funcs.push_back(nmfunc);
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
            oss << "    .globl " << gv->get_name() << "\n";
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

    std::string generate_clear_mem_asm() {
        std::ostringstream out;

        out << "    .globl __clear_mem__\n";
        out << "    .align 1\n";
        out << "__clear_mem__:\n";
        out << "    addi    sp, sp, -16\n";
        out << "    sd      ra, 8(sp)\n";
        out << "    sd      s0, 0(sp)\n";
        // out << "\n";
        out << "    mv      s0, a0        \n";
        out << "    li      t0, 0         \n";
        // out << "\n";
        out << ".Lclear_loop:\n";
        out << "    beq     t0, a1, .Ldone    \n";
        out << "    sw      zero, 0(s0)       \n";
        out << "    addi    s0, s0, 4         \n";
        out << "    addi    t0, t0, 4         \n";
        out << "    j       .Lclear_loop\n";
        // out << "\n";
        out << ".Ldone:\n";
        out << "    ld      s0, 0(sp)\n";
        out << "    ld      ra, 8(sp)\n";
        out << "    addi    sp, sp, 16\n";
        out << "    ret\n";
        // out << "__clear_mem__:\n";
        // out << ".entry___memset_zero__:\n";
        // out << "    sd fp, -8(sp)\n";
        // out << "    sd ra, -16(sp)\n";
        // out << "    addi sp, sp, -16\n";
        // out << "    addi fp, sp, 16\n";
        // out << "    mv t0, a0\n";
        // out << ".Lmemzero:\n";
        // out << "    li t1, 0\n";
        // out << "    slt t2, t1, a1\n";
        // out << "    beqz t2, .exit___memset_zero__\n";
        // out << ".Lmemzero_loop:\n";
        // out << "    li t3, 0\n";
        // out << "    li t2, 4\n";
        // out << "    mul t2, t2, t1\n";
        // out << "    add t2, t2, t0\n";
        // out << "    sw t3, 0(t2)\n";
        // out << "    addi t1, t1, 1\n";
        // out << "    slt t2, t1, a1\n";
        // out << "    beqz t2, .exit___memset_zero__\n";
        // out << "    j .Lmemzero_loop\n";
        // out << ".exit___memset_zero__:\n";
        // out << "    addi sp, sp, 16\n";
        // out << "    ld fp, -8(sp)\n";
        // out << "    ld ra, -16(sp)\n";
        // out << "    ret\n";
 

        return out.str();
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
        os << generate_clear_mem_asm();
         os << "\n";
        for(auto f : funcs) {
            f->dump_asm(os); 
        }
    }
};
}
