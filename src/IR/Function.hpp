#pragma once 

#include "IR/BasicBlock.hpp"
#include "common/type.hpp"
#include <list>
#include <map>
#include <vector>
namespace IR {

class CFG {
public:
    CFG(std::list<BasicBlock*> bbs) {}

    std::list<BasicBlock*> _bbs;
    std::map<int, BasicBlock*> idx2bb;
    std::map<int, int> prev_bb;
    std::map<int, int> succ_bb;
};

class Module;
class Function {
public:
    Function(Module* m, Type* return_type, std::vector<Type*> arg_types, std::vector<std::string> arg_names, bool is_lib)
        : _parent(m), _return_type(return_type), _arg_types(arg_types), _arg_names(arg_names), _is_lib(is_lib)  {}
    
    std::string get_func_name() const {
        return _func_name;
    }

    bool is_lib() const {
        return _is_lib;
    }

    std::string get_name() const {
        return _func_name;
    }

    Type* get_return_type() const {
        return _return_type;
    }

private:
    std::list<BasicBlock*> _bbs;
    CFG* _cfg;
    Module* _parent;

    std::string _func_name;
    Type* _return_type;
    std::vector<Type*> _arg_types;
    std::vector<std::string> _arg_names;
    bool _is_lib;
};

}
