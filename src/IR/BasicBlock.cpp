#include "BasicBlock.hpp"
#include "Instructions.hpp"
#include <string>
#include "utils.hpp"

namespace IR {

void BasicBlock::dump(std::ostream& out) {
    out << this->bb_label  << "\n";
    // << std::to_string(this->get_bb_idx())
    for(auto i : this->get_intrs()) {
         print_indent(out, 4);
         out << i->to_str() 
             << '\n';
    }
}

}
