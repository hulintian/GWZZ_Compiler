#include "BasicBlock.hpp"
#include "IR/Instructions.hpp"
#include <string>
#include "common/utils.hpp"

namespace IR {

void BasicBlock::dump(std::ostream& out) {
    out << this->bb_label << std::to_string(this->get_bb_idx()) << "\n";
    for(auto i : this->get_intrs()) {
         print_indent(out, 4);
         out << i->to_str() 
             << '\n';
    }
}

}
