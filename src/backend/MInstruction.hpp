#pragma once
#include "common/regarch.hpp"

namespace backend {
enum MachineInstrType { 
// Icompute
    ADD,
    SUB,
    AND,
    OR,
    XOR,
    SLL,
    SRA,
    SRL, 
// IArithIMM
    ADDI,
    SUBI,
    ANDI,
    ORI,
    XORI, 
// IArithU
    LUI,
    AUIPC, 
// Load
    LB,
    LH,
    LW,
    LD, 
// Branch 
// Jump
    J, 
// Jump and Link
    JAL,
    JALR,
};

class MachineInstr {

};
// Icompute

class ADDInst : public MachineInstr {
public:
    ADDInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1 ,RiscvReg::Reg rs2  
        /* User Code Start: other add args */

        /* User Code End: other add args */
    ) 
        /* User Code Start: other add init construct */

        /* User Code End: other add init construct */

    {
        /* User Code Start: ADD_Inst construct function */
        // 构造函数实现
        /* User Code End: ADD_Inst construct function */
    }

    /* User Code Start: ADD_Inst methods */
    // 自定义成员函数
    /* User Code End: ADD_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
};

class SUBInst : public MachineInstr {
public:
    SUBInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1 ,RiscvReg::Reg rs2  
        /* User Code Start: other sub args */

        /* User Code End: other sub args */
    ) 
        /* User Code Start: other sub init construct */

        /* User Code End: other sub init construct */

    {
        /* User Code Start: SUB_Inst construct function */

        /* User Code End: SUB_Inst construct function */
    }

    /* User Code Start: SUB_Inst methods */

    /* User Code End: SUB_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
};

class ANDInst : public MachineInstr {
public:
    ANDInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1 ,RiscvReg::Reg rs2  
        /* User Code Start: other and args */

        /* User Code End: other and args */
    ) 
        /* User Code Start: other and init construct */

        /* User Code End: other and init construct */

    {
        /* User Code Start: AND_Inst construct function */

        /* User Code End: AND_Inst construct function */
    }

    /* User Code Start: AND_Inst methods */

    /* User Code End: AND_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
};

class ORInst : public MachineInstr {
public:
    ORInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1 ,RiscvReg::Reg rs2  
        /* User Code Start: other or args */

        /* User Code End: other or args */
    ) 
        /* User Code Start: other or init construct */

        /* User Code End: other or init construct */

    {
        /* User Code Start: OR_Inst construct function */

        /* User Code End: OR_Inst construct function */
    }

    /* User Code Start: OR_Inst methods */

    /* User Code End: OR_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
};

class XORInst : public MachineInstr {
public:
    XORInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1 ,RiscvReg::Reg rs2  
        /* User Code Start: other xor args */

        /* User Code End: other xor args */
    ) 
        /* User Code Start: other xor init construct */

        /* User Code End: other xor init construct */

    {
        /* User Code Start: XOR_Inst construct function */

        /* User Code End: XOR_Inst construct function */
    }

    /* User Code Start: XOR_Inst methods */

    /* User Code End: XOR_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
};

class SLLInst : public MachineInstr {
public:
    SLLInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1 ,RiscvReg::Reg rs2  
        /* User Code Start: other sll args */

        /* User Code End: other sll args */
    ) 
        /* User Code Start: other sll init construct */

        /* User Code End: other sll init construct */

    {
        /* User Code Start: SLL_Inst construct function */

        /* User Code End: SLL_Inst construct function */
    }

    /* User Code Start: SLL_Inst methods */

    /* User Code End: SLL_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
};

class SRAInst : public MachineInstr {
public:
    SRAInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1 ,RiscvReg::Reg rs2  
        /* User Code Start: other sra args */

        /* User Code End: other sra args */
    ) 
        /* User Code Start: other sra init construct */

        /* User Code End: other sra init construct */

    {
        /* User Code Start: SRA_Inst construct function */

        /* User Code End: SRA_Inst construct function */
    }

    /* User Code Start: SRA_Inst methods */

    /* User Code End: SRA_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
};

class SRLInst : public MachineInstr {
public:
    SRLInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1 ,RiscvReg::Reg rs2  
        /* User Code Start: other srl args */

        /* User Code End: other srl args */
    ) 
        /* User Code Start: other srl init construct */

        /* User Code End: other srl init construct */

    {
        /* User Code Start: SRL_Inst construct function */

        /* User Code End: SRL_Inst construct function */
    }

    /* User Code Start: SRL_Inst methods */

    /* User Code End: SRL_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    RiscvReg::Reg _rs2;
};
// IArithIMM

class ADDIInst : public MachineInstr {
public:
    ADDIInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1  ,int32_t imm
        /* User Code Start: other addi args */

        /* User Code End: other addi args */
    ) 
        /* User Code Start: other addi init construct */

        /* User Code End: other addi init construct */

    {
        /* User Code Start: ADDI_Inst construct function */

        /* User Code End: ADDI_Inst construct function */
    }

    /* User Code Start: ADDI_Inst methods */

    /* User Code End: ADDI_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    int32_t _imm;
};

class SUBIInst : public MachineInstr {
public:
    SUBIInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1  ,int32_t imm
        /* User Code Start: other subi args */

        /* User Code End: other subi args */
    ) 
        /* User Code Start: other subi init construct */

        /* User Code End: other subi init construct */

    {
        /* User Code Start: SUBI_Inst construct function */

        /* User Code End: SUBI_Inst construct function */
    }

    /* User Code Start: SUBI_Inst methods */
    // hello
    /* User Code End: SUBI_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    int32_t _imm;
};

class ANDIInst : public MachineInstr {
public:
    ANDIInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1  ,int32_t imm
        /* User Code Start: other andi args */

        /* User Code End: other andi args */
    ) 
        /* User Code Start: other andi init construct */

        /* User Code End: other andi init construct */

    {
        /* User Code Start: ANDI_Inst construct function */

        /* User Code End: ANDI_Inst construct function */
    }

    /* User Code Start: ANDI_Inst methods */

    /* User Code End: ANDI_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    int32_t _imm;
};

class ORIInst : public MachineInstr {
public:
    ORIInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1  ,int32_t imm
        /* User Code Start: other ori args */

        /* User Code End: other ori args */
    ) 
        /* User Code Start: other ori init construct */

        /* User Code End: other ori init construct */

    {
        /* User Code Start: ORI_Inst construct function */

        /* User Code End: ORI_Inst construct function */
    }

    /* User Code Start: ORI_Inst methods */

    /* User Code End: ORI_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    int32_t _imm;
};

class XORIInst : public MachineInstr {
public:
    XORIInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1  ,int32_t imm
        /* User Code Start: other xori args */

        /* User Code End: other xori args */
    ) 
        /* User Code Start: other xori init construct */

        /* User Code End: other xori init construct */

    {
        /* User Code Start: XORI_Inst construct function */

        /* User Code End: XORI_Inst construct function */
    }

    /* User Code Start: XORI_Inst methods */

    /* User Code End: XORI_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
    int32_t _imm;
};
// IArithU

class LUIInst : public MachineInstr {
public:
    LUIInst( MachineInstrType mty ,RiscvReg::Reg rd  ,int32_t imm
        /* User Code Start: other lui args */

        /* User Code End: other lui args */
    ) 
        /* User Code Start: other lui init construct */

        /* User Code End: other lui init construct */

    {
        /* User Code Start: LUI_Inst construct function */

        /* User Code End: LUI_Inst construct function */
    }

    /* User Code Start: LUI_Inst methods */

    /* User Code End: LUI_Inst methods */
    RiscvReg::Reg _rd;
    int32_t _imm;
};

class AUIPCInst : public MachineInstr {
public:
    AUIPCInst( MachineInstrType mty ,RiscvReg::Reg rd  ,int32_t imm
        /* User Code Start: other auipc args */

        /* User Code End: other auipc args */
    ) 
        /* User Code Start: other auipc init construct */

        /* User Code End: other auipc init construct */

    {
        /* User Code Start: AUIPC_Inst construct function */

        /* User Code End: AUIPC_Inst construct function */
    }

    /* User Code Start: AUIPC_Inst methods */

    /* User Code End: AUIPC_Inst methods */
    RiscvReg::Reg _rd;
    int32_t _imm;
};
// Load

class LBInst : public MachineInstr {
public:
    LBInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1  
        /* User Code Start: other lb args */

        /* User Code End: other lb args */
    ) 
        /* User Code Start: other lb init construct */

        /* User Code End: other lb init construct */

    {
        /* User Code Start: LB_Inst construct function */

        /* User Code End: LB_Inst construct function */
    }

    /* User Code Start: LB_Inst methods */

    /* User Code End: LB_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
};

class LHInst : public MachineInstr {
public:
    LHInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1  
        /* User Code Start: other lh args */

        /* User Code End: other lh args */
    ) 
        /* User Code Start: other lh init construct */

        /* User Code End: other lh init construct */

    {
        /* User Code Start: LH_Inst construct function */

        /* User Code End: LH_Inst construct function */
    }

    /* User Code Start: LH_Inst methods */

    /* User Code End: LH_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
};

class LWInst : public MachineInstr {
public:
    LWInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1  
        /* User Code Start: other lw args */

        /* User Code End: other lw args */
    ) 
        /* User Code Start: other lw init construct */

        /* User Code End: other lw init construct */

    {
        /* User Code Start: LW_Inst construct function */

        /* User Code End: LW_Inst construct function */
    }

    /* User Code Start: LW_Inst methods */

    /* User Code End: LW_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
};

class LDInst : public MachineInstr {
public:
    LDInst( MachineInstrType mty ,RiscvReg::Reg rd ,RiscvReg::Reg rs1  
        /* User Code Start: other ld args */

        /* User Code End: other ld args */
    ) 
        /* User Code Start: other ld init construct */

        /* User Code End: other ld init construct */

    {
        /* User Code Start: LD_Inst construct function */

        /* User Code End: LD_Inst construct function */
    }

    /* User Code Start: LD_Inst methods */

    /* User Code End: LD_Inst methods */
    RiscvReg::Reg _rd;
    RiscvReg::Reg _rs1;
};
// Branch
// Jump

class JInst : public MachineInstr {
public:
    JInst( MachineInstrType mty  ,MachineBasicBlock* dst_bb
        /* User Code Start: other j args */

        /* User Code End: other j args */
    ) 
        /* User Code Start: other j init construct */

        /* User Code End: other j init construct */

    {
        /* User Code Start: J_Inst construct function */

        /* User Code End: J_Inst construct function */
    }

    /* User Code Start: J_Inst methods */

    /* User Code End: J_Inst methods */
    MachineBasicBlock* _dst_bb;
};
// Jump and Link

class JALInst : public MachineInstr {
public:
    JALInst( MachineInstrType mty ,RiscvReg::Reg rd  , 
        /* User Code Start: other jal args */

        /* User Code End: other jal args */
    ) 
        /* User Code Start: other jal init construct */

        /* User Code End: other jal init construct */

    {
        /* User Code Start: JAL_Inst construct function */

        /* User Code End: JAL_Inst construct function */
    }

    /* User Code Start: JAL_Inst methods */

    /* User Code End: JAL_Inst methods */
    RiscvReg::Reg _rd;
     _;
};

class JALRInst : public MachineInstr {
public:
    JALRInst( MachineInstrType mty ,RiscvReg::Reg rd  , 
        /* User Code Start: other jalr args */

        /* User Code End: other jalr args */
    ) 
        /* User Code Start: other jalr init construct */

        /* User Code End: other jalr init construct */

    {
        /* User Code Start: JALR_Inst construct function */

        /* User Code End: JALR_Inst construct function */
    }

    /* User Code Start: JALR_Inst methods */

    /* User Code End: JALR_Inst methods */
    RiscvReg::Reg _rd;
     _;
};


}