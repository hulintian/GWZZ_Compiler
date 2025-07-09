#pragma once

#include "IR/Value.hpp"
#include "common/defines.hpp"
#include "common/type.hpp"
#include <cassert>
#include <memory>
#include <ostream>
#include <variant>

namespace IR {

class Module;
class GlobalValue : public Value {
public:
    GlobalValue(Module* m, const std::string &sym, std::shared_ptr<Var> var, bool is_inited) : Value(&var->type, sym) ,moulde(m), _symbol(sym), _var(var), _is_inited(is_inited){}
    

    const std::string get_symbol() const { return _symbol; }
    const Type get_type() const { 
        assert(_var && "Noninitialized var\n");
        return _var->type; 
    }
    
    const std::shared_ptr<Var> get_var() const { return _var; }
    
    void dump(std::ostream &out);
private:
    Module* moulde;
    std::string _symbol;
    std::shared_ptr<Var> _var;
    bool _is_inited;
    bool _is_bss;
};

class ConstantValue : public Value {
public:
    using value = ConstValue;
    ConstantValue(Type* ty, const std::string &name, value v) : Value(ty, name), val(v)  {}
    
    const value get_value() { return val; }
private:
    value val;
};

}
