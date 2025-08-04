#pragma once 

#include "IR/Value.hpp"
#include "common/type.hpp"

#include <iostream>

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
        assert(i < operands_.size() && "Index out of range.");
        return operands_[i];
    }
    //User Code Start. Sasara
    std::vector<Value *> get_operands()const{
        return operands_;
    }
    void operands_clear(){
        operands_.clear();
    }
    void replace_operand(Value* old_v, Value* new_v){
        for(int i = 0;i<get_num_operand();++i){
            if(old_v == get_operand(i)){
                operands_[i] = new_v;
                //set_operand(i,new_v);
                std::cout << this->get_name() << ": replace " 
                            << old_v->get_name() << " → " 
                            << new_v->get_name() << "\n";

            }
        }
    }
    void remove_operand(unsigned i){
        operands_.erase(operands_.begin()+i);
    }
    //User Code End. Sasara
    
    // 将该使用者的第i个操作数设为值v
    void set_operand(unsigned i, Value *v) {
        assert(i < operands_.size() && "Index out of range.");
        operands_[i] = v;
    }
    // 将值v添加到该使用者的操作数链表上
    void add_operand(Value *v) {
        operands_.push_back(v);
    }
    // 得到操作数链表的大小
    unsigned get_num_operand() const {
        return operands_.size();
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
    //unsigned num_ops_;
};

}
