#pragma once

#include "IR/IR.hpp"
#include "IR/CFG.hpp"

namespace midend {

class DominatorTree {
public:
    int index_;
    std::unordered_set<int> dom_; // dominator
    int idom_; // immediate dominator
    std::unordered_set<int> df_; // dominance frontier
    std::unordered_set<int> dom_succ_;
    std::unordered_set<int> temp_def_, temp_use_, temp_alloca_;
    std::unordered_map<int, int> temp_rename_map_;
    DominatorTree(int index) : index_(index) {}
};

class Mem2Reg {
private:
    CFG *cfg_;
    std::unordered_map<int, DominatorTree *> DTnode_;
    std::unordered_map<int, Temp*> temp_map;
    std::unordered_map<int, std::unordered_set<int>> temp_def_map;
    int next_temp_id_ = 0;
    std::unordered_map<int, std::vector<Temp *>> new_temp_from_;

    Temp *new_temp(int temp_id, Type type);
    void build_dom();
    void build_idom();
    void build_df();
    void build_temp_def();
    void build_bb_temp_use_and_def();
    void build_rename_map();
    void insert_phi();
    void insert_single_phi(Temp* temp, int bb);
    void remove_useless_phi();
    void rename(int bb);
    void setphi();
public:
    Mem2Reg(CFG *cfg);
    // build for module pre function's cfg
    Mem2Reg(ir::Module *module) {
        for (auto &func : *module->get_functions()) {
            CFG *cfg = new CFG(func);
            Mem2Reg mem2reg(cfg);
            cfg->rebuild();
        }
    }
};

} // namespace middleend
