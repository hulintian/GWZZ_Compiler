#include <climits>
#include <iostream>
#include <stack>
#include <algorithm>
#include <vector>
#include "LinearRegAllocator.hpp"
#include "MBasicBlock.hpp"
#include "MInstruction.hpp"
#include "ASMBuilder.hpp"
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

        if(auto call = dynamic_cast<CallInst*>(instr)) {
            this->latest_call_timestamp = timestamp;
        }

        for(auto ur : use_regs) {
            if(!ur->is_standard()) {
                if(reg_activated.find(ur) != reg_activated.end()) {
                    reg_activated[ur]->end = timestamp;
                    if(this->latest_call_timestamp != -1) {
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


    int spilled_operands = 0;
    // slot 从哪开始？ 
    int stack_0_size = this->_parent->local_variable_size + 16;
    if(stack_0_size % 8 != 0) {
        std::cerr << error << "spill start ptr is fp-" << stack_0_size << " is not 8 size align\n"; 
    }
    std::map<RiscvReg::Reg, int> slot;

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
                        }else if(slot.find(ur) != slot.end()) {
#ifdef BEBUGG
                            std::cerr << info << " Reg " << ur->name() << " is spilled to fp-" << meta2stackbias[md] << "\n";
#endif
                            // directly use a free reg on the top of stack 
                            // get the bias from slot
                            int bias = slot[ur];
                            if(ur->is_gp()) {
                                if(!stk_temp_regs.empty()) {
                                    auto single_life_reg = stk_temp_regs.top();
                                    if(bias < 2047 && bias > -2048) {
                                        auto ld_from_mm = new LoadInst(MachineInstrType::LD, cur_bb, single_life_reg, RiscvReg::FP, bias);
                                        cur_bb->insert_instr_before(instr, ld_from_mm);
                                        *ur = *single_life_reg;
                                    }
                                }
                            } else {
                                if(!stk_fp_temp_regs.empty()) {
                                    auto single_life_reg = stk_fp_temp_regs.top();
                                    if(bias < 2047 && bias > -2048) {
                                        auto ld_from_mm = new FLoadInst(MachineInstrType::FLW, cur_bb, single_life_reg, RiscvReg::FP, bias);
                                        cur_bb->insert_instr_before(instr, ld_from_mm);
                                        *ur = *single_life_reg;
                                    }
                                }
                            }
                        } else {
#ifdef BEBUGG
                            std::cerr << error << "Not found " << ur->name() << " from " << md->start_ << " to " << md->end << "\n";
#endif
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
#ifdef DEBUG
                        std::cout << "In instr " << instr->to_asm() << "    \n";
                        std::cout << instr->time <<  "        let " << def_r->name();
#endif
                        // 更新定义的到 meta指针
                        reg2meta[md->temp_reg] = md;
                        if(def_r->is_gp()) {
                            // 整数寄存器
                            if(!md->pass_call_instr) {
                                if(!stk_temp_regs.empty()) {
#ifdef DEBUG
                        std::cout << " through 1 " ;
#endif
                                    auto *mreg = stk_temp_regs.top();
                                    stk_temp_regs.pop();
                                    meta2machine[md] = mreg;
                                    *def_r = *mreg;
                                } else if(!stk_save_regs.empty()) {
#ifdef DEBUG
                        std::cout << " through 2 " ;
#endif
                                    auto *mreg = stk_save_regs.top();
                                    stk_save_regs.pop();
                                    meta2machine[md] = mreg;
                                    *def_r = *mreg;
                                    this->used_S_x.insert(*mreg);
                                }else {
                                    // TODO 处理spill
                                }
                            } else {
                                if(!stk_save_regs.empty()) {
#ifdef DEBUG
                        std::cout << " through 3 " ;
#endif
#ifdef SHOW_PASS_CALL_REGS
                        std::cerr << warn << "Reg " << def_r << " passes call \n";
#endif
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
#ifdef DEBUG
                        std::cout << " through 4 " ;
#endif
                                    auto *mreg = stk_fp_temp_regs.top();
                                    stk_fp_temp_regs.pop();
                                    meta2machine[md] = mreg;
                                    *def_r = *mreg;
                                } else if(!stk_fp_save_regs.empty()){
#ifdef DEBUG
                        std::cout << " through 5 " ;
#endif
                                    auto *mreg = stk_fp_save_regs.top();
                                    stk_fp_save_regs.pop();
                                    meta2machine[md] = mreg;
                                    *def_r = *mreg;
                                    this->used_FS_x.insert(*mreg);
                                } else {
                                    // TODO 处理spill
                                }
                            } else {
                                if(!stk_fp_save_regs.empty()) {
#ifdef DEBUG
                        std::cout << " through 6 " ;
#endif
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
#ifdef DEBUG
                        std::cout <<  " be " << def_r->name() << "\n";
#endif
                    } else {
                        std::cerr << error << "Not exist " << def_r->name() << "'s interval meta data\n";
                    }
                }
            }


           // auto load_from_mem = [&](RiscvReg::Reg dst, RiscvReg::Reg addr, int bias, bool front_o_back) {
           //     if(bias > 2047 || bias < -2048) {
           //         if(dst.is_gp()) {
           //             auto calculate_bias = new LIInst(MachineInstrType::LI, cur_bb, dst, bias);
           //             auto add_2_dst = new IArithInst(MachineInstrType::ADD, cur_bb, dst, dst, addr);
           //             auto ld_f_mem = new LoadInst(MachineInstrType::LD, cur_bb, dst, addr, bias);
           //             if(front_o_back) {
           //                 cur_bb->insert_instr_before(instr, calculate_bias);
           //                 cur_bb->insert_instr_before(instr, add_2_dst);
           //                 cur_bb->insert_instr_before(instr, ld_f_mem);
           //             } else {
           //                 cur_bb->insert_instr_after(instr, calculate_bias);
           //                 cur_bb->insert_instr_after(instr, add_2_dst);
           //                 cur_bb->insert_instr_after(instr, ld_f_mem);
           //             }
           //         } else {
           //             auto calculate_bias = new LIInst(MachineInstrType::LI, cur_bb, dst, bias);
           //             auto add_2_dst = new IArithInst(MachineInstrType::ADD, cur_bb, dst, dst, addr);
           //             auto ld_f_mem = new LoadInst(MachineInstrType::LD, cur_bb, dst, addr, bias);
           //             if(front_o_back) {
           //                 cur_bb->insert_instr_before(instr, calculate_bias);
           //                 cur_bb->insert_instr_before(instr, add_2_dst);
           //                 cur_bb->insert_instr_before(instr, ld_f_mem);
           //             } else {
           //                 cur_bb->insert_instr_after(instr, calculate_bias);
           //                 cur_bb->insert_instr_after(instr, add_2_dst);
           //                 cur_bb->insert_instr_after(instr, ld_f_mem);
           //             }
           //         }
           //     } else {
           //         if(dst.is_gp()) {
           //             auto ld_f_mem = new LoadInst(MachineInstrType::LD, cur_bb, dst, addr, bias);
           //         }
           //     }

           // };

           // auto store_to_mem = [&]() {

           // };
            
            
            // 统计指令使用的寄存器
            std::set<RiscvReg::Reg> u_x;
            std::set<RiscvReg::Reg> u_f;

            u_x.clear();
            u_f.clear();
            for(auto rg : instr->get_srcs()) {
                if(rg->is_standard()) {
                    if(rg->is_gp()) {
                        u_x.insert(rg);
                    } else {
                        u_f.insert(rg);
                    }
                }
            }

            // TODO set 要后面自己维护
            // True -- gp
            // False -- fp
            auto find_an_usable_reg = [&](bool gp) {
                if(gp)  {
                    for(auto reg : RiscvReg::temp_regs) {
                        if(u_x.find(reg) == u_x.end()) {
                            u_x.insert(reg);
                            return reg;
                        }
                    }
                    std::cerr << error << "1 can't find an free reg.\n" ;
                } else {
                    for(auto reg : RiscvReg::fp_Temp_regs) {
                        if(u_x.find(reg) == u_x.end()) {
                            u_f.insert(reg);
                            return reg;
                        }
               //         return static_cast<const RiscvReg::Reg*>(nullptr);
                    }
                    std::cerr << error << "2 can't find an free reg.\n" ;
                }
                std::cerr << error << "3 can't find an free reg.\n" ;
                return static_cast<const RiscvReg::Reg*>(nullptr);
            };

            // TODO 在最后处理没有分配的寄存器
            // 还要考虑
            // 如果存在相同的源操作数，就用同一个
            int x_spill_ld_cnt = 0;
            int f_spill_ld_cnt = 0;
            std::map<RiscvReg::Reg, RiscvReg::Reg> forsamspilled;
            for(auto opd : instr->get_srcs()) {
                if(!opd->is_standard()) {
                    spilled_operands++;
                    if(forsamspilled.find(*opd) != forsamspilled.end())  {
                        *opd = forsamspilled[opd];
                    } else {
                        // load_from_mem(RiscvReg::temp_regs[spill_ld_cnt], RiscvReg::FP, bias, true);
                        if(opd->is_gp()) {
                            x_spill_ld_cnt++;
                            // the general regs 
                            int bias = slot[*opd];
                            if(bias > 2047 || bias < -2048) {
                                int r_bias = -bias;
                                int subts = (r_bias) / 2048;
                                int final_bias = -((r_bias) % 2048);
                                auto mv_fp = new IArithIMMInst(MachineInstrType::ADDI, cur_bb, RiscvReg::FP, RiscvReg::FP, -2048);
                                for(int i=0; i < subts; i++) {
                                    cur_bb->insert_instr_before(instr, mv_fp);
                                }
                                
                                auto usable_reg = find_an_usable_reg(true);
                                auto store_reg = new StoreInst(MachineInstrType::SD, cur_bb, usable_reg, RiscvReg::FP, final_bias+8);
                                auto load_vreg = new LoadInst(MachineInstrType::LD, cur_bb, usable_reg, RiscvReg::FP, final_bias);

                                cur_bb->insert_instr_before(instr, store_reg);
                                cur_bb->insert_instr_before(instr, load_vreg);
                                *opd = *usable_reg;

                                // 地址怎么存取和恢复
                                    // +的imm最大只能2047, 来两下1024的
                                auto inc_fp = new IArithIMMInst(MachineInstrType::ADDI, cur_bb, RiscvReg::FP, RiscvReg::FP, 1024);
                                for(int i=0; i < subts; i++) {
                                    cur_bb->insert_instr_after(instr, inc_fp);
                                    cur_bb->insert_instr_after(instr, inc_fp);
                                }
                                auto load_back = new LoadInst(MachineInstrType::LD, cur_bb, usable_reg, RiscvReg::FP, final_bias+8);
                                // auto store_vreg = new StoreInst(MachineInstrType::SD, cur_bb, usable_reg, RiscvReg::FP, final_bias);
                                // 还原
                                // NOTE 往后插入是倒着的
                                cur_bb->insert_instr_after(instr, load_back);
                                // cur_bb->insert_instr_after(instr, store_vreg);
                            } else {
                                auto usable_reg = find_an_usable_reg(true);
                                // u_x.insert(usable_reg);
                                auto store_reg = new StoreInst(MachineInstrType::SD, cur_bb, usable_reg, RiscvReg::FP, bias+8);
                                auto ld_f_mm = new LoadInst(MachineInstrType::LD, cur_bb, usable_reg, RiscvReg::FP, bias);
                            
                                cur_bb->insert_instr_before(instr, store_reg);
                                cur_bb->insert_instr_before(instr, ld_f_mm);

                                *opd = *usable_reg;

                                auto load_back_reg = new LoadInst(MachineInstrType::LD, cur_bb, usable_reg, RiscvReg::FP, bias+8);
                                cur_bb->insert_instr_after(instr, load_back_reg);
                            }
                        } else {
                            // the float point 
                            // is gp empty? 
                            f_spill_ld_cnt++;
                            // the general regs 
                            int bias = slot[*opd];
                            if(bias > 2047 || bias < -2048) {

                                // 计算地址
                                int r_bias = -bias;
                                int subts = (r_bias) / 2048;
                                int final_bias = -((r_bias) % 2048);
                                auto mv_fp = new IArithIMMInst(MachineInstrType::ADDI, cur_bb, RiscvReg::FP, RiscvReg::FP, -2048);
                                for(int i=0; i < subts; i++) {
                                    cur_bb->insert_instr_before(instr, mv_fp);
                                }
                                // 保存
                                auto usable_f_reg = find_an_usable_reg(false);
                                auto store_f_reg = new FStoreInst(MachineInstrType::FSW, cur_bb, usable_f_reg, RiscvReg::FP, final_bias+8);
                                auto load_f_vreg = new FLoadInst(MachineInstrType::FLW, cur_bb, usable_f_reg, RiscvReg::FP, final_bias);

                                cur_bb->insert_instr_before(instr, store_f_reg);
                                cur_bb->insert_instr_before(instr, load_f_vreg);

                                *opd = *usable_f_reg;
                                // 还原
                                // NOTE 往后插入是倒着的
                                auto inc_fp = new IArithIMMInst(MachineInstrType::ADDI, cur_bb, RiscvReg::FP, RiscvReg::FP, 1024);
                                for(int i=0; i < subts; i++) {
                                    cur_bb->insert_instr_after(instr, inc_fp);
                                    cur_bb->insert_instr_after(instr, inc_fp);
                                }

                                auto load_fp_back = new FLoadInst(MachineInstrType::FLW, cur_bb, usable_f_reg, RiscvReg::FP, final_bias+8);
                                cur_bb->insert_instr_after(instr, load_fp_back);

                                // auto store_vreg = new FStoreInst(MachineInstrType::FSW, cur_bb, usable_f_reg, RiscvReg::FP, bias);
                                // cur_bb->insert_instr_after(instr, store_vreg);
                                // 地址要提前取回
                            } else {
                                auto usable_reg = find_an_usable_reg(false);
                                // u_x.insert(usable_reg);
                                auto store_reg = new FStoreInst(MachineInstrType::FSW, cur_bb, usable_reg, RiscvReg::FP, bias+8);
                                auto ld_f_mm = new FLoadInst(MachineInstrType::FLW, cur_bb, usable_reg, RiscvReg::FP, bias);
                            
                                cur_bb->insert_instr_before(instr, store_reg);
                                cur_bb->insert_instr_before(instr, ld_f_mm);

                                *opd = *usable_reg;
                                auto load_back_reg = new FLoadInst(MachineInstrType::FLW, cur_bb, usable_reg, RiscvReg::FP, bias);
                                cur_bb->insert_instr_after(instr, load_back_reg);
                            }
                        }
#ifdef BEBUGG
                        std::cerr << info << "In Line 399 Spill for src regs after " << instr->to_asm() << "\n";
#endif
                    }
                    // std::cerr << warn << "Src operand " << opd->name() <<  " In instruction :" << instr->time << " " << instr->to_asm() << " is spilled\n"; 
                    // cur_bb->insert_instr_before(instr, new IArithUInst(MachineInstrType::AUIPC, cur_bb, RiscvReg::S11, 100));
#ifdef BEBUGG
                    std::cerr << info << "In Line 403 Spill for src regs after " << instr->to_asm() << "\n";
#endif
                }
            }

            for(auto opd : instr->get_dsts()) {
                if(!opd->is_standard()) {
#ifdef BEBUGG
                    std::cerr << warn << "Dst operand " << opd->name() <<  " In instruction :" << instr->time << " " << instr->to_asm() << " is spilled\n"; 
#endif
                    // cur_bb->insert_instr_after(instr, new IArithUInst(MachineInstrType::AUIPC, cur_bb, RiscvReg::S11, 100));
                    if(opd->is_gp()) {
                        //  保存
                        this->spill_size_cnt += 16; 
                        // 3个8位的，一个溢出数据，一个用于还原，一个用于地址的溢出的临时内存
                        int bias = -(stack_0_size + this->spill_size_cnt);
                        slot[*opd] = bias;
                        if(bias > 2047 || bias < -2048) {
                            // 计算地址
                            int r_bias = -bias;
                            int subts = (r_bias) / 2048;
                            int final_bias = -((r_bias) % 2048);
                            auto mv_fp = new IArithIMMInst(MachineInstrType::ADDI, cur_bb, RiscvReg::FP, RiscvReg::FP, -2048);
                            for(int i=0; i < subts; i++) {
                                cur_bb->insert_instr_before(instr, mv_fp);
                            }
                            
                            auto usable_reg = find_an_usable_reg(true);
                            auto store_reg = new StoreInst(MachineInstrType::SD, cur_bb, usable_reg, RiscvReg::FP, final_bias+8);
                            auto load_vreg = new LoadInst(MachineInstrType::LD, cur_bb, usable_reg, RiscvReg::FP, final_bias);

                            cur_bb->insert_instr_before(instr, store_reg);
                            cur_bb->insert_instr_before(instr, load_vreg);
                            *opd = *usable_reg;

                            // 地址怎么存取和恢复
                                // +的imm最大只能2047, 来两下1024的
                            auto inc_fp = new IArithIMMInst(MachineInstrType::ADDI, cur_bb, RiscvReg::FP, RiscvReg::FP, 1024);
                            for(int i=0; i < subts; i++) {
                                cur_bb->insert_instr_after(instr, inc_fp);
                                cur_bb->insert_instr_after(instr, inc_fp);
                            }
                            auto load_back = new LoadInst(MachineInstrType::LD, cur_bb, usable_reg, RiscvReg::FP, final_bias+8);
                            auto store_vreg = new StoreInst(MachineInstrType::SD, cur_bb, usable_reg, RiscvReg::FP, final_bias);
                            // 还原
                            // NOTE 往后插入是倒着的
                            cur_bb->insert_instr_after(instr, load_back);
                            cur_bb->insert_instr_after(instr, store_vreg);
                  
                        } else {
                        // store bias 
                        //  使用
                            auto a_usable_reg = find_an_usable_reg(true);
                            auto store_reg = new StoreInst(MachineInstrType::SD, cur_bb, a_usable_reg, RiscvReg::FP, bias+8);
                            cur_bb->insert_instr_before(instr, store_reg);

                            *opd = *a_usable_reg;
                        // 存到内存
                            auto store_vreg = new StoreInst(MachineInstrType::SD, cur_bb, a_usable_reg, RiscvReg::FP, bias);
                        //  还原
                            auto load_back = new LoadInst(MachineInstrType::LD, cur_bb, a_usable_reg, RiscvReg::FP, bias+8);

                            // NOTE 往后插入是倒着的
                            cur_bb->insert_instr_after(instr, load_back);
                            cur_bb->insert_instr_after(instr, store_vreg);
                        }
                    } else {
                        this->spill_size_cnt += 16; 
                        // 3个8位的，一个溢出数据，一个用于还原，一个用于地址的溢出的临时内存
                        int bias = -(stack_0_size + this->spill_size_cnt);
                        slot[opd] = bias;
                        //  保存
                        //  使用
                        //  还原
                        if(bias > 2047 || bias < -2048) {
                            // 计算地址
                            int r_bias = -bias;
                            int subts = (r_bias) / 2048;
                            int final_bias = -((r_bias) % 2048);
                            auto mv_fp = new IArithIMMInst(MachineInstrType::ADDI, cur_bb, RiscvReg::FP, RiscvReg::FP, -2048);
                            for(int i=0; i < subts; i++) {
                                cur_bb->insert_instr_before(instr, mv_fp);
                            }
                            // 保存
                            auto usable_f_reg = find_an_usable_reg(false);
                            auto store_f_reg = new FStoreInst(MachineInstrType::FSW, cur_bb, usable_f_reg, RiscvReg::FP, final_bias+8);
                            auto load_f_vreg = new FLoadInst(MachineInstrType::FLW, cur_bb, usable_f_reg, RiscvReg::FP, final_bias);

                            cur_bb->insert_instr_before(instr, store_f_reg);
                            cur_bb->insert_instr_before(instr, load_f_vreg);

                            *opd = *usable_f_reg;
                            // 还原
                            // NOTE 往后插入是倒着的
                            auto inc_fp = new IArithIMMInst(MachineInstrType::ADDI, cur_bb, RiscvReg::FP, RiscvReg::FP, 1024);
                            for(int i=0; i < subts; i++) {
                                cur_bb->insert_instr_after(instr, inc_fp);
                                cur_bb->insert_instr_after(instr, inc_fp);
                            }

                            auto load_fp_back = new FLoadInst(MachineInstrType::FLW, cur_bb, usable_f_reg, RiscvReg::FP, final_bias+8);
                            cur_bb->insert_instr_after(instr, load_fp_back);

                            auto store_vreg = new FStoreInst(MachineInstrType::FSW, cur_bb, usable_f_reg, RiscvReg::FP, final_bias);
                            cur_bb->insert_instr_after(instr, store_vreg);
                            // 地址要提前取回
                        } else {
                        // store bias 
                        //  使用
                            auto a_usable_reg = find_an_usable_reg(false);
                            auto store_reg = new FStoreInst(MachineInstrType::FSW, cur_bb, a_usable_reg, RiscvReg::FP, bias+8);
                            cur_bb->insert_instr_before(instr, store_reg);
                            *opd = *a_usable_reg;
                        // 存到内存
                            auto store_vreg = new FStoreInst(MachineInstrType::FSW, cur_bb, a_usable_reg, RiscvReg::FP, bias);
                        //  还原
                            auto load_back = new FLoadInst(MachineInstrType::FLW, cur_bb, a_usable_reg, RiscvReg::FP, bias+8);

                            // NOTE 往后插入是倒着的
                            cur_bb->insert_instr_after(instr, load_back);
                            cur_bb->insert_instr_after(instr, store_vreg);
                        }

                        this->max_spill_size_cnt = std::max(this->max_spill_size_cnt, this->spill_size_cnt);
                    }
#ifdef BEBUGG
                    std::cerr << "after spill: " << instr->to_asm() << "\n";
#endif
                }
            }

            // TODO 还原使用的寄存器

        }
        }
    }
}

}
