#pragma once 

#include "IR/Function.hpp"
#include "IR/GlobalValue.hpp"
#include "common/utils.hpp"

#include <cassert>
#include <iostream>
#include <vector>
namespace IR {

class Module {
public:
    Module(){}

    void dump(std::ostream &out);

    void add_func(Function* func) {
        if(func->is_lib()) {
            std::cout << error << "This is lib function. Expect function.\n";
            assert(false);
        }
        // assert(_name2func.find(func->get_func_name()) != _name2func.end() && "Function already defined.\n");
        _funcs.push_back(func);
        _name2func[func->get_func_name()] = func;
    }
    void add_lib_func(Function* func) {
        if(!func->is_lib()) {
            std::cout << error << "This is not lib function. Expect lib function.\n";
            assert(false);
        }
        assert(_name2func.find(func->get_func_name()) != _name2lib_func.end() && "Function already defined.\n");
        _lib_funcs.push_back(func);
        _name2lib_func[func->get_func_name()] = func;
    }

    void add_gv(GlobalValue* gv) {
        assert(_name2gv.find(gv->get_symbol()) == _name2gv.end() && "Already have the GlobalValue");
        _gvs.push_back(gv);
        _name2gv[gv->get_symbol()] = gv;
    }

    GlobalValue* get_gv(const std::string &symbol) {
        if(_name2gv.find(symbol) != _name2gv.end()) {
            return _name2gv[symbol];
        }
        return nullptr;
    }

    bool has_gv(const std::string& symbol) {
        return this->get_gv(symbol) != nullptr;
    }

    bool find_function(const std::string name)const  {
        return _name2func.find(name) != _name2func.end() || _name2lib_func.find(name) != _name2lib_func.end();
    }

    const Function* get_func(std::string name) {
        assert(find_function(name) && "The not find the function\n");
        if(_name2func.find(name) != _name2func.end()) {
            return _name2func[name];
        }else {
            return _name2lib_func[name];
        }
    }
private:
    // TODO Need maintain the function and global variable
    std::vector<Function*> _funcs;
    std::map<std::string, Function*> _name2func;
    std::vector<Function*> _lib_funcs;
    std::map<std::string, Function*> _name2lib_func;
    std::vector<GlobalValue*> _gvs;
    std::map<std::string, GlobalValue*> _name2gv;
};

}
