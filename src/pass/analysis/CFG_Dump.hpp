#pragma once
#include "Pass.hpp"
#include <memory>

namespace pass {

class CFG_AnalysisResult : public AnalysisResult {
private:
    /* data */
public:
    CFG_AnalysisResult();
    ~CFG_AnalysisResult() = default;
};

class CFG_Dump : public ModuleAnalysisPass {
public:
    CFG_Dump(){}
    const char* get_name() const override { return "CFG_Dump"; }
    std::unique_ptr<AnalysisResult> run(const IR::Module& m, PassManager& pm) override;

    void dump_cfg_dot(std::ofstream& out);
    void dump_func_cfg(const IR::Function* f, std::ofstream& out);
private:
    const IR::Module* _m;
    PassManager* _pm;
};

}
