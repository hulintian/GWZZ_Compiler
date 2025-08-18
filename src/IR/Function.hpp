#pragma once 

#include "BasicBlock.hpp"
// #include "IR/Instructions.hpp"
#include "Value.hpp"
#include "type.hpp"
#include <cassert>
#include <cstdarg>
#include <list>
#include <map>
#include <set>
#include <ostream>
#include <stack>
#include <string>
#include <vector>

//User Code Start. Sasara
#include <set>
#include <functional>
//User Code End. Sasara
namespace IR {

class CFG {
public:
    CFG(std::list<BasicBlock*> bbs) {}
    CFG() {}

    std::list<BasicBlock*> _bbs;
    std::map<int, BasicBlock*> idx2bb;
    std::map<int, std::set<int>> prev_bb;
    std::map<int, std::set<int>> succ_bb;
    BasicBlock* entry_bb;

    void regen_cfg();

    void insert_bb(BasicBlock* bb) {
        this->_bbs.push_back(bb);
        idx2bb[bb->get_bb_idx()] = bb;
    }
    
    void dump(std::ostream &out) ;

    // User Code Start. Sasara

    void dump_cfg(const std::string& title = "CFG Dump") const;

    void rm_bb(BasicBlock* bb){
        if (!bb) return;
        this->_bbs.remove(bb);
        idx2bb.erase(bb->get_bb_idx());
        delete bb;                      
    }

    // TODO 在更新CFG的时候把上面三个表也更新了
    void refresh_predecessors();
    void build_predecessors() const;
    const std::vector<BasicBlock*>& get_predecessors(const BasicBlock* bb) const;

private:
    mutable std::map<BasicBlock*, std::vector<BasicBlock*>> _predecessor_map;       
    mutable bool _predecessors_built = false;                                       
    void _build_predecessors()const;
    // User Code End. Sasara
};

class Module;
class Function : public Value{
public:
    Function(Module* m, 
            const std::string& func_name, 
            Type* return_type, 
            std::vector<Type*> arg_types, 
            std::vector<std::string> arg_names, 
            bool is_lib)
        :Value(return_type, func_name), _parent(m), _func_name(func_name),_return_type(return_type), _arg_types(arg_types), _arg_names(arg_names), _is_lib(is_lib){
            this->_cfg = new CFG();
        }
    
    std::string get_func_name() const {
        return _func_name;
    }

    std::vector<std::string> get_func_p_names() { return _arg_names; }

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
    //User Code Start. Sasara
    Module* get_parent()const{
        return _parent;
    }

    const std::list<BasicBlock*>& get_basic_blocks() const {
        return _cfg->_bbs;
    }
    void rm_basic_block(BasicBlock* bb){
        _cfg->rm_bb(bb);
    }
    void build_predecessors() {
        _cfg->build_predecessors();
    }

    void refresh_predecessors(){
        _cfg->refresh_predecessors();
    }

    //回调函数，后续遍历
    void post_order_traversal(std::function<void(BasicBlock*)> callback) const;
    //逆后序
    std::vector<BasicBlock*> get_reverse_post_order() const;
    //User Code End. Sasara
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
    void dump_head(std::ostream& out);

    Value* find_alias(const std::string &symbol) {
        if(alias.find(symbol) != alias.end()) {
            return alias[symbol];
        }
        return nullptr;
    }

    bool has_symbol(const std::string& symbol) {
        return this->find_alias(symbol) != nullptr;
    }

    void change_alias(const std::string& symbol, Value* nv) {
        assert(this->find_alias(symbol) && "Not exists alias");
        this->alias[symbol] = nv;
    }
    void add_alias(const std::string& symbol, Value* nv) {
        assert(!this->find_alias(symbol) && "Already exists alias");
        this->alias[symbol] = nv;
    }

    std::map<std::string, Value*>& get_alias_map() {
        return alias;
    }

    std::map<std::string, int>& get_alias_cnt_map() {
        return alias_cnt;
    }

    void push_break_continue_point(BasicBlock* bp, BasicBlock* cp){
        break_dst.push(bp);
        continue_dst.push(cp);
    }

    void pop_break_continue_point(){
        assert(!break_dst.empty() && !continue_dst.empty() && "Bp or Cp empty\n");
        break_dst.pop();
        continue_dst.pop();
    }

    BasicBlock* get_break_point() {
        assert(!this->break_dst.empty() && "Attempted to get break point outside of a loop!");
        return this->break_dst.top();
    }

    BasicBlock* get_continue_point() {
        assert(!this->continue_dst.empty() && "Attempted to get continue point outside of a loop!");
        return this->continue_dst.top();
    }

    void add_allocas(Instruction* inst) {
        allocas.push_back(inst);
    }

    std::list<BasicBlock*>& get_bbs() { return this->_cfg->_bbs; }

    std::vector<Instruction*> get_allocas() { return allocas; }

    void re_scain_allocas();

    bool is_param(Instruction* inst);

    void add_inline_times() { inline_times+=1; }
    int get_inline_time() const { return inline_times; }

private:
    CFG* _cfg;
    Module* _parent;

    std::string _func_name;
    Type* _return_type;
    std::vector<Type*> _arg_types;
    std::vector<std::string> _arg_names;
    bool _is_lib;

    std::map<std::string, Value*> alias;
    std::map<std::string, int> alias_cnt;

    // only for while stmt
    std::stack<BasicBlock*> break_dst;
    std::stack<BasicBlock*> continue_dst;

    std::vector<Instruction*> allocas;

    BasicBlock* entry_bb;

    int inline_times = 0;
};

}
