#pragma once

#include "common/type.hpp"
#include <string>

/**
 * @brief 表示临时寄存器
 *
 */
class Temp {
protected:
    int index_;     
    Type temp_type_;        // 分配的类型
public:
    Temp(int index, Type temp_type) : index_(index), temp_type_(temp_type) {}
    std::string to_str() const { return type_string(temp_type_) + " _T" + std::to_string(index_); }
    std::string to_llvm_str() const { return "%T" + std::to_string(index_); }
    int get_index() const { return index_; }
    void set_index(int index) { index_ = index; }
    Type get_type() const { return temp_type_; }
    void set_type(Type type) { temp_type_ = type; }
    bool operator < (const Temp &b) const { return index_ < b.index_; }
    bool operator ==(const Temp &b) const { return index_ == b.index_; }
};
