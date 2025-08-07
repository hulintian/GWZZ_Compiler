#pragma once
#include "IR/Value.hpp"
#include "common/type.hpp"
#include <map>
#include <string>

namespace IR {
class UndefValue : public Value {
private:
    UndefValue(Type* ty) : Value(ty, "undef") {}

public:
    // 禁止拷贝 移动
    UndefValue(const UndefValue&) = delete;
    UndefValue& operator=(const UndefValue&) = delete;

    static UndefValue* get(Type* ty) {
        static std::map<Type*, UndefValue*> _undef_instances;
        auto it = _undef_instances.find(ty);
        if (it != _undef_instances.end()) {
            return it->second;
        }
        UndefValue* new_undef = new UndefValue(ty);
        _undef_instances[ty] = new_undef;
        return new_undef;
    }
    std::string to_str(){return "<undef>";}
    
};

} // namespace IR