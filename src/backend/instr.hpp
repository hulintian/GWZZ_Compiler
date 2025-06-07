#pragma once

#include "backend/program.hpp"
#include "common/regarch.hpp"
#include <set>

namespace backend{

namespace riscv{

using namespace RiscvReg;

enum OperationType {
    IntALU,
    IntMULALU,
    IntDIVALU,
    FloatALU,
    FloatMULALU,
    FloatDIVALU,
    StoreUnit,
    LoadUnit,
    BranchUnit,
    LiUnit,
    IntALU2,
};

class Instr;
struct Edge {
    Instr* parent;
    int latency;
    OperationType type;
    Edge(Instr* parent_, int latency_, OperationType type_): parent(parent_), latency(latency_), type(type_) {}
};

class Instr {
//private:
//    Reg dst_, lst_, rhs_;
public:
    std::set<RiscvReg::Reg> live_in, live_out;
    virtual void gen_asm(std::ostream &out) = 0;
    virtual std::vector<Reg> def_reg() { return {}; }
    virtual std::vector<Reg> use_reg() { return {}; }
    virtual std::vector<Reg *> regs() { return {}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) = 0;
    void replace_reg(Reg src, Reg dst) {
        for (auto p : regs())
            if (*p == src)
                *p = dst;
    }
    std::unordered_set<std::pair<int, Instr*>> edges_out;
    std::unordered_set<std::pair<int, Instr*>> edges_in;
    int rely_count = 0;
    int latency;
    OperationType type;
    bool finished = false;
    int start_time;
    int cost;
    int temp;
};

namespace RiscvInstr {

class RiscvLabel : public Instr {
private:
    std::string label;
public:
    RiscvLabel(std::string _label) : label(std::move(_label)) {}
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new RiscvLabel(label);
    }
    virtual void gen_asm(std::ostream &out) override {
        out << label << ":\n";
    }
};

enum RvUnaryOp {
    NEG,
    SNEZ,
    SEQZ,
    NOT,
    FNEGS,
};

enum RvBinaryOp {
    MAX,
    MIN,
    ADD,
    ADDF,
    ADDUW,
    SUB,
    MUL,
    DIV,
    REM,
    OR,
    AND,
    XOR,
    SLT,
    SLTU,
    SLL,
    SRL,
    SRLF,
    SRAF,
    SAL,
    SLLF,
    SRA,
    FADDS,
    FMULS,
    FDIVS,
    FLT,
    FLE,
    FEQ,
    FSUBS,
    FMODS,
    MULUH,
    SH1ADD,
    SH3ADD,
    SH2ADD
};

enum RvCompareOp { 
    EQ, 
    NE,
    BLT, 
    BLE,
    BGT,
    BGE,
    BEQ,
    BNE
};

class Unary : public Instr {
private:
    Reg dst, src;
    RvUnaryOp op;
public:
    Unary(RvUnaryOp _op, const Reg & _dst, const Reg & _src) : op(_op), dst(_dst), src(_src) {}

    virtual std::vector<Reg> def_reg() override { return {dst}; }
    virtual std::vector<Reg> use_reg() override { return {src}; }
    virtual std::vector<Reg *> regs() override { return {&dst, &src}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new Unary(op, _def[0], _use[0]);
    }

    virtual void gen_asm(std::ostream &out) override {
        static const std::map<RvUnaryOp, std::string> asm_name{
                {RvUnaryOp::NEG, "    neg"}, {RvUnaryOp::SNEZ, "    snez"}, 
                {RvUnaryOp::SEQZ, "    seqz"}, {RvUnaryOp::NOT, "    not"},
                {RvUnaryOp::FNEGS, "    fneg.s"}};
        out << asm_name.find(op)->second << ' ' << dst << ", " << src << '\n';
    }
};

class Binary : public Instr {
private:
    Reg dst, lhs, rhs;
    RvBinaryOp op;
public:
    Binary(RvBinaryOp _op, const Reg & _dst, const Reg & _lhs, const Reg & _rhs)
    : op(_op), dst(_dst), lhs(_lhs), rhs(_rhs) {}
    virtual std::vector<Reg> def_reg() override { return {dst}; }
    virtual std::vector<Reg> use_reg() override { return {lhs, rhs}; }
    virtual std::vector<Reg *> regs() override { return {&dst, &lhs, &rhs}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new Binary(op, _def[0], _use[0], _use[1]);
    }
    RvBinaryOp get_op() const {return op;}
    virtual void gen_asm(std::ostream &out) override {
        static const std::map<RvBinaryOp, std::string> asm_name{
                {RvBinaryOp::ADD, "    add"}, {RvBinaryOp::SUB, "    sub"}, {RvBinaryOp::MUL, "    mul"}, {RvBinaryOp::ADDUW, "    add.uw"}, };
        out << asm_name.find(op)->second << ' ' << dst << ", " << lhs << ", " << rhs << '\n';
    }
};


class BinaryInt : public Instr {
private:
    Reg dst, lhs, rhs;
    RvBinaryOp op;
public:
    BinaryInt(RvBinaryOp _op, const Reg & _dst, const Reg & _lhs, const Reg & _rhs)
    : op(_op), dst(_dst), lhs(_lhs), rhs(_rhs) {}
    virtual std::vector<Reg> def_reg() override { return {dst}; }
    virtual std::vector<Reg> use_reg() override { return {lhs, rhs}; }
    bool is_gp() {
        return lhs.is_gp();
    }
    virtual std::vector<Reg *> regs() override { return {&dst, &lhs, &rhs}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new BinaryInt(op, _def[0], _use[0], _use[1]);
    }
    Reg getlhs() { return lhs; }
    Reg getrhs() { return rhs; }
    RvBinaryOp get_op() const {return op;}
    virtual void gen_asm(std::ostream &out) override {
        static const std::map<RvBinaryOp, std::string> asm_name{
                {RvBinaryOp::ADD, "    addw"}, {RvBinaryOp::SUB, "    subw"}, {RvBinaryOp::MUL, "    mulw"},
                {RvBinaryOp::MAX, "    max"}, {RvBinaryOp::MIN, "    min"},
                {RvBinaryOp::DIV, "    divw"}, {RvBinaryOp::REM, "    remw"}, {RvBinaryOp::AND, "    and"},
                {RvBinaryOp::OR, "    orw"}, {RvBinaryOp::XOR, "    xorw"}, {RvBinaryOp::SLT, "    slt"},
                {RvBinaryOp::SLTU, "    sltu"}, {RvBinaryOp::SLL, "    sllw"}, {RvBinaryOp::SRL, "    srlw"},
                {RvBinaryOp::FADDS, "    fadd.s"}, {RvBinaryOp::FDIVS, "    fdiv.s"}, {RvBinaryOp::FMULS, "    fmul.s"},
                {RvBinaryOp::FLT, "    flt.s"}, {RvBinaryOp::FLE, "    fle.s"}, {RvBinaryOp::FEQ, "    feq.s"},
                {RvBinaryOp::FSUBS, "    fsub.s"}, {RvBinaryOp::FMODS, "    frem.s"}, {RvBinaryOp::SAL, "    sllw"}, 
                {RvBinaryOp::SH1ADD, "    sh1addw"}, {RvBinaryOp::SH3ADD, "    sh3addw"}, {RvBinaryOp::SH2ADD, "    sh2addw"}};
        out << asm_name.find(op)->second << ' ' << dst << ", " << lhs << ", " << rhs << '\n';
    }
};

class BinaryImm : public Instr {
private:
    Reg dst, lhs;
    RvBinaryOp op;
    int32_t value;
public:
    BinaryImm(RvBinaryOp _op, const Reg & _dst, const Reg & _lhs, const int32_t & _value)
    : op(_op), dst(_dst), lhs(_lhs), value(_value) {}
    virtual std::vector<Reg> def_reg() override { return {dst}; }
    virtual std::vector<Reg> use_reg() override { return {lhs}; }
    virtual std::vector<Reg *> regs() override { return {&dst, &lhs}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new BinaryImm(op, _def[0], _use[0], value);
    }
    RvBinaryOp get_op() const {return op;}
    virtual void gen_asm(std::ostream &out) override {
        static const std::map<RvBinaryOp, std::string> asm_name{
                {RvBinaryOp::ADD, "    addiw"}, {RvBinaryOp::SUB, "    addiw"}, {RvBinaryOp::AND, "    andi"},
                {RvBinaryOp::OR, "    ori"}, {RvBinaryOp::XOR, "    xori"}, {RvBinaryOp::SLL, "    slliw"}, 
                {RvBinaryOp::SRL, "    srliw"}, {RvBinaryOp::SRLF, "    srli"}, {RvBinaryOp::ADDF, "    addi"}, 
                {RvBinaryOp::SRA, "    sraiw"}, {RvBinaryOp::SLLF, "    slli"}, {RvBinaryOp::SRAF, "    srai"}, };
        if(op == RvBinaryOp::SUB){
            value = -value;
        }
        out << asm_name.find(op)->second << ' ' << dst << ", " << lhs << ", " << value << '\n';
    }
};

class LoadImm : public Instr {
private:
    Reg dst;
    int32_t value;
public:
    LoadImm(const Reg & _dst, int32_t _value) : dst(_dst), value(_value) {}
    void changeVal(int32_t new_val){value = new_val;}

    virtual std::vector<Reg> def_reg() override { return {dst}; }
    virtual std::vector<Reg *> regs() override { return {&dst}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new LoadImm(_def[0], value);
    }
    virtual void gen_asm(std::ostream &out) override {
        out << "    li " << dst << ", " << value << '\n';
    }
    void update_imm(int32_t new_val) {value = new_val;}
    int getimm() { return value; }
    Reg getdst() { return dst; }
};

class Convert: public Instr {
private:
    Reg dst, src;
public:
    Convert(const Reg & _dst, const Reg & _src) : dst(_dst), src(_src) {}

    virtual std::vector<Reg> def_reg() override { return {dst}; }
    virtual std::vector<Reg> use_reg() override { return {src}; }
    virtual std::vector<Reg *> regs() override { return {&dst, &src}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new Convert(_def[0], _use[0]);
    }
    virtual void gen_asm(std::ostream &out) override {
        if (dst.is_gp() && !src.is_gp())
            out << "    fcvt.w.s " << dst << ", " << src << ",rtz\n";
        else
            out << "    fcvt.s.w " << dst << ", " << src << "\n";
    }
};

class ADDImm : public Instr {
private:
    Reg dst, src;
    int32_t value;
public:
    ADDImm(const Reg & _dst, const Reg & _src, int32_t _value) : dst(_dst), src(_src), value(_value) {}
    int get_val() { return value; }
    virtual std::vector<Reg> def_reg() override { return {dst}; }
    virtual std::vector<Reg> use_reg() override { return {src}; }
    virtual std::vector<Reg *> regs() override { return {&dst, &src}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new ADDImm(_def[0], _use[0], value);
    }
    virtual void gen_asm(std::ostream &out) override {
        out << "    addi " << dst << ", " << src << ", " << value << '\n';
    }

};

class SLTIU : public Instr {
private:
    Reg dst, src;
    int32_t value;
public:
    SLTIU(const Reg & _dst, const Reg & _src, int32_t _value) : dst(_dst), src(_src), value(_value) {}

    virtual std::vector<Reg> def_reg() override { return {dst}; }
    virtual std::vector<Reg> use_reg() override { return {src}; }
    virtual std::vector<Reg *> regs() override { return {&dst, &src}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new SLTIU(_def[0], _use[0], value);
    }
    virtual void gen_asm(std::ostream &out) override {
        out << "    sltiu " << dst << ", " << src << ", " << value << '\n';
    }

};

class Jump : public Instr {
private:
    BasicBlock *target;
public:
    Jump(BasicBlock *_target) : target(_target) {
        target->set_label_used(true);
    }
    BasicBlock *get_target(){
        return target;
    }
    void set_target(BasicBlock* new_target) {
        target = new_target;
    }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new Jump(target);
    }
    virtual void gen_asm(std::ostream &out) override {
        out << "    j " << target->get_name() << '\n';
    }
};

class Branch : public Instr {
private:
    RvCompareOp op;
    Reg src;
    Reg lhs, rhs;
    BasicBlock *target;
public:
    Branch(RvCompareOp _op, const Reg & _src, BasicBlock *_target)
            : op(_op), src(_src), target(_target) {
        target->set_label_used(true);
    }
    Branch(RvCompareOp _op, const Reg & _lhs, const Reg & _rhs, BasicBlock *_target)
            : op(_op), lhs(_lhs), rhs(_rhs), target(_target) {
        target->set_label_used(true);
    }
    BasicBlock* get_target(){return target;}
    void set_target(BasicBlock* new_target){target = new_target;}
    virtual std::vector<Reg> use_reg() override {
        if (op == RvCompareOp::EQ || op == RvCompareOp::NE) return {src};
        else return {lhs, rhs}; }
    virtual std::vector<Reg *> regs() override { 
        if (op == RvCompareOp::EQ || op == RvCompareOp::NE) return {&src};
        else return {&lhs, &rhs}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new Branch(op, _use[0], target);
    }
    virtual void gen_asm(std::ostream &out) override {
        if (op == RvCompareOp::EQ || op == RvCompareOp::NE) {
            static const std::map<RvCompareOp, std::string> asm_name{
                    {RvCompareOp::EQ, "    beqz"}, {RvCompareOp::NE, "    bnez"}
                    };
            out << asm_name.find(op)->second << ' ' << src << ", " << target->get_name() << '\n';
        }
        else {
            static const std::map<RvCompareOp, std::string> asm_name{
                    {RvCompareOp::BLT, "    blt"}, {RvCompareOp::BLE, "    ble"},
                    {RvCompareOp::BGT, "    bgt"}, {RvCompareOp::BGE, "    bge"},
                    {RvCompareOp::BEQ, "    beq"}, {RvCompareOp::BNE, "    bne"},
                    };
            out << asm_name.find(op)->second << ' ' << lhs << ", " << rhs << ", " << target->get_name() << '\n';
        }
    }
};

class Call : public Instr {
private:
public:
    std::string callee;
    int arg_n_gp;
    int arg_n_fp;
    std::set<Reg> caller_used_reg;

    Call(std::string _callee, int arg_n_gp, int arg_n_fp)
    : callee(std::move(_callee)), arg_n_gp(arg_n_gp), arg_n_fp(arg_n_fp) {}

    virtual std::vector<Reg> def_reg() override {
        std::vector<Reg> ret;
        for (auto reg : regs_callersaved) ret.emplace_back(reg);
        for (auto reg : fp_regs_callersaved) ret.emplace_back(reg);
        ret.emplace_back(RA);
        return ret;
    }
    virtual std::vector<Reg> use_reg() override {
        std::vector<Reg> ret;
        for (int i = 0; i < std::min(arg_n_gp, RegArgCount); ++i)
            ret.emplace_back(regs_arg[i]);
        for (int i = 0; i < std::min(arg_n_fp, FpRegArgCount); ++i)
            ret.emplace_back(fp_regs_arg[i]);
        //ret.emplace_back(RA);
        //ret.emplace_back(FP);
        return ret;
    }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new Call(callee, arg_n_gp, arg_n_fp);
    }
    virtual void gen_asm(std::ostream &out) override {
        out << "    call ";
        if (callee == "putf")
            out << "printf";
        else if (callee == "starttime")
            out << "_sysy_starttime";
        else if (callee == "stoptime")
            out << "_sysy_stoptime";
        else
            out << callee;
        out << '\n';
    }
};

class Return : public Instr {
private:
    bool has_return_value;
    bool is_gp;
public:
    Return(bool _has_return_value, bool is_gp) : has_return_value(_has_return_value), is_gp(is_gp) {}

    virtual std::vector<Reg> use_reg() override {
        if(has_return_value && is_gp)
            return {A0};
        if(has_return_value && !is_gp)
            return {FP10};
        else return {};
    }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new Return(has_return_value, is_gp);
    }
    virtual void gen_asm(std::ostream &out) override {
        out << "    ret\n";
    }
};

class LoadDouble: public Instr {
private:
    Reg dst, base;
    int32_t offset;
    bool is_spill;
public:
    bool is_for_func; // true if this instruction is for caller save reg store
    void changeOffset(int32_t new_offset){
        offset = new_offset;
    }
    bool offsetZero(){return offset == 0;}
    LoadDouble(const Reg & _dst, const Reg & _base, int32_t _offset, bool isspill=false, bool cs=false) : dst(_dst), base(_base), offset(_offset), is_for_func(cs), is_spill(isspill) {}
    virtual std::vector<Reg> def_reg() override { return {dst}; }
    virtual std::vector<Reg> use_reg() override { return {base}; }
    virtual std::vector<Reg *> regs() override { return {&dst, &base}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new LoadDouble(_def[0], _use[0], offset);
    }
    virtual void gen_asm(std::ostream &out) override {
        if (dst.is_gp())
            out << "    ld " << dst << ", " << offset << '(' << base << ")\n";
        else
            out << "    fld " << dst << ", " << offset << '(' << base << ")\n";
    }
    bool is_spill_load() { return is_spill; }
    Reg get_base() { return base; }
    Reg get_dst() { return dst; }
    int32_t get_offset() { return offset; }
};

class Load : public Instr {
private:
    Reg dst, base;
    int32_t offset;
public:
    bool is_for_func; // true if this instruction is for caller save reg store
    void changeOffset(int32_t new_offset){
        offset = new_offset;
    }
    bool offsetZero(){return offset == 0;}
    Load(const Reg & _dst, const Reg & _base, int32_t _offset, bool cs=false) : dst(_dst), base(_base), offset(_offset), is_for_func(cs) {}

    virtual std::vector<Reg> def_reg() override { return {dst}; }
    virtual std::vector<Reg> use_reg() override { return {base}; }
    virtual std::vector<Reg *> regs() override { return {&dst, &base}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new Load(_def[0], _use[0], offset);
    }
    virtual void gen_asm(std::ostream &out) override {
        if (dst.is_gp())
            out << "    lw " << dst << ", " << offset << '(' << base << ")\n";
        else
            out << "    flw " << dst << ", " << offset << '(' << base << ")\n";
    }
    Reg get_base() { return base; }
    Reg get_dst() { return dst; }
    int32_t get_offset() { return offset; }
};

class Store : public Instr {
private:
    Reg src, base;
    int32_t offset;
public:
    bool is_for_func; // true if this instruction is for caller save reg store
    void changeOffset(int32_t new_offset){
        offset = new_offset;
    }
    bool offsetZero(){return offset == 0;}
    Store(const Reg & _src, const Reg & _base, int32_t _offset, bool cs=false) : src(_src), base(_base), offset(_offset), is_for_func(cs) {}

    virtual std::vector<Reg> use_reg() override { return {src, base}; }
    virtual std::vector<Reg *> regs() override { return {&src, &base}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new Store(_use[0], _use[1], offset);
    }
    virtual void gen_asm(std::ostream &out) override {
        if (src.is_gp())
            out << "    sw " << src << ", " << offset << '(' << base << ")\n";
        else
            out << "    fsw " << src << ", " << offset << '(' << base << ")\n";
    }
    Reg get_base() { return base; }
    Reg get_src() { return src; }
    int32_t get_offset() { return offset; }
};

class StoreDouble : public Instr {
private:
    Reg src, base;
    int32_t offset;
    bool is_spill;
public:
    bool is_for_func; // true if this instruction is for caller save reg store
    void changeOffset(int32_t new_offset){
        offset = new_offset;
    }
    Reg base_reg() { return base; }
    bool offsetZero(){return offset == 0;}
    StoreDouble(const Reg & _src, const Reg & _base, int32_t _offset, bool isspill=false, bool cs=false) : src(_src), base(_base), offset(_offset), is_for_func(cs), is_spill(isspill) {}

    virtual std::vector<Reg> use_reg() override { return {src, base}; }
    virtual std::vector<Reg *> regs() override { return {&src, &base}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new StoreDouble(_use[0], _use[1], offset);
    }
    virtual void gen_asm(std::ostream &out) override {
        if (src.is_gp())
            out << "    sd " << src << ", " << offset << '(' << base << ")\n";
        else
            out << "    fsd " << src << ", " << offset << '(' << base << ")\n";
    }
    bool is_spill_store() { return is_spill; }
    int32_t get_offset() { return offset; }
    Reg get_src() { return src; }
    Reg get_base() { return base; }

};

class Sext : public Instr {
private:
    Reg dst;
    Reg src;
public:
    bool is_for_func; // true if this instruction is for caller save reg store
    bool arg;

    Sext(const Reg & _dst, const Reg & src_, bool cs=false, bool _arg=false) : dst(_dst), src(src_), is_for_func(cs), arg(_arg) {}
    virtual std::vector<Reg> def_reg() override { return {dst}; }
    virtual std::vector<Reg> use_reg() override { return {src}; }
    virtual std::vector<Reg *> regs() override { return {&dst, &src}; }
    virtual void gen_asm(std::ostream &out) override {
        out << "    sext.w " << dst << ", " << src << "\n";
    }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new Sext(_def[0], _use[0]);
    }
};


class Move : public Instr {
private:
    Reg dst, src;
public:
    bool pass_arg;
    Move(const Reg & _dst, const Reg & _src, bool arg=false) : dst(_dst), src(_src), pass_arg(arg) {}

    virtual std::vector<Reg> def_reg() override { return {dst}; }
    virtual std::vector<Reg> use_reg() override { return {src}; }
    virtual std::vector<Reg *> regs() override { return {&dst, &src}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new Move(_def[0], _use[0]);
    }
    Reg* getdst() { return &dst; }
    Reg* getsrc() { return &src; }
    virtual void gen_asm(std::ostream &out) override {
        if (dst.is_gp() && src.is_gp())
            out << "    mv " << dst << ", " << src << '\n';
        else if (dst.is_gp() && !src.is_gp())
            out << "    fmv.x.s " << dst << ", " << src << "\n";
        else if (!dst.is_gp() && src.is_gp())
            out << "    fmv.s.x " << dst << ", " << src << "\n";
        else
            out << "    fmv.s " << dst << ", " << src << "\n";
    }
};

class LoadLabelAddr : public Instr {
private:
    Reg dst;
    std::string label;
public:
    LoadLabelAddr(const Reg & _dst, std::string _label)
            : dst(_dst), label(std::move(_label)) {}

    virtual std::vector<Reg> def_reg() override { return {dst}; }
    virtual std::vector<Reg *> regs() override { return {&dst}; }
    virtual Instr* tonative(std::vector<Reg> _def, std::vector<Reg> _use) override {
        return new LoadLabelAddr(_def[0], label);
    }
    virtual void gen_asm(std::ostream &out) override {
        out << "    la " << dst << ", " << label << '\n';
    }
};

}

} // namespace riscv

} // namespace backend