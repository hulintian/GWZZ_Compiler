#include "GlobalValue.hpp"
#include "type.hpp"
#include <ostream>

namespace IR {

void GlobalValue::dump(std::ostream& out) {
    out << this->get_symbol() 
        << " = global ";
    if(this->_is_const) out << "const " ;
    out << type_string(this->get_type()) << " ";
    if(this->_is_inited) {
        out << this->get_var()->to_string();
    } 
    if(this->is_bss()) {
        out << "  , in .bss section";
    } else {
        out << "  , in .data section";
    }
        out << "\n";
}

}
