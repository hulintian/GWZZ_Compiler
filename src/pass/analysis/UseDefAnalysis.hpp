#pragma once
#include "Pass.hpp"
#include "Value.hpp"
#include "User.hpp"
#include <map>
#include <vector>

namespace pass {

class UseDefResult : public AnalysisResult {
public:
    // 提供一个接口来获取一个 Value 的所有使用者
    const std::vector<IR::User*>& get_users(const Value* val) const {
        static const std::vector<IR::User*> empty_users; // 静态空vector用于返回
        auto it = use_def_map.find(val);
        if (it != use_def_map.end()) {
            return it->second;
        }
        return empty_users;
    }

private:
    friend class UseDefAnalysisPass;
    // key: Value* (被使用者, Def)
    // value: vector<User*> (使用者列表, Use)
    std::map<const Value*, std::vector<IR::User*>> use_def_map;
};

class UseDefAnalysisPass : public FunctionAnalysisPass {
public:
    using Result = UseDefResult;
    const char* get_name() const override { return "UseDefAnalysis"; }
    std::unique_ptr<AnalysisResult> run(const IR::Function &func, PassManager& pm) override;
};

} 
