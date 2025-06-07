#include "IR/dominator_tree.hpp"
#include<queue>

namespace midend {

void DominatorTree_::build_dom() {
    dom.clear();
    std::unordered_set<ir::BasicBlock *> V;
    for (auto &bb : *func->get_basic_blocks()) {
        V.insert(bb);
    }
    for (auto &bb : *func->get_basic_blocks()) {
        dom[bb] = V;
    }
    dom[entry] = {entry};
    bool changed = true;
    while (changed) {
        changed = false;
        for (auto &bb_idx : rpo->order) {
            auto bb = cfg->get_bb(bb_idx);
            if (bb == entry) {
                continue;
            }
            for (auto iter = dom[bb].begin(); iter != dom[bb].end();) {
                auto &dom_bb = *iter;
                if (dom_bb == bb) {
                    ++iter;
                    continue;
                }
                bool find = false;
                for (auto &pred_idx : *cfg->get_bb_prev(bb_idx)) {
                    auto pred = cfg->get_bb(pred_idx);
                    if (dom[pred].find(dom_bb) == dom[pred].end()) {
                        find = true;
                        break;
                    }
                }
                if (find) {
                    iter = dom[bb].erase(iter);
                    changed = true;
                } else {
                    ++iter;
                }
            }
            // std::unordered_set<ir::BasicBlock *> new_dom = {bb}; // wrong
            // for (auto &pred_idx : *cfg->get_bb_prev(bb_idx)) {
            //     auto pred = cfg->get_bb(pred_idx);
            //     new_dom.insert(pred);
            // }
            // if (new_dom != dom[bb]) {
            //     dom[bb] = new_dom;
            //     changed = true;
            // }
        }
    }
}

void DominatorTree_::build_idom_dominate() {
    idom.clear();
    for (auto &bb : *func->get_basic_blocks()) {
        if (bb == entry) {
            idom[bb] = nullptr;
            continue;
        }
        for (auto &dom_bb : dom[bb]) {
            if (dom_bb == bb) {
                continue;
            }
            bool ok = true;
            for (auto &dom_bb2 : dom[bb]) {
                if (dom_bb2 == bb || dom_bb2 == dom_bb) {
                    continue;
                }
                if (dom[dom_bb2].find(dom_bb) != dom[dom_bb2].end()) { // 还不是最近支配者
                    ok = false;
                    break;
                }
            }
            if (ok) {
                idom[bb] = dom_bb;
                dominate[dom_bb].insert(bb);
                break;
            }
        }
    }
}

void DominatorTree_::build_dom_depth() {
    dom_depth.clear();
    std::queue<ir::BasicBlock *> q; // bfs
    q.push(entry);
    dom_depth[entry] = 0;
    while (!q.empty()) {
        auto bb = q.front();
        q.pop();
        for (auto &dominate_bb : dominate[bb]) {
            dom_depth[dominate_bb] = dom_depth[bb] + 1;
            q.push(dominate_bb);
        }
    }
}

void DominatorTree_::build_df() {
    df.clear();
    for (auto &bb : *func->get_basic_blocks()) {
        for (auto pred_idx : *cfg->get_bb_prev(bb->get_index())) {
            auto pred = cfg->get_bb(pred_idx);
            auto runner = pred;
            while (runner != idom[bb]) {
                df[runner].insert(bb);
                runner = idom[runner];
            }
        }
    }
}

void DominatorTree_::po_dfs(std::vector<ir::BasicBlock *> &po, ir::BasicBlock *bb) {
    for (auto &dominate_bb : dominate[bb]) {
        po_dfs(po, dominate_bb);
    }
    po.push_back(bb);
}

std::vector<ir::BasicBlock *> DominatorTree_::get_po(ir::BasicBlock *bb) {
    std::vector<ir::BasicBlock *> po;
    po_dfs(po, bb);
    return po;
}

void DominatorTree_::preo_dfs(std::vector<ir::BasicBlock *> &preo, ir::BasicBlock *bb) {
    preo.push_back(bb);
    for (auto &dominate_bb : dominate[bb]) {
        preo_dfs(preo, dominate_bb);
    }
}

std::vector<ir::BasicBlock *> DominatorTree_::get_preo(ir::BasicBlock *bb) {
    std::vector<ir::BasicBlock *> preo;
    preo_dfs(preo, bb);
    return preo;
}

ir::BasicBlock *DominatorTree_::find_lca(ir::BasicBlock *bb1, ir::BasicBlock *bb2) {
    if (bb1 == nullptr) {
        return bb2;
    }
    if (bb2 == nullptr) {
        return bb1;
    }
    while (dom_depth[bb1] > dom_depth[bb2]) {
        bb1 = idom[bb1];
    }
    while (dom_depth[bb2] > dom_depth[bb1]) {
        bb2 = idom[bb2];
    }
    while (bb1 != bb2) {
        bb1 = idom[bb1];
        bb2 = idom[bb2];
    }
    return bb1;
}

// void DominatorTree_::loop_dfs(ir::BasicBlock * bb) {
//     for (auto next: dom[bb])
//         loop_dfs(next);
//     std::vector<ir::BasicBlock*> bbs;
//     for (auto bb_prev: cfg->prev(bb)) {
//         if (dominate[bb_prev].find(bb) != dominate[bb_prev].end())
//             bbs.emplace_back(bb_prev);
//     }
//     if (!bbs.empty()) {
//         Loop* new_loop = new Loop(bb);
//         func->loops.push_back(new_loop);
//         while (bbs.size() > 0) {
//             auto bb_ = bbs.back();
//             bbs.pop_back();
//             if (loop.find(bb_) == loop.end()) {
//                 loop[bb_] = new_loop;
//                 if (bb_ != bb)
//                     bbs.insert(bbs.end(), cfg->prev(bb_).begin(), cfg->prev(bb_).end());
//             }
//             else {
//                 Loop* inner_loop = loop[bb_];
//                 while (inner_loop->outer) 
//                     inner_loop = inner_loop->outer;
//                 if (inner_loop == new_loop) 
//                     continue;
//                 new_loop->no_inner = false;
//                 inner_loop->outer = new_loop;
//                 bbs.insert(bbs.end(), cfg->prev(inner_loop->header).begin(), cfg->prev(inner_loop->header).end());
//             }
//         }
//     }
// } 

// void DominatorTree_::calc_loop_level(Loop* loop) {
//     if (loop == nullptr)
//         return;
//     if (loop->level != -1) 
//         return;
//     if (loop->outer == nullptr) 
//         loop->level == 1;
//     else {
//         calc_loop_level(loop->outer);
//         loop->level = loop->outer->level + 1;
//     }
// }

// void DominatorTree_::loop_analysis() {
//     loop.clear();
//     loop[entry] = nullptr;
//     loop_dfs(entry);
//     for (auto &bb : *func->get_basic_blocks()) {
//         calc_loop_level(loop[bb]);
//     }
// }

} // namespace middleend
