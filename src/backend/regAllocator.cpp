#include "backend/regAllocator.hpp"
#include <memory>
#include <queue>
#include <iostream>
#include <algorithm>
#include <math.h>
//#define DEBUG

namespace backend{
namespace riscv {

using namespace RiscvInstr;
using namespace RiscvReg;

void ColoringRegAllocator::init(Function *func, bool is_pg_pass) {
    this->func = func;
    // func->gen_asm(std::cout);
    this->is_pg_pass = is_pg_pass;
    K = is_pg_pass ? RegAllocatableCount : FpRegAllocatableCount;
    alias.clear();
    moveList.clear();
    spilledNodes.clear();
    coloredNodes.clear();
    coalescedNodes.clear();
    coalescedMoves.clear();
    constrainedMoves.clear();
    frozenMoves.clear();
    worklistMoves.clear();
    activeMoves.clear();
    spillingRegs.clear();
    spilled_regs_map.clear();
    selectStack.clear();
    if (is_pg_pass)
        spillsize = 0;
    used_reg.clear();
}

void ColoringRegAllocator::alloc_reg(Function* func, bool is_pg_pass) {
    init(func, is_pg_pass);
    bool alloc_finished = false;
    std::map<Reg, int> color_for_alloc;
    
    do{
        // filter registers according to `is_gp_pass`
        this->func->livenessAnalysis(is_pg_pass);
        Build();
        MkWorklist();
        do {
            if(!simplifyWorklist.empty()){
                Simplify();
            } else if (!worklistMoves.empty()) {
                Coalesce();
            } else if (!freezeWorklist.empty()) {
                Freeze();
            } else if (!spillWorklist.empty()) {
                SelectSpill();
            }
        }while(!simplifyWorklist.empty() || !worklistMoves.empty() || !freezeWorklist.empty() || !spillWorklist.empty());
        color_for_alloc = AssignColors();
        if(!spilledNodes.empty()){
            //in essay it's RewriteProgram(),but we don't want recursion
            //we should do something for spilledNodes here
            SaveSpilled(spilledNodes);
            spilledNodes.clear();
            coloredNodes.clear();
            coalescedNodes.clear();
            alloc_finished = false;
        }
        else{
            alloc_finished = true;
        }
    } while (!alloc_finished);
    replace_virtual_regs(color_for_alloc, is_pg_pass);
}

void ColoringRegAllocator::SaveSpilled(const std::set<Reg> &nodes){
    /*Allocate memory locations for each v ∈ spilledNodes,
Create a new temporary vi for each definition and each use,
In the program (instructions), insert a store after each
definition of a vi, a fetch before each use of a vi.
Put all the vi into a set newTemps*/
    for(Reg v: nodes) {
        const RegValue *val = nullptr;
        if (func->reg_val.count(v)) {
            val = &(func->reg_val.at(v));
        }
        auto bbs = *func->get_bbs();
        for(auto bb: bbs) {
            auto insns = *bb->get_instr();
            for(auto it = insns.begin(); it != insns.end();) {
                auto inst = *it;
                auto def_ = inst->def_reg();
                std::vector<RiscvReg::Reg> def, use;
                for (auto i: def_) {
                    if (i.is_gp() == is_pg_pass)
                        def.push_back(i);
                }
                auto use_ = inst->use_reg();
                for (auto i: use_) {
                    if (i.is_gp() == is_pg_pass)
                        use.push_back(i);
                }
                Reg new_reg(func->reg_n++, false, is_pg_pass);

                if(std::find(def.begin(),def.end(),v) != def.end() || std::find(use.begin(),use.end(),v) != use.end()) {
                    //v  is in the instruction's def or use
                    inst->replace_reg(v, new_reg);
                    spillingRegs.insert(new_reg);
                } else {
                    it++;
                    func->reg_n--;
                    continue;
                }
                auto insn_to_remove = insns.end();
                if(std::find(use.begin(),use.end(),v) != use.end()) {
                    // insert a fetch before each use of a vi
                    if (val != nullptr) {
                        switch (val->index()) {
                            case 0: // loadimm
                                bb->insert_instr(new LoadImm(new_reg, std::get<0>(*val)), it);
                                break;
                            case 1: // loadaddr
                                bb->insert_instr(new LoadLabelAddr(new_reg, std::get<1>(*val)), it);
                                break;
                            case 2: // alloca 
                                auto stack_obj = std::get<2>(*val);
                                if(stack_obj->get_pos() > 2047 || stack_obj->get_pos() < -2048){
                                    Reg new_reg_to_save_imm(func->reg_n++, false, is_pg_pass);
                                    bb->insert_instr(new LoadImm(new_reg_to_save_imm, stack_obj->get_pos()), it);
                                    it = bb->insert_instr(new Binary(RiscvInstr::RvBinaryOp::ADD, new_reg, SP, new_reg_to_save_imm), it);
                                }
                                else{
                                    bb->insert_instr(new ADDImm(new_reg, SP, stack_obj->get_pos()), it);
                                }
                                break;
                        }
                    }   
                    else {
                        // compute offset in stack
                        int offset;
                        if(spilled_regs_map.find(v) == spilled_regs_map.end()) {
                            offset = spillsize+8;
                            spilled_regs_map[v] = spillsize+8;
                            spillsize += 8;
                        } else 
                            offset = spilled_regs_map.at(v);
                        if (auto mov = dynamic_cast<Move *>(inst)) {
                            auto dst = mov->getdst();
                            insn_to_remove = it;
                            if (offset >= 2048) {
                                auto fp_offset = 2048*(offset/2048);
                                auto reg_offset = (offset % 2048);
                                auto change = fp_offset;
                                while (change != 0) {
                                    insns.emplace(it, new ADDImm(FP, FP, -2048));
                                    change -= 2048;
                                }
                                insns.emplace(it, new LoadDouble{*dst, FP, -reg_offset, true});
                                change = fp_offset;
                                while (change != 0) {
                                    insns.emplace(it, new ADDImm(FP, FP, 1024));
                                    change -= 1024;
                                }
                            }
                            else {
                                insns.emplace(it, new LoadDouble{*dst, FP, -offset, true});
                            }
                        } else {
                            if (offset >= 2048) {
                                auto fp_offset = 2048*(offset/2048);
                                auto reg_offset = (offset % 2048);
                                auto change = fp_offset;
                                while (change != 0) {
                                    insns.emplace(it, new ADDImm(FP, FP, -2048));
                                    change -= 2048;
                                }
                                insns.emplace(it, new LoadDouble{new_reg, FP, -reg_offset, true});
                                change = fp_offset;
                                while (change != 0) {
                                    insns.emplace(it, new ADDImm(FP, FP, 1024));
                                    change -= 1024;
                                }
                            }
                            else {
                                insns.emplace(it, new LoadDouble{new_reg, FP, -offset, true});
                            }
                        }
                    }
                }
                it++;
                if(std::find(def.begin(),def.end(),v) != def.end()) {
                    int offset;
                    // insert a store after each definition of a vi
                    if(spilled_regs_map.find(v) == spilled_regs_map.end()) {
                        offset = spillsize+8;
                        spilled_regs_map[v] = spillsize+8;
                        spillsize += 8;
                    } else 
                        offset = spilled_regs_map.at(v);
                    if (val == nullptr) {
                        if (auto mov = dynamic_cast<Move *>(inst)) {
                            auto src = mov->getsrc();
                            insn_to_remove = std::prev(it);
                            if (offset >= 2048) {
                                auto fp_offset = 2048*(offset/2048);
                                auto reg_offset = (offset % 2048);
                                auto change = fp_offset;
                                while (change != 0) {
                                    insns.emplace(it, new ADDImm(FP, FP, -2048));
                                    change -= 2048;
                                }
                                insns.emplace(it, new StoreDouble{*src, FP, -reg_offset, true});
                                change = fp_offset;
                                while (change != 0) {
                                    insns.emplace(it, new ADDImm(FP, FP, 1024));
                                    change -= 1024;
                                }
                            }
                            else {
                                insns.emplace(it, new StoreDouble{*src, FP, -offset, true});
                            }
                        } else {
                            if (offset >= 2048) {
                                auto fp_offset = 2048*(offset/2048);
                                auto reg_offset = (offset % 2048);
                                auto change = fp_offset;
                                while (change != 0) {
                                    insns.emplace(it, new ADDImm(FP, FP, -2048));
                                    change -= 2048;
                                }
                                insns.emplace(it, new StoreDouble{new_reg, FP, -reg_offset, true});
                                change = fp_offset;
                                while (change != 0) {
                                    insns.emplace(it, new ADDImm(FP, FP, 1024));
                                    change -= 1024;
                                }
                            }
                            else {
                                insns.emplace(it, new StoreDouble{new_reg, FP, -offset, true});
                            }
                        }
                    } else
                        insn_to_remove = std::prev(it);
                }
                if (insn_to_remove != insns.end())
                    insns.erase(insn_to_remove);
            }
            bb->change(insns);
        }
    }
}

void ColoringRegAllocator::Build(){
    // clear interference map
    adjSet.clear();
    adjList.clear();
    degree.clear();
    int inf = 1 << 30;
    if (is_pg_pass) {
        for(int i = 0; i < RegAllocatableCount; i++)
            degree[Reg{regs_allocatable[i]->id(), true, true}] = inf;
        degree[SP] = inf;
        degree[FP] = inf;
        degree[RA] = inf;
        degree[ZERO] = inf;
    }
    else {
        for (int i = 0; i < FpRegAllocatableCount; ++i)
            degree[Reg{i, true, false}] = inf;
    }
    auto bbs = *func->get_bbs();
    for(auto &bb: bbs) {
        auto live = bb->live_out;
        auto insns = *bb->get_instr();
        for(auto it = insns.rbegin(); it != insns.rend(); ++it) {
            auto inst = *it;
            if(auto arg_st = dynamic_cast<Store*>(inst)) {
                if(arg_st->is_for_func){
                    continue;
                }
            }
            auto def = inst->def_reg();
            auto use = inst->use_reg();
            if(auto mov = dynamic_cast<Move*>(inst)) {
                if (def[0].is_gp() == is_pg_pass && use[0].is_gp() == is_pg_pass) {
                    live.erase(use[0]);
                    moveList[def[0]].insert(mov);
                    moveList[use[0]].insert(mov);
                    worklistMoves.insert(mov);
                }
            }
            for(Reg d: def) {
                if (d.is_gp() == is_pg_pass)
                    live.insert(d);
            }
            for(Reg d: def){
                for(Reg l: live){
                    AddEdge(l, d);
                }
            }
            //live := use(I) ∪ (live\def(I))
            for(Reg d: def){
                if (d.is_gp() == is_pg_pass)
                    live.erase(d);
            }
            for(Reg u: use){
                if (u.is_gp() == is_pg_pass)
                    live.insert(u);
            }
            for (Reg d : def)
                store_weight[d] += std::pow(8, bb->loop_level);
            for (Reg u : use) {
                load_weight[u] += std::pow(8, bb->loop_level);
                if (it != insns.rbegin()) {
                    auto prev_ins_def = (*(--it))->def_reg();
                    if (std::find(prev_ins_def.begin(), prev_ins_def.end(), u) != prev_ins_def.end())
                        load_weight[u] = 1e30;
                    it++;
                }
            }
        }
    }
}

double ColoringRegAllocator::get_spill_cost(Reg r) {
    if (spillingRegs.count(r))
        return 1e100;

    if (func->reg_val.count(r)) {
        auto &val = func->reg_val.at(r);
        double base_cost;
        switch (val.index()) {
            case 0: // loadimm4
                base_cost = 1.0;
                break;
            case 1: // loadaddr
                base_cost = 1.0;
                break;
            case 2: // alloca 
            {
                auto stack_obj = std::get<2>(val);
                if (stack_obj->get_pos() > 2047 || stack_obj->get_pos() < -2048)
                    base_cost = 3.0;
                else
                    base_cost = 1.0;
                break;
            }
            default:
                assert(false);
        }
        return base_cost * load_weight[r];
    }
    return 5.0 * (load_weight[r] + store_weight[r]);
}

void ColoringRegAllocator::MkWorklist(){
    std::set<Reg> initial;
    // create initial: set of virtual regs
    auto bbs = *func->get_bbs();
    for(auto &bb: bbs){
        for(auto inst: *(bb->get_instr())) {
            auto def = inst->def_reg();
            auto use = inst->use_reg();
            for(Reg d: def){
                if(!d.is_standard() && d.is_gp() == is_pg_pass) {
                    initial.insert(d);
                    //std::cout << "dd " << d << std::endl;
                }
            }
            for(Reg u: use){
                if(!u.is_standard() && u.is_gp() == is_pg_pass) {
                    initial.insert(u);
                    //std::cout << "dd " << u << std::endl;
                }
            }
        }
    }

    for(Reg n: initial){
        if(degree[n] >= K){
            spillWorklist.insert(n);
        } else if(MoveRelated(n)){
            freezeWorklist.insert(n);
        } else {
            simplifyWorklist.insert(n);
        }
    }
}

void ColoringRegAllocator::Simplify(){
    auto it = simplifyWorklist.begin();
    auto n = *it;
    simplifyWorklist.erase(it);
    selectStack.push_back(n);
    for(Reg m: Adjacent(n)){
        DecrementDegree(m);
    }
}

void ColoringRegAllocator::Coalesce(){
    auto it = worklistMoves.begin();
    auto m = *it;
    Reg dst = (m->def_reg())[0];
    Reg src = (m->use_reg())[0];
    Reg u = GetAlias(dst);
    Reg v = GetAlias(src);
    // std::cout << "u is " << u << ", v is " << v << "\n";
    if(v.is_standard())
        std::swap(u, v);
    worklistMoves.erase(m);
    if(u == v){
        coalescedMoves.insert(m);
        AddWorkList(u);
    } else if (v.is_standard() || adjSet.count({u,v})) {
        constrainedMoves.insert(m);
        AddWorkList(u);
        AddWorkList(v);
    } else {
        bool combine = false;
        auto adj_nodes = Adjacent(v);
        // std::cout << "adj v is";
        // for (auto i: adj_nodes)
        //     std::cout << " " << i << ",";
        // std::cout << "\n";
        if(!u.is_standard()) {
            adj_nodes.merge(Adjacent(u));
            combine = Conservative(adj_nodes);
        } else {
            // std::cout << "u is not standard\n";
            combine = std::all_of(adj_nodes.begin(), adj_nodes.end(), [this, u](Reg r) {return OK(r, u);});
        }

        if(combine) {
            // std::cout << "combine " << u << " and " << v << "\n";
            coalescedMoves.insert(m);
            Combine(u, v);
            AddWorkList(u);
        } else {
            activeMoves.insert(m);
        }
    }

}
void ColoringRegAllocator::Freeze(){
    auto it = freezeWorklist.begin();
    auto u = *it;
    freezeWorklist.erase(u);
    simplifyWorklist.insert(u);
    FreezeMoves(u);
}

std::map<Reg, int> ColoringRegAllocator::AssignColors(){
    //std::cout << "assign!!!" << std::endl;
    std::map<Reg, int> color;
    while(!selectStack.empty()) {
        Reg n = selectStack.back();
        //std::cout << "coloring " << n << std::endl;
        selectStack.pop_back();
        if(n.is_standard()) continue; // do not need to assign colors for regs not virtual
        
        std::vector<int> okColors;
        if (is_pg_pass) {
            for(int i = 0; i < RegAllocatableCount; i++){
                okColors.push_back(regs_allocatable[i]->id());
                //std::cout << "can be used:" << *regs_allocatable[i] << std::endl;
            }
        } else {
            for (int i = 0; i < FpRegAllocatableCount; i++)
                okColors.push_back(i);
        }

        for(auto w: adjList[n]) {
            auto u = GetAlias(w);
            if(u.is_standard()){
                //std::cout << "erase " << u << " " << u.id() << std::endl;
                okColors.erase(remove(okColors.begin(), okColors.end(), u.id()), okColors.end());
                // for (auto iter = okColors.begin(); iter != okColors.end(); ++iter){
                //     std::cout << "now " << *iter << " ";
                // }
                //okColors.erase(u.id());
            } else if(coloredNodes.count(u)){
                //std::cout << "erase " << color[u] << std::endl;
                okColors.erase(remove(okColors.begin(), okColors.end(), color[u]), okColors.end());
                //okColors.erase(color[u]);
            }
        }

        if(okColors.empty()) {
            //std::cout << "spilled!" << std::endl;
            spilledNodes.insert(n);
        } else {
            //std::cout << "OK: " << n << " to " << *(okColors.begin()) << std::endl;
            coloredNodes.insert(n);
            //std::cout << "coloring from " << n << std::endl;
            color[n] = okColors.front();
        }
    }

    for(auto n: coalescedNodes) {
        if(!n.is_standard()) {
            Reg u = GetAlias(n);
            //std::cout << "coloring to " << n << std::endl;
            color[n] = u.is_standard() ? u.id() : color[u];
        }
    }
    return color;
}

void ColoringRegAllocator::replace_virtual_regs(const std::map<Reg, int>& new_reg_colors, bool is_pg_pass){
    auto bbs = *func->get_bbs();
    for (auto bb : bbs) {
        for(auto it = bb->get_instr()->begin(); it != bb->get_instr()->end();){
            auto insn = *it;
            auto reg_ptrs = insn->regs();
            for (auto p : reg_ptrs) {
                Reg old = *p;
                if (new_reg_colors.find(old) != new_reg_colors.end()){
                    *p = Reg{new_reg_colors.at(old), true, is_pg_pass};
                }
                if((*p).is_standard() && used_reg.find(*p) == used_reg.end()) {
                    used_reg.insert(*p);
                }
            }
            // check if insn is useless
            bool useless = false;
            if(auto ir_move = dynamic_cast<Move*>(insn)) {
                if(ir_move->def_reg() == ir_move->use_reg()) {
                    useless = true;
                }
            }
            if(useless){
                it = bb->get_instr()->erase(it);
            } else {
                it++;
            }
        }
    }
}

void ColoringRegAllocator::AddEdge(Reg u, Reg v){
    if(adjSet.count({u,v}) == 0 && (u.is_standard() != v.is_standard() || u.id() != v.id()) && (u.is_gp() == is_pg_pass) && (v.is_gp() == is_pg_pass)) {
        adjSet.insert({u, v});
        adjSet.insert({v, u});
        if(!u.is_standard()) {
            adjList[u].insert(v);
            degree[u]++;
        }
        if(!v.is_standard()) {
            adjList[v].insert(u);
            degree[v]++;
        }
    }
}

std::set<Reg> ColoringRegAllocator::Adjacent(Reg n) const{
    // adjList[n] \ (selectStack ∪ coalescedNodes)
    std::set<Reg> res;
    auto it = adjList.find(n);
    if(it == adjList.end()){
        return {};
    }
    auto &adj_nodes = it->second;
    auto pred = [this](Reg r) {
        return coalescedNodes.count(r) == 0 && (std::find(selectStack.begin(), selectStack.end(), r) == selectStack.end());
    };
    //filter using pred
    std::copy_if(adj_nodes.begin(), adj_nodes.end(), std::inserter(res, res.begin()), pred);
    return res;
}

std::set<Move*> ColoringRegAllocator::NodeMoves(Reg n) const{
    // moveList[n] ∩ (activeMoves ∪ worklistMoves)
    std::set<Move*> res;
    auto it = moveList.find(n);
    if(it == moveList.end()){
        return {};
    }
    auto &moves = it->second;
    auto pred = [this](Move* m){
        return activeMoves.count(m) || worklistMoves.count(m);
    };
    //filter using pred
    std::copy_if(moves.begin(), moves.end(), std::inserter(res, res.begin()), pred);
    return res;
}

bool ColoringRegAllocator::MoveRelated(Reg n) const{
    // NodeMoves(n) != {}
    return !(NodeMoves(n).empty());
}

void ColoringRegAllocator::DecrementDegree(Reg m){
    int d = degree[m];
    degree[m] = d - 1;
    if(d == K){
        auto adj_nodes = Adjacent(m);
        adj_nodes.insert(m);
        EnableMoves(adj_nodes);
        spillWorklist.erase(m);
        if(MoveRelated(m)){
            freezeWorklist.insert(m);
        } else {
            simplifyWorklist.insert(m);
        }
    }
}

void ColoringRegAllocator::EnableMoves(const std::set<Reg>& nodes){
    for(Reg n: nodes){
        for(auto m: NodeMoves(n)){
            if(activeMoves.count(m)){
                activeMoves.erase(m);
                worklistMoves.insert(m);
            }
        }
    }
}

void ColoringRegAllocator::AddWorkList(Reg u){
    if(!u.is_standard() && !MoveRelated(u) && degree[u] < K) {
        freezeWorklist.erase(u);
        simplifyWorklist.insert(u);
    }
}

bool ColoringRegAllocator::OK(Reg t, Reg r) const{
    if(degree.find(t) == degree.end())
        std::cout << t << "1" << std::endl;
    return degree.at(t) < K || t.is_standard() && adjSet.count({t, r});
    
    // return true;
}

bool ColoringRegAllocator::Conservative(const std::set<Reg> &nodes) const{
    int k = 0;
    for(auto n: nodes) {
        if(degree.find(n) == degree.end())
            std::cout << n << "2" << std::endl;
        if(degree.at(n) >= K){
            k++;
        }
    }
    return k < K;
}

Reg ColoringRegAllocator::GetAlias(Reg n) const{
    if(coalescedNodes.count(n)) {
        if(alias.find(n) == alias.end())
            std::cout << n << "3" << std::endl;
        return GetAlias(alias.at(n));
    }
    return n;
}

void ColoringRegAllocator::Combine(Reg u, Reg v){
    if(freezeWorklist.count(v)) {
        freezeWorklist.erase(v);
    } else {
        spillWorklist.erase(v);
    }
    coalescedNodes.insert(v);
    alias[v] = u;
    //in essay it's nodeMoves but doesn't seem to be correct
    auto & moves = moveList[u];
    for(auto mv: moveList[v]) {
        moves.insert(mv);
    }

    for(auto t: Adjacent(v)){
        AddEdge(t, u);
        DecrementDegree(t);
    }
    if(degree[u] >= K && freezeWorklist.count(u)){
        freezeWorklist.erase(u);
        spillWorklist.insert(u);
    }
}

void ColoringRegAllocator::FreezeMoves(Reg u){
    for(auto m: NodeMoves(u)) {
        if(activeMoves.count(m)){
            activeMoves.erase(m);
        } else {
            worklistMoves.erase(m);
        }
        frozenMoves.insert(m);
        Reg v = (u == m->def_reg()[0]) ? m->use_reg()[0] : m->def_reg()[0];
        if(NodeMoves(v).empty() && degree[v] < K) {
            freezeWorklist.erase(v);
            simplifyWorklist.insert(v);
        }
    }
}

void ColoringRegAllocator::SelectSpill(){
    // select m using heuristic
    /*selected using favorite heuristic
    Note: avoid choosing nodes that are the tiny live ranges
    resulting from the fetches of previously spilled registers*/

    // for (auto r: spillWorklist) {
    //     std::cout << "spill cost " << r << " is " << get_spill_cost(r) << "\n";
    // }

    Reg m = *std::min_element(spillWorklist.begin(), spillWorklist.end(), [this](const Reg &a, const Reg &b) { 
        if (get_spill_cost(a) / degree[a] != get_spill_cost(b) / degree[b])
            return get_spill_cost(a) / degree[a] < get_spill_cost(b) / degree[b];
        // if(degree[a] != degree[b])
        //     return degree[a] < degree[b];
        else
            return a.id() < b.id();
    });
    //TODO: there should be a better heuristic here
    // std::cout << "min spill cost " << m << " is " << get_spill_cost(m) << "\n-----\n";
    spillWorklist.erase(m);
    simplifyWorklist.insert(m);
    FreezeMoves(m);
}


} // namespace riscv

} // namespace backend
