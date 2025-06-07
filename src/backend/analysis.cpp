#include "backend/program.hpp"
#include "backend/instr.hpp"
#include "common/regarch.hpp"

#include <iostream>

namespace backend{

namespace riscv{

void BasicBlock::computeDefAndLiveUse(bool is_gp_pass){
    // if (!is_gp_pass) std::cout << "is fp pass\n";
    live_use.clear();
    def.clear();
    live_out.clear();
    live_in.clear();
    for(auto instr : *get_instr()){
        auto def_reg = instr->def_reg();
        auto use_reg = instr->use_reg();
        // std::cout << "----";
        // instr->gen_asm(std::cout);

        for (auto &u : use_reg) {
            if (!def.count(u) && !u.is_standard() && (u.is_gp() == is_gp_pass)){
                // std::cout << is_gp_pass << " use has " << u << "\n";
                live_use.insert(u);
            }
        }
        for (auto &d : def_reg) {
            if (!d.is_standard() && (d.is_gp() == is_gp_pass)) {
                //  std::cout << is_gp_pass << " def has " << d << "\n";
                def.insert(d);
            }
        }
    }
}

void BasicBlock::computeDefAndLiveUseAfterAlloc(){
    // if (!is_gp_pass) std::cout << "is fp pass\n";
    live_use.clear();
    def.clear();
    live_out.clear();
    live_in.clear();
    for(auto instr : *get_instr()){
        auto def_reg = instr->def_reg();
        auto use_reg = instr->use_reg();
        // std::cout << "----";
        // instr->gen_asm(std::cout);

        for (auto &u : use_reg) {
            if (!def.count(u)){
                // std::cout << is_gp_pass << " use has " << u << "\n";
                live_use.insert(u);
            }
        }
        for (auto &d : def_reg) {
            def.insert(d);
        }
    }
}

void BasicBlock::analyzeLivenessForEachInstr(){
    auto liveOut = live_out;
    for (auto it = instrs_.rbegin(); it != instrs_.rend(); it++) {
        (*it)->live_out = liveOut;
        for (auto &e : (*it)->def_reg())
            liveOut.erase(e);
        for (auto &e : (*it)->use_reg())
            liveOut.insert(e);
        (*it)->live_in = liveOut;
    }
}

void BasicBlock::analyzeLivenessForEachInstrAfterAlloc(){
    auto liveOut = live_out;
    for (auto it = instrs_.rbegin(); it != instrs_.rend(); it++) {
        (*it)->live_out = liveOut;
        for (auto &e : (*it)->def_reg())
            liveOut.erase(e);
        for (auto &e : (*it)->use_reg())
            liveOut.insert(e);
        (*it)->live_in = liveOut;
    }
}

void Function::livenessAnalysis(bool is_gp_pass){
    for(auto &bb : bbs){
        //std::cout << bb->get_name() << std::endl;
        bb->computeDefAndLiveUse(is_gp_pass);
    }
    
    bool changed = true;
    while (changed) {
        changed = false;
        for (auto it = bbs.rbegin(); it != bbs.rend(); it++) {
            auto bb = *it;
            //std::cout << "<<<<" << bb->get_name() << std::endl;
            for (auto succ : bb->succ){
                // std::cout << "{" << succ->get_name() << "}" << std::endl;
                bb->live_out.insert(succ->live_in.begin(), succ->live_in.end());
            }

            auto new_live_in = bb->live_use;
            //for(auto reg: new_live_in) std::cout << reg.name() << std::endl;
            for (auto &e : bb->live_out)
                if (!bb->def.count(e))
                    new_live_in.insert(e);

            if(bb->live_in != new_live_in) {
                changed = true;
                bb->live_in = new_live_in;
            }
        }
    }
    for(auto &bb : bbs){
        bb->analyzeLivenessForEachInstr();
    }
}

void Function::livenessAnalysisAfterAlloc(){
    for(auto &bb : bbs){
        //std::cout << bb->get_name() << std::endl;
        bb->computeDefAndLiveUseAfterAlloc();
    }
    
    bool changed = true;
    while (changed) {
        changed = false;
        for (auto it = bbs.rbegin(); it != bbs.rend(); it++) {
            auto bb = *it;
            //std::cout << "<<<<" << bb->get_name() << std::endl;
            for (auto succ : bb->succ){
                // std::cout << "{" << succ->get_name() << "}" << std::endl;
                bb->live_out.insert(succ->live_in.begin(), succ->live_in.end());
            }

            auto new_live_in = bb->live_use;
            //for(auto reg: new_live_in) std::cout << reg.name() << std::endl;
            for (auto &e : bb->live_out)
                if (!bb->def.count(e))
                    new_live_in.insert(e);

            if(bb->live_in != new_live_in) {
                changed = true;
                bb->live_in = new_live_in;
            }
        }
    }
    for(auto &bb : bbs){
        bb->analyzeLivenessForEachInstr();
    }
}

}

}