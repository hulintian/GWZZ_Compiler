#pragma once 

#include "IR/BasicBlock.hpp"
#include "common/type.hpp"
#include <list>
#include <map>
#include <ostream>
#include <vector>
namespace IR {

class CFG {
public:
    CFG(std::list<BasicBlock*> bbs) {}
    CFG() {}

    std::list<BasicBlock*> _bbs;
    std::map<int, BasicBlock*> idx2bb;
    std::map<int, int> prev_bb;
    std::map<int, int> succ_bb;
    BasicBlock* entry_bb;

    void regen_cfg();

    void insert_bb(BasicBlock* bb) {
        this->_bbs.push_back(bb);
    }
    
    void dump(std::ostream &out) ;
};

class Module;
class Function {
public:
    Function(Module* m, const std::string& func_name, Type* return_type, std::vector<Type*> arg_types, std::vector<std::string> arg_names, bool is_lib)
        : _parent(m), _func_name(func_name),_return_type(return_type), _arg_types(arg_types), _arg_names(arg_names), _is_lib(is_lib){
            this->_cfg = new CFG();
        }
    
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
    
    BasicBlock* find_bb(int idx) {
        if(_cfg->idx2bb.find(idx) != _cfg->idx2bb.end()) {
            return _cfg->idx2bb[idx];
        }
        return nullptr;
    }

    BasicBlock* get_entry_bb() const {
        return entry_bb;
    }
    
    const std::vector<Type*> get_params_type() const {
        return _arg_types;
    }
    
    CFG* get_cfg() const {
        return _cfg;
    }
    
    void insert_bb(BasicBlock* bb) {
        this->_cfg->insert_bb(bb);
    }
    // add the entry 
    void set_entry_bb(BasicBlock* bb) {
        this->insert_bb(bb);
        _cfg->entry_bb = bb;
        entry_bb = bb;
    }

    // change the entry 
    void change_entry_bb(BasicBlock* bb) {
        _cfg->entry_bb = bb;
        entry_bb = bb;
    }

    void dump(std::ostream& out);
private:
    CFG* _cfg;
    Module* _parent;

    std::string _func_name;
    Type* _return_type;
    std::vector<Type*> _arg_types;
    std::vector<std::string> _arg_names;
    bool _is_lib;

    BasicBlock* entry_bb;
};

}
