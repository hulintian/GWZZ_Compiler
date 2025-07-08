#include "IR/Module.hpp"

namespace IR {
void Module::dump(std::ostream &out) {
    // dump global variables
    for(auto gv : _gvs) {
        gv->dump(out);
    }

    for(auto func : _funcs) {
        func->dump(out);
    }
}
}
