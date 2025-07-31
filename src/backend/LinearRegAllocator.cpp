#include <climits>
#include <iostream>
#include <stack>
#include <algorithm>
#include "LinearRegAllocator.hpp"
#include "Instructions.hpp"
#include "MBasicBlock.hpp"
#include "MInstruction.hpp"
#include "regarch.hpp"
#include "utils.hpp"

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

        if(!visited[bbi]) {
            visited[bbi] = true;
            traverse_bb(bb);
        }
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

        for(auto ur : use_regs) {
            if(!ur->is_standard()) {
                if(reg_activated.find(ur) != reg_activated.end()) {
                    reg_activated[ur]->end = timestamp;
                    if(latest_call_timestamp != -1) {
                        if(reg_activated[ur]->start_ < latest_call_timestamp &&
                            reg_activated[ur]->end > latest_call_timestamp) {
                            reg_activated[ur]->pass_call_instr = true;
                        }
                    }
                } else {
                    std::cerr << error << "Use undefined reg " << ur->name() << "\n";
                }
            }
        }
        
        if(!def_regs.empty()) {
            auto defined = def_regs[0];
            // 已经被定义了
            if(!defined->is_standard()) {
                temp_reg_live_interval_meta_data* trlimd = new temp_reg_live_interval_meta_data(defined, timestamp, timestamp);
                reg_activated[defined] = trlimd;
                regs_live_interval.push_back(trlimd);
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

    this->sort_interval_regs();

    MachineBasicBlock* bb;
    bb = this->_parent->prologue_bb;
    std::map<int, bool> visited;
    // dfs traverse 
    std::stack<int> bb_idx_stack;
    bb_idx_stack.push(bb->_bb_idx);

    // for non spill
    std::map<temp_reg_live_interval_meta_data*, const RiscvReg::Reg*> meta2machine;
    // for spill regs
    std::map<temp_reg_live_interval_meta_data*, int> meta2stackbias;
    // 用来找old value的 
    std::map<RiscvReg::Reg, temp_reg_live_interval_meta_data*> reg2meta;

    auto deal_spill = [&](temp_reg_live_interval_meta_data* meta) {

    };

    while(!bb_idx_stack.empty()) {
        int bbi = bb_idx_stack.top();
        bb_idx_stack.pop();
        bb = this->_parent->find_m_bb(bbi);
        for(auto i : this->_parent->next_bb[bbi]) {
            if(!visited[i] && i != _parent->epilogue_bb->_bb_idx) bb_idx_stack.push(i);
        }
        
        auto cur_bb = this->_parent->find_m_bb(bbi);
        // loop to alloca regs 
        if(!visited[bbi]) {
        visited[bbi] = true;
        for(auto instr : cur_bb->m_instrs) {
            
            for(auto  ur : instr->get_srcs()) {
                if(!ur->is_standard()) {
                    if(reg2meta.find(ur) != reg2meta.end()) {
                        auto md = reg2meta[ur];
#ifdef SHOW_INST_TIME
                        std::cerr << info << instr->time << " Allocate register for " << ur->name() << " from " << md->start_ << " to " << md->end << " ";
#endif
                        if(meta2machine.find(md) != meta2machine.end()) {
                            *ur = *meta2machine[md];
                        }else if(meta2stackbias.find(md) != meta2stackbias.end()) {
                            std::cerr << info << " Reg " << ur->name() << " is spilled to fp-" << meta2stackbias[md] << "\n";
                        } else {
                            std::cerr << error << "Not found " << ur->name() << " from " << md->start_ << " to " << md->end << "\n";
                        }
#ifdef SHOW_INST_TIME
                        std::cerr << "Machine reg " << ur->name() << "\n";
#endif
                    } else {
                        // should never run 
                        std::cerr << error << " Not find metadata  for reg " << ur->name() << "\n";
                    }
                }
            }

            // TODO need to free the regs which temp  regs are not active
            for(auto [m,r] : meta2machine) {
                if(m->end < instr->time + 1 && r != nullptr) {
                    meta2machine[m] = nullptr;
                    if (RiscvReg::is_in_pool(RiscvReg::temp_regs, r)) {
                        // r 属于 整型 caller-saved (T_x)
                        stk_temp_regs.push(r);
                    } else if (RiscvReg::is_in_pool(RiscvReg::regs_saved, r)) {
                        // r 属于 整型 callee-saved (S_x)
                        stk_save_regs.push(r);
                    } else if (RiscvReg::is_in_pool(RiscvReg::fp_Temp_regs, r)) {
                        // r 属于 浮点 caller-saved (FT_x)
                        stk_fp_temp_regs.push(r);
                    } else if (RiscvReg::is_in_pool(RiscvReg::fp_regs_calleesaved, r)) {
                        // r 属于 浮点 callee-saved (FS_x)
                        stk_fp_temp_regs.push(r);
                    } else {
                        // 不属于任何一类
                        std::cerr << "Unkonw reg type " << r->name() << "\n"; 
                    }
                }
            }

            for(auto def_r : instr->get_dsts()) {
                if(!def_r->is_standard()) {
                    if(temp_reg_live_interval_meta_data* md = this->find_def_meta_data(def_r, instr->time)) {
                        // 更新定义的到 meta指针
                        reg2meta[md->temp_reg] = md;
                        if(def_r->is_gp()) {
                            // 整数寄存器
                            if(!md->pass_call_instr) {
                                if(!stk_temp_regs.empty()) {
                                    auto *mreg = stk_temp_regs.top();
                                    stk_temp_regs.pop();
                                    meta2machine[md] = mreg;
                                    *def_r = *mreg;
                                } else {
                                    // TODO 处理spill
                                }
                            } else {
                                if(!stk_save_regs.empty()) {
                                    auto *mreg = stk_save_regs.top();
                                    stk_save_regs.pop();
                                    meta2machine[md] = mreg;
                                    *def_r = *mreg;
                                    this->used_S_x.insert(*mreg);
                                } else {
                                    // TODO 处理spill

                                }
                            }
                        } else {
                            // 浮点寄存器
                            if(!md->pass_call_instr) {
                                if(!stk_fp_temp_regs.empty()) {
                                    auto *mreg = stk_fp_temp_regs.top();
                                    stk_fp_temp_regs.pop();
                                    meta2machine[md] = mreg;
                                    *def_r = *mreg;
                                } else {
                                    // TODO 处理spill
                                }
                            } else {
                                if(!stk_fp_save_regs.empty()) {
                                    auto *mreg = stk_fp_save_regs.top();
                                    stk_fp_save_regs.pop();
                                    meta2machine[md] = mreg;
                                    *def_r = *mreg;
                                    this->used_FS_x.insert(*mreg);
                                } else {
                                    // TODO 处理spill

                                }
                            }

                        }
                    } else {
                        std::cerr << error << "Not exist " << def_r->name() << "'s interval meta data\n";
                    }
                }
            }

        }
        }
    }
}

}
