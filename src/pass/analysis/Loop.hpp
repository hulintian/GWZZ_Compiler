#pragma once
#include "IR/BasicBlock.hpp"
#include <vector>
#include <set>
#include <memory>
#include <map>
#include <functional>
namespace pass{

class Loop{
public:
    Loop(IR::BasicBlock* header):_header(header){}

    const std::set<IR::BasicBlock*>& get_blocks() const{return _blocks;}

    Loop* get_parent_loop() const { return _parent_loop;}
    IR::BasicBlock* get_header()const {return _header;}
    const std::vector<Loop*> get_sub_loops() const{return _sub_loops;}

    void add_block(IR::BasicBlock* bb) { _blocks.insert(bb); }
    void set_parent_loop(Loop* p) { _parent_loop = p; }
    void add_sub_loop(Loop* sub) { _sub_loops.push_back(sub); }
private:
    IR::BasicBlock* _header;
    std::set<IR::BasicBlock*> _blocks;
    Loop* _parent_loop = nullptr;
    std::vector<Loop*> _sub_loops;
};

}