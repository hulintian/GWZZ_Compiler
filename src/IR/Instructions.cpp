#include "Instructions.hpp"

namespace IR {
/* User Code Start: Global */

/* User Code End: Global */

// ======================= Start Alloca =======================

std::string AllocaInst::to_str() {
    /* User Code Start: Alloca::to_str */
    return "Alloca " + this->get_name();
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
    return "Load ";
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
    return "Store";
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
    return "Binary ";
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
    return "cvt";
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
    return "Call ";

    /* User Code End: Call::to_str */
}

std::string CallInst::to_llvm() {
    /* User Code Start: Call::to_llvm */
    return "Call ";
    /* User Code End: Call::to_llvm */
}

// ======================= End Call =======================

// ======================= Start GetElementPtr =======================

std::string GetElementPtrInst::to_str() {
    /* User Code Start: GetElementPtr::to_str */
    return "gep";
    /* User Code End: GetElementPtr::to_str */
}

std::string GetElementPtrInst::to_llvm() {
    /* User Code Start: GetElementPtr::to_llvm */
    return "gep";
    /* User Code End: GetElementPtr::to_llvm */
}

// ======================= End GetElementPtr =======================

}
