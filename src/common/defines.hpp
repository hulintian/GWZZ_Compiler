#pragma once 

#include "type.hpp"

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

/// 值 
struct Var {
    // TODO Wait to finish
    Type type;
};

/// 正、负、非
enum class UnaryOp { Add, Sub, Not };

enum class BinaryOp {
  Add,  
  Sub,
  Mul,
  Div,
  Mod,
  Eq,
  Neq,
  Lt,
  Gt,
  Leq,
  Geq,
  And,
  Or,
  Shr,
  Shl,
  Ashl,
  NR_OPS
};
