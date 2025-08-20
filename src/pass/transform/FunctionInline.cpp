#include "Pass.hpp"
#include "PassManager.hpp"
#include "FunctionInline.hpp"
#include "IRBuilder.hpp"
#include "Instructions.hpp"
#include "BasicBlock.hpp"
#include <set>
#include <fstream>
#include <ostream>


#include <utils.hpp>

namespace pass {

const int INLINE_THRESHOLD = 50;

static IR::Function* is_inlining_candidate(IR::CallInst* call_inst) {
    IR::Function* callee = call_inst->get_func();
    IR::Function* caller = call_inst->get_parent()->get_parent();
    if (!callee) {
        return nullptr; //间接call
    }
    if (callee == caller) {
        return nullptr;
    }
    if (callee->is_lib()) {
        return nullptr;
    }
    // 限制大小
    int inst_count = 0;
    for (auto& bb : callee->get_basic_blocks()) {
        inst_count += bb->get_intrs().size();
    }
    if (inst_count > INLINE_THRESHOLD) {
        return nullptr;
    }
    return callee;
}

bool FunctionInlinePass::run(IR::Module& module, PassManager& pm) {
    this->_module = &module;
    this->_pm = &pm;
    init();
    re_gen_call_graph();

#ifdef SHOW_CALL_GRAPH
    // the default path is at /tmp
    std::ofstream cg_out;
    cg_out.open("/tmp/sysy_test_call_graph_test.dot");
    dump_call_graph(cg_out);
    cg_out.close();
#endif

    return true;
}

void FunctionInlinePass::init(){
    this->_builder = &_pm->get_ir_builder();
    this->call_graph.clear();
}

void FunctionInlinePass::perform_inlining(IR::CallInst* call_inst, IR::Function* callee){
    IR::Function* caller = call_inst->get_parent()->get_parent();
    IR::BasicBlock* original_bb = call_inst->get_parent();
    //step 1
    split_BB(original_bb,call_inst);
    std::pair<IR::BasicBlock*,IR::BasicBlock*> post_call_bb = this->split_bb_at_call.at(call_inst);


}

void FunctionInlinePass::split_BB(IR::BasicBlock* cur_BB,IR::CallInst* call){
    std::pair<IR::BasicBlock*,IR::BasicBlock*> pairs;
    this->_builder->set_cur_func(cur_BB->get_parent());
    auto sc_bb = this->_builder->create_bb();
    auto insts = cur_BB->get_intrs();
    auto it = std::find(insts.begin(),insts.end(),call);
    if(it != insts.end()){
        for(auto iter = it + 1 ;iter != insts.end();++iter){
            auto mv_inst = cur_BB->remove_instr(*iter);
            sc_bb->add_instr(mv_inst);
        }
    }
    this->_builder->set_cur_bb(cur_BB);
    this->_builder->create_br(sc_bb);
    this->split_bb_at_call.insert({static_cast<IR::CallInst*>(cur_BB->remove_instr(call)),pairs});
}
void FunctionInlinePass::callee_to_caller(IR::CallInst* call){
    auto pair = this->split_bb_at_call.at(call);
    auto caller = pair.first->get_parent();
    auto callee = call->get_func();

    auto startBB = pair.first;
    auto endBB = pair.second;

    // DFS 
    std::set<IR::BasicBlock*> visited;
    std::stack<IR::BasicBlock*> stk;
    stk.push(callee->get_entry_bb());
    

    while(!stk.empty()){
        auto curbb = stk.top();
        stk.pop();
        if(visited.find(curbb) == visited.end()){
            visited.insert(curbb);
            for(auto s : curbb->get_successors()){
                stk.push(s);
            }
            //curbb->set_parent(caller);
        }
    }


}


void FunctionInlinePass::re_gen_call_graph() {
    call_graph.clear();
    for(auto f : this->_module->get_functions()) {
        f->get_cfg()->regen_cfg();
        auto cfg = f->get_cfg();
        auto ebb = cfg->entry_bb;

        std::map<int, bool> visited;
        std::stack<IR::BasicBlock*> stk;
        stk.push(ebb);

        auto callinfo = new call_info(f);
        call_graph[f] = callinfo;

        while(!stk.empty()) {
            auto cur_bb = stk.top();
            stk.pop();
            for(auto succs : cfg->succ_bb[cur_bb->get_bb_idx()]) {
                if(!visited[succs]) {
                    auto sbb = cfg->idx2bb[succs];
                    stk.push(sbb);
                }
            }
            
            if(!visited[cur_bb->get_bb_idx()]) {
                visited[cur_bb->get_bb_idx()] = true;
                for(auto inst : cur_bb->get_intrs()) {
                    if(auto callinstr = dynamic_cast<IR::CallInst*>(inst)){
                        callinfo->callees.insert(callinstr->get_func());
                        callinfo->callinstrs.insert(callinstr);
                    }
                }

            }
        }
    }
}



    // 简单转义 DOT label 中的特殊字符
    // inline std::string dot_escape(std::string s) {
    //     std::string out;
    //     out.reserve(s.size());
    //     for (char c : s) {
    //         switch (c) {
    //             case '"':  out += "\\\""; break;
    //             case '\\': out += "\\\\"; break;
    //             case '\n': out += "\\n";  break;
    //             case '\r': /* skip */     break;
    //             default:   out += c;      break;
    //         }
    //     }
    //     return out;
    // }

void FunctionInlinePass::dump_call_graph(std::ostream& out) {

    // head of dot
    out << "digraph CallGraph {\n";
    out << "  graph [rankdir=LR, fontsize=12];\n";
    out << "  node  [shape=box, fontname=\"monospace\", style=filled, fillcolor=\"#f8f9fb\", color=\"#A0A0A0\"];\n";
    out << "  edge  [color=\"#555555\"];\n\n";

    for(auto func : this->_module->get_funcs()) {
        auto f_id = "n_" + std::ptr_hex_id(func);
        auto name = func->get_name();
        auto label = dot_escape(name);

        out << "  " << f_id << " [label=\"" << label << "\"";
        out << ", fillcolor=\"#FFF4CC\", color=\"#D9A300\""; // 柔黄色高亮
        out << "];\n";
    }
    out << "\n";

    for(const auto& [caller, info] : this->call_graph) {
        std::string caller_id = "n_" + std::ptr_hex_id(caller);

        for(const auto cf : info->callees) {
            std::string callee_id = "n_" + std::ptr_hex_id(cf);
            out << "  " << caller_id << " -> " << callee_id << ";\n";
        }
    }
    out << "}\n";
}



}

