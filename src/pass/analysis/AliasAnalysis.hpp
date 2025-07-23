#pragma once

#include "pass/Pass.hpp"
#include "pass/Analysis.hpp"
#include "IR/Value.hpp"

namespace pass{

enum class AliasResult{
    NoAlias,
    MustAlias,
    MayAlias
};

class AliasAnalysisResult : public AnalysisResult{
public:
    virtual AliasResult query(Value* P1,Value* P2){return AliasResult::MayAlias;}
};

class AliasAnalysisPass : public ModuleAnalysisPass{
public:
    using Result = AliasAnalysisResult;
    const char* get_name() const override {return "AliasAnalysis";}
    std::unique_ptr<AnalysisResult> run(const IR::Module &module, PassManager& pm) override;
};

}

