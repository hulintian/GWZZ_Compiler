#pragma once
#include "regarch.hpp"
#include "MBasicBlock.hpp"
#include "MFunction.hpp"
#include <sstream>
#include <string>

namespace backend {
enum MachineInstrType { 
// IArith
    ADD,
    SUB,
    AND,
    OR,
    XOR,
    SLL,
    SRA,
    SRL,
    ADDW,
    SUBW, 
// IArithIMM
    ADDI,
    SUBI,
    ANDI,
    ORI,
    XORI,
    SLLI,
    SRAI,
    SRLI, 
// IArithU
    LUI,
    AUIPC, 
// Load
    LB,
    LH,
    LW,
    LD, 
// Move
    MV, 
// LLA
    LLA,
    LA, 
// LI
    LI, 
// Store
    SB,
    SH,
    SW,
    SD, 
// CondSet
    SLT,
    SLTU, 
// CondSetU
    SEQZ,
    SNEZ,
    SLTZ,
    SGTZ, 
// CondSetIMM
    SLTI,
    SGTI, 
// Branch
    BEQ,
    BNE,
    BLT,
    BGE,
    BLTU,
    BGEU,
    BGT,
    BGTU,
    BLE,
    BLEU, 
// BranchU
    BEZ,
    BNEZ,
    BGTZ,
    BLTZ,
    BGEZ,
    BLZE, 
// Jump
    J, 
// JAL
    JAL,
    JALR, 
// Call
    CALL, 
// Return
    RET, 
// Multiply
    MUL,
    MULH,
    MULHSU,
    MULHU,
    MULW,
    DIV,
    DIVU,
    DIVW,
    REM,
    REMU,
    REMW, 
// FArith
    FADD_S,
    FSUB_S,
    FMUL_S,
    FDIV_S,
    FSGNJ_S,
    FSGNJN_S,
    FSGNJX_S,
    FMIN_S,
    FMAX_S, 
// FArithU
    FABS_S,
    FNEG_S,
    FSQRT_S, 
// FCMP
    FEQ_S,
    FLT_S,
    FLE_S, 
// FArithT
    FMADD_S,
    FNMADD_S,
    FMSUB_S,
    FNMSUB_S, 
// FLoad
    FLW,
    FLD, 
// FStore
    FSW,
    FSD, 
// FCVT
    FCVT_S_W,
    FCVT_W_S, 
// FMV
    FMV_S,
    FMV_W_X,
    FMV_X_W,
};

class MachineInstr {
public:
        virtual std::vector<RiscvReg::Reg*> get_srcs() = 0;
        virtual std::vector<RiscvReg::Reg*> get_dsts() = 0;
        virtual std::vector<RiscvReg::Reg*> get_regs() = 0;

        virtual std::string to_asm() = 0;

        MachineInstrType mity;
        MachineBasicBlock* parent;

        // 根据dfs的顺序到给指令的序号
        long long time = 0;

        MachineInstr(MachineInstrType ty, MachineBasicBlock* p): mity(ty), parent(p) {}
};
// IArith

class IArithInst : public MachineInstr {
public:
    IArithInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 , RiscvReg::Reg rs2 
        /* User Code Start: other IArith args */

        /* User Code End: other IArith args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) , _rs2(rs2) 
        /* User Code Start: other IArith init construct */

        /* User Code End: other IArith init construct */

    {
        /* User Code Start: IArithInst construct function */

        /* User Code End: IArith_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1, &_rs2 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::ADD : 
                oss << "add"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::SUB : 
                oss << "sub"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::AND : 
                oss << "and"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::OR : 
                oss << "or"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::XOR : 
                oss << "xor"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::SLL : 
                oss << "sll"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::SRA : 
                oss << "sra"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::SRL : 
                oss << "srl"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::ADDW : 
                oss << "addw"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::SUBW : 
                oss << "subw"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: IArith_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1, &_rs2 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: IArith_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
};
// IArithIMM

class IArithIMMInst : public MachineInstr {
public:
    IArithIMMInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 ,int32_t imm
        /* User Code Start: other IArithIMM args */

        /* User Code End: other IArithIMM args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) , _imm(imm)
        /* User Code Start: other IArithIMM init construct */

        /* User Code End: other IArithIMM init construct */

    {
        /* User Code Start: IArithIMMInst construct function */

        /* User Code End: IArithIMM_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::ADDI : 
                oss << "addi"
                    << " " << _rd<< ", " << _rs1
                        << ", "<<  _imm
                ; 
                break;
            case MachineInstrType::SUBI : 
                oss << "subi"
                    << " " << _rd<< ", " << _rs1
                        << ", "<<  _imm
                ; 
                break;
            case MachineInstrType::ANDI : 
                oss << "andi"
                    << " " << _rd<< ", " << _rs1
                        << ", "<<  _imm
                ; 
                break;
            case MachineInstrType::ORI : 
                oss << "ori"
                    << " " << _rd<< ", " << _rs1
                        << ", "<<  _imm
                ; 
                break;
            case MachineInstrType::XORI : 
                oss << "xori"
                    << " " << _rd<< ", " << _rs1
                        << ", "<<  _imm
                ; 
                break;
            case MachineInstrType::SLLI : 
                oss << "slli"
                    << " " << _rd<< ", " << _rs1
                        << ", "<<  _imm
                ; 
                break;
            case MachineInstrType::SRAI : 
                oss << "srai"
                    << " " << _rd<< ", " << _rs1
                        << ", "<<  _imm
                ; 
                break;
            case MachineInstrType::SRLI : 
                oss << "srli"
                    << " " << _rd<< ", " << _rs1
                        << ", "<<  _imm
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: IArithIMM_Inst methods */
    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }

    /* User Code End: IArithIMM_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    int32_t _imm;
};
// IArithU

class IArithUInst : public MachineInstr {
public:
    IArithUInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd ,int32_t imm
        /* User Code Start: other IArithU args */

        /* User Code End: other IArithU args */
    ) : MachineInstr(mty, p), _rd(rd) , _imm(imm)
        /* User Code Start: other IArithU init construct */

        /* User Code End: other IArithU init construct */

    {
        /* User Code Start: IArithUInst construct function */

        /* User Code End: IArithU_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::LUI : 
                oss << "lui"
                    << " " << _rd
                        << ", "<<  _imm
                ; 
                break;
            case MachineInstrType::AUIPC : 
                oss << "auipc"
                    << " " << _rd
                        << ", "<<  _imm
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: IArithU_Inst methods */
    std::vector<RiscvReg::Reg*> get_srcs() override { return { }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }

    /* User Code End: IArithU_Inst methods */
    RiscvReg::Reg _rd;
    int32_t _imm;
};
// Load

class LoadInst : public MachineInstr {
public:
    LoadInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 ,int32_t offset
        /* User Code Start: other Load args */

        /* User Code End: other Load args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) , _offset(offset)
        /* User Code Start: other Load init construct */

        /* User Code End: other Load init construct */

    {
        /* User Code Start: LoadInst construct function */

        /* User Code End: Load_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::LB : 
                oss << "lb"
                    << " " << _rd<< ", ";
                        oss << _offset << "(" << _rs1  <<  ")";
                ; 
                break;
            case MachineInstrType::LH : 
                oss << "lh"
                    << " " << _rd<< ", ";
                        oss << _offset << "(" << _rs1  <<  ")";
                ; 
                break;
            case MachineInstrType::LW : 
                oss << "lw"
                    << " " << _rd<< ", ";
                        oss << _offset << "(" << _rs1  <<  ")";
                ; 
                break;
            case MachineInstrType::LD : 
                oss << "ld"
                    << " " << _rd<< ", ";
                        oss << _offset << "(" << _rs1  <<  ")";
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: Load_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: Load_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    int32_t _offset;
};
// Move

class MoveInst : public MachineInstr {
public:
    MoveInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 
        /* User Code Start: other Move args */

        /* User Code End: other Move args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) 
        /* User Code Start: other Move init construct */

        /* User Code End: other Move init construct */

    {
        /* User Code Start: MoveInst construct function */

        /* User Code End: Move_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::MV : 
                oss << "mv"
                    << " " << _rd<< ", " << _rs1
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: Move_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: Move_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
};
// LLA

class LLAInst : public MachineInstr {
public:
    LLAInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd ,std::string symbol
        /* User Code Start: other LLA args */

        /* User Code End: other LLA args */
    ) : MachineInstr(mty, p), _rd(rd) , _symbol(symbol)
        /* User Code Start: other LLA init construct */

        /* User Code End: other LLA init construct */

    {
        /* User Code Start: LLAInst construct function */

        /* User Code End: LLA_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::LLA : 
                oss << "lla"
                    << " " << _rd
                        << ", "<<  _symbol
                ; 
                break;
            case MachineInstrType::LA : 
                oss << "la"
                    << " " << _rd
                        << ", "<<  _symbol
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: LLA_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: LLA_Inst methods */
    RiscvReg::Reg _rd;
    std::string _symbol;
};
// LI

class LIInst : public MachineInstr {
public:
    LIInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd ,int imm
        /* User Code Start: other LI args */

        /* User Code End: other LI args */
    ) : MachineInstr(mty, p), _rd(rd) , _imm(imm)
        /* User Code Start: other LI init construct */

        /* User Code End: other LI init construct */

    {
        /* User Code Start: LIInst construct function */

        /* User Code End: LI_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::LI : 
                oss << "li"
                    << " " << _rd
                        << ", "<<  _imm
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: LI_Inst methods */
    std::vector<RiscvReg::Reg*> get_srcs() override { return { }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: LI_Inst methods */
    RiscvReg::Reg _rd;
    int _imm;
};
// Store

class StoreInst : public MachineInstr {
public:
    StoreInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rs1 , RiscvReg::Reg rs2 ,int32_t offset
        /* User Code Start: other Store args */

        /* User Code End: other Store args */
    ) : MachineInstr(mty, p), _rs1(rs1) , _rs2(rs2) , _offset(offset)
        /* User Code Start: other Store init construct */

        /* User Code End: other Store init construct */

    {
        /* User Code Start: StoreInst construct function */

        /* User Code End: Store_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rs1, &_rs2 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::SB : 
                oss << "sb"
                    << " " << _rs1<< ", ";
                        oss << _offset << "(" << _rs2  <<  ")";
                ; 
                break;
            case MachineInstrType::SH : 
                oss << "sh"
                    << " " << _rs1<< ", ";
                        oss << _offset << "(" << _rs2  <<  ")";
                ; 
                break;
            case MachineInstrType::SW : 
                oss << "sw"
                    << " " << _rs1<< ", ";
                        oss << _offset << "(" << _rs2  <<  ")";
                ; 
                break;
            case MachineInstrType::SD : 
                oss << "sd"
                    << " " << _rs1<< ", ";
                        oss << _offset << "(" << _rs2  <<  ")";
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: Store_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1, &_rs2 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { }; }
    /* User Code End: Store_Inst methods */
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
    int32_t _offset;
};
// CondSet

class CondSetInst : public MachineInstr {
public:
    CondSetInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 , RiscvReg::Reg rs2 
        /* User Code Start: other CondSet args */

        /* User Code End: other CondSet args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) , _rs2(rs2) 
        /* User Code Start: other CondSet init construct */

        /* User Code End: other CondSet init construct */

    {
        /* User Code Start: CondSetInst construct function */

        /* User Code End: CondSet_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1, &_rs2 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::SLT : 
                oss << "slt"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::SLTU : 
                oss << "sltu"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: CondSet_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1, &_rs2 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: CondSet_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
};
// CondSetU

class CondSetUInst : public MachineInstr {
public:
    CondSetUInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 
        /* User Code Start: other CondSetU args */

        /* User Code End: other CondSetU args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) 
        /* User Code Start: other CondSetU init construct */

        /* User Code End: other CondSetU init construct */

    {
        /* User Code Start: CondSetUInst construct function */

        /* User Code End: CondSetU_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::SEQZ : 
                oss << "seqz"
                    << " " << _rd<< ", " << _rs1
                ; 
                break;
            case MachineInstrType::SNEZ : 
                oss << "snez"
                    << " " << _rd<< ", " << _rs1
                ; 
                break;
            case MachineInstrType::SLTZ : 
                oss << "sltz"
                    << " " << _rd<< ", " << _rs1
                ; 
                break;
            case MachineInstrType::SGTZ : 
                oss << "sgtz"
                    << " " << _rd<< ", " << _rs1
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: CondSetU_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: CondSetU_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
};
// CondSetIMM

class CondSetIMMInst : public MachineInstr {
public:
    CondSetIMMInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 ,int32_t imm
        /* User Code Start: other CondSetIMM args */

        /* User Code End: other CondSetIMM args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) , _imm(imm)
        /* User Code Start: other CondSetIMM init construct */

        /* User Code End: other CondSetIMM init construct */

    {
        /* User Code Start: CondSetIMMInst construct function */

        /* User Code End: CondSetIMM_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::SLTI : 
                oss << "slti"
                    << " " << _rd<< ", " << _rs1
                        << ", "<<  _imm
                ; 
                break;
            case MachineInstrType::SGTI : 
                oss << "sgti"
                    << " " << _rd<< ", " << _rs1
                        << ", "<<  _imm
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: CondSetIMM_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: CondSetIMM_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    int32_t _imm;
};
// Branch

class BranchInst : public MachineInstr {
public:
    BranchInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rs1 , RiscvReg::Reg rs2 ,MachineBasicBlock* dst_bb
        /* User Code Start: other Branch args */

        /* User Code End: other Branch args */
    ) : MachineInstr(mty, p), _rs1(rs1) , _rs2(rs2) , _dst_bb(dst_bb)
        /* User Code Start: other Branch init construct */

        /* User Code End: other Branch init construct */

    {
        /* User Code Start: BranchInst construct function */

        /* User Code End: Branch_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rs1, &_rs2 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::BEQ : 
                oss << "beq"
                    << " " << _rs1<< ", " << _rs2
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BNE : 
                oss << "bne"
                    << " " << _rs1<< ", " << _rs2
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BLT : 
                oss << "blt"
                    << " " << _rs1<< ", " << _rs2
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BGE : 
                oss << "bge"
                    << " " << _rs1<< ", " << _rs2
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BLTU : 
                oss << "bltu"
                    << " " << _rs1<< ", " << _rs2
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BGEU : 
                oss << "bgeu"
                    << " " << _rs1<< ", " << _rs2
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BGT : 
                oss << "bgt"
                    << " " << _rs1<< ", " << _rs2
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BGTU : 
                oss << "bgtu"
                    << " " << _rs1<< ", " << _rs2
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BLE : 
                oss << "ble"
                    << " " << _rs1<< ", " << _rs2
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BLEU : 
                oss << "bleu"
                    << " " << _rs1<< ", " << _rs2
                        << ", "<<  _dst_bb
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: Branch_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1, &_rs2 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { }; }
    /* User Code End: Branch_Inst methods */
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
    MachineBasicBlock* _dst_bb;
};
// BranchU

class BranchUInst : public MachineInstr {
public:
    BranchUInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rs1 ,MachineBasicBlock* dst_bb
        /* User Code Start: other BranchU args */

        /* User Code End: other BranchU args */
    ) : MachineInstr(mty, p), _rs1(rs1) , _dst_bb(dst_bb)
        /* User Code Start: other BranchU init construct */

        /* User Code End: other BranchU init construct */

    {
        /* User Code Start: BranchUInst construct function */

        /* User Code End: BranchU_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rs1 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::BEZ : 
                oss << "bez"
                    << " " << _rs1
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BNEZ : 
                oss << "bnez"
                    << " " << _rs1
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BGTZ : 
                oss << "bgtz"
                    << " " << _rs1
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BLTZ : 
                oss << "bltz"
                    << " " << _rs1
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BGEZ : 
                oss << "bgez"
                    << " " << _rs1
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::BLZE : 
                oss << "blze"
                    << " " << _rs1
                        << ", "<<  _dst_bb
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: BranchU_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return {  }; }
    /* User Code End: BranchU_Inst methods */
    RiscvReg::Reg _rs1;
    MachineBasicBlock* _dst_bb;
};
// Jump

class JumpInst : public MachineInstr {
public:
    JumpInst( MachineInstrType mty, MachineBasicBlock* p,MachineBasicBlock* dst_bb
        /* User Code Start: other Jump args */

        /* User Code End: other Jump args */
    ) : MachineInstr(mty, p), _dst_bb(dst_bb)
        /* User Code Start: other Jump init construct */

        /* User Code End: other Jump init construct */

    {
        /* User Code Start: JumpInst construct function */

        /* User Code End: Jump_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return {  }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::J : 
                oss << "j"
                        << " "<<  _dst_bb
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: Jump_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return {  }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return {  }; }
    /* User Code End: Jump_Inst methods */
    MachineBasicBlock* _dst_bb;
};
// JAL

class JALInst : public MachineInstr {
public:
    JALInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd ,MachineBasicBlock* dst_bb
        /* User Code Start: other JAL args */

        /* User Code End: other JAL args */
    ) : MachineInstr(mty, p), _rd(rd) , _dst_bb(dst_bb)
        /* User Code Start: other JAL init construct */

        /* User Code End: other JAL init construct */

    {
        /* User Code Start: JALInst construct function */

        /* User Code End: JAL_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::JAL : 
                oss << "jal"
                    << " " << _rd
                        << ", "<<  _dst_bb
                ; 
                break;
            case MachineInstrType::JALR : 
                oss << "jalr"
                    << " " << _rd
                        << ", "<<  _dst_bb
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: JAL_Inst methods */
    std::vector<RiscvReg::Reg*> get_srcs() override { return {  }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }

    /* User Code End: JAL_Inst methods */
    RiscvReg::Reg _rd;
    MachineBasicBlock* _dst_bb;
};
// Call

class CallInst : public MachineInstr {
public:
    CallInst( MachineInstrType mty, MachineBasicBlock* p,MachineFunction* func
        /* User Code Start: other Call args */

        /* User Code End: other Call args */
    ) : MachineInstr(mty, p), _func(func)
        /* User Code Start: other Call init construct */

        /* User Code End: other Call init construct */

    {
        /* User Code Start: CallInst construct function */

        // TODO the call instr need to add _sysy_ for starttime and stoptime
        /* User Code End: Call_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return {  }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::CALL : 
                oss << "call"
                        << " "<<  _func
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: Call_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return {  }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return {  }; }

    /* User Code End: Call_Inst methods */
    MachineFunction* _func;
};
// Return

class ReturnInst : public MachineInstr {
public:
    ReturnInst( MachineInstrType mty, MachineBasicBlock* p
        /* User Code Start: other Return args */

        /* User Code End: other Return args */
    ) : MachineInstr(mty, p)
        /* User Code Start: other Return init construct */

        /* User Code End: other Return init construct */

    {
        /* User Code Start: ReturnInst construct function */

        /* User Code End: Return_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return {  }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::RET : 
                oss << "ret"
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: Return_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return {  }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return {  }; }
    /* User Code End: Return_Inst methods */
};
// Multiply

class MultiplyInst : public MachineInstr {
public:
    MultiplyInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 , RiscvReg::Reg rs2 
        /* User Code Start: other Multiply args */

        /* User Code End: other Multiply args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) , _rs2(rs2) 
        /* User Code Start: other Multiply init construct */

        /* User Code End: other Multiply init construct */

    {
        /* User Code Start: MultiplyInst construct function */

        /* User Code End: Multiply_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1, &_rs2 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::MUL : 
                oss << "mul"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::MULH : 
                oss << "mulh"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::MULHSU : 
                oss << "mulhsu"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::MULHU : 
                oss << "mulhu"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::MULW : 
                oss << "mulw"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::DIV : 
                oss << "div"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::DIVU : 
                oss << "divu"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::DIVW : 
                oss << "divw"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::REM : 
                oss << "rem"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::REMU : 
                oss << "remu"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::REMW : 
                oss << "remw"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: Multiply_Inst methods */
    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1, &_rs2 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }

    /* User Code End: Multiply_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
};
// FArith

class FArithInst : public MachineInstr {
public:
    FArithInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 , RiscvReg::Reg rs2 
        /* User Code Start: other FArith args */

        /* User Code End: other FArith args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) , _rs2(rs2) 
        /* User Code Start: other FArith init construct */

        /* User Code End: other FArith init construct */

    {
        /* User Code Start: FArithInst construct function */

        /* User Code End: FArith_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1, &_rs2 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::FADD_S : 
                oss << "fadd.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::FSUB_S : 
                oss << "fsub.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::FMUL_S : 
                oss << "fmul.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::FDIV_S : 
                oss << "fdiv.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::FSGNJ_S : 
                oss << "fsgnj.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::FSGNJN_S : 
                oss << "fsgnjn.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::FSGNJX_S : 
                oss << "fsgnjx.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::FMIN_S : 
                oss << "fmin.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::FMAX_S : 
                oss << "fmax.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: FArith_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1, &_rs2 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: FArith_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
};
// FArithU

class FArithUInst : public MachineInstr {
public:
    FArithUInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 
        /* User Code Start: other FArithU args */

        /* User Code End: other FArithU args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) 
        /* User Code Start: other FArithU init construct */

        /* User Code End: other FArithU init construct */

    {
        /* User Code Start: FArithUInst construct function */

        /* User Code End: FArithU_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::FABS_S : 
                oss << "fabs.s"
                    << " " << _rd<< ", " << _rs1
                ; 
                break;
            case MachineInstrType::FNEG_S : 
                oss << "fneg.s"
                    << " " << _rd<< ", " << _rs1
                ; 
                break;
            case MachineInstrType::FSQRT_S : 
                oss << "fsqrt.s"
                    << " " << _rd<< ", " << _rs1
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: FArithU_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: FArithU_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
};
// FCMP

class FCMPInst : public MachineInstr {
public:
    FCMPInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 , RiscvReg::Reg rs2 
        /* User Code Start: other FCMP args */

        /* User Code End: other FCMP args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) , _rs2(rs2) 
        /* User Code Start: other FCMP init construct */

        /* User Code End: other FCMP init construct */

    {
        /* User Code Start: FCMPInst construct function */

        /* User Code End: FCMP_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1, &_rs2 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::FEQ_S : 
                oss << "feq.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::FLT_S : 
                oss << "flt.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;
            case MachineInstrType::FLE_S : 
                oss << "fle.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: FCMP_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1, &_rs2 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: FCMP_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
};
// FArithT

class FArithTInst : public MachineInstr {
public:
    FArithTInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 , RiscvReg::Reg rs2 , RiscvReg::Reg rs3 
        /* User Code Start: other FArithT args */

        /* User Code End: other FArithT args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) , _rs2(rs2) , _rs3(rs3) 
        /* User Code Start: other FArithT init construct */

        /* User Code End: other FArithT init construct */

    {
        /* User Code Start: FArithTInst construct function */

        /* User Code End: FArithT_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1, &_rs2, &_rs3 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::FMADD_S : 
                oss << "fmadd.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2<< ", " << _rs3
                ; 
                break;
            case MachineInstrType::FNMADD_S : 
                oss << "fnmadd.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2<< ", " << _rs3
                ; 
                break;
            case MachineInstrType::FMSUB_S : 
                oss << "fmsub.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2<< ", " << _rs3
                ; 
                break;
            case MachineInstrType::FNMSUB_S : 
                oss << "fnmsub.s"
                    << " " << _rd<< ", " << _rs1<< ", " << _rs2<< ", " << _rs3
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: FArithT_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1, &_rs2, &_rs3 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: FArithT_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
    RiscvReg::Reg _rs3;
};
// FLoad

class FLoadInst : public MachineInstr {
public:
    FLoadInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 ,int32_t offset
        /* User Code Start: other FLoad args */

        /* User Code End: other FLoad args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) , _offset(offset)
        /* User Code Start: other FLoad init construct */

        /* User Code End: other FLoad init construct */

    {
        /* User Code Start: FLoadInst construct function */

        /* User Code End: FLoad_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::FLW : 
                oss << "flw"
                    << " " << _rd<< ", ";
                        oss << _offset << "(" << _rs1  <<  ")";
                ; 
                break;
            case MachineInstrType::FLD : 
                oss << "fld"
                    << " " << _rd<< ", ";
                        oss << _offset << "(" << _rs1  <<  ")";
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: FLoad_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: FLoad_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    int32_t _offset;
};
// FStore

class FStoreInst : public MachineInstr {
public:
    FStoreInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rs1 , RiscvReg::Reg rs2 ,int32_t offset
        /* User Code Start: other FStore args */

        /* User Code End: other FStore args */
    ) : MachineInstr(mty, p), _rs1(rs1) , _rs2(rs2) , _offset(offset)
        /* User Code Start: other FStore init construct */

        /* User Code End: other FStore init construct */

    {
        /* User Code Start: FStoreInst construct function */

        /* User Code End: FStore_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rs1, &_rs2 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::FSW : 
                oss << "fsw"
                    << " " << _rs1<< ", ";
                        oss << _offset << "(" << _rs2  <<  ")";
                ; 
                break;
            case MachineInstrType::FSD : 
                oss << "fsd"
                    << " " << _rs1<< ", ";
                        oss << _offset << "(" << _rs2  <<  ")";
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: FStore_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1, &_rs2 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { }; }
    /* User Code End: FStore_Inst methods */
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
    int32_t _offset;
};
// FCVT

class FCVTInst : public MachineInstr {
public:
    FCVTInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 
        /* User Code Start: other FCVT args */

        /* User Code End: other FCVT args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) 
        /* User Code Start: other FCVT init construct */

        /* User Code End: other FCVT init construct */

    {
        /* User Code Start: FCVTInst construct function */

        /* User Code End: FCVT_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::FCVT_S_W : 
                oss << "fcvt.s.w"
                    << " " << _rd<< ", " << _rs1 << ", rtz"
                ; 
                break;
            case MachineInstrType::FCVT_W_S : 
                oss << "fcvt.w.s"
                    << " " << _rd<< ", " << _rs1 << ", rtz"
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: FCVT_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: FCVT_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
};
// FMV

class FMVInst : public MachineInstr {
public:
    FMVInst( MachineInstrType mty, MachineBasicBlock* p, RiscvReg::Reg rd , RiscvReg::Reg rs1 
        /* User Code Start: other FMV args */

        /* User Code End: other FMV args */
    ) : MachineInstr(mty, p), _rd(rd) , _rs1(rs1) 
        /* User Code Start: other FMV init construct */

        /* User Code End: other FMV init construct */

    {
        /* User Code Start: FMVInst construct function */

        /* User Code End: FMV_Inst construct function */
    }

    std::vector<RiscvReg::Reg*> get_regs() override { return { &_rd, &_rs1 }; }

    std::string to_asm() override { 
        std::ostringstream oss; 
        switch(this->mity) {
            case MachineInstrType::FMV_S : 
                oss << "fmv.s"
                    << " " << _rd<< ", " << _rs1
                ; 
                break;
            case MachineInstrType::FMV_W_X : 
                oss << "fmv.w.x"
                    << " " << _rd<< ", " << _rs1
                ; 
                break;
            case MachineInstrType::FMV_X_W : 
                oss << "fmv.x.w"
                    << " " << _rd<< ", " << _rs1
                ; 
                break;default : break;
        }
        return oss.str();
    }

    /* User Code Start: FMV_Inst methods */

    std::vector<RiscvReg::Reg*> get_srcs() override { return { &_rs1 }; }
    std::vector<RiscvReg::Reg*> get_dsts() override { return { &_rd }; }
    /* User Code End: FMV_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
};
}
