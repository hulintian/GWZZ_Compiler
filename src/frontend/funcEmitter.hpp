#pragma once

#include "frontend/AST.hpp"
#include "IR/IR.hpp"
#include "IR/temp.hpp"

namespace frontend{

using namespace midend;
using namespace ir;

class FuncEmitter{
private:
    int nextTempId;
    int nextBBId;
    std::vector<ir::BasicBlock*> break_bb_stack;
    std::vector<ir::BasicBlock*> continue_bb_stack;
public:
    ir::Function *func;
    ir::BasicBlock *cur_bb;
    std::unordered_map<std::string, Temp*> global_map;
    FuncEmitter(Module *parent, Type var_type, instruction::Label entry, int numArgs){
        func = new ir::Function(parent, var_type, std::vector<DataMeta*>(), entry.get_label());
        nextTempId = 0;
        nextBBId = 0;
        cur_bb = new_bb();
    };
    virtual ~FuncEmitter() {};

    BasicBlock *new_bb(){
        auto bb = new BasicBlock(func, std::vector<Instruction *>(), nextBBId++);
        func->add_bb(bb);
        return bb;
    }
    int getUsedBB(){ return nextBBId; };

    void new_instruction(Instruction *ins){
        cur_bb->add_inst(ins);
        ins->set_parent(cur_bb);
    }
    int getUsedTemp(){ return nextTempId; };
    Temp *freshTemp(Type type){ return new Temp(nextTempId++, type); }
    ir::Function *visitEnd();
    void openLoop(BasicBlock *break_bb, BasicBlock *continue_bb){
        break_bb_stack.push_back(break_bb);
        continue_bb_stack.push_back(continue_bb);
    }
    void closeLoop(){
        break_bb_stack.pop_back();
        continue_bb_stack.pop_back();
    }
    BasicBlock *getLoopBreakBB(){ return break_bb_stack.back();}
    BasicBlock *getLoopContinueBB(){ return continue_bb_stack.back();}

    void visitAlloca(Temp *temp, Type type);
    Temp *visitAssignment(Temp *dst, Temp *src);
    Temp *visitLiteral(ConstValue immediate, Type type);
    void visitReturn(Temp * ret = nullptr);
    Temp *visitLoadAddr(Type type, std::string name);
    Temp *visitLoad(Type type, Temp *addr, bool not_delete);
    Temp *visitElementPtr(Type type, Temp *addr, std::vector<Temp *> indices);
    Temp *visitStore(Temp *addr, Temp *value, bool not_delete, int offset = 0);
    Temp *visitBinary(BinaryOp op, Temp *lhs, Temp *rhs, Type type);
    Temp *visitUnary(UnaryOp op, Temp *src, Type type);
    Temp *visitCall(ir::Function *func, std::vector<Temp *> args_temp);
    void visitCondBranch(Temp *cond, BasicBlock *true_bb, BasicBlock *false_bb);
    void visitCast(Temp *dst, Temp *src, Type type);
};

} // namespace middleend
