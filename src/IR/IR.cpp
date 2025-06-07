#include "IR.hpp"
#include "common/defines.hpp"
#include "common/type.hpp"

namespace midend {

namespace ir {

namespace instruction {

std::string Assign::to_llvm_str(int &llvm_temp_cnt)  {
    if(_dsts[0]->get_type() == Int) {
        return _dsts[0]->to_llvm_str() 
                + " = add " + type_llvm_string(_dsts[0]->get_type()) 
                + " 0, "
                + _srcs[0]->to_llvm_str();
    } else {
        return _dsts[0]->to_llvm_str() 
                + " = fadd " + type_llvm_string(_dsts[0]->get_type()) 
                + " 0, "
                + _srcs[0]->to_llvm_str();
    }
}

std::string Load::to_str() {
    return "load " + _dsts[0]->to_str() + " = *(" + _srcs[0]->to_str() + " + " + std::to_string(_offset) + ")"; 
}

std::string Load::to_llvm_str(int &llvm_temp_cnt) {
    // is just base type 
        if(_offset == 0) 
            return _dsts[0]->to_llvm_str() + " = load " 
                                           + type_llvm_string(_dsts[0]->get_type()) 
                                           + ", " 
                                           + type_llvm_string(_srcs[0]->get_type()) 
                                           + " " + _srcs[0]->to_llvm_str();
        // is array type need use getelementptr
        auto ret = "%TT" + std::to_string(llvm_temp_cnt) + " = getelementptr " 
                                                              + type_llvm_string(_srcs[0]->get_type(), true) 
                                                              + ", " + type_llvm_string(_srcs[0]->get_type()) 
                                                              + " " + _srcs[0]->to_llvm_str() 
                                                              + ", i32 " + std::to_string(_offset / 4);
        // Then load
        return ret + "\n" + _dsts[0]->to_llvm_str() + " = load " 
                                                    + type_llvm_string(_dsts[0]->get_type()) 
                                                    + ", " + type_llvm_string(_srcs[0]->get_type()) 
                                                    + " %TT" + std::to_string(llvm_temp_cnt++);
}

std::string Store::to_str() { 
    return "store *(" + _srcs[0]->to_str() + " + " + std::to_string(_offset) + ") = " + _srcs[1]->to_str(); 
}
std::string Store::to_llvm_str(int &llvm_temp_cnt) {
    if (_offset == 0) 
        return "store " 
                + type_llvm_string(_srcs[1]->get_type()) + " " 
                + _srcs[1]->to_llvm_str() + ", " 
                + type_llvm_string(_srcs[0]->get_type()) + " " 
                + _srcs[0]->to_llvm_str();

    auto ret = "%TT" + std::to_string(llvm_temp_cnt) + " = getelementptr " + type_llvm_string(_srcs[0]->get_type(), true) + ", " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", i32 " + std::to_string(_offset / 4);
    return ret + "\nstore " + type_llvm_string(_srcs[1]->get_type()) + " " + _srcs[1]->to_llvm_str() + ", " + type_llvm_string(_srcs[0]->get_type()) + " %TT" + std::to_string(llvm_temp_cnt++);
}

std::string Binary::to_str() { 
    if (_type == BinaryOp::And) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " & " + _srcs[1]->to_str();
    if (_type == BinaryOp::Or ) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " | " + _srcs[1]->to_str();
                                                                                                  
    if (_type == BinaryOp::Add) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " + " + _srcs[1]->to_str();
    if (_type == BinaryOp::Sub) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " - " + _srcs[1]->to_str();
    if (_type == BinaryOp::Mul) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " * " + _srcs[1]->to_str();
    if (_type == BinaryOp::Div) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " / " + _srcs[1]->to_str();
    if (_type == BinaryOp::Mod) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " % " + _srcs[1]->to_str();
                                                                     
    if (_type == BinaryOp::Eq) return  _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " == " + _srcs[1]->to_str();
    if (_type == BinaryOp::Neq) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " != " + _srcs[1]->to_str();
    if (_type == BinaryOp::Lt) return  _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " < " +  _srcs[1]->to_str();
    if (_type == BinaryOp::Leq) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " <= " + _srcs[1]->to_str();
    if (_type == BinaryOp::Gt) return  _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " > " +  _srcs[1]->to_str();
    if (_type == BinaryOp::Geq) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " >= " + _srcs[1]->to_str();
    if (_type == BinaryOp::Shr) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " >> " + _srcs[1]->to_str();
    if (_type == BinaryOp::Shl) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " << " + _srcs[1]->to_str();
    assert(false);
}
std::string Binary::to_llvm_str(int &llvm_temp_cnt) {
    if (_dsts[0]->get_type() == Int) {
        if (_type == BinaryOp::And) return _dsts[0]->to_llvm_str() + " = and " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Or ) return _dsts[0]->to_llvm_str() + " = or " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();

        if (_type == BinaryOp::Add) return _dsts[0]->to_llvm_str() + " = add " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Sub) return _dsts[0]->to_llvm_str() + " = sub " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Mul) return _dsts[0]->to_llvm_str() + " = mul " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Div) return _dsts[0]->to_llvm_str() + " = sdiv " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Mod) return _dsts[0]->to_llvm_str() + " = srem " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();

        if (_type == BinaryOp::Shr) return _dsts[0]->to_llvm_str() + " = ashr " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Shl) return _dsts[0]->to_llvm_str() + " = shl " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();

        std::string ret = "";
        if (_type == BinaryOp::Eq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp eq " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Neq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp ne " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Lt) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp slt " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Leq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp sle " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Gt) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp sgt " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Geq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp sge " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        return ret + "\n" + _dsts[0]->to_llvm_str() + " = zext i1 %TT" + std::to_string(llvm_temp_cnt - 1) + " to i32";
    } else {
        if (_type == BinaryOp::And) return _dsts[0]->to_llvm_str() + " = and " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Or ) return _dsts[0]->to_llvm_str() + " = or " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();

        if (_type == BinaryOp::Add) return _dsts[0]->to_llvm_str() + " = fadd " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Sub) return _dsts[0]->to_llvm_str() + " = fsub " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Mul) return _dsts[0]->to_llvm_str() + " = fmul " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Div) return _dsts[0]->to_llvm_str() + " = fdiv " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Mod) return _dsts[0]->to_llvm_str() + " = frem " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();

        if (_type == BinaryOp::Shr) return _dsts[0]->to_llvm_str() + " = ashr " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Shl) return _dsts[0]->to_llvm_str() + " = shl " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();

        std::string ret = "";
        if (_type == BinaryOp::Eq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = fcmp eq " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Neq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = fcmp ne " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Lt) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = fcmp slt " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Leq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = fcmp sle " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Gt) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = fcmp sgt " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        if (_type == BinaryOp::Geq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = fcmp sge " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + _srcs[1]->to_llvm_str();
        return ret + "\n" + _dsts[0]->to_llvm_str() + " = zext i1 %TT" + std::to_string(llvm_temp_cnt - 1) + " to i32";
    }
}
std::string Binary::op_str() { 
    if (_type == BinaryOp::And) return " & " ;
    if (_type == BinaryOp::Or ) return " | " ;

    if (_type == BinaryOp::Add) return " + " ;
    if (_type == BinaryOp::Sub) return " - " ;
    if (_type == BinaryOp::Mul) return " * " ;
    if (_type == BinaryOp::Div) return " / " ;
    if (_type == BinaryOp::Mod) return " % " ;

    if (_type == BinaryOp::Eq)  return " == ";
    if (_type == BinaryOp::Neq) return " != ";
    if (_type == BinaryOp::Lt)  return " < " ;
    if (_type == BinaryOp::Leq) return " <= ";
    if (_type == BinaryOp::Gt)  return " > " ;
    if (_type == BinaryOp::Geq) return " >= ";
    if (_type == BinaryOp::Shr) return " >> ";
    if (_type == BinaryOp::Shl) return " << ";
    assert(false);
}
ConstValue Binary::to_const(ConstValue lhs, ConstValue rhs) {
    if (lhs.type == Int && rhs.type == Int) {
        if (_type == BinaryOp::And) return ConstValue(lhs.iv & rhs.iv);
        if (_type == BinaryOp::Or ) return ConstValue(lhs.iv | rhs.iv);
        if (_type == BinaryOp::Add) return ConstValue(lhs.iv + rhs.iv);
        if (_type == BinaryOp::Sub) return ConstValue(lhs.iv - rhs.iv);
        if (_type == BinaryOp::Mul) return ConstValue(lhs.iv * rhs.iv);
        if (_type == BinaryOp::Div) return ConstValue(lhs.iv / rhs.iv);
        if (_type == BinaryOp::Mod) return ConstValue(lhs.iv % rhs.iv);

        if (_type == BinaryOp::Lt)  return ConstValue(lhs.iv < rhs.iv);
        if (_type == BinaryOp::Leq) return ConstValue(lhs.iv <= rhs.iv);
        if (_type == BinaryOp::Gt)  return ConstValue(lhs.iv > rhs.iv);
        if (_type == BinaryOp::Geq) return ConstValue(lhs.iv >= rhs.iv);
        if (_type == BinaryOp::Shr) return ConstValue(lhs.iv >> rhs.iv);
        if (_type == BinaryOp::Shl) return ConstValue(lhs.iv << rhs.iv);
    } else if (lhs.type == Float && rhs.type == Int) {
        if (_type == BinaryOp::And) return ConstValue((int)lhs.fv & rhs.iv);
        if (_type == BinaryOp::Or ) return ConstValue((int)lhs.fv | rhs.iv);
        if (_type == BinaryOp::Add) return ConstValue(lhs.fv + rhs.iv);
        if (_type == BinaryOp::Sub) return ConstValue(lhs.fv - rhs.iv);
        if (_type == BinaryOp::Mul) return ConstValue(lhs.fv * rhs.iv);
        if (_type == BinaryOp::Div) return ConstValue(lhs.fv / rhs.iv);
        if (_type == BinaryOp::Mod) return ConstValue((int)lhs.fv % rhs.iv);

        if (_type == BinaryOp::Lt)  return ConstValue(lhs.fv < rhs.iv);
        if (_type == BinaryOp::Leq) return ConstValue(lhs.fv <= rhs.iv);
        if (_type == BinaryOp::Gt)  return ConstValue(lhs.fv > rhs.iv);
        if (_type == BinaryOp::Geq) return ConstValue(lhs.fv >= rhs.iv);
        if (_type == BinaryOp::Shr) return ConstValue((int)lhs.fv >> rhs.iv);
        if (_type == BinaryOp::Shl) return ConstValue((int)lhs.fv << rhs.iv);
    } else if (lhs.type == Int && rhs.type == Float) {
        if (_type == BinaryOp::And) return ConstValue(lhs.iv & (int)rhs.fv);
        if (_type == BinaryOp::Or ) return ConstValue(lhs.iv | (int)rhs.fv);
        if (_type == BinaryOp::Add) return ConstValue(lhs.iv + rhs.fv);
        if (_type == BinaryOp::Sub) return ConstValue(lhs.iv - rhs.fv);
        if (_type == BinaryOp::Mul) return ConstValue(lhs.iv * rhs.fv);
        if (_type == BinaryOp::Div) return ConstValue(lhs.iv / rhs.fv);
        if (_type == BinaryOp::Mod) return ConstValue(lhs.iv % (int)rhs.fv);

        if (_type == BinaryOp::Lt)  return ConstValue(lhs.iv < rhs.fv);
        if (_type == BinaryOp::Leq) return ConstValue(lhs.iv <= rhs.fv);
        if (_type == BinaryOp::Gt)  return ConstValue(lhs.iv > rhs.fv);
        if (_type == BinaryOp::Geq) return ConstValue(lhs.iv >= rhs.fv);
        if (_type == BinaryOp::Shr) return ConstValue(lhs.iv >> (int)rhs.fv);
        if (_type == BinaryOp::Shl) return ConstValue(lhs.iv << (int)rhs.fv);
    } else if (lhs.type == Float && rhs.type == Float) {
        if (_type == BinaryOp::And) return ConstValue((int)lhs.fv & (int)rhs.fv);
        if (_type == BinaryOp::Or ) return ConstValue((int)lhs.fv | (int)rhs.fv);
        if (_type == BinaryOp::Add) return ConstValue(lhs.fv + rhs.fv);
        if (_type == BinaryOp::Sub) return ConstValue(lhs.fv - rhs.fv);
        if (_type == BinaryOp::Mul) return ConstValue(lhs.fv * rhs.fv);
        if (_type == BinaryOp::Div) return ConstValue(lhs.fv / rhs.fv);
        if (_type == BinaryOp::Mod) return ConstValue((int)lhs.fv % (int)rhs.fv);

        if (_type == BinaryOp::Lt)  return ConstValue(lhs.fv < rhs.fv);
        if (_type == BinaryOp::Leq) return ConstValue(lhs.fv <= rhs.fv);
        if (_type == BinaryOp::Gt)  return ConstValue(lhs.fv > rhs.fv);
        if (_type == BinaryOp::Geq) return ConstValue(lhs.fv >= rhs.fv);
        if (_type == BinaryOp::Shr) return ConstValue((int)lhs.fv >> (int)rhs.fv);
        if (_type == BinaryOp::Shl) return ConstValue((int)lhs.fv << (int)rhs.fv);
    }

    if (_type == BinaryOp::Eq) return lhs == rhs;
    if (_type == BinaryOp::Neq) return lhs != rhs;

    assert(false);
}


std::string BinaryImm::to_str() { 
    if (_type == BinaryOp::And) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " & " + std::to_string(_imm);
    if (_type == BinaryOp::Or ) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " | " + std::to_string(_imm);

    if (_type == BinaryOp::Add) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " + " + std::to_string(_imm);
    if (_type == BinaryOp::Sub) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " - " + std::to_string(_imm);
    if (_type == BinaryOp::Mul) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " * " + std::to_string(_imm);
    if (_type == BinaryOp::Div) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " / " + std::to_string(_imm);
    if (_type == BinaryOp::Mod) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " % " + std::to_string(_imm);
    
    if (_type == BinaryOp::Eq) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " == " + std::to_string(_imm);
    if (_type == BinaryOp::Neq) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " != " + std::to_string(_imm);
    if (_type == BinaryOp::Lt) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " < " + std::to_string(_imm);
    if (_type == BinaryOp::Leq) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " <= " + std::to_string(_imm);
    if (_type == BinaryOp::Gt) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " > " + std::to_string(_imm);
    if (_type == BinaryOp::Geq) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " >= " + std::to_string(_imm);
    if (_type == BinaryOp::Shr) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " >> " + std::to_string(_imm);
    if (_type == BinaryOp::Shl) return _dsts[0]->to_str() + " = " + _srcs[0]->to_str() + " << " + std::to_string(_imm);
    return "error";
}

std::string BinaryImm::to_llvm_str(int &llvm_temp_cnt) {
    if (_dsts[0]->get_type() == Int) {
        if (_type == BinaryOp::And) return _dsts[0]->to_llvm_str() + " = and " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Or ) return _dsts[0]->to_llvm_str() + " = or " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);

        if (_type == BinaryOp::Add) return _dsts[0]->to_llvm_str() + " = add " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Sub) return _dsts[0]->to_llvm_str() + " = sub " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Mul) return _dsts[0]->to_llvm_str() + " = mul " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Div) return _dsts[0]->to_llvm_str() + " = sdiv " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Mod) return _dsts[0]->to_llvm_str() + " = srem " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm + 1); 

        if (_type == BinaryOp::Shr) return _dsts[0]->to_llvm_str() + " = ashr " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Shl) return _dsts[0]->to_llvm_str() + " = shl " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);

        std::string ret = "";
        if (_type == BinaryOp::Eq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp eq " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Neq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp ne " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Lt) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp slt " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Leq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp sle " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Gt) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp sgt " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Geq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp sge " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        return ret + "\n" + _dsts[0]->to_llvm_str() + " = zext i1 %TT" + std::to_string(llvm_temp_cnt - 1) + " to i32";
    } else {
        if (_type == BinaryOp::And) return _dsts[0]->to_llvm_str() + " = and " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Or ) return _dsts[0]->to_llvm_str() + " = or " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);

        if (_type == BinaryOp::Add) return _dsts[0]->to_llvm_str() + " = fadd " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Sub) return _dsts[0]->to_llvm_str() + " = fsub " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Mul) return _dsts[0]->to_llvm_str() + " = fmul " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Div) return _dsts[0]->to_llvm_str() + " = fdiv " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Mod) return _dsts[0]->to_llvm_str() + " = frem " + type_llvm_string(_dsts[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm + 1);

        if (_type == BinaryOp::Shr) return _dsts[0]->to_llvm_str() + " = ashr " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Shl) return _dsts[0]->to_llvm_str() + " = shl " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);

        std::string ret = "";
        if (_type == BinaryOp::Eq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = fcmp eq " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Neq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = fcmp ne " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Lt) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = fcmp slt " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Leq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = fcmp sle " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Gt) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = fcmp sgt " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        if (_type == BinaryOp::Geq) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = fcmp sge " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", " + std::to_string(_imm);
        return ret + "\n" + _dsts[0]->to_llvm_str() + " = zext i1 %TT" + std::to_string(llvm_temp_cnt - 1) + " to i32";
    }
}

std::string CondBranch::to_str() { return "if " + _srcs[0]->to_str() + " " + (_type != IR_Instr_BNE ? "==" : "!=") + " 0 jump " + _false_bb->get_name() + " else jump " + _true_bb->get_name(); }

std::string CondBranch::to_llvm_str(int &llvm_temp_cnt) {
    std::string ret = "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp ne " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", 0\n";
    if (_type == IR_Instr_BEQ) return ret + "br i1 %TT" + std::to_string(llvm_temp_cnt -1) + ", label %B" + std::to_string(_true_bb->get_index()) + ", label %B" + std::to_string(_false_bb->get_index());
    if (_type == IR_Instr_BNE) return ret + "br i1 %TT" + std::to_string(llvm_temp_cnt -1) + ", label %B" + std::to_string(_false_bb->get_index()) + ", label %B" + std::to_string(_true_bb->get_index());
}

std::string Call::to_str() { 
    std::string ret = "";
    if(_dsts[0] != nullptr)ret = _dsts[0]->to_str() + " = ";
    ret += "call " + _func->get_name() + "(";
    for (int i = 0; i < _srcs.size(); ++i) {
        ret += _srcs[i]->to_str();
        if (i != _srcs.size() - 1) ret += ", ";
    }
    ret += ")";
    return ret;
}
std::string Call::to_llvm_str(int &llvm_temp_cnt) {
    std::string func_name = _func->get_name();
    if (func_name == "starttime") {
        func_name = "_sysy_starttime";
    } else if (func_name == "stoptime") {
        func_name = "_sysy_stoptime";
    }
    std::string ret = "";
    if(_dsts[0] != nullptr)ret = _dsts[0]->to_llvm_str() + " = ";
    ret += "call " + type_llvm_string(_func->get_ret_type()) + " @" + func_name + "(";
    for (int i = 0; i < _srcs.size(); ++i) {
        ret += type_llvm_string(_srcs[i]->get_type()) + " " + _srcs[i]->to_llvm_str();
        if (i != _srcs.size() - 1) ret += ", ";
    }
    ret += ")";
    return ret;
}

std::string Cast::to_str() { return "cast " + _dsts[0]->to_str() + " = " + _srcs[0]->to_str(); }
std::string Cast::to_llvm_str(int &llvm_temp_cnt) {
    if (_type.base_type == Int) return _dsts[0]->to_llvm_str() + " = fptosi " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + " to " + type_llvm_string(_dsts[0]->get_type());
    if (_type.base_type == Float) return _dsts[0]->to_llvm_str() + " = sitofp " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + " to " + type_llvm_string(_dsts[0]->get_type());
    return "";
}

std::string ElementPtr::to_str() {
    std::string s = _dsts[0]->to_str() + " = elementptr: " + _srcs[0]->to_str();
    auto indices_ = std::vector<Temp*>(_srcs.begin() + 1, _srcs.end());
    for (auto i : indices_) {
        s += "[" + i->to_str() + "]";
    }
    return s;
}

std::string ElementPtr::to_llvm_str(int &llvm_temp_cnt) {
    if (_srcs[0]->get_type().dims[0] == 0) {
        if (_srcs[0]->get_type().nr_dims() == _srcs.size() - 1) {
            std::string s = "";
            if (_srcs[0]->get_type().nr_dims() == _srcs.size() - 1) {
                s += "%TT" + std::to_string(llvm_temp_cnt++) + " = getelementptr " + type_llvm_string(_srcs[0]->get_type(), true) + ", " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", i32 " + _srcs[_srcs.size() - 1]->to_llvm_str() + "\n";
            } else {
                s += "%TT" + std::to_string(llvm_temp_cnt++) + " = getelementptr " + type_llvm_string(_srcs[0]->get_type(), true) + ", " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + "\n";
            }
            int block_size = _srcs[0]->get_type().dims[_srcs[0]->get_type().nr_dims() - 1];
            for (int i = _srcs[0]->get_type().nr_dims() - 1; i > 0; i--) {
                if (i < _srcs.size() - 1) {
                    s += "%TT" + std::to_string(llvm_temp_cnt++) + " = mul i32 " + _srcs[i]->to_llvm_str() + ", " + std::to_string(block_size) + "\n";
                    s += "%TT" + std::to_string(llvm_temp_cnt) + " = getelementptr " + type_llvm_string(_srcs[0]->get_type(), true) + ", " + type_llvm_string(_srcs[0]->get_type()) + " %TT" + std::to_string(llvm_temp_cnt - 2) + ", i32 %TT" + std::to_string(llvm_temp_cnt - 1) + "\n";
                    llvm_temp_cnt ++;
                }
                block_size *= _srcs[0]->get_type().dims[i - 1];
            }
            s += _dsts[0]->to_llvm_str() + " = getelementptr " + type_llvm_string(_srcs[0]->get_type(), true) + ", " + type_llvm_string(_srcs[0]->get_type()) + " %TT" + std::to_string(llvm_temp_cnt - 1);
            return s;
        } else {
            std::string s = "";
            if (_srcs[0]->get_type().nr_dims() == _srcs.size()) {
                s += "%TT" + std::to_string(llvm_temp_cnt++) + " = getelementptr " + type_llvm_string(_srcs[0]->get_type(), true) + ", " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + ", i32 " + _srcs[_srcs.size() - 1]->to_llvm_str() + "\n";
            } else {
                s += "%TT" + std::to_string(llvm_temp_cnt++) + " = getelementptr " + type_llvm_string(_srcs[0]->get_type(), true) + ", " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str() + "\n";
            }
            int block_size = _srcs[0]->get_type().dims[_srcs[0]->get_type().nr_dims() - 1];
            for (int i = _srcs[0]->get_type().nr_dims() - 2; i > 0; i--) {
                if (i < _srcs.size()) {
                    s += "%TT" + std::to_string(llvm_temp_cnt++) + " = mul i32 " + _srcs[i]->to_llvm_str() + ", " + std::to_string(block_size) + "\n";
                    s += "%TT" + std::to_string(llvm_temp_cnt) + " = getelementptr " + type_llvm_string(_srcs[0]->get_type(), true) + ", " + type_llvm_string(_srcs[0]->get_type()) + " %TT" + std::to_string(llvm_temp_cnt - 2) + ", i32 %TT" + std::to_string(llvm_temp_cnt - 1) + "\n";
                    llvm_temp_cnt ++;
                }
                block_size *= _srcs[0]->get_type().dims[i];
            }
            s += _dsts[0]->to_llvm_str() + " = getelementptr " + type_llvm_string(_srcs[0]->get_type(), true) + ", " + type_llvm_string(_srcs[0]->get_type()) + " %TT" + std::to_string(llvm_temp_cnt - 1);
            return s;
        }
    } else {
        assert(false);
    }
}

std::string Phi::to_str() { 
    std::string ret = _dsts[0]->to_str() + " = phi ";
    for (int i = 0; i < _srcs.size(); ++i) {
        ret += "[" + _srcs[i]->to_str() + ", " + _bbs[i]->get_name() + "]";
        if (i != _srcs.size() - 1) ret += ", ";
    }
    ret += " use_dsize: " + std::to_string(_used.size());
    ret += " used: ";
    for (auto temp : _used) {
        ret += temp->to_str() + " ";
    }
    return ret;
}
std::string Phi::to_llvm_str(int &llvm_temp_cnt) {
    std::string ret = _dsts[0]->to_llvm_str() + " = phi " + type_llvm_string(_dsts[0]->get_type()) + " ";
    for (int i = 0; i < _srcs.size(); ++i) {
        ret += "[ " + _srcs[i]->to_llvm_str() + ", %B" + std::to_string(_bbs[i]->get_index()) + " ]";
        if (i != _srcs.size() - 1) ret += ", ";
    }
    return ret;
}

std::string Return::to_str() {
    if(_srcs[0] == nullptr)return "return";
    return "return " + _srcs[0]->to_str();
}
std::string Return::to_llvm_str(int &llvm_temp_cnt) {
    if(_srcs[0] == nullptr)return "ret void";
    return "ret " + type_llvm_string(_srcs[0]->get_type()) + " " + _srcs[0]->to_llvm_str();
}

std::string Unary::to_str() { 
    if (_type == UnaryOp::Add) return _dsts[0]->to_str() + " = +" + _srcs[0]->to_str();
    if (_type == UnaryOp::Sub) return _dsts[0]->to_str() + " = -" + _srcs[0]->to_str();
    if (_type == UnaryOp::Not) return _dsts[0]->to_str() + " = !" + _srcs[0]->to_str();
    assert(false);
}
std::string Unary::to_llvm_str(int &llvm_temp_cnt) {
    if (_dsts[0]->get_type() == Int) {
        if (_type == UnaryOp::Add) return _dsts[0]->to_llvm_str() + " = add " + type_llvm_string(_srcs[0]->get_type()) + " 0, " + _srcs[0]->to_llvm_str();
        if (_type == UnaryOp::Sub) return _dsts[0]->to_llvm_str() + " = sub " + type_llvm_string(_srcs[0]->get_type()) + " 0, " + _srcs[0]->to_llvm_str();
        
        std::string ret = "";
        if (_type == UnaryOp::Not) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = icmp eq " + type_llvm_string(_srcs[0]->get_type()) + " 0, " + _srcs[0]->to_llvm_str();
        return ret + "\n" + _dsts[0]->to_llvm_str() + " = zext i1 %TT" + std::to_string(llvm_temp_cnt - 1) + " to i32";
    } else {
        if (_type == UnaryOp::Add) return _dsts[0]->to_llvm_str() + " = fadd " + type_llvm_string(_srcs[0]->get_type()) + " 0, " + _srcs[0]->to_llvm_str();
        if (_type == UnaryOp::Sub) return _dsts[0]->to_llvm_str() + " = fsub " + type_llvm_string(_srcs[0]->get_type()) + " 0, " + _srcs[0]->to_llvm_str();
        
        std::string ret = "";
        if (_type == UnaryOp::Not) ret += "%TT" + std::to_string(llvm_temp_cnt ++) + " = fcmp eq " + type_llvm_string(_srcs[0]->get_type()) + " 0, " + _srcs[0]->to_llvm_str();
        return ret + "\n" + _dsts[0]->to_llvm_str() + " = zext i1 %TT" + std::to_string(llvm_temp_cnt - 1) + " to i32";
    }
    assert(false);
}


}

} // EOF ir

} // EOF midend
