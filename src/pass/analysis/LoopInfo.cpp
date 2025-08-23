#include "LoopInfo.hpp"
#include "PassManager.hpp"
#include <stack>
namespace pass{

std::unique_ptr<AnalysisResult> 
LoopInfoPass::run(const IR::Function& function,PassManager& pm){
    auto result = std::make_unique<LoopInfoResult>();
    auto& dom_tree = pm.get_analysis_manager().get_function_result<DominatorTreePass>(function);
    find_loops(function,dom_tree,*result);
    return result;
}

void LoopInfoPass::find_loops(const IR::Function& F, 
                const DominatorTreeResult& dom_tree, 
                LoopInfoResult& result){
    //储存循环头到循环尾的映射，也就是回边（反的）
    std::map<IR::BasicBlock*, std::vector<IR::BasicBlock*>> header_to_back_edges;
    for(auto& u : F.get_basic_blocks()){
        //找回边
        for(auto& v : u->get_successors()){
            if(dom_tree.dominates(v,u)){
                header_to_back_edges[v].push_back(u);
            }
        }
    }

    for (auto const& [header, back_edges] : header_to_back_edges){
        auto loop = std::make_unique<Loop>(header);

        loop->add_block(header);
        for(auto& tail : back_edges){
            build_loop_body(header,tail,loop.get());
        }
        
        //先都加进去
        result.all_loops.push_back(std::move(loop));
    }
    build_loop_nesting_tree(result);
    //建立查询
    for (auto& loop : result.top_level_loops) {
        std::function<void(Loop*)> populate_map = 
            [&](Loop* l){
                for (auto* bb : l->get_blocks()) {
                    result.block_to_loop_map[bb] = l;
                }
                for (auto* sub : l->get_sub_loops()) {
                    populate_map(sub);
                }
            };
        populate_map(loop);
    }
}

//反向洪水填充
void LoopInfoPass::build_loop_body(IR::BasicBlock* header, IR::BasicBlock* tail, Loop* loop) {
    std::stack<IR::BasicBlock*> worklist;

    worklist.push(tail);
    loop->add_block(tail);

    while (!worklist.empty()) {
        IR::BasicBlock* current = worklist.top();
        worklist.pop(); 

        for (IR::BasicBlock* pred : current->get_predecessors()) {
            if (loop->get_blocks().find(pred) == loop->get_blocks().end()) {
                loop->add_block(pred);
                worklist.push(pred);
            }
        }
    }
}

//构建循环嵌套树
void LoopInfoPass::build_loop_nesting_tree(LoopInfoResult& result) {
    for(auto& loop_ptr : result.all_loops){
        Loop *current_loop = loop_ptr.get();
        Loop *best_parent = nullptr;

        for(auto& may_parent_ptr : result.all_loops){
            Loop *may_parent = may_parent_ptr.get();
            if(may_parent == current_loop) continue;
            if(may_parent->get_blocks().count(current_loop->get_header())){
                if (best_parent==nullptr||
                    best_parent->get_blocks().size() > may_parent->get_blocks().size()){
                    best_parent = may_parent;
                }
            }
        }
        //绑定关系
        if(best_parent){
            current_loop->set_parent_loop(best_parent);
            best_parent->add_sub_loop(current_loop);
        }else{
            result.top_level_loops.push_back(current_loop);
        }

    }
}
    
} // namespace pass

