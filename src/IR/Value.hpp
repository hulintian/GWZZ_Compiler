#pragma once 

#include "common/type.hpp"
#include <list>

class Value ;
struct Use {
    Value *val_;
    unsigned arg_no_;
};

/*
 * @brief The value that can be used as an operand（like temp reg）
 * */
class Value {
public:
    Value(Type *t, const std::string &name) : _type(t), _name(name) {}
    ~Value() = default;
    Type *get_type() const;
    std::list<Use> &get_use_list() { return _use_list; }
    void add_use(Value *val, unsigned arg_no = 0) { 
        Use u = {val, arg_no};
        _use_list.push_back(u);
    }
    void replace_all_use_with(Value *new_val) {
        // wait to implement
    }
    void remove_use(Value *val) {
        // wait to implement
    }
private:
    Type *_type;
    std::string _name;
    int idx;
    std::list<Use> _use_list;
};


