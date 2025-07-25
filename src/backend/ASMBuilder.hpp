#pragma once 
#include "backend/MInstruction.hpp"
#include "backend/miscs.hpp"

namespace backend {
class ASMBuilder {
public:
    ASMBuilder(MCtx* ctx) : mctx(ctx) {}

    /* User Code Start: code space 1 */

    /* User Code End: code space 1 */ 
    // IArith
        MachineInstr* create_ADD(
        /* User Code Start: add args */

        /* User Code End: add args */
        ) {
        /* User Code Start: add func */
            return nullptr;
        /* User Code End: add func */
        }
        MachineInstr* create_SUB(
        /* User Code Start: sub args */

        /* User Code End: sub args */
        ) {
        /* User Code Start: sub func */
            return nullptr;
        /* User Code End: sub func */
        }
        MachineInstr* create_AND(
        /* User Code Start: and args */

        /* User Code End: and args */
        ) {
        /* User Code Start: and func */
            return nullptr;
        /* User Code End: and func */
        }
        MachineInstr* create_OR(
        /* User Code Start: or args */

        /* User Code End: or args */
        ) {
        /* User Code Start: or func */
            return nullptr;
        /* User Code End: or func */
        }
        MachineInstr* create_XOR(
        /* User Code Start: xor args */

        /* User Code End: xor args */
        ) {
        /* User Code Start: xor func */
            return nullptr;
        /* User Code End: xor func */
        }
        MachineInstr* create_SLL(
        /* User Code Start: sll args */

        /* User Code End: sll args */
        ) {
        /* User Code Start: sll func */
            return nullptr;
        /* User Code End: sll func */
        }
        MachineInstr* create_SRA(
        /* User Code Start: sra args */

        /* User Code End: sra args */
        ) {
        /* User Code Start: sra func */
            return nullptr;
        /* User Code End: sra func */
        }
        MachineInstr* create_SRL(
        /* User Code Start: srl args */

        /* User Code End: srl args */
        ) {
        /* User Code Start: srl func */
            return nullptr;
        /* User Code End: srl func */
        } 
    // IArithIMM
        MachineInstr* create_ADDI(
        /* User Code Start: addi args */

        /* User Code End: addi args */
        ) {
        /* User Code Start: addi func */
            return nullptr;
        /* User Code End: addi func */
        }
        MachineInstr* create_SUBI(
        /* User Code Start: subi args */

        /* User Code End: subi args */
        ) {
        /* User Code Start: subi func */
            return nullptr;
        /* User Code End: subi func */
        }
        MachineInstr* create_ANDI(
        /* User Code Start: andi args */

        /* User Code End: andi args */
        ) {
        /* User Code Start: andi func */
            return nullptr;
        /* User Code End: andi func */
        }
        MachineInstr* create_ORI(
        /* User Code Start: ori args */

        /* User Code End: ori args */
        ) {
        /* User Code Start: ori func */
            return nullptr;
        /* User Code End: ori func */
        }
        MachineInstr* create_XORI(
        /* User Code Start: xori args */

        /* User Code End: xori args */
        ) {
        /* User Code Start: xori func */
            return nullptr;
        /* User Code End: xori func */
        }
        MachineInstr* create_SLLI(
        /* User Code Start: slli args */

        /* User Code End: slli args */
        ) {
        /* User Code Start: slli func */
            return nullptr;
        /* User Code End: slli func */
        }
        MachineInstr* create_SRAI(
        /* User Code Start: srai args */

        /* User Code End: srai args */
        ) {
        /* User Code Start: srai func */
            return nullptr;
        /* User Code End: srai func */
        }
        MachineInstr* create_SRLI(
        /* User Code Start: srli args */

        /* User Code End: srli args */
        ) {
        /* User Code Start: srli func */
            return nullptr;
        /* User Code End: srli func */
        } 
    // IArithU
        MachineInstr* create_LUI(
        /* User Code Start: lui args */

        /* User Code End: lui args */
        ) {
        /* User Code Start: lui func */
            return nullptr;
        /* User Code End: lui func */
        }
        MachineInstr* create_AUIPC(
        /* User Code Start: auipc args */

        /* User Code End: auipc args */
        ) {
        /* User Code Start: auipc func */
            return nullptr;
        /* User Code End: auipc func */
        } 
    // Load
        MachineInstr* create_LB(
        /* User Code Start: lb args */

        /* User Code End: lb args */
        ) {
        /* User Code Start: lb func */
            return nullptr;
        /* User Code End: lb func */
        }
        MachineInstr* create_LH(
        /* User Code Start: lh args */

        /* User Code End: lh args */
        ) {
        /* User Code Start: lh func */
            return nullptr;
        /* User Code End: lh func */
        }
        MachineInstr* create_LW(
        /* User Code Start: lw args */

        /* User Code End: lw args */
        ) {
        /* User Code Start: lw func */
            return nullptr;
        /* User Code End: lw func */
        }
        MachineInstr* create_LD(
        /* User Code Start: ld args */

        /* User Code End: ld args */
        ) {
        /* User Code Start: ld func */
            return nullptr;
        /* User Code End: ld func */
        } 
    // LLA
        MachineInstr* create_LLA(
        /* User Code Start: lla args */

        /* User Code End: lla args */
        ) {
        /* User Code Start: lla func */
            return nullptr;
        /* User Code End: lla func */
        } 
    // Store
        MachineInstr* create_SB(
        /* User Code Start: sb args */

        /* User Code End: sb args */
        ) {
        /* User Code Start: sb func */
            return nullptr;
        /* User Code End: sb func */
        }
        MachineInstr* create_SH(
        /* User Code Start: sh args */

        /* User Code End: sh args */
        ) {
        /* User Code Start: sh func */
            return nullptr;
        /* User Code End: sh func */
        }
        MachineInstr* create_SW(
        /* User Code Start: sw args */

        /* User Code End: sw args */
        ) {
        /* User Code Start: sw func */
            return nullptr;
        /* User Code End: sw func */
        }
        MachineInstr* create_SD(
        /* User Code Start: sd args */

        /* User Code End: sd args */
        ) {
        /* User Code Start: sd func */
            return nullptr;
        /* User Code End: sd func */
        } 
    // CondSet
        MachineInstr* create_SLT(
        /* User Code Start: slt args */

        /* User Code End: slt args */
        ) {
        /* User Code Start: slt func */
            return nullptr;
        /* User Code End: slt func */
        }
        MachineInstr* create_SLTU(
        /* User Code Start: sltu args */

        /* User Code End: sltu args */
        ) {
        /* User Code Start: sltu func */
            return nullptr;
        /* User Code End: sltu func */
        } 
    // CondSetU
        MachineInstr* create_SEQZ(
        /* User Code Start: seqz args */

        /* User Code End: seqz args */
        ) {
        /* User Code Start: seqz func */
            return nullptr;
        /* User Code End: seqz func */
        }
        MachineInstr* create_SNEZ(
        /* User Code Start: snez args */

        /* User Code End: snez args */
        ) {
        /* User Code Start: snez func */
            return nullptr;
        /* User Code End: snez func */
        }
        MachineInstr* create_SLTZ(
        /* User Code Start: sltz args */

        /* User Code End: sltz args */
        ) {
        /* User Code Start: sltz func */
            return nullptr;
        /* User Code End: sltz func */
        }
        MachineInstr* create_SGTZ(
        /* User Code Start: sgtz args */

        /* User Code End: sgtz args */
        ) {
        /* User Code Start: sgtz func */
            return nullptr;
        /* User Code End: sgtz func */
        } 
    // CondSetIMM
        MachineInstr* create_SLTI(
        /* User Code Start: slti args */

        /* User Code End: slti args */
        ) {
        /* User Code Start: slti func */
            return nullptr;
        /* User Code End: slti func */
        }
        MachineInstr* create_SGTI(
        /* User Code Start: sgti args */

        /* User Code End: sgti args */
        ) {
        /* User Code Start: sgti func */
            return nullptr;
        /* User Code End: sgti func */
        } 
    // Branch
        MachineInstr* create_BEQ(
        /* User Code Start: beq args */

        /* User Code End: beq args */
        ) {
        /* User Code Start: beq func */
            return nullptr;
        /* User Code End: beq func */
        }
        MachineInstr* create_BNE(
        /* User Code Start: bne args */

        /* User Code End: bne args */
        ) {
        /* User Code Start: bne func */
            return nullptr;
        /* User Code End: bne func */
        }
        MachineInstr* create_BLT(
        /* User Code Start: blt args */

        /* User Code End: blt args */
        ) {
        /* User Code Start: blt func */
            return nullptr;
        /* User Code End: blt func */
        }
        MachineInstr* create_BGE(
        /* User Code Start: bge args */

        /* User Code End: bge args */
        ) {
        /* User Code Start: bge func */
            return nullptr;
        /* User Code End: bge func */
        }
        MachineInstr* create_BLTU(
        /* User Code Start: bltu args */

        /* User Code End: bltu args */
        ) {
        /* User Code Start: bltu func */
            return nullptr;
        /* User Code End: bltu func */
        }
        MachineInstr* create_BGEU(
        /* User Code Start: bgeu args */

        /* User Code End: bgeu args */
        ) {
        /* User Code Start: bgeu func */
            return nullptr;
        /* User Code End: bgeu func */
        }
        MachineInstr* create_BGT(
        /* User Code Start: bgt args */

        /* User Code End: bgt args */
        ) {
        /* User Code Start: bgt func */
            return nullptr;
        /* User Code End: bgt func */
        }
        MachineInstr* create_BGTU(
        /* User Code Start: bgtu args */

        /* User Code End: bgtu args */
        ) {
        /* User Code Start: bgtu func */
            return nullptr;
        /* User Code End: bgtu func */
        }
        MachineInstr* create_BLE(
        /* User Code Start: ble args */

        /* User Code End: ble args */
        ) {
        /* User Code Start: ble func */
            return nullptr;
        /* User Code End: ble func */
        }
        MachineInstr* create_BLEU(
        /* User Code Start: bleu args */

        /* User Code End: bleu args */
        ) {
        /* User Code Start: bleu func */
            return nullptr;
        /* User Code End: bleu func */
        } 
    // BranchU
        MachineInstr* create_BEZ(
        /* User Code Start: bez args */

        /* User Code End: bez args */
        ) {
        /* User Code Start: bez func */
            return nullptr;
        /* User Code End: bez func */
        }
        MachineInstr* create_BNEZ(
        /* User Code Start: bnez args */

        /* User Code End: bnez args */
        ) {
        /* User Code Start: bnez func */
            return nullptr;
        /* User Code End: bnez func */
        }
        MachineInstr* create_BGTZ(
        /* User Code Start: bgtz args */

        /* User Code End: bgtz args */
        ) {
        /* User Code Start: bgtz func */
            return nullptr;
        /* User Code End: bgtz func */
        }
        MachineInstr* create_BLTZ(
        /* User Code Start: bltz args */

        /* User Code End: bltz args */
        ) {
        /* User Code Start: bltz func */
            return nullptr;
        /* User Code End: bltz func */
        }
        MachineInstr* create_BGEZ(
        /* User Code Start: bgez args */

        /* User Code End: bgez args */
        ) {
        /* User Code Start: bgez func */
            return nullptr;
        /* User Code End: bgez func */
        }
        MachineInstr* create_BLZE(
        /* User Code Start: blze args */

        /* User Code End: blze args */
        ) {
        /* User Code Start: blze func */
            return nullptr;
        /* User Code End: blze func */
        } 
    // Jump
        MachineInstr* create_J(
        /* User Code Start: j args */

        /* User Code End: j args */
        ) {
        /* User Code Start: j func */
            return nullptr;
        /* User Code End: j func */
        } 
    // JAL
        MachineInstr* create_JAL(
        /* User Code Start: jal args */

        /* User Code End: jal args */
        ) {
        /* User Code Start: jal func */
            return nullptr;
        /* User Code End: jal func */
        }
        MachineInstr* create_JALR(
        /* User Code Start: jalr args */

        /* User Code End: jalr args */
        ) {
        /* User Code Start: jalr func */
            return nullptr;
        /* User Code End: jalr func */
        } 
    // Call
        MachineInstr* create_CALL(
        /* User Code Start: call args */

        /* User Code End: call args */
        ) {
        /* User Code Start: call func */
            return nullptr;
        /* User Code End: call func */
        } 
    // Return
        MachineInstr* create_RET(
        /* User Code Start: ret args */

        /* User Code End: ret args */
        ) {
        /* User Code Start: ret func */
            return nullptr;
        /* User Code End: ret func */
        } 
    // Multiply
        MachineInstr* create_MUL(
        /* User Code Start: mul args */

        /* User Code End: mul args */
        ) {
        /* User Code Start: mul func */
            return nullptr;
        /* User Code End: mul func */
        }
        MachineInstr* create_MULH(
        /* User Code Start: mulh args */

        /* User Code End: mulh args */
        ) {
        /* User Code Start: mulh func */
            return nullptr;
        /* User Code End: mulh func */
        }
        MachineInstr* create_MULHSU(
        /* User Code Start: mulhsu args */

        /* User Code End: mulhsu args */
        ) {
        /* User Code Start: mulhsu func */
            return nullptr;
        /* User Code End: mulhsu func */
        }
        MachineInstr* create_MULHU(
        /* User Code Start: mulhu args */

        /* User Code End: mulhu args */
        ) {
        /* User Code Start: mulhu func */
            return nullptr;
        /* User Code End: mulhu func */
        }
        MachineInstr* create_DIV(
        /* User Code Start: div args */

        /* User Code End: div args */
        ) {
        /* User Code Start: div func */
            return nullptr;
        /* User Code End: div func */
        }
        MachineInstr* create_DIVU(
        /* User Code Start: divu args */

        /* User Code End: divu args */
        ) {
        /* User Code Start: divu func */
            return nullptr;
        /* User Code End: divu func */
        }
        MachineInstr* create_REM(
        /* User Code Start: rem args */

        /* User Code End: rem args */
        ) {
        /* User Code Start: rem func */
            return nullptr;
        /* User Code End: rem func */
        }
        MachineInstr* create_REMU(
        /* User Code Start: remu args */

        /* User Code End: remu args */
        ) {
        /* User Code Start: remu func */
            return nullptr;
        /* User Code End: remu func */
        } 
    // FArith
        MachineInstr* create_FADD_S(
        /* User Code Start: fadd_s args */

        /* User Code End: fadd_s args */
        ) {
        /* User Code Start: fadd_s func */
            return nullptr;
        /* User Code End: fadd_s func */
        }
        MachineInstr* create_FSUB_S(
        /* User Code Start: fsub_s args */

        /* User Code End: fsub_s args */
        ) {
        /* User Code Start: fsub_s func */
            return nullptr;
        /* User Code End: fsub_s func */
        }
        MachineInstr* create_FMUL_S(
        /* User Code Start: fmul_s args */

        /* User Code End: fmul_s args */
        ) {
        /* User Code Start: fmul_s func */
            return nullptr;
        /* User Code End: fmul_s func */
        }
        MachineInstr* create_FDIV_S(
        /* User Code Start: fdiv_s args */

        /* User Code End: fdiv_s args */
        ) {
        /* User Code Start: fdiv_s func */
            return nullptr;
        /* User Code End: fdiv_s func */
        }
        MachineInstr* create_FSGNJ_S(
        /* User Code Start: fsgnj_s args */

        /* User Code End: fsgnj_s args */
        ) {
        /* User Code Start: fsgnj_s func */
            return nullptr;
        /* User Code End: fsgnj_s func */
        }
        MachineInstr* create_FSGNJN_S(
        /* User Code Start: fsgnjn_s args */

        /* User Code End: fsgnjn_s args */
        ) {
        /* User Code Start: fsgnjn_s func */
            return nullptr;
        /* User Code End: fsgnjn_s func */
        }
        MachineInstr* create_FSGNJX_S(
        /* User Code Start: fsgnjx_s args */

        /* User Code End: fsgnjx_s args */
        ) {
        /* User Code Start: fsgnjx_s func */
            return nullptr;
        /* User Code End: fsgnjx_s func */
        }
        MachineInstr* create_FMIN_S(
        /* User Code Start: fmin_s args */

        /* User Code End: fmin_s args */
        ) {
        /* User Code Start: fmin_s func */
            return nullptr;
        /* User Code End: fmin_s func */
        }
        MachineInstr* create_FMAX_S(
        /* User Code Start: fmax_s args */

        /* User Code End: fmax_s args */
        ) {
        /* User Code Start: fmax_s func */
            return nullptr;
        /* User Code End: fmax_s func */
        } 
    // FArithU
        MachineInstr* create_FABS_S(
        /* User Code Start: fabs_s args */

        /* User Code End: fabs_s args */
        ) {
        /* User Code Start: fabs_s func */
            return nullptr;
        /* User Code End: fabs_s func */
        }
        MachineInstr* create_FNEG_S(
        /* User Code Start: fneg_s args */

        /* User Code End: fneg_s args */
        ) {
        /* User Code Start: fneg_s func */
            return nullptr;
        /* User Code End: fneg_s func */
        }
        MachineInstr* create_FSQRT_S(
        /* User Code Start: fsqrt_s args */

        /* User Code End: fsqrt_s args */
        ) {
        /* User Code Start: fsqrt_s func */
            return nullptr;
        /* User Code End: fsqrt_s func */
        } 
    // FCMP
        MachineInstr* create_FEQ_S(
        /* User Code Start: feq_s args */

        /* User Code End: feq_s args */
        ) {
        /* User Code Start: feq_s func */
            return nullptr;
        /* User Code End: feq_s func */
        }
        MachineInstr* create_FLT_S(
        /* User Code Start: flt_s args */

        /* User Code End: flt_s args */
        ) {
        /* User Code Start: flt_s func */
            return nullptr;
        /* User Code End: flt_s func */
        }
        MachineInstr* create_FLE_S(
        /* User Code Start: fle_s args */

        /* User Code End: fle_s args */
        ) {
        /* User Code Start: fle_s func */
            return nullptr;
        /* User Code End: fle_s func */
        } 
    // FArithT
        MachineInstr* create_FMADD_S(
        /* User Code Start: fmadd_s args */

        /* User Code End: fmadd_s args */
        ) {
        /* User Code Start: fmadd_s func */
            return nullptr;
        /* User Code End: fmadd_s func */
        }
        MachineInstr* create_FNMADD_S(
        /* User Code Start: fnmadd_s args */

        /* User Code End: fnmadd_s args */
        ) {
        /* User Code Start: fnmadd_s func */
            return nullptr;
        /* User Code End: fnmadd_s func */
        }
        MachineInstr* create_FMSUB_S(
        /* User Code Start: fmsub_s args */

        /* User Code End: fmsub_s args */
        ) {
        /* User Code Start: fmsub_s func */
            return nullptr;
        /* User Code End: fmsub_s func */
        }
        MachineInstr* create_FNMSUB_S(
        /* User Code Start: fnmsub_s args */

        /* User Code End: fnmsub_s args */
        ) {
        /* User Code Start: fnmsub_s func */
            return nullptr;
        /* User Code End: fnmsub_s func */
        } 
    // FLoad
        MachineInstr* create_FLW(
        /* User Code Start: flw args */

        /* User Code End: flw args */
        ) {
        /* User Code Start: flw func */
            return nullptr;
        /* User Code End: flw func */
        } 
    // FCVT
        MachineInstr* create_FCVT_S_W(
        /* User Code Start: fcvt_s_w args */

        /* User Code End: fcvt_s_w args */
        ) {
        /* User Code Start: fcvt_s_w func */
            return nullptr;
        /* User Code End: fcvt_s_w func */
        }
        MachineInstr* create_FCVT_W_S(
        /* User Code Start: fcvt_w_s args */

        /* User Code End: fcvt_w_s args */
        ) {
        /* User Code Start: fcvt_w_s func */
            return nullptr;
        /* User Code End: fcvt_w_s func */
        } 
    // FMV
        MachineInstr* create_FMV_S(
        /* User Code Start: fmv_s args */

        /* User Code End: fmv_s args */
        ) {
        /* User Code Start: fmv_s func */
            return nullptr;
        /* User Code End: fmv_s func */
        }
        MachineInstr* create_FMV_W_X(
        /* User Code Start: fmv_w_x args */

        /* User Code End: fmv_w_x args */
        ) {
        /* User Code Start: fmv_w_x func */
            return nullptr;
        /* User Code End: fmv_w_x func */
        }
        MachineInstr* create_FMV_X_W(
        /* User Code Start: fmv_x_w args */

        /* User Code End: fmv_x_w args */
        ) {
        /* User Code Start: fmv_x_w func */
            return nullptr;
        /* User Code End: fmv_x_w func */
        }

private:
    MCtx* mctx;
};
}