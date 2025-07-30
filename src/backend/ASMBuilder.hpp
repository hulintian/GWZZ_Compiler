#pragma once 
#include "backend/MBasicBlock.hpp"
#include "backend/MInstruction.hpp"
#include "backend/miscs.hpp"
#include <cassert>

namespace backend {
class ASMBuilder {
public:
    ASMBuilder(MCtx* ctx) : mctx(ctx) {}

    /* User Code Start: code space 1 */
        MachineFunction* get_cur_func() { return this->mctx->get_function(); }    
        MachineBasicBlock* get_cur_bb() { return this->mctx->get_basic_block(); }    


        MachineBasicBlock* create_m_basicblock(int _idx) {
            auto nmbb = new MachineBasicBlock(_idx);
            assert(this->get_cur_func() != nullptr && "Not in Func scope");
            this->get_cur_func()->add_mbb(nmbb);
            return nmbb;
        }

        MachineFunction* create_m_func( std::string func_name, Type* ret_ty, std::vector<Type*> tys, std::vector<std::string> agsn ) {
            auto nmfunc = new MachineFunction(this->mctx->get_module(), func_name, ret_ty, tys, agsn);
            this->mctx->get_module()->addfuncs(nmfunc);
            return nmfunc;
        }
    /* User Code End: code space 1 */ 
    // IArith
        MachineInstr* create_ADD(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: add args */

        /* User Code End: add args */
        ) {
        /* User Code Start: add func */
            auto add_instr = new IArithInst(MachineInstrType::ADD, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(add_instr);
            return add_instr;
        /* User Code End: add func */
        }
        MachineInstr* create_SUB(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: sub args */

        /* User Code End: sub args */
        ) {
        /* User Code Start: sub func */
            auto instr = new IArithInst(MachineInstrType::SUB, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: sub func */
        }
        MachineInstr* create_AND(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: and args */

        /* User Code End: and args */
        ) {
        /* User Code Start: and func */
            auto instr = new IArithInst(MachineInstrType::AND, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: and func */
        }
        MachineInstr* create_OR(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: or args */

        /* User Code End: or args */
        ) {
        /* User Code Start: or func */
            auto instr = new IArithInst(MachineInstrType::OR, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: or func */
        }
        MachineInstr* create_XOR(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: xor args */

        /* User Code End: xor args */
        ) {
        /* User Code Start: xor func */
            auto instr = new IArithInst(MachineInstrType::XOR, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: xor func */
        }
        MachineInstr* create_SLL(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: sll args */

        /* User Code End: sll args */
        ) {
        /* User Code Start: sll func */
            auto instr = new IArithInst(MachineInstrType::SLL, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: sll func */
        }
        MachineInstr* create_SRA(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: sra args */

        /* User Code End: sra args */
        ) {
        /* User Code Start: sra func */
            auto instr = new IArithInst(MachineInstrType::SRA, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: sra func */
        }
        MachineInstr* create_SRL(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: srl args */

        /* User Code End: srl args */
        ) {
        /* User Code Start: srl func */
            auto instr = new IArithInst(MachineInstrType::SRL, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: srl func */
        } 
    // IArithIMM
        MachineInstr* create_ADDI(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t imm
        /* User Code Start: addi args */

        /* User Code End: addi args */
        ) {
        /* User Code Start: addi func */
            auto  addiinstr = new IArithIMMInst(MachineInstrType::ADDI, this->get_cur_bb(), rd, rs1, imm);
            this->get_cur_bb()->insert_instr(addiinstr);
            return addiinstr;
        /* User Code End: addi func */
        }
        MachineInstr* create_SUBI(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t imm
        /* User Code Start: subi args */

        /* User Code End: subi args */
        ) {
        /* User Code Start: subi func */
            auto instr = new IArithIMMInst(MachineInstrType::SUBI, this->get_cur_bb(), rd, rs1, imm);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: subi func */
        }
        MachineInstr* create_ANDI(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t imm
        /* User Code Start: andi args */

        /* User Code End: andi args */
        ) {
        /* User Code Start: andi func */
            auto instr = new IArithIMMInst(MachineInstrType::ANDI, this->mctx->get_basic_block(), rd, rs1, imm);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: andi func */
        }
        MachineInstr* create_ORI(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t imm
        /* User Code Start: ori args */

        /* User Code End: ori args */
        ) {
        /* User Code Start: ori func */
            auto instr = new IArithIMMInst(MachineInstrType::ORI, this->mctx->get_basic_block(), rd, rs1, imm);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: ori func */
        }
        MachineInstr* create_XORI(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t imm
        /* User Code Start: xori args */

        /* User Code End: xori args */
        ) {
        /* User Code Start: xori func */
            auto instr = new IArithIMMInst(MachineInstrType::XORI, this->mctx->get_basic_block(), rd, rs1, imm);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: xori func */
        }
        MachineInstr* create_SLLI(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t imm
        /* User Code Start: slli args */

        /* User Code End: slli args */
        ) {
        /* User Code Start: slli func */
            auto instr = new IArithIMMInst(MachineInstrType::SLLI, this->mctx->get_basic_block(), rd, rs1, imm);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: slli func */
        }
        MachineInstr* create_SRAI(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t imm
        /* User Code Start: srai args */

        /* User Code End: srai args */
        ) {
        /* User Code Start: srai func */
            auto instr = new IArithIMMInst(MachineInstrType::SRAI, this->mctx->get_basic_block(), rd, rs1, imm);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: srai func */
        }
        MachineInstr* create_SRLI(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t imm
        /* User Code Start: srli args */

        /* User Code End: srli args */
        ) {
        /* User Code Start: srli func */
            auto instr = new IArithIMMInst(MachineInstrType::SRLI, this->mctx->get_basic_block(), rd, rs1, imm);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: srli func */
        } 
    // IArithU
        MachineInstr* create_LUI(RiscvReg::Reg rd, int32_t imm
        /* User Code Start: lui args */

        /* User Code End: lui args */
        ) {
        /* User Code Start: lui func */
            auto instr = new IArithUInst(MachineInstrType::LUI, this->mctx->get_basic_block(), rd, imm);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: lui func */
        }
        MachineInstr* create_AUIPC(RiscvReg::Reg rd, int32_t imm
        /* User Code Start: auipc args */

        /* User Code End: auipc args */
        ) {
        /* User Code Start: auipc func */
            auto instr = new IArithUInst(MachineInstrType::AUIPC, this->mctx->get_basic_block(), rd, imm);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: auipc func */
        } 
    // Load
        MachineInstr* create_LB(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t offset
        /* User Code Start: lb args */

        /* User Code End: lb args */
        ) {
        /* User Code Start: lb func */
            auto lb_instr = new LoadInst(MachineInstrType::LB, this->mctx->get_basic_block(), rd, rs1, offset);
            this->mctx->get_basic_block()->insert_instr(lb_instr);
            return lb_instr;
        /* User Code End: lb func */
        }
        MachineInstr* create_LH(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t offset
        /* User Code Start: lh args */

        /* User Code End: lh args */
        ) {
        /* User Code Start: lh func */
            auto lh_instr = new LoadInst(MachineInstrType::LH, this->mctx->get_basic_block(), rd, rs1, offset);
            this->mctx->get_basic_block()->insert_instr(lh_instr);
            return lh_instr;
        /* User Code End: lh func */
        }
        MachineInstr* create_LW(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t offset
        /* User Code Start: lw args */
        /* User Code End: lw args */
        ) {
        /* User Code Start: lw func */
            // load word , for base type
            auto lwinstr = new LoadInst(MachineInstrType::LW, this->mctx->get_basic_block(), rd, rs1, offset);
            this->mctx->get_basic_block()->insert_instr(lwinstr);
            return lwinstr;
        /* User Code End: lw func */
        }
        MachineInstr* create_LD(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t offset
        /* User Code Start: ld args */
        /* User Code End: ld args */
        ) {
        /* User Code Start: ld func */
            // load double , for arr / ptr
            auto ldinstr = new LoadInst(MachineInstrType::LD, this->mctx->get_basic_block(), rd, rs1, offset);
            this->mctx->get_basic_block()->insert_instr(ldinstr);
            return ldinstr;
        /* User Code End: ld func */
        } 
    // Move
        MachineInstr* create_MV(RiscvReg::Reg rd, RiscvReg::Reg rs1
        /* User Code Start: mv args */

        /* User Code End: mv args */
        ) {
        /* User Code Start: mv func */
            auto mv_instr = new MoveInst(MachineInstrType::MV, this->mctx->get_basic_block(), rd, rs1);
            this->mctx->get_basic_block()->insert_instr(mv_instr);
            return mv_instr;
        /* User Code End: mv func */
        } 
    // LLA
        MachineInstr* create_LLA(RiscvReg::Reg rd, std::string symbol
        /* User Code Start: lla args */

        /* User Code End: lla args */
        ) {
        /* User Code Start: lla func */
            auto minst = new LLAInst(MachineInstrType::LLA, this->mctx->get_basic_block(), rd, symbol);
            this->mctx->get_basic_block()->insert_instr(minst);
            return minst;
        /* User Code End: lla func */
        }
        MachineInstr* create_LA(RiscvReg::Reg rd, std::string symbol
        /* User Code Start: la args */

        /* User Code End: la args */
        ) {
        /* User Code Start: la func */
            auto minst = new LLAInst(MachineInstrType::LA, this->mctx->get_basic_block(), rd, symbol);
            this->mctx->get_basic_block()->insert_instr(minst);
            return minst;
        /* User Code End: la func */
        } 
    // LI
        MachineInstr* create_LI(RiscvReg::Reg rd, int imm
        /* User Code Start: li args */

        /* User Code End: li args */
        ) {
        /* User Code Start: li func */
            auto li_instr = new LIInst(MachineInstrType::LI, this->mctx->get_basic_block(), rd, imm);
            this->mctx->get_basic_block()->insert_instr(li_instr);
            return li_instr;
        /* User Code End: li func */
        } 
    // Store
        MachineInstr* create_SB(RiscvReg::Reg rs1, RiscvReg::Reg rs2, int32_t offset
        /* User Code Start: sb args */

        /* User Code End: sb args */
        ) {
        /* User Code Start: sb func */
            auto instr = new StoreInst(MachineInstrType::SB, this->mctx->get_basic_block(), rs1, rs2, offset);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: sb func */
        }
        MachineInstr* create_SH(RiscvReg::Reg rs1, RiscvReg::Reg rs2, int32_t offset
        /* User Code Start: sh args */

        /* User Code End: sh args */
        ) {
        /* User Code Start: sh func */
            auto instr = new StoreInst(MachineInstrType::SH, this->mctx->get_basic_block(), rs1, rs2, offset);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: sh func */
        }
        MachineInstr* create_SW(RiscvReg::Reg rs1, RiscvReg::Reg rs2, int32_t offset
        /* User Code Start: sw args */

        /* User Code End: sw args */
        ) {
        /* User Code Start: sw func */
            auto instr = new StoreInst(MachineInstrType::SW, this->mctx->get_basic_block(), rs1, rs2, offset);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: sw func */
        }
        MachineInstr* create_SD(RiscvReg::Reg rs1, RiscvReg::Reg rs2, int32_t offset
        /* User Code Start: sd args */

        /* User Code End: sd args */
        ) {
        /* User Code Start: sd func */
            auto instr = new StoreInst(MachineInstrType::SD, this->mctx->get_basic_block(), rs1, rs2, offset);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: sd func */
        } 
    // CondSet
        MachineInstr* create_SLT(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: slt args */

        /* User Code End: slt args */
        ) {
        /* User Code Start: slt func */
            auto instr = new CondSetInst(MachineInstrType::SLT, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: slt func */
        }
        MachineInstr* create_SLTU(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: sltu args */

        /* User Code End: sltu args */
        ) {
        /* User Code Start: sltu func */
            auto instr = new CondSetInst(MachineInstrType::SLTU, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: sltu func */
        } 
    // CondSetU
        MachineInstr* create_SEQZ(RiscvReg::Reg rd, RiscvReg::Reg rs1
        /* User Code Start: seqz args */

        /* User Code End: seqz args */
        ) {
        /* User Code Start: seqz func */
            auto instr = new CondSetUInst(MachineInstrType::SEQZ, this->mctx->get_basic_block(), rd, rs1);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: seqz func */
        }
        MachineInstr* create_SNEZ(RiscvReg::Reg rd, RiscvReg::Reg rs1
        /* User Code Start: snez args */

        /* User Code End: snez args */
        ) {
        /* User Code Start: snez func */
            auto instr = new CondSetUInst(MachineInstrType::SNEZ, this->mctx->get_basic_block(), rd, rs1);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: snez func */
        }
        MachineInstr* create_SLTZ(RiscvReg::Reg rd, RiscvReg::Reg rs1
        /* User Code Start: sltz args */

        /* User Code End: sltz args */
        ) {
        /* User Code Start: sltz func */
            auto instr = new CondSetUInst(MachineInstrType::SLTZ, this->mctx->get_basic_block(), rd, rs1);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: sltz func */
        }
        MachineInstr* create_SGTZ(RiscvReg::Reg rd, RiscvReg::Reg rs1
        /* User Code Start: sgtz args */

        /* User Code End: sgtz args */
        ) {
        /* User Code Start: sgtz func */
            auto instr = new CondSetUInst(MachineInstrType::SGTZ, this->mctx->get_basic_block(), rd, rs1);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: sgtz func */
        } 
    // CondSetIMM
        MachineInstr* create_SLTI(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t imm
        /* User Code Start: slti args */

        /* User Code End: slti args */
        ) {
        /* User Code Start: slti func */
            auto instr = new CondSetIMMInst(MachineInstrType::SLTI, this->mctx->get_basic_block(), rd, rs1, imm);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: slti func */
        }
        MachineInstr* create_SGTI(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t imm
        /* User Code Start: sgti args */

        /* User Code End: sgti args */
        ) {
        /* User Code Start: sgti func */
            auto instr = new CondSetIMMInst(MachineInstrType::SGTI, this->mctx->get_basic_block(), rd, rs1, imm);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: sgti func */
        } 
    // Branch
        MachineInstr* create_BEQ(RiscvReg::Reg rs1, RiscvReg::Reg rs2, MachineBasicBlock* dst_bb
        /* User Code Start: beq args */

        /* User Code End: beq args */
        ) {
        /* User Code Start: beq func */
            auto instr = new BranchInst(MachineInstrType::BEQ, this->mctx->get_basic_block(), rs1, rs2, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: beq func */
        }
        MachineInstr* create_BNE(RiscvReg::Reg rs1, RiscvReg::Reg rs2, MachineBasicBlock* dst_bb
        /* User Code Start: bne args */

        /* User Code End: bne args */
        ) {
        /* User Code Start: bne func */
            auto instr = new BranchInst(MachineInstrType::BNE, this->mctx->get_basic_block(), rs1, rs2, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: bne func */
        }
        MachineInstr* create_BLT(RiscvReg::Reg rs1, RiscvReg::Reg rs2, MachineBasicBlock* dst_bb
        /* User Code Start: blt args */

        /* User Code End: blt args */
        ) {
        /* User Code Start: blt func */
            auto instr = new BranchInst(MachineInstrType::BLT, this->mctx->get_basic_block(), rs1, rs2, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: blt func */
        }
        MachineInstr* create_BGE(RiscvReg::Reg rs1, RiscvReg::Reg rs2, MachineBasicBlock* dst_bb
        /* User Code Start: bge args */

        /* User Code End: bge args */
        ) {
        /* User Code Start: bge func */
            auto instr = new BranchInst(MachineInstrType::BGE, this->mctx->get_basic_block(), rs1, rs2, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: bge func */
        }
        MachineInstr* create_BLTU(RiscvReg::Reg rs1, RiscvReg::Reg rs2, MachineBasicBlock* dst_bb
        /* User Code Start: bltu args */

        /* User Code End: bltu args */
        ) {
        /* User Code Start: bltu func */
            auto instr = new BranchInst(MachineInstrType::BLTU, this->mctx->get_basic_block(), rs1, rs2, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: bltu func */
        }
        MachineInstr* create_BGEU(RiscvReg::Reg rs1, RiscvReg::Reg rs2, MachineBasicBlock* dst_bb
        /* User Code Start: bgeu args */

        /* User Code End: bgeu args */
        ) {
        /* User Code Start: bgeu func */
            auto instr = new BranchInst(MachineInstrType::BGEU, this->mctx->get_basic_block(), rs1, rs2, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: bgeu func */
        }
        MachineInstr* create_BGT(RiscvReg::Reg rs1, RiscvReg::Reg rs2, MachineBasicBlock* dst_bb
        /* User Code Start: bgt args */

        /* User Code End: bgt args */
        ) {
        /* User Code Start: bgt func */
            auto instr = new BranchInst(MachineInstrType::BGT, this->mctx->get_basic_block(), rs1, rs2, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: bgt func */
        }
        MachineInstr* create_BGTU(RiscvReg::Reg rs1, RiscvReg::Reg rs2, MachineBasicBlock* dst_bb
        /* User Code Start: bgtu args */

        /* User Code End: bgtu args */
        ) {
        /* User Code Start: bgtu func */
            auto instr = new BranchInst(MachineInstrType::BGTU, this->mctx->get_basic_block(), rs1, rs2, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: bgtu func */
        }
        MachineInstr* create_BLE(RiscvReg::Reg rs1, RiscvReg::Reg rs2, MachineBasicBlock* dst_bb
        /* User Code Start: ble args */

        /* User Code End: ble args */
        ) {
        /* User Code Start: ble func */
            auto instr = new BranchInst(MachineInstrType::BLE, this->mctx->get_basic_block(), rs1, rs2, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: ble func */
        }
        MachineInstr* create_BLEU(RiscvReg::Reg rs1, RiscvReg::Reg rs2, MachineBasicBlock* dst_bb
        /* User Code Start: bleu args */

        /* User Code End: bleu args */
        ) {
        /* User Code Start: bleu func */
            auto instr = new BranchInst(MachineInstrType::BLEU, this->mctx->get_basic_block(), rs1, rs2, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: bleu func */
        } 
    // BranchU
        MachineInstr* create_BEZ(RiscvReg::Reg rs1, MachineBasicBlock* dst_bb
        /* User Code Start: bez args */

        /* User Code End: bez args */
        ) {
        /* User Code Start: bez func */
            auto instr = new BranchUInst(MachineInstrType::BEZ, this->mctx->get_basic_block(), rs1, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: bez func */
        }
        MachineInstr* create_BNEZ(RiscvReg::Reg rs1, MachineBasicBlock* dst_bb
        /* User Code Start: bnez args */

        /* User Code End: bnez args */
        ) {
        /* User Code Start: bnez func */
            auto instr = new BranchUInst(MachineInstrType::BNEZ, this->mctx->get_basic_block(), rs1, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: bnez func */
        }
        MachineInstr* create_BGTZ(RiscvReg::Reg rs1, MachineBasicBlock* dst_bb
        /* User Code Start: bgtz args */

        /* User Code End: bgtz args */
        ) {
        /* User Code Start: bgtz func */
            auto instr = new BranchUInst(MachineInstrType::BGTZ, this->mctx->get_basic_block(), rs1, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: bgtz func */
        }
        MachineInstr* create_BLTZ(RiscvReg::Reg rs1, MachineBasicBlock* dst_bb
        /* User Code Start: bltz args */

        /* User Code End: bltz args */
        ) {
        /* User Code Start: bltz func */
            auto instr = new BranchUInst(MachineInstrType::BLTZ, this->mctx->get_basic_block(), rs1, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: bltz func */
        }
        MachineInstr* create_BGEZ(RiscvReg::Reg rs1, MachineBasicBlock* dst_bb
        /* User Code Start: bgez args */

        /* User Code End: bgez args */
        ) {
        /* User Code Start: bgez func */
            auto instr = new BranchUInst(MachineInstrType::BGEZ, this->mctx->get_basic_block(), rs1, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: bgez func */
        }
        MachineInstr* create_BLZE(RiscvReg::Reg rs1, MachineBasicBlock* dst_bb
        /* User Code Start: blze args */

        /* User Code End: blze args */
        ) {
        /* User Code Start: blze func */
            auto instr = new BranchUInst(MachineInstrType::BLZE, this->mctx->get_basic_block(), rs1, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: blze func */
        } 
    // Jump
        MachineInstr* create_J(MachineBasicBlock* dst_bb
        /* User Code Start: j args */

        /* User Code End: j args */
        ) {
        /* User Code Start: j func */
            auto jump_instr = new JumpInst(MachineInstrType::J, mctx->get_basic_block(), dst_bb);
            this->mctx->get_basic_block()->insert_instr(jump_instr);
            return jump_instr;
        /* User Code End: j func */
        } 
    // JAL
        MachineInstr* create_JAL(RiscvReg::Reg rd, MachineBasicBlock* dst_bb
        /* User Code Start: jal args */

        /* User Code End: jal args */
        ) {
        /* User Code Start: jal func */
            auto instr = new JALInst(MachineInstrType::JAL, this->mctx->get_basic_block(), rd, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: jal func */
        }
        MachineInstr* create_JALR(RiscvReg::Reg rd, MachineBasicBlock* dst_bb
        /* User Code Start: jalr args */

        /* User Code End: jalr args */
        ) {
        /* User Code Start: jalr func */
            auto instr = new JALInst(MachineInstrType::JALR, this->mctx->get_basic_block(), rd, dst_bb);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: jalr func */
        } 
    // Call
        MachineInstr* create_CALL(MachineFunction* func
        /* User Code Start: call args */

        /* User Code End: call args */
        ) {
        /* User Code Start: call func */
            auto instr = new CallInst(MachineInstrType::CALL, this->mctx->get_basic_block(), func);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: call func */
        } 
    // Return
        MachineInstr* create_RET(
        /* User Code Start: ret args */

        /* User Code End: ret args */
        ) {
        /* User Code Start: ret func */
            auto instr = new ReturnInst(MachineInstrType::RET, this->mctx->get_basic_block());
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: ret func */
        } 
    // Multiply
        MachineInstr* create_MUL(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: mul args */

        /* User Code End: mul args */
        ) {
        /* User Code Start: mul func */
            auto instr = new MultiplyInst(MachineInstrType::MUL, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: mul func */
        }
        MachineInstr* create_MULH(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: mulh args */

        /* User Code End: mulh args */
        ) {
        /* User Code Start: mulh func */
            auto instr = new MultiplyInst(MachineInstrType::MULH, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: mulh func */
        }
        MachineInstr* create_MULHSU(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: mulhsu args */

        /* User Code End: mulhsu args */
        ) {
        /* User Code Start: mulhsu func */
            auto instr = new MultiplyInst(MachineInstrType::MULHSU, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: mulhsu func */
        }
        MachineInstr* create_MULHU(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: mulhu args */

        /* User Code End: mulhu args */
        ) {
        /* User Code Start: mulhu func */
            auto instr = new MultiplyInst(MachineInstrType::MULHU, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: mulhu func */
        }
        MachineInstr* create_DIV(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: div args */

        /* User Code End: div args */
        ) {
        /* User Code Start: div func */
            auto instr = new MultiplyInst(MachineInstrType::DIV, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: div func */
        }
        MachineInstr* create_DIVU(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: divu args */

        /* User Code End: divu args */
        ) {
        /* User Code Start: divu func */
            auto instr = new MultiplyInst(MachineInstrType::DIVU, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: divu func */
        }
        MachineInstr* create_REM(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: rem args */

        /* User Code End: rem args */
        ) {
        /* User Code Start: rem func */
            auto instr = new MultiplyInst(MachineInstrType::REM, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: rem func */
        }
        MachineInstr* create_REMU(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: remu args */

        /* User Code End: remu args */
        ) {
        /* User Code Start: remu func */
            auto instr = new MultiplyInst(MachineInstrType::REMU, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: remu func */
        } 
    // FArith
        MachineInstr* create_FADD_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: fadd_s args */

        /* User Code End: fadd_s args */
        ) {
        /* User Code Start: fadd_s func */
            auto instr = new FArithInst(MachineInstrType::FADD_S, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fadd_s func */
        }
        MachineInstr* create_FSUB_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: fsub_s args */

        /* User Code End: fsub_s args */
        ) {
        /* User Code Start: fsub_s func */
            auto instr = new FArithInst(MachineInstrType::FSUB_S, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fsub_s func */
        }
        MachineInstr* create_FMUL_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: fmul_s args */

        /* User Code End: fmul_s args */
        ) {
        /* User Code Start: fmul_s func */
            auto instr = new FArithInst(MachineInstrType::FMUL_S, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fmul_s func */
        }
        MachineInstr* create_FDIV_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: fdiv_s args */

        /* User Code End: fdiv_s args */
        ) {
        /* User Code Start: fdiv_s func */
            auto instr = new FArithInst(MachineInstrType::FDIV_S, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fdiv_s func */
        }
        MachineInstr* create_FSGNJ_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: fsgnj_s args */

        /* User Code End: fsgnj_s args */
        ) {
        /* User Code Start: fsgnj_s func */
            auto instr = new FArithInst(MachineInstrType::FSGNJ_S, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fsgnj_s func */
        }
        MachineInstr* create_FSGNJN_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: fsgnjn_s args */

        /* User Code End: fsgnjn_s args */
        ) {
        /* User Code Start: fsgnjn_s func */
            auto instr = new FArithInst(MachineInstrType::FSGNJN_S, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fsgnjn_s func */
        }
        MachineInstr* create_FSGNJX_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: fsgnjx_s args */

        /* User Code End: fsgnjx_s args */
        ) {
        /* User Code Start: fsgnjx_s func */
            auto instr = new FArithInst(MachineInstrType::FSGNJX_S, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fsgnjx_s func */
        }
        MachineInstr* create_FMIN_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: fmin_s args */

        /* User Code End: fmin_s args */
        ) {
        /* User Code Start: fmin_s func */
            auto instr = new FArithInst(MachineInstrType::FMIN_S, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fmin_s func */
        }
        MachineInstr* create_FMAX_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: fmax_s args */

        /* User Code End: fmax_s args */
        ) {
        /* User Code Start: fmax_s func */
            auto instr = new FArithInst(MachineInstrType::FMAX_S, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fmax_s func */
        } 
    // FArithU
        MachineInstr* create_FABS_S(RiscvReg::Reg rd, RiscvReg::Reg rs1
        /* User Code Start: fabs_s args */

        /* User Code End: fabs_s args */
        ) {
        /* User Code Start: fabs_s func */
            auto instr = new FArithUInst(MachineInstrType::FABS_S, this->mctx->get_basic_block(), rd, rs1);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fabs_s func */
        }
        MachineInstr* create_FNEG_S(RiscvReg::Reg rd, RiscvReg::Reg rs1
        /* User Code Start: fneg_s args */

        /* User Code End: fneg_s args */
        ) {
        /* User Code Start: fneg_s func */
            auto instr = new FArithUInst(MachineInstrType::FNEG_S, this->mctx->get_basic_block(), rd, rs1);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fneg_s func */
        }
        MachineInstr* create_FSQRT_S(RiscvReg::Reg rd, RiscvReg::Reg rs1
        /* User Code Start: fsqrt_s args */

        /* User Code End: fsqrt_s args */
        ) {
        /* User Code Start: fsqrt_s func */
            auto instr = new FArithUInst(MachineInstrType::FSQRT_S, this->mctx->get_basic_block(), rd, rs1);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fsqrt_s func */
        } 
    // FCMP
        MachineInstr* create_FEQ_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: feq_s args */

        /* User Code End: feq_s args */
        ) {
        /* User Code Start: feq_s func */
            auto instr = new FCMPInst(MachineInstrType::FEQ_S, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: feq_s func */
        }
        MachineInstr* create_FLT_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: flt_s args */

        /* User Code End: flt_s args */
        ) {
        /* User Code Start: flt_s func */
            auto instr = new FCMPInst(MachineInstrType::FLT_S, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: flt_s func */
        }
        MachineInstr* create_FLE_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2
        /* User Code Start: fle_s args */

        /* User Code End: fle_s args */
        ) {
        /* User Code Start: fle_s func */
            auto instr = new FCMPInst(MachineInstrType::FLE_S, this->mctx->get_basic_block(), rd, rs1, rs2);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fle_s func */
        } 
    // FArithT
        MachineInstr* create_FMADD_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2, RiscvReg::Reg rs3
        /* User Code Start: fmadd_s args */

        /* User Code End: fmadd_s args */
        ) {
        /* User Code Start: fmadd_s func */
            auto instr = new FArithTInst(MachineInstrType::FMADD_S, this->mctx->get_basic_block(), rd, rs1, rs2, rs3);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fmadd_s func */
        }
        MachineInstr* create_FNMADD_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2, RiscvReg::Reg rs3
        /* User Code Start: fnmadd_s args */

        /* User Code End: fnmadd_s args */
        ) {
        /* User Code Start: fnmadd_s func */
            auto instr = new FArithTInst(MachineInstrType::FNMADD_S, this->mctx->get_basic_block(), rd, rs1, rs2, rs3);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fnmadd_s func */
        }
        MachineInstr* create_FMSUB_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2, RiscvReg::Reg rs3
        /* User Code Start: fmsub_s args */

        /* User Code End: fmsub_s args */
        ) {
        /* User Code Start: fmsub_s func */
            auto instr = new FArithTInst(MachineInstrType::FMSUB_S, this->mctx->get_basic_block(), rd, rs1, rs2, rs3);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fmsub_s func */
        }
        MachineInstr* create_FNMSUB_S(RiscvReg::Reg rd, RiscvReg::Reg rs1, RiscvReg::Reg rs2, RiscvReg::Reg rs3
        /* User Code Start: fnmsub_s args */

        /* User Code End: fnmsub_s args */
        ) {
        /* User Code Start: fnmsub_s func */
            auto instr = new FArithTInst(MachineInstrType::FNMSUB_S, this->mctx->get_basic_block(), rd, rs1, rs2, rs3);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fnmsub_s func */
        } 
    // FLoad
        MachineInstr* create_FLW(RiscvReg::Reg rd, RiscvReg::Reg rs1, int32_t offset
        /* User Code Start: flw args */

        /* User Code End: flw args */
        ) {
        /* User Code Start: flw func */
            // need to check the offset is in 2047
            assert(offset < 2047 && offset > -2048 && "Offset is out of range\n");
            auto flwinstr = new FLoadInst(MachineInstrType::FLW, this->mctx->get_basic_block(), rd, rs1, offset);
            this->mctx->get_basic_block()->insert_instr(flwinstr);
            return flwinstr;
        /* User Code End: flw func */
        } 
    // FStore
        MachineInstr* create_FSW(RiscvReg::Reg rs1, RiscvReg::Reg rs2, int32_t offset
        /* User Code Start: fsw args */

        /* User Code End: fsw args */
        ) {
        /* User Code Start: fsw func */
            auto fsw_instr = new FStoreInst(MachineInstrType::FSW, this->get_cur_bb(), rs1, rs2, offset);
            this->mctx->get_basic_block()->insert_instr(fsw_instr);
            return fsw_instr;
        /* User Code End: fsw func */
        }
        MachineInstr* create_FSD(RiscvReg::Reg rs1, RiscvReg::Reg rs2, int32_t offset
        /* User Code Start: fsd args */

        /* User Code End: fsd args */
        ) {
        /* User Code Start: fsd func */
            auto fsd_instr = new FStoreInst(MachineInstrType::FSD, this->get_cur_bb(), rs1, rs2, offset);
            this->mctx->get_basic_block()->insert_instr(fsd_instr);
            return fsd_instr;
        /* User Code End: fsd func */
        } 
    // FCVT
        MachineInstr* create_FCVT_S_W(RiscvReg::Reg rd, RiscvReg::Reg rs1
        /* User Code Start: fcvt_s_w args */

        /* User Code End: fcvt_s_w args */
        ) {
        /* User Code Start: fcvt_s_w func */
            auto instr = new FCVTInst(MachineInstrType::FCVT_S_W, this->mctx->get_basic_block(), rd, rs1);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fcvt_s_w func */
        }
        MachineInstr* create_FCVT_W_S(RiscvReg::Reg rd, RiscvReg::Reg rs1
        /* User Code Start: fcvt_w_s args */

        /* User Code End: fcvt_w_s args */
        ) {
        /* User Code Start: fcvt_w_s func */
            auto instr = new FCVTInst(MachineInstrType::FCVT_W_S, this->mctx->get_basic_block(), rd, rs1);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fcvt_w_s func */
        } 
    // FMV
        MachineInstr* create_FMV_S(RiscvReg::Reg rd, RiscvReg::Reg rs1
        /* User Code Start: fmv_s args */

        /* User Code End: fmv_s args */
        ) {
        /* User Code Start: fmv_s func */
            auto instr = new FMVInst(MachineInstrType::FMV_S, this->mctx->get_basic_block(), rd, rs1);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fmv_s func */
        }
        MachineInstr* create_FMV_W_X(RiscvReg::Reg rd, RiscvReg::Reg rs1
        /* User Code Start: fmv_w_x args */

        /* User Code End: fmv_w_x args */
        ) {
        /* User Code Start: fmv_w_x func */
            auto instr = new FMVInst(MachineInstrType::FMV_W_X, this->mctx->get_basic_block(), rd, rs1);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fmv_w_x func */
        }
        MachineInstr* create_FMV_X_W(RiscvReg::Reg rd, RiscvReg::Reg rs1
        /* User Code Start: fmv_x_w args */

        /* User Code End: fmv_x_w args */
        ) {
        /* User Code Start: fmv_x_w func */
            auto instr = new FMVInst(MachineInstrType::FMV_X_W, this->mctx->get_basic_block(), rd, rs1);
            this->get_cur_bb()->insert_instr(instr);
            return instr;
        /* User Code End: fmv_x_w func */
        }

private:
    MCtx* mctx;
};
}