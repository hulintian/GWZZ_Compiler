#include "use_def_analysis.hpp"

namespace midend {

void UseDefAnalysis::build_use_def() {
    def_sets.clear();
    use_sets.clear();
    ir::Function *func = cfg_->get_func();
    for (auto bb : *func->get_basic_blocks()) {
        for (auto inst : *bb->get_insts()) {
            for (auto use : *inst->get_src()) {
                use_sets[use].insert(inst);
            }
            for (auto def : *inst->get_dst()) {
                def_sets[def].insert(inst);
            }
            TypeCase(arraystore, ir::instruction::ArrayStore *, inst) {
                for (auto use : *arraystore->get_used_temps()) {
                    use_sets[use].insert(inst);
                }
            }
            TypeCase(phi, ir::instruction::Phi *, inst) {
                for (auto use : *phi->get_used()) {
                    use_sets[use].insert(inst);
                }
            }
        }
    }
}

void UseDefAnalysis::change_use(Temp* old, Temp* new_temp, ir::Instruction* inst) {
    use_sets[new_temp].insert(inst);
    use_sets[old].erase(inst);
}

void UseDefAnalysis::change_def(Temp* old, Temp* new_temp, ir::Instruction* inst) {
    def_sets[new_temp].insert(inst);
    def_sets[old].erase(inst);
}

std::unordered_map<Temp *, std::unordered_set<ir::Instruction *>> UseDefAnalysis::get_usesets() {
    return use_sets;
}

std::unordered_map<Temp *, std::unordered_set<ir::Instruction *>> UseDefAnalysis::get_defsets() {
    return def_sets;
}

std::unordered_set<ir::Instruction *> UseDefAnalysis::get_useset(Temp *temp) {
    return use_sets[temp];
}

std::unordered_set<ir::Instruction *> UseDefAnalysis::get_defset(Temp *temp) {
    return def_sets[temp];
}

UseDefAnalysis::UseDefAnalysis(CFG *cfg) : cfg_(cfg) {
    build_use_def();
}

void UseDefAnalysis::compute_use_def(ir::Instruction* inst) {
    if (inst->get_dst()->size() > 0)
        def_sets[inst->get_dst()->front()] = {inst};
    for (auto i: *inst->get_src())
        use_sets[i].insert(inst);
}

void UseDefAnalysis::erase_use_def(ir::Instruction* inst) {
    for (auto i: *inst->get_dst())
        def_sets[i].erase(inst);
    for (auto i: *inst->get_src())
        use_sets[i].erase(inst);
}

} // namespace middleend
 
