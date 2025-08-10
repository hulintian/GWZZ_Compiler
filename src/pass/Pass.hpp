#pragma once
#include <memory> 
#include "Analysis.hpp"
namespace IR{
class Module;
class Function;
}


namespace pass{
class PassManager;

class Pass{
public:
    virtual ~Pass()=default;
    virtual const char* get_name() const = 0;
};

class TransformPass : public Pass{
public:
    ~TransformPass() override = default;
};
class ModuleTransformPass : public TransformPass{
public:
    ~ModuleTransformPass() override = default;
    virtual bool run(IR::Module& module, PassManager& pm) = 0;
};
class FunctionTransformPass : public TransformPass{
public:
    ~FunctionTransformPass() override = default;
    virtual bool run(IR::Function& function,PassManager& pm) = 0;
};



class AnalysisPass : public Pass{
public:
    ~AnalysisPass() override = default;
};

class ModuleAnalysisPass : public AnalysisPass{
public:
    ~ModuleAnalysisPass() override = default;
    virtual std::unique_ptr<AnalysisResult> run(const IR::Module& module, PassManager& pm) = 0;
};
class FunctionAnalysisPass : public AnalysisPass {
public:
    ~FunctionAnalysisPass() override = default;
    virtual std::unique_ptr<AnalysisResult> run(const IR::Function& function, PassManager& pm) = 0;
};

}
