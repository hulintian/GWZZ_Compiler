#include "IR/Function.hpp"
#include "common/type.hpp"
#include <ostream>

namespace IR {

void  Function::dump(std::ostream &out) {
    out << "define " << type_string(*this->get_return_type())  
        << this->get_func_name() ;

    out << " ( " ;
    // the params
    for(auto  para = this->get_params_type().begin(); 
            para != this->get_params_type().end(); 
            para++) {
        out << type_string(**para);
        if((this->get_params_type().end() - para - 1) != 0) {
            out << ", ";
        }
    }
    out << " ) ";

    out << "{";
    // the body 
    this->get_cfg()->dump(out);
    out << "}";
}

void CFG::dump(std::ostream &out) {
    for(auto bb : _bbs) {
        bb->dump(out);
        out << "\n";
    }
#include "IR/BasicBlock.hpp" 
} 

}
