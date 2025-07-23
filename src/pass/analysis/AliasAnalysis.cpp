#include "pass/analysis/AliasAnalysis.hpp"
#include "IR/Instructions.hpp"
#include "IR/GlobalValue.hpp"

namespace pass{

class BasicAliasAnalysisResult : public AliasAnalysisResult{
public:
    AliasResult query(Value* P1,Value* P2) override{
        if(P1 == P2){
            return AliasResult::MustAlias;
        }
        Value* BaseP1 = get_base_pointer(P1);
        Value* BaseP2 = get_base_pointer(P2);
        if (is_memory_allocation(BaseP1) && 
            is_memory_allocation(BaseP2) &&
            BaseP1 != BaseP2) {
            return AliasResult::NoAlias;
        }
        //安全检查
        Type* P1_type = P1->get_type();
        Type* P2_type = P2->get_type();
        if (!P1_type->is_ptr() || !P2_type->is_ptr()) {
            return AliasResult::NoAlias;
        }
        //获取指针所指的元素Type
        Type Type1 = P1->get_type()->get_pointer_element_type();
        Type Type2 = P2->get_type()->get_pointer_element_type();
        //sy好像没有类型转换，直接进行比较
        if (Type1 != Type2) {
            return AliasResult::NoAlias; 
        }
        return AliasResult::MayAlias;
    }
private:
    bool is_memory_allocation(Value* V) {
        return dynamic_cast<IR::AllocaInst*>(V) || dynamic_cast<IR::GlobalValue*>(V);
    }
    Value* get_base_pointer(Value* Ptr) {
        if (auto* GEP = dynamic_cast<IR::GetElementPtrInst*>(Ptr)) {
            //找到GEP的源ptr
            return get_base_pointer(GEP->get_src()); 
        }
        return Ptr;
    }
};

std::unique_ptr<AnalysisResult> AliasAnalysisPass::run(const IR::Module& module, PassManager& pm) {
    return std::make_unique<BasicAliasAnalysisResult>();
}

}

