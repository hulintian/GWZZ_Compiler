#include "IR/GlobalValue.hpp"
#include "common/type.hpp"
#include <ostream>

namespace IR {

void GlobalValue::dump(std::ostream& out) {
    out << "@" << this->get_symbol() 
        << " global" 
        << type_string(this->get_type()) 
        << this->get_var() 
        << "\n";
}

}
