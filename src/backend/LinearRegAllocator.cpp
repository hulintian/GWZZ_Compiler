#include <climits>
#include <iostream>
#include <stack>
#include <algorithm>
#include "backend/LinearRegAllocator.hpp"
#include "IR/Instructions.hpp"
#include "backend/MBasicBlock.hpp"
#include "backend/MInstruction.hpp"
#include "common/regarch.hpp"
#include "common/utils.hpp"

namespace backend {

void RegAllocator::live_interval_analysis() {
    // TODO 活跃区间分析
    //          1. 从prologue开始扫描
    //          2. 然后dfs下去，遇到epilogue先不扫描
    //          3. 最后扫描epilogue

    MachineBasicBlock* bb;
    bb = this->_parent->prologue_bb;
    std::map<int, bool> visited;
    // dfs
    std::stack<int> bb_idx_stack;
    bb_idx_stack.push(bb->_bb_idx);

    while(!bb_idx_stack.empty()) {
        int bbi = bb_idx_stack.top();
        bb_idx_stack.pop();
        bb = this->_parent->find_m_bb(bbi);
        for(auto i : this->_parent->next_bb[bbi]) {
            if(!visited[i] && i != _parent->epilogue_bb->_bb_idx) bb_idx_stack.push(i);
        }
        traverse_bb(bb);
    }
    traverse_bb(this->_parent->epilogue_bb);
}

void RegAllocator::traverse_bb(MachineBasicBlock* mbb) {
    // std::cerr << "Scan " << mbb << "\n";
    for(auto instr : mbb->get_machine_instrs()) {
        instr->time = timestamp;
        
        auto def_regs = instr->get_dsts();
        auto use_regs = instr->get_srcs();

        if(auto call = dynamic_cast<IR::CallInst*>(instr)) {
            this->latest_call_timestamp = timestamp;
        }
        
        if(!def_regs.empty()) {
            auto defined = def_regs[0];
            // 已经被定义了
            if(!defined.is_standard()) {
                temp_reg_live_interval_meta_data* trlimd = new temp_reg_live_interval_meta_data(defined, timestamp, timestamp);
                reg_activated[defined] = trlimd;
                regs_live_interval.push_back(trlimd);
            }
        }

        for(auto ur : use_regs) {
            if(!ur.is_standard()) {
                if(reg_activated.find(ur) != reg_activated.end()) {
                    reg_activated[ur]->end = timestamp;
                    if(latest_call_timestamp != -1) {
                        if(reg_activated[ur]->start_ < latest_call_timestamp &&
                            reg_activated[ur]->end > latest_call_timestamp) {
                            reg_activated[ur]->pass_call_instr = true;
                        }
                    }
                } else {
                    std::cerr << error << "Use undefined reg " << ur.name() << "\n";
                }
            }
        }
        timestamp++;
    }
}

void RegAllocator::plot_reg_interval() {
    this->sort_interval_regs();
    std::cerr << _parent << ":\n";
    unsigned long long maxlife = 0;
    unsigned long long minlife = LONG_MAX / 2;
    for(auto metadata : regs_live_interval) {
        if(metadata->pass_call_instr) {
            std::cerr << "S_x ";
        } else {
            std::cerr << "T_x ";
        }
        std::cerr << metadata->temp_reg.name() << " -- start: " << metadata->start_ << " ; end: " << metadata->end << "\n";
        maxlife = std::max(metadata->end - metadata->start_, maxlife);
        minlife = std::min(metadata->end - metadata->start_, maxlife);
    }
    std::cerr << "Max activate time: " << maxlife << "\n";
    std::cerr << "Min activate time: " << minlife << "\n";
}

void RegAllocator::alloca_regs() {

    MachineBasicBlock* bb;
    bb = this->_parent->prologue_bb;
    std::map<int, bool> visited;
    // dfs traverse 
    std::stack<int> bb_idx_stack;
    bb_idx_stack.push(bb->_bb_idx);

    // for non spill
    std::map<temp_reg_live_interval_meta_data*, RiscvReg::Reg> meta2machine;
    // for spill regs
    std::map<temp_reg_live_interval_meta_data*, int> meta2stackbias;

    while(!bb_idx_stack.empty()) {
        int bbi = bb_idx_stack.top();
        bb_idx_stack.pop();
        bb = this->_parent->find_m_bb(bbi);
        for(auto i : this->_parent->next_bb[bbi]) {
            if(!visited[i] && i != _parent->epilogue_bb->_bb_idx) bb_idx_stack.push(i);
        }
        
        auto cur_bb = this->_parent->find_m_bb(bbi);
        // loop to alloca regs 
        for(auto instr : cur_bb->m_instrs) {
            // TODO need to free the regs which temp  regs are not active


            for(auto ur : instr->get_srcs()) {

            }

            for(auto def_r : instr->get_dsts()) {
                if(temp_reg_live_interval_meta_data* md = this->find_meta_data(def_r, instr->time)) {
                    if(def_r.is_gp()) {
                        // 整数寄存器
                        if(md->pass_call_instr) {
                            if(!stk_save_regs.empty()) {
                                const RiscvReg::Reg *mreg = stk_save_regs.top();
                                meta2machine[md] = *mreg;
                                instr
                            }
                        } else {

                        }
                    } else {
                        // 浮点寄存器

                    }
                } else {
                    std::cerr << error << "Not exist " << def_r.name() << "'s interval meta data\n";
                }
            }
        }
    }
}

}
