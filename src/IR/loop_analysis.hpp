#pragma once

#include <iostream>
#include "IR/IR.hpp"
#include "IR/CFG.hpp"
#include "IR/dominator_tree.hpp"
#include "IR/use_def_analysis.hpp"

namespace midend {

class Loop {
public:
    ir::BasicBlock *header_; // NOTE: 目前针对同一个header只有一个loop，不考虑嵌套的情况
    Loop *parent_;
    Loop *child_;
    int depth_;
    bool unrolled = false;
    Loop(ir::BasicBlock *header_) : header_(header_), parent_(nullptr), child_(nullptr), depth_(-1) {}
};

// Simple loop: one exit, one back edge to entry (and only one exit_prev), cond_var appear twice (phi, update)
struct SimpleLoopInfo {
public:
    SimpleLoopInfo(int loop_t, int inst_c): loop_type(loop_t), inst_cnt(inst_c) {};
    bool valid = false;
    int loop_type; // 0: nothing special; 1: i = c0, i </<= c1, i++; 2: i = c0, i </<= n, i++
    int start = 0; // const start
    int step; // const step
    int end; // const end, available when type = 1
    Temp* end_reg;
    Temp* new_end_reg;
    Temp* cond_reg;
    Temp* upd_reg; // +1 后结果
    Temp* imm_reg; // 最开始的 i
    Temp* for_last_bb; // 用来 +5
    Temp* cmp_reg;
    Temp* indvar_reg; // ind var after updated in loop
    Temp* new_cmp_reg; // +5 后的比较
    BinaryOp cond_op;
    ir::instruction::Binary *into_cond; // comparation at init, outside loop
    ir::instruction::Branch *into_br; // br at init, outside loop
    ir::instruction::Binary *upd;
    ir::instruction::Binary *cmp;
    ir::instruction::CondBranch *brch;
    ir::instruction::LoadImm4 *start_imm;
    int inst_cnt;
    ir::BasicBlock *exit_prev;
    std::vector<ir::BasicBlock*> exit_prevs;
    ir::BasicBlock *exit;
    ir::BasicBlock *into_entry;
    ir::BasicBlock *new_into_entry;
    ir::BasicBlock *header;
};

struct InterchangeLoopInfo {
    bool valid;
    ir::BasicBlock *entry;
    ir::BasicBlock *exit_prev;
    ir::BasicBlock *exit;
    ir::instruction::Phi *ind_phi;
    ir::instruction::Binary *ind_upd;
    ir::instruction::Binary *ind_cond;
    ir::instruction::CondBranch *ind_br;
};

using ir::BasicBlock;
struct ParallelLoopInfo {
    bool valid;
    Temp* start_reg; // reg start
    int step; // const step
    Temp* end_reg; // reg end
    BinaryOp bop;
    BasicBlock *into_entry;
    BasicBlock *entry;
    BasicBlock *exit_prev;
    BasicBlock *exit;
    ir::instruction::Phi *entry_ind_phi;
    ir::instruction::Binary *cond_cmp;
    ir::instruction::Binary *binary_upd;

    bool profitable(Loop *loop, const std::unordered_set<BasicBlock *> &loop_bbs, UseDefAnalysis* uda_) {
        if (loop->child_ == nullptr) return false; // don't parallel single layer loop
        // if (loop->header_->get_parent()->get_name().length() != 2) return false;
        // if (loop->header_->get_parent()->get_name()[0] != 'm') return false;
        // if (loop->header_->get_parent()->param_size() != 4) return false;
        bool wr_perpendicular = true;
        std::unordered_set<Temp*> write_set, read_set;
        for (auto bb : loop_bbs) {
            // std::cout << "check profitable【loop bb】"; bb->print(std::cout);
            for (auto &insn : *bb->get_insts()) {
                TypeCase (load, ir::instruction::Load *, insn) {
                    if (!uda_->get_defsets().count(load->get_addr())) return false;
                    TypeCase (gep, ir::instruction::ElementPtr *, *uda_->get_defset(load->get_addr()).begin()) {
                        read_set.insert(gep->get_base());
                    } else TypeCase(loadaddr, ir::instruction::LoadAddr *, *uda_->get_defset(load->get_addr()).begin()) {
                        read_set.insert(loadaddr->get_addr());
                    } else assert(false);
                }
                TypeCase (store, ir::instruction::Store *, insn) {
                    if (!uda_->get_defsets().count(store->get_addr())) return false;
                    TypeCase (gep, ir::instruction::ElementPtr *, *uda_->get_defset(store->get_addr()).begin()) {
                        write_set.insert(gep->get_base());
                        for (auto r : gep->get_indices()) {
                            if (uda_->get_defsets().count(r)) {
                                TypeCase (ld, ir::instruction::Load *, *uda_->get_defset(r).begin()) {
                                    return false; // indirect index
                                }
                            }
                        }
                    } else TypeCase (loadaddr, ir::instruction::LoadAddr *, *uda_->get_defset(store->get_addr()).begin()) {
                        write_set.insert(loadaddr->get_addr());
                    } else assert(false);
                }
                TypeCase (call, ir::instruction::Call *, insn) {
                    // return false;
                    // if (program->functions.count(call->getfunc()) && program->functions.at(call->getfunc()).is_only_load_param()) {
                    //     auto &types = program->functions.at(call->func).sig.param_types;
                    //     int n_params = types.size();
                    //     for (int i = 0; i < n_params; i++) {
                    //     if (types[i].is_array()) {
                    //         read_set.insert(call->args[i]);
                    //     }
                    //     }
                    // }
                }
            }
        }
        for (auto w : write_set) {
            if (read_set.count(w)) { std::cout << "read write conflict\n"; wr_perpendicular = false; return false; }
        }
        if (wr_perpendicular) return true;
        Temp* ind_var = entry_ind_phi->get_dst();
        for (auto use_i : uda_->get_useset(ind_var)) {
            if (use_i == binary_upd) continue;
            TypeCase (dummy, ir::instruction::ElementPtr *, use_i) {
                // i only used for array index
            } else return false;
        }
        return true;
    }
};

class LoopAnalysis {
private:
    std::unordered_map<ir::BasicBlock *, Loop *> loop_map_;
    ir::Function *func_;
    CFG *cfg_;
    DominatorTree_ *dom_tree_;
    void build_loop();
    
public:
    
    std::vector<Loop*> loops;
    Loop *get_loop(ir::BasicBlock *bb) {
        if (loop_map_.find(bb) != loop_map_.end()) {
            return loop_map_[bb];
        }
        return nullptr;
    }

    void set_loop(ir::BasicBlock *bb, Loop* loop) {
        loop_map_[bb] = loop;
    }

    int get_loop_depth(ir::BasicBlock *bb) {
        if (loop_map_.find(bb) != loop_map_.end()) {
            return loop_map_[bb]->depth_;
        }
        return 0;
    }

    ~LoopAnalysis() {
        delete dom_tree_;
    }

    LoopAnalysis(CFG *cfg) : cfg_(cfg) {
        func_ = cfg->get_func();
        dom_tree_ = new DominatorTree_(cfg);
        build_loop();
    }
};

class TightlyNestedLoopInfo {
public:
    bool valid;
    InterchangeLoopInfo inner, outer;
    CFG *cfg_;
    DominatorTree_ *dom_tree_;
    LoopAnalysis *la_;

    TightlyNestedLoopInfo(InterchangeLoopInfo _inner, InterchangeLoopInfo _outer, LoopAnalysis* la, DominatorTree_* dom, CFG * cfg) : valid(false), inner(_inner), outer(_outer), la_(la), dom_tree_(dom), cfg_(cfg) {
        if (!inner.valid || !outer.valid) return;
        // std::cout << "get tightly nested loop info\n";
        // check condition for tightly nested loops
        if (dom_tree_->get_idom(inner.entry) != outer.entry) return;
        if (outer.exit_prev != inner.exit) return; 
        // std::cout << "【outer.entry】"; (outer.entry)->print(std::cout);
        // if ((*outer.entry->get_instructions()).size() != 2) return; // phi + br
        // if ((*outer.entry->get_instructions()).front() != outer.ind_phi) { std::cout << "case 3\n"; return; }
        auto &insns = *outer.exit_prev->get_insts();
        // std::cout << "【outer.exit_prev】"; (outer.exit_prev)->print(std::cout);
        // if (insns.size() != 3) return; // upd + cmp + br
        auto find_inst = [&insns](ir::Instruction *inst) {
            for (auto &insn : insns) {
                if (insn == inst) return true;
            }
            return false;
        };
        if (!find_inst(outer.ind_upd)) return;
        if (!find_inst(outer.ind_cond)) return;
        if (!find_inst(outer.ind_br)) return;
        valid = true;
    }

    bool profitable(Loop *inner_loop) { // detect a[j][i] and no a[i][j]
        auto in_loop = [inner_loop](ir::BasicBlock *b, LoopAnalysis* la_) {
            Loop *l = la_->get_loop(b);
            while (l != nullptr && l != inner_loop) {
                l = l->parent_;
            }
            return l == inner_loop;
        };
        std::vector<ir::BasicBlock *> stack;
        std::unordered_set<ir::BasicBlock *> loop_bbs;
        stack.push_back(inner_loop->header_);
        // std::cout << "check profitable\n";
        while (stack.size()) {
            auto bb = stack.back();
            stack.pop_back();
            if (in_loop(bb, la_)) {
                loop_bbs.insert(bb);
                for (auto each : dom_tree_->get_dominate(bb)) {
                    stack.push_back(each);
                }
            }
        }
        // std::cout << "got loop bbs\n";
        bool order_found = false, reverse_found = false;
        Temp *reg_i = outer.ind_phi->get_dst(), *reg_j = inner.ind_phi->get_dst();
        // std::cout << "【outer.ind_phi】"; (outer.ind_phi)->print(std::cout);
        // std::cout << "【inner.ind_phi】"; (inner.ind_phi)->print(std::cout);
        for (auto &bb : loop_bbs) {
            // std::cout << "【loop bb】"; bb->print(std::cout);
            for (auto &insn : *bb->get_insts()) {
                TypeCase (gep, ir::instruction::ElementPtr *, insn) {
                    if (gep->get_indices().size() == 2) {
                        if (gep->get_indices()[0] == reg_i && gep->get_indices()[1] == reg_j) order_found = true;
                        if (gep->get_indices()[0] == reg_j && gep->get_indices()[1] == reg_i) reverse_found = true;
                    }
                }
            }
        }
        if (order_found) return false;
        if (!reverse_found) return false;
        return true;
    }
};


} // namespace middleend
