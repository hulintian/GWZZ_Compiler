#include "IR/Instructions.hpp"
#include "common/type.hpp"
#include <string>

namespace IR {
/* User Code Start: Global */

/* User Code End: Global */

// ======================= Start Alloca =======================

std::string AllocaInst::to_str() {
    /* User Code Start: Alloca::to_str */
    // auto ty = this->get_type();
    return "Alloca " + this->get_name() + " " + type_string(*this->get_type()) + ", align " + std::to_string(this->_alignment) ;
    /* User Code End: Alloca::to_str */
}

std::string AllocaInst::to_llvm() {
    /* User Code Start: Alloca::to_llvm */
    return "Alloca ";
    /* User Code End: Alloca::to_llvm */
}

void AllocaInst::dump() {
    /* User Code Start: Alloca::dump */

    /* User Code End: Alloca::dump */
}

// ======================= End Alloca =======================

// ======================= Start Load =======================

std::string LoadInst::to_str() {
    /* User Code Start: Load::to_str */
    std::string dst = "Unknow";
    if(this->get_src()) {
        dst = this->get_src()->get_name();
    }
    return this->get_name() + " = Load " + dst;
    /* User Code End: Load::to_str */
}

std::string LoadInst::to_llvm() {
    /* User Code Start: Load::to_llvm */
    return "Load ";
    /* User Code End: Load::to_llvm */
}

// ======================= End Load =======================

// ======================= Start Store =======================

std::string StoreInst::to_str() {
    /* User Code Start: Store::to_str */
    std::string dst = "none", src = "none";
    if(this->get_dst()) {
        dst = this->get_dst()->get_name();
    }
    if(this->get_src()) {
        src = this->get_src()->get_name();
    }
    return "Store " + src + " " + dst;
    /* User Code End: Store::to_str */
}

std::string StoreInst::to_llvm() {
    /* User Code Start: Store::to_llvm */
    return "Store";
    /* User Code End: Store::to_llvm */
}

// ======================= End Store =======================

// ======================= Start Binary =======================

std::string BinaryInst::to_str() {
    /* User Code Start: Binary::to_str */
    std::string op_str;
    switch(this->get_instr_type()) {
        case add: op_str = "add"; break;
        case sub: op_str = "sub"; break;
        case mul: op_str = "mul"; break;
        case udiv: op_str = "udiv"; break;
        case sdiv: op_str = "sdiv"; break;
        case urem: op_str = "urem"; break;
        case srem: op_str = "srem"; break;
        case fadd: op_str = "fadd"; break;
        case fsub: op_str = "fsub"; break;
        case fmul: op_str = "fmul"; break;
        case fdiv: op_str = "fdiv"; break;
        case frem: op_str = "frem"; break;
        case iand: op_str = "and"; break;
        case ior: op_str = "or"; break;
        case ixor: op_str = "xor"; break;
        case icmp: op_str = "icmp"; break;
        case eq: op_str = "icmp eq"; break;
        case ne: op_str = "icmp ne"; break;
        case gt: op_str = "icmp gt"; break;
        case lt: op_str = "icmp lt"; break;
        case ge: op_str = "icmp ge"; break;
        case le: op_str = "icmp le"; break;
        case fcmp: op_str = "fcmp"; break;
        case oeq: op_str = "fcmp oeq"; break;
        case one: op_str = "fcmp one"; break;
        case ogt: op_str = "fcmp ogt"; break;
        case olt: op_str = "fcmp olt"; break;
        case oge: op_str = "fcmp oge"; break;
        case ole: op_str = "fcmp ole"; break;
        case lshr: op_str = "lshr"; break;
        case ashr: op_str = "ashr"; break;
        case shl: op_str = "shl"; break;
        case fshr: op_str = "fshr"; break;
        default: op_str = "unknown_binary_op"; break;
    }
    return this->get_name() + " = " + op_str + " " + this->get_lhs()->get_name() + " " + this->get_rhs()->get_name();
    /* User Code End: Binary::to_str */
}

std::string BinaryInst::to_llvm() {
    /* User Code Start: Binary::to_llvm */
    return "Binary ";
    /* User Code End: Binary::to_llvm */
}

// ======================= End Binary =======================

// ======================= Start Convert =======================

std::string ConvertInst::to_str() {
    /* User Code Start: Convert::to_str */
    return this->get_name() + " = cvt " + type_string(*this->getsrc_type()) + " " + this->getsrc()->get_name() + " " + type_string(*this->getdst_type());
    /* User Code End: Convert::to_str */
}

std::string ConvertInst::to_llvm() {
    /* User Code Start: Convert::to_llvm */

    return "cvt";
    /* User Code End: Convert::to_llvm */
}

// ======================= End Convert =======================

// ======================= Start Call =======================

std::string CallInst::to_str() {
    /* User Code Start: Call::to_str */
    std::string args_str = "";
    for(int i=0; i<this->_args.size(); i++) {
        args_str += this->_args[i]->get_name();
        if(i != this->_args.size()-1) {
            args_str += ", ";
        }
    }
    return this->get_name() + " = Call " + this->get_func()->get_func_name() + "( " + args_str + " )" ;

    /* User Code End: Call::to_str */
}

std::string CallInst::to_llvm() {
    /* User Code Start: Call::to_llvm */
    return "Call ";
    /* User Code End: Call::to_llvm */
}

// ======================= End Call =======================

// ======================= Start Return =======================

std::string ReturnInst::to_str() {
    /* User Code Start: Return::to_str */
    std::string rv = "";
    if(this->get_ret_val()) {
        rv = this->get_ret_val()->get_name();
    }
    return "ret " + rv;
    /* User Code End: Return::to_str */
}

std::string ReturnInst::to_llvm() {
    /* User Code Start: Return::to_llvm */

    /* User Code End: Return::to_llvm */
}

// ======================= End Return =======================

// ======================= Start GetElementPtr =======================

std::string GetElementPtrInst::to_str() {
    /* User Code Start: GetElementPtr::to_str */
    std::string ty = " unknow ", idx = "", src = " unknow source ";
    if(this->get_arr_type()) {
        ty = type_string(*this->get_arr_type());
    }
    
    for(auto i : this->get_indices()) {
        idx += " [ " + i->get_name() + " ] ";
        
    }
    if(this->get_src()) {
        src = this->get_src()->get_name();
    }
    return this->get_name() + " = gep " + ty + " " + src + ", " + idx; 
    /* User Code End: GetElementPtr::to_str */
}

std::string GetElementPtrInst::to_llvm() {
    /* User Code Start: GetElementPtr::to_llvm */
    return "gep";
    /* User Code End: GetElementPtr::to_llvm */
}

// ======================= End GetElementPtr =======================

// ======================= Start Phi .By Sasara=======================

std::string PhiInst::to_str() {
    /* User Code Start: Phi::to_str */
    std::string str = this->get_name() + " = Phi " + type_string(*this->get_type());
    for (size_t i = 0; i < _candidate_bbs.size(); ++i) {
        str += (i == 0 ? " " : ", ");
        str += "[ " + _candidate_vars[i]->get_name() + ", %" + _candidate_bbs[i]->get_name() + " ]";
    }
    return str;
    /* User Code End: Phi::to_str */
}

std::string PhiInst::to_llvm() {
    /* User Code Start: Phi::to_llvm */
    return "Phi";
    /* User Code End: Phi::to_llvm */
}

// ======================= End Phi .By Sasara=======================

// ======================= Start CondBranch =======================

std::string CondBranchInst::to_str() {
    /* User Code Start: CondBranch::to_str */
    return "cond br " + this->get_cond()->get_name() + " " + this->get_true_bb()->get_name() + " " + this->get_false_bb()->get_name() ;
    /* User Code End: CondBranch::to_str */
}

std::string CondBranchInst::to_llvm() {
    /* User Code Start: CondBranch::to_llvm */

    /* User Code End: CondBranch::to_llvm */
}

// ======================= End CondBranch =======================

// ======================= Start Branch =======================

std::string BranchInst::to_str() {
    /* User Code Start: Branch::to_str */
    return "br " + this->get_dst_bb()->get_name();
    /* User Code End: Branch::to_str */
}

std::string BranchInst::to_llvm() {
    /* User Code Start: Branch::to_llvm */

    /* User Code End: Branch::to_llvm */
}

// ======================= End Branch =======================

}
