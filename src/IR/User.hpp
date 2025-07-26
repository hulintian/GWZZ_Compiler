#pragma once 

#include "IR/Value.hpp"
#include "common/type.hpp"

/*
 *  @brief The user
 * */
namespace IR { 

class User : public Value
{
public:
    User(Type* t, const std::string &name) : Value(t, name) {}
    // 从该使用者的操作数链表中取出第i个操作数
    Value *get_operand(unsigned i) const {
        assert(i < num_ops_ && "Index out of range.");
        return operands_[i];
    }
    // 将该使用者的第i个操作数设为值v
    void set_operand(unsigned i, Value *v) {
        assert(i < num_ops_ && "Index out of range.");
        operands_[i] = v;
    }
    // 将值v添加到该使用者的操作数链表上
    void add_operand(Value *v) {
        operands_.push_back(v);
        v->add_use(this, operands_.size());
    }
    // 得到操作数链表的大小
    unsigned get_num_operand() const {
        return num_ops_;
    }
    // 从该使用者的操作数链表中的所有操作数的使用情况中移除该使用者
    void remove_use_of_ops() {
        // wait to implement
    }
    // 移除操作数链表中索引为index1到index2的操作数
    // 例如想删除第0个操作数：remove_operands(0,0)
    void remove_operands(int index1,int index2) {
        // wait to implement
    }
private:
    // 参数列表，表示该使用者用到的参数
    std::vector<Value *> operands_;
    // 该使用者使用的参数个数
    unsigned num_ops_;
};

}
