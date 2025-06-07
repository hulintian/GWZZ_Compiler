
#include "funcEmitter.hpp"
#include "IR/CFG.hpp"

namespace frontend{
    using namespace std;

    ir::Function *FuncEmitter::visitEnd(){
        if(func->get_ret_type().base_type == Int){
            auto temp = freshTemp(Int);
            new_instruction(new instruction::LoadImm4(temp, ConstValue(0)));
            new_instruction(new instruction::Return(temp));
        }
        else if(func->get_ret_type().base_type == Float){
            auto temp = freshTemp(Float);
            new_instruction(new instruction::LoadImm4(temp, ConstValue(0.0f)));
            new_instruction(new instruction::Return(temp));
        }
        else{
            new_instruction(new instruction::Return(nullptr));
        }
        func->set_temp_used(getUsedTemp());
        func->set_bb_used(getUsedBB());
        // std::cout << "Function " << func->get_name() << " has " << func->get_bb_used() << " basic blocks and " << func->get_temp_used() << " temps used." << std::endl;
        // func->print(std::cout);
        return func;
    }

    void FuncEmitter::visitAlloca(Temp *temp, Type type){
        new_instruction(new instruction::Alloca(temp, type));
    }

    Temp *FuncEmitter::visitAssignment(Temp *dst, Temp *src){
        new_instruction(new instruction::Assign(dst, src));
        return src;
    }

    Temp *FuncEmitter::visitLiteral(ConstValue immediate, Type type){
        Temp *temp = freshTemp(type);
        new_instruction(new instruction::LoadImm4(temp, immediate));
        return temp;
    }

    void FuncEmitter::visitReturn(Temp * ret){
        new_instruction(new instruction::Return(ret));
        cur_bb = new_bb();
    }

    Temp *FuncEmitter::visitLoadAddr(Type type, std::string name){
        Temp *temp = freshTemp(type);
        new_instruction(new instruction::LoadAddr(temp, name, type));
        return temp;
    }

    Temp *FuncEmitter::visitLoad(Type type, Temp *addr, bool not_delete){
        Temp *temp = freshTemp(type);
        new_instruction(new instruction::Load(temp, addr, not_delete));
        return temp;
    }

    Temp *FuncEmitter::visitElementPtr(Type type, Temp *addr, std::vector<Temp *> indices){
        Temp *temp = freshTemp(type);
        new_instruction(new instruction::ElementPtr(temp, addr, std::vector<Temp *>(indices.begin(), indices.end())));
        return temp;
    }

    Temp *FuncEmitter::visitStore(Temp *addr, Temp *value, bool not_delete, int offset){
        new_instruction(new instruction::Store(addr, value, not_delete, offset));
        return value;
    }

    Temp *FuncEmitter::visitBinary(BinaryOp op, Temp *lhs, Temp *rhs, Type type){
        Temp *temp = freshTemp(type);
        new_instruction(new instruction::Binary(op, temp, lhs, rhs));
        return temp;
    }

    Temp *FuncEmitter::visitUnary(UnaryOp op, Temp *src, Type type){
        Temp *temp = freshTemp(type);
        new_instruction(new instruction::Unary(temp, src, op));
        return temp;
    }

    Temp *FuncEmitter::visitCall(midend::ir::Function *func, std::vector<Temp *> args_temp){
        Temp *temp = nullptr;
        if(func->get_ret_type().base_type != Void)
            temp = freshTemp(func->get_ret_type());
        new_instruction(new instruction::Call(temp, std::vector<Temp *>(args_temp.begin(), args_temp.end()), func));
        return temp;
    }

    void FuncEmitter::visitCondBranch(Temp *cond, BasicBlock *true_bb, BasicBlock *false_bb){
        new_instruction(new instruction::CondBranch(instruction::CondBranch::IR_Instr_BEQ, true_bb, false_bb, cond));
    }

    void FuncEmitter::visitCast(Temp *dst, Temp *src, Type type){
        new_instruction(new instruction::Cast(dst, src, type));
    }

}
