#include "IR/loop_analysis.hpp"

namespace midend {

void LoopAnalysis::build_loop() {
    loop_map_.clear();
    auto dom_post_order = dom_tree_->get_po(func_->get_entry());
    for (auto &bb_head : dom_post_order) {
        std::vector<ir::BasicBlock *> in_loop;
        for (auto &bb_prev_idx : *cfg_->get_bb_prev(bb_head->get_index())) {
            auto bb_prev = cfg_->get_bb(bb_prev_idx);
            if (dom_tree_->get_dom(bb_prev).find(bb_head) != dom_tree_->get_dom(bb_prev).end()) { // 找到一条回边
                in_loop.push_back(bb_prev);
            }
        }
        if (in_loop.empty()) {
            continue;
        }
        Loop *loop = new Loop(bb_head);
        loops.push_back(loop);
        std::unordered_set<ir::BasicBlock *> visit_bb;
        while (!in_loop.empty()) {
            auto bb = in_loop.back();
            in_loop.pop_back();
            if (loop_map_.find(bb) != loop_map_.end()) { // 如果当前节点已经在loop中，则新的loop是该节点的最外层loop
                Loop *cur_loop = loop_map_[bb];
                while (cur_loop->parent_ != nullptr) {
                    cur_loop = cur_loop->parent_;
                }
                if (cur_loop != loop) {
                    loop->depth_ = 1;
                    loop->child_ = cur_loop;
                    cur_loop->parent_ = loop;
                    while (cur_loop != nullptr) {
                        cur_loop->depth_++;
                        cur_loop = cur_loop->child_;
                    }
                }
            } else {
                loop->depth_ = 1;
                loop_map_[bb] = loop;
            }
            if (bb != bb_head) {
                for (auto &bb_prev_idx : *cfg_->get_bb_prev(bb->get_index())) {
                    auto bb_prev = cfg_->get_bb(bb_prev_idx);
                    if (!visit_bb.count(bb_prev)) {
                        visit_bb.insert(bb_prev);
                        in_loop.push_back(bb_prev); // 继续向前找
                    }
                }
            }
        }
    }
}

}  // namespace middleend
