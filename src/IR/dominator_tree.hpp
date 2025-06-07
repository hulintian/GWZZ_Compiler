#pragma once

#include "IR/IR.hpp"
#include "IR/CFG.hpp"
#include "IR/reverse_postorder.hpp"

namespace midend {

class DominatorTree_ {
private:
    std::unordered_map<ir::BasicBlock *, std::unordered_set<ir::BasicBlock *>> dom; // 支配者节点
    std::unordered_map<ir::BasicBlock *, ir::BasicBlock *> idom; // 直接支配者节点
    std::unordered_map<ir::BasicBlock *, std::unordered_set<ir::BasicBlock *>> dominate; // 被支配者节点
    std::unordered_map<ir::BasicBlock *, int> dom_depth; // 支配树上深度
    std::unordered_map<ir::BasicBlock *, std::unordered_set<ir::BasicBlock *>> df; // 支配边界

    CFG *cfg;
    ir::Function *func;
    ir::BasicBlock *entry;
    ReversePostOrder *rpo;

    void build_dom();               // 支配
    void build_idom_dominate();     // 直接支配
    void build_dom_depth();
    void build_df();

    void po_dfs(std::vector<ir::BasicBlock *> &po, ir::BasicBlock *bb);
    void preo_dfs(std::vector<ir::BasicBlock *> &preo, ir::BasicBlock *bb);

public:
    std::vector<ir::BasicBlock *> get_po(ir::BasicBlock *bb); // 获取支配树上的后序遍历
    std::vector<ir::BasicBlock *> get_preo(ir::BasicBlock *bb); // 获取支配树上的前序遍历

    std::unordered_set<ir::BasicBlock *> get_dom(ir::BasicBlock *bb) { return dom[bb]; }
    ir::BasicBlock *get_idom(ir::BasicBlock *bb) { return idom[bb]; }
    std::unordered_set<ir::BasicBlock *> get_dominate(ir::BasicBlock *bb) { return dominate[bb]; }
    int get_dom_depth(ir::BasicBlock *bb) { return dom_depth[bb]; }
    std::unordered_set<ir::BasicBlock *> get_dom_frontier(ir::BasicBlock *bb) { return df[bb]; }

    ir::BasicBlock *find_lca(ir::BasicBlock *bb1, ir::BasicBlock *bb2); // 寻找两个节点的最近公共祖先

    ir::Function *get_func() { return func; }
    CFG *get_cfg() { return cfg; }

    ~DominatorTree_() {
        delete rpo;
    }
    
    DominatorTree_(CFG *cfg) : cfg(cfg) {
        func = cfg->get_func();
        entry = func->get_entry();
        rpo = new ReversePostOrder(cfg);
        build_dom();
        build_idom_dominate();
        build_dom_depth();
        build_df();
    }
};

} // namespace middleend
