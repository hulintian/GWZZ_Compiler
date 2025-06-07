#include "backend/passes.hpp"
#include <iostream>
#include <memory>
#include <vector>
#include <set>

namespace backend{
namespace riscv{

using namespace RiscvInstr;
using namespace RiscvReg;

void backend_passes(Program *prog) {
    for (Function* func: prog->functions()){
        remove_useless_inst(func);
        remove_useless_load(func);
        clean_control_flow(func);
        tail_duplication(prog, func);
    }
}

void tail_duplication(Program* prog, Function* func) {
    const int duplicationIterations = 10;
    const int duplicationThreshold = 10;

    clean_control_flow(func);

    for(int k = 0; k < duplicationIterations; k++){
        std::unordered_map<BasicBlock*, std::vector<BasicBlock*>> successors;
        for(auto bb: *func->get_bbs()){
            auto &blockSucc = successors[bb];
            for(auto succ: bb->succ){
                blockSucc.push_back(succ);
            }
        }

        bool noCopyBranchJumps = false;
        int branchCnt = 0;
        for(auto block: *func->get_bbs()){
            TypeCase(br, RiscvInstr::Branch *, block->get_instr()->back()) {
                branchCnt++;
                if(branchCnt >= 1000) {
                    noCopyBranchJumps = true;
                    break;
                }
            }
        }

        auto hasCall = [&](BasicBlock* bb) {
            for(auto inst: *bb->get_instr()) {
                TypeCase(call, RiscvInstr::Call *, inst) {
                    return true;
                }
            }
            return false;
        };

        bool modified = false;
        for(auto iter = func->get_bbs()->begin(); iter != func->get_bbs()->end();) {
            const auto next = std::next(iter);
            const auto bb = *iter;
            auto insts = bb->get_instr();
            const auto termi = insts->back();
            BasicBlock* targetBlock;
            TypeCase(jp, RiscvInstr::Jump*, termi) {
                targetBlock = jp->get_target();
                if(targetBlock != bb && targetBlock->succ.find(bb) == targetBlock->succ.end() &&
                !dynamic_cast<RiscvInstr::Return *>(targetBlock->get_instr()->back()) &&
                targetBlock->get_instr()->size() <= duplicationThreshold &&
                ((!noCopyBranchJumps) || dynamic_cast<RiscvInstr::Jump *>(targetBlock->get_instr()->back())) &&
                !hasCall(targetBlock)) {
                    insts->pop_back();
                    insts->insert(insts->cend(), targetBlock->get_instr()->cbegin(), targetBlock->get_instr()->cend());

                    // fix control flow
                    const auto addNextBB = [&](BasicBlock* next_bb) {
                        if(next == func->get_bbs()->cend() || *next != next_bb) {
                            auto new_bb = new BasicBlock(".L" + std::to_string(prog->bb_num++));
                            new_bb->get_instr()->push_back(new RiscvInstr::Jump(next_bb));
                            new_bb->succ.insert(next_bb);
                            func->get_bbs()->insert(next, new_bb);
                        }
                    };

                    BasicBlock* target;
                    auto& newSucc = successors.at(bb);
                    TypeCase(br, RiscvInstr::Branch*, insts->back()){
                        target = br->get_target();
                        const auto&succ = successors.at(targetBlock);
                        if(succ.size() == 2) {
                            if(target == succ[0]) {
                                addNextBB(succ[1]);
                            } else {
                                addNextBB(succ[0]);
                            }
                        } else if(succ.size() == 1){
                            addNextBB(succ[0]);
                        } else {
                            assert(false);
                        }
                        const auto nextbb = *std::next(iter);
                        if(target != nextbb) {
                            newSucc = {target, nextbb};
                        } else {
                            newSucc = {target};
                        }
                    } else if(auto jp = dynamic_cast<RiscvInstr::Jump *>(insts->back())) {
                        target = jp->get_target();
                        newSucc = {target};
                    } else {
                        newSucc = {};
                    }

                    modified = true;
                    // std::cout << "backend tail duplication" << std::endl;
                }
            }

            iter = next;
        }
        if(!modified) return;

        clean_control_flow(func);
    }
}

void post_order_dfs(BasicBlock *bb, std::unordered_set<BasicBlock *> &visited_bbs, std::vector<BasicBlock *> &order) {
    // well, maybe bfs is also a possible choice
    if (visited_bbs.count(bb)) return;
    visited_bbs.insert(bb);

    for (auto next : bb->succ) {
        post_order_dfs(next, visited_bbs, order);
    }
    order.push_back(bb);

}

bool clean_cf_one_pass(Function* func) {
    if(func->get_bbs()->empty()) return false;

    std::unordered_set<BasicBlock*> visited_bbs;
    std::vector<BasicBlock*> order;
    auto entry = func->get_bbs()->front();
    post_order_dfs(entry, visited_bbs, order);

    bool changed = false;
    auto get_terminator = [](BasicBlock* bb) -> Instr* {
        assert(!bb->get_instr()->empty());
        auto inst = bb->get_instr()->back();
        return inst;
    };

    for(auto bb_iter = order.rbegin(); bb_iter != order.rend(); bb_iter++){
        auto bb = *bb_iter;
        if(!visited_bbs.count(bb)) continue;

        auto inst = get_terminator(bb); // last instruction
        TypeCase(jp, Jump *, inst) {
            auto target = jp->get_target();
            // i'm not sure why bb cannot be entry, but i will keep it until the reason is found
            if(bb->get_instr()->size() == 1 && bb != entry) {
                // bb is empty
                for(auto pred: bb->prev) {
                    for(auto insns: *pred->get_instr()){
                        TypeCase(jp_pre, Jump *, insns) {
                            if(jp_pre->get_target() == bb){
                                jp_pre->set_target(target);
                            }
                        }
                        else TypeCase(br_pre, Branch *, insns) {
                            if(br_pre->get_target() == bb){
                                br_pre->set_target(target);
                            }
                        }
                    }
                    pred->succ.erase(bb);
                    pred->succ.insert(target);
                    target->prev.insert(pred);
                }
                target->prev.erase(bb);
                bb->prev.clear();
                bb->succ.clear();
                visited_bbs.erase(bb);
                changed = true;
                continue;
            }
            if(target->prev.size() == 1){
                continue;
                bool has_branch = false;
                int jump = 0;
                for(auto insns: *bb->get_instr()){
                    TypeCase(br, Branch *, insns) {
                        if(br->get_target() == target){
                            has_branch = true;
                            break;
                        }
                    }
                    TypeCase(jp, Jump *, insns) {
                        if(jp->get_target() == target){
                            jump++;
                        }
                    }
                }
                if(has_branch || jump > 1) continue;
                // target can be merged into bb
                for(auto next: target->succ) {
                    next->prev.erase(target);
                    next->prev.insert(bb);
                    bb->succ.insert(next);
                }
                bb->succ.erase(target);
                target->succ.clear();
                target->prev.clear();

                bb->get_instr()->pop_back();
                for(auto i: *target->get_instr()){
                    bb->get_instr()->push_back(i);
                }
                target->get_instr()->clear();

                visited_bbs.erase(target);
                changed = true;
                continue;
            }
            // there should be a branch-hoist strategy, however,  according to our implementation
            // the hoist should be done in middleend not backend
        }
    }

    // remove unreachable basic blocks
    for(auto it = func->get_bbs()->begin(); it != func->get_bbs()->end();) {
        if(!visited_bbs.count(*it)) {
            it = func->get_bbs()->erase(it);
        } else {
            it++;
        }
    }
    return changed;
}

void clean_control_flow(Function *func) {
    bool changed;
    do {
        changed = clean_cf_one_pass(func);
    } while (changed);
}

void remove_useless_load(Function *func) {
    auto bbs = *func->get_bbs();
    for (auto &bb: bbs) {
        auto insns = *bb->get_instr();
        std::vector<Instr*> stores;
        for (auto iter = insns.begin(); iter != insns.end(); iter++) {
            if (iter == insns.begin()) continue;
            auto inst = *iter;
            auto prev_inst = --iter;
            if (auto load = dynamic_cast<LoadDouble*>(inst)) {
                if (auto st = dynamic_cast<StoreDouble*>(*prev_inst)) {    
                    if (st->get_base() == load->get_base() && st->get_src() == load->get_dst() && st->get_offset() == load->get_offset()) {
                        iter = insns.erase(prev_inst);
                    }
                }
            }
            if (auto load = dynamic_cast<Load*>(inst)) {
                if (auto st = dynamic_cast<Store*>(*prev_inst)) {    
                    if (st->get_base() == load->get_base() && st->get_src() == load->get_dst() && st->get_offset() == load->get_offset()) {
                        iter = insns.erase(prev_inst);
                    }
                }
            }
            iter++;
        }
    }
}


void remove_useless_inst(Function *func) {

}

}
}