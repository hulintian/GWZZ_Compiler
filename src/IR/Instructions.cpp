#include "IR/Instructions.hpp"
#include "common/type.hpp"
#include <string>

namespace IR {
/* User Code Start: Global */

/* User Code End: Global */

// ======================= Start Alloca =======================

std::string AllocaInst::to_str(){
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
    Value* src_ptr = this->get_operand(0);

    std::string src_ptr_name = src_ptr ? src_ptr->get_name() : "null_ptr";

    return this->get_name() + " = Load " + src_ptr_name;
    /* User Code End: Load::to_str */
}

std::string LoadInst::to_llvm() {
    /* User Code Start: Load::to_llvm */
    return "Load ";
    /* User Code End: Load::to_llvm */
}

// ======================= End Load =======================

// ======================= Start Store =======================

std::string StoreInst::to_str(){
    /* User Code Start: Store::to_str */
    Value* value_op = this->get_operand(0);
    Value* ptr_op = this->get_operand(1);

    std::string value_name = value_op ? value_op->get_name() : "null_val";
    std::string ptr_name = ptr_op ? ptr_op->get_name() : "null_ptr";

    return "Store " + value_name + " " + ptr_name;
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
    Value* lhs = this->get_operand(0);
    Value* rhs = this->get_operand(1);

    std::string lhs_name = lhs ? lhs->get_name() : "null";
    std::string rhs_name = rhs ? rhs->get_name() : "null";
    return this->get_name() + " = " + op_str + " " + lhs_name + " " + rhs_name;
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
    Value* src_val = this->get_operand(0);
    Type* src_type = this->getsrc_type(); 
    Type* dst_type = this->get_type(); 

    std::string src_name = src_val ? src_val->get_name() : "null_val";
    std::string src_type_str = src_type ? type_string(*src_type) : "null_type";
    std::string dst_type_str = dst_type ? type_string(*dst_type) : "null_type";
    return this->get_name() + " = cvt " + src_type_str + " " + src_name + " to " + dst_type_str;
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
    Value* func_val = this->get_operand(0);
    Function* func = func_val ? static_cast<Function*>(func_val) : nullptr;
    std::string func_name = func ? func->get_func_name() : "null_func";

    std::string args_str = "";
    for (unsigned i = 1; i < this->get_num_operand(); ++i) {
        Value* arg = this->get_operand(i);
        args_str += arg ? arg->get_name() : "null_arg";
        if (i != this->get_num_operand() - 1) {
            args_str += ", ";
        }
    }
    if (this->get_type()->is_void()) {
        return "Call " + func_name + "( " + args_str + " )";
    }
    return this->get_name() + " = Call " + func_name + "( " + args_str + " )";

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
    if (this->get_num_operand() == 0) {
        return "ret";
    }
    Value* ret_val = this->get_operand(0);
    std::string ret_val_name = ret_val ? ret_val->get_name() : "null_val";

    return "ret " + ret_val_name;
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

// ======================= Start Phi =======================

std::string PhiInst::to_str() {
    /* User Code Start: Phi::to_str */
    std::string str = this->get_name() + " = Phi " + type_string(*this->get_type());
    
    for (unsigned i = 0; i < get_num_incoming(); ++i) {
        str += (i == 0) ? " [ " : ", [ ";
        
        Value* val = get_incoming_value(i);
        BasicBlock* bb = get_incoming_block(i);

        // --- 核心修复：添加 nullptr 检查 ---
        if (val) {
            str += val->get_name();
        } else {
            str += "<undef>"; // 或者 "<pending>"
        }
        
        str += ", ";

        if (bb) {
            str += bb->get_name();
        } else {
            str += "<bad_block>";
        }

        str += " ]";
    }
    
    return str;
    /* User Code End: Phi::to_str */
}

std::string PhiInst::to_llvm() {
    /* User Code Start: Phi::to_llvm */
    return "Phi";
    /* User Code End: Phi::to_llvm */
}

// ======================= End Phi =======================

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
