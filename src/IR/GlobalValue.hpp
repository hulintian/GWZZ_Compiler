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
    GlobalValue(Module* m, const std::string &sym, std::shared_ptr<Var> var, bool is_inited, bool is_const) 
        : Value(&var->type, sym) ,moulde(m), _symbol(sym), _var(var), _is_inited(is_inited), _is_const(is_const)
    {
        if(!is_inited || (!this->get_type().is_array() && (var->val->iv == 0 || var->val->fv == 0))) {
            this->_is_bss = true;
        } else {
            this->_is_bss = false;
        }
    }

    const std::string get_symbol() const { return _symbol; }
    const Type get_type() const { 
        assert(_var && "Noninitialized var\n");
        return _var->type; 
    }
    
    const std::shared_ptr<Var> get_var() const { return _var; }

    bool is_bss() { return _is_bss; }
    
    void dump(std::ostream &out);
private:
    Module* moulde;
    std::string _symbol;
    std::shared_ptr<Var> _var;
    bool _is_inited;
    bool _is_const;
    bool _is_bss;
};

class ConstantValue : public Value {
public:
    using value = ConstValue;
    ConstantValue(Type* ty, const std::string &name, value &v) : Value(ty, name), val(v)  {}
    
    const value get_value() { return val; }
private:
    value val;
};

}
