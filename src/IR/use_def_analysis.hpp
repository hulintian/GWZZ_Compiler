#pragma once

#include "IR/IR.hpp"
#include "IR/CFG.hpp"

namespace midend {

class UseDefAnalysis {
private:
    CFG *cfg_;
    std::unordered_map<Temp *, std::unordered_set<ir::Instruction *>> use_sets; // 使用出现的指令集合
    std::unordered_map<Temp *, std::unordered_set<ir::Instruction *>> def_sets; // 定义出现的指令集合

public:
    void build_use_def();
    std::unordered_map<Temp *, std::unordered_set<ir::Instruction *>> get_usesets();
    std::unordered_map<Temp *, std::unordered_set<ir::Instruction *>> get_defsets();
    std::unordered_set<ir::Instruction *> get_useset(Temp *temp);
    std::unordered_set<ir::Instruction *> get_defset(Temp *temp);
    UseDefAnalysis(CFG *cfg);
    void change_def(Temp* old, Temp* new_temp, ir::Instruction* inst);
    void change_use(Temp* old, Temp* new_temp, ir::Instruction* inst);
    void compute_use_def(ir::Instruction* inst);
    void erase_use_def(ir::Instruction* inst);
};


} // namespace middleend
