#pragma once
#include <functional>
#include <map>
#include <set>
#include <utility>
#include <vector>
#include "backend/program.hpp"
#include "backend/instr.hpp"
#include "common/regarch.hpp"
#include <unordered_map>

namespace backend{
namespace riscv {

using namespace RiscvReg;
using namespace RiscvInstr;

class ColoringRegAllocator {
    // interference graph
    /// @brief adjacency list representation of the graph
    std::map<Reg, std::set<Reg>> adjList;
    /// @brief the set of interference edges (u, v) in the graph
    std::set<std::pair<Reg, Reg>> adjSet;
    /// @brief an array containing the current degree of each node
    std::map<Reg, int> degree;

    /// @brief when a move (u, v) has been coalesced, and v put in coalescedNodes, then alias(v) = u
    std::map<Reg, Reg> alias;
    /// @brief a mapping from node to the list of moves it is associated with
    std::map<Reg, std::set<Move *>> moveList;

    // every reg can only be in exactly one sets below
    /// @brief list of low-degree non-move-related nodes
    std::set<Reg> simplifyWorklist;
    /// @brief low-degree move-related nodes
    std::set<Reg> freezeWorklist;
    /// @brief high-degree nodes
    std::set<Reg> spillWorklist;
    /// @brief nodes marked for spilling during this round; initially empty
    std::set<Reg> spilledNodes;
    /// @brief registers that have been coalesced
    std::set<Reg> coalescedNodes;
    /// @brief nodes successfully colored
    std::set<Reg> coloredNodes;
    /// @brief stack containing temporaries removed from the graph
    std::vector<Reg> selectStack;

    // Move Sets, every move should be in exactly one of the following sets
    /// @brief moves that have been coalesced
    std::set<Move *> coalescedMoves;
    /// @brief moves whose source and target interfere
    std::set<Move *> constrainedMoves;
    /// @brief moves that will no longer be considered for coalescing
    std::set<Move *> frozenMoves;
    /// @brief moves enabled for possible coalescing
    std::set<Move *> worklistMoves;
    /// @brief moves not yet ready for coalescing
    std::set<Move *> activeMoves;

    std::map<Reg, double> load_weight, store_weight;

    double get_spill_cost(Reg r);

    Function* func;
    int K; // 可用于分配的物理寄存器数量
    std::set<Reg> spillingRegs;
    std::map<Reg, int> spilled_regs_map; // map for offset of spilling onto stack
    int spillsize;

    void init(Function *func, bool is_gp_pass);

    void Build();
    void MkWorklist();
    void Simplify();
    void Coalesce();
    void Freeze();
    void SelectSpill();
    std::map<Reg, int> AssignColors();
    void replace_virtual_regs(const std::map<Reg, int>&, bool);
    void AddEdge(Reg u, Reg v);
    std::set<Reg> Adjacent(Reg n) const;
    std::set<Move*> NodeMoves(Reg n) const;
    bool MoveRelated(Reg n) const;
    void DecrementDegree(Reg m);
    void EnableMoves(const std::set<Reg>& nodes);
    void AddWorkList(Reg u);
    bool OK(Reg t, Reg r) const;
    bool Conservative(const std::set<Reg> &nodes) const;
    Reg GetAlias(Reg n) const;
    void Combine(Reg u, Reg v);
    void FreezeMoves(Reg u);
    void SaveSpilled(const std::set<Reg> &nodes);
    bool is_pg_pass;
    std::unordered_map<BasicBlock*, int> cur_fp_offset;

public:
    std::set<Reg> used_reg;
    void alloc_reg(Function *func, bool is_gp_pass);
    int spill_size() {return spillsize;}
    // int get_cur_fp_offset() {return cur_fp_offset;}
};


} // namespace riscv

} // namespace backend