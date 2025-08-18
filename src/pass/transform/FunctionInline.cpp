#include "Pass.hpp"
#include "PassManager.hpp"
#include "FunctionInline.hpp"
#include "IRBuilder.hpp"
#include <set>
#include <fstream>
#include <ostream>

#include <utils.hpp>

namespace pass {

    void FunctionInline::re_gen_call_graph() {
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

    void FunctionInline::dump_call_graph(std::ostream& out) {

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
    
    bool FunctionInline::run(IR::Module& module, PassManager& pm) {
        this->_module = &module;
        this->_pm = &pm;
        this->_builder = &pm.get_ir_builder();

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

}

