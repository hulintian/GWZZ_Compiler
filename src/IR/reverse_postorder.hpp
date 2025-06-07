#pragma once

#include "IR/IR.hpp"

namespace midend {

class ReversePostOrder {
private:
    std::unordered_set<int> visit;
    void dfs_reverse_postorder(int cur, CFG * cfg) {
        visit.insert(cur);
        for (auto nxt : *cfg->get_bb_succ(cur)) {
            if (!visit.count(nxt)) {
                dfs_reverse_postorder(nxt, cfg);
            }
        }
        order.push_back(cur);
    }
public:
    std::vector<int> order;
    int get_index(int bb_id) {
        return std::distance(order.begin(), std::find(order.begin(), order.end(), bb_id));
    }
    ReversePostOrder(CFG *cfg) {
        if (cfg->get_bb_list()->size() == 0) return;
        dfs_reverse_postorder(cfg->get_bb_list()->front(), cfg);
        std::reverse(order.begin(), order.end());
    }
};

} // namespace middleend
