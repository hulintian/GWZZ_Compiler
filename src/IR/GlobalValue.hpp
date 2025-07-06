#pragma once

#include "IR/Value.hpp"
#include "common/defines.hpp"
#include <memory>

namespace IR {

class Module;
class GlobalValue : Value {
public:
    GlobalValue(Module* m, const std::string &sym, std::shared_ptr<Var> var, bool is_inited) : Value(&var->type, sym) ,moulde(m), _symbol(sym), _var(var), _is_inited(is_inited){}
    

    const std::string get_symbol() const { return _symbol; }
private:
    Module* moulde;
    std::string _symbol;
    std::shared_ptr<Var> _var;
    bool _is_inited;
    bool _is_bss;
};

}
