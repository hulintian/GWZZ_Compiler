#pragma once 

#include "type.hpp"
#include <functional>
#include <memory>
#include <map>
#include <optional>
#include <string>
#include <vector>

#define TypeCase(res, type, expr) if (auto res = dynamic_cast<type>(expr))

struct ConstValue {
    int type;
    union {int iv; float fv;};

    ConstValue(){}
    ConstValue(int v) : type{Int} {iv = v;}
    ConstValue(float v) : type{Float} {fv = v;}
    
    inline ConstValue getNot() const { return type == Int ? (int)(iv == 0) : (int)(fv == 0); }
    inline ConstValue getNeg() const { return type == Int ? ConstValue(-iv) : ConstValue(-fv); }
    bool operator == (const ConstValue &b) const {
      if (type!= b.type) return false;
      if (type == Int) return iv == b.iv;
      return fv == b.fv;
    }
    bool operator != (const ConstValue &b) const { return !(this->operator==(b)); }
    std::string to_string() const { return type == Int ? std::to_string(iv) : std::to_string(fv); }
};

/// 变量 
struct Var {
  Type type;
  std::optional<ConstValue> val;
  std::unique_ptr<std::map<int, ConstValue>>
      arr_val; 

  Var() {}
  Var(Type type_) : type{std::move(type_)} {}
  Var(Type type_, std::optional<ConstValue> value)
      : type{std::move(type_)}, val{std::move(value)} {}

  std::string to_string() {
        std::string ans = "";
        if(!type.is_array()) {
            if(val) {
                switch (type.base_type) {
                    case Int : ans = std::to_string(val->iv);  break;
                    case Float : ans = std::to_string(val->fv);  break;
                }
            }
        } else {
            ans += " [ ";
            int n = type.nr_elems();
            for(int i=0; i<n; i++) {
                if(arr_val->find(i) != arr_val->end()) {
                    ans += (*arr_val)[i].to_string();
                } else {
                    ans += "0";
                }
                if(i != n-1) {
                    ans += ",";
                }
            }
            ans += " ] ";
        }
        return ans;
    }
};


/// 正、负、非
enum class UnaryOp { Add, Sub, Not };

enum class BinaryOp {
// arithmetic
  Add,  
  Sub,
  Mul,
  Div,
  Mod,
// Logical, compares
  Eq,
  Neq,
  Lt,
  Gt,
  Leq,
  Geq,
// this tow only exists in cond, in if and while stmt
  And,
  Or,
// shift
  Shr,      // shift right
  Shl,      // shift left
  Ashl,     // arithmetic shift left
  NR_OPS // number of operators
};
