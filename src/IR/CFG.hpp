#pragma once

#include "IR/IR.hpp"
#include "IR/temp.hpp"
#include <list>

namespace midend {

class CFG {
private:
    ir::Function *func;
    std::list<int> bb_list;
    std::unordered_set<int> jump_in_bb;
    std::unordered_map<int, ir::BasicBlock *> bb_map;
    std::unordered_map<int, std::unordered_set<int>> bb_prev;
    std::unordered_map<int, std::unordered_set<int>> bb_succ;
    void add_edge(int from, int to);
    void build_bb_edge();
    void remove_unreachable_bb(); // proceed in build_bb_edge()
public:
    CFG(ir::Function *func);
    ir::Function* get_func() { return func; }
    inline std::list<int>* get_bb_list() { return &bb_list; }
    inline std::unordered_map<int, ir::BasicBlock *>* get_bb_map() { return &bb_map; }
    inline std::unordered_map<int, std::unordered_set<int>>* get_bb_prev_map() { return &bb_prev; }
    inline std::unordered_map<int, std::unordered_set<int>>* get_bb_succ_map() { return &bb_succ; }
    inline ir::BasicBlock* get_bb(int bb) { return bb_map[bb]; }
    inline std::unordered_set<int>* get_bb_prev(int bb) { return &bb_prev[bb]; }
    inline std::unordered_set<int>* get_bb_succ(int bb) { return &bb_succ[bb]; }
    std::unordered_set<ir::BasicBlock*> prev(ir::BasicBlock* bb) { 
        std::unordered_set<ir::BasicBlock*> prevs;
        for (auto i: *get_bb_prev(bb->get_index())) {
            prevs.insert(get_bb(i));
        }
        return prevs;
    }
    std::unordered_set<ir::BasicBlock*> succ(ir::BasicBlock* bb) { 
        std::unordered_set<ir::BasicBlock*> succs;
        for (auto i: *get_bb_succ(bb->get_index())) {
            succs.insert(get_bb(i));
        }
        return succs;
    }
    void erase_from_prev(ir::BasicBlock* bb, ir::BasicBlock* other) {
        bb_prev.at(bb->get_index()).erase(other->get_index());
    }
    void erase_from_succ(ir::BasicBlock* bb, ir::BasicBlock* other) {
        bb_succ.at(bb->get_index()).erase(other->get_index());
    }
    void insert_succ(ir::BasicBlock* bb, ir::BasicBlock* other) {
        if (bb_succ.count(bb->get_index()))
            bb_succ.at(bb->get_index()).insert(other->get_index());
        else 
            bb_succ[bb->get_index()] = {other->get_index()};
    }
    void insert_prev(ir::BasicBlock* bb, ir::BasicBlock* other) {
        if (bb_prev.count(bb->get_index()))
            bb_prev.at(bb->get_index()).insert(other->get_index());
        else 
            bb_prev[bb->get_index()] = {other->get_index()};
    }
    void print();
    void rebuild();
    void change_succ(ir::BasicBlock *now_bb, ir::BasicBlock *old_bb, ir::BasicBlock *new_bb);
    void change_prev(ir::BasicBlock *now_bb, ir::BasicBlock *old_bb, ir::BasicBlock *new_bb);
    // not inpl
//     void compute_dom_level(ir::BasicBlock *bb, int dom_level);
//     void compute_dom();
//     void compute_rpo();
//     void loop_analysis();
};

} // namespace middleend
