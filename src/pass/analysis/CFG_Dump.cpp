#include "CFG_Dump.hpp"
#include "Module.hpp"
#include "Function.hpp"
#include "BasicBlock.hpp"
#include "Instructions.hpp"
#include <fstream>
#include <map>
#include <memory>
#include <stack>
#include "utils.hpp"
#include "sstream"
namespace pass {

    std::unique_ptr<AnalysisResult> CFG_Dump::run(const IR::Module& m, PassManager& pm) {
        this->_m = &m;
        this->_pm = &pm;

        std::ofstream out;
        dump_cfg_dot(out);

        return nullptr;
    }

    void CFG_Dump::dump_cfg_dot(std::ofstream& out) {
        for(const auto func : this->_m->view_funcs()) {
            out.open("tmp/cfg_tests/" + func->get_func_name() + ".dot");
            dump_func_cfg(func, out);
            out.close();
        }
    }

    // 把 BB 内指令渲染为 HTML-like label：标题高亮、指令逐行
    inline std::string render_bb_label(IR::BasicBlock* BB) {
        std::ostringstream os;
        os << R"(<
    <TABLE BORDER="0" CELLBORDER="0" CELLPADDING="2">
      <TR><TD ALIGN="LEFT"><B><FONT COLOR="#A61B1B">)"
           << html_escape(BB->get_name())
           << R"(</FONT>:</B></TD></TR>)";

        for (auto* I : BB->get_intrs()) {
            // 指令文本（可按需做简单高亮：load/store/br/ret/icmp 等关键字）
            std::string line = I->to_str();
            // 左对齐显示
            os << R"(<TR><TD ALIGN="LEFT"><FONT FACE="monospace">)"
               << html_escape(line)
               << R"(</FONT></TD></TR>)";
        }
        os << "</TABLE>>";
        return os.str();
    }

    void CFG_Dump::dump_func_cfg(const IR::Function* f, std::ofstream& out) {
        out << "digraph CFG_" << f->get_name() << " {\n";
        out << "  graph [fontsize=12, rankdir=TB];\n";
        out << "  node  [shape=box, fontname=\"monospace\", style=filled, "
              "fillcolor=\"#f8f9fb\", color=\"#A0A0A0\"];\n";
        out << "  edge  [color=\"#555555\"];\n\n";

        f->get_cfg()->regen_cfg();

        auto ebb = f->get_cfg()->entry_bb;
        std::stack<IR::BasicBlock*> stk;
        stk.push(ebb);
        std::map<int, bool> visited;

        for(auto bb : f->get_basic_blocks()) {
            auto bb_node = "b_n_" + std::ptr_hex_id(bb);
            out << bb_node 
                << " [label = " <<render_bb_label(bb)
                << " ]\n";
        }

        while(!stk.empty()) {
            auto cbb = stk.top();
            stk.pop();

            for(auto succ_bb_ids : f->get_cfg()->succ_bb[cbb->get_bb_idx()]) {
                if(!visited[succ_bb_ids]) stk.push(f->get_cfg()->idx2bb[succ_bb_ids]);
            }

            if(!visited[cbb->get_bb_idx()]) {
                visited[cbb->get_bb_idx()] = true;

                for(auto succ_bb_ids : f->get_cfg()->succ_bb[cbb->get_bb_idx()]) {
                    out << "    " 
                        << "b_n_" + std::ptr_hex_id(cbb)
                        << " -> "
                        << "b_n_" + std::ptr_hex_id(f->get_cfg()->idx2bb[succ_bb_ids])
                        << "\n";
                }

            }
        }

        out << "}\n";
    }
}
