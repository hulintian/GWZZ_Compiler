#pragma once
#include "backend/program.hpp"
#include "backend/instr.hpp"
#include "common/regarch.hpp"

namespace backend{
namespace riscv{

class Program;
class Function;

void backend_passes(Program *prog);

void remove_useless_load(Function* func);

void clean_control_flow(Function* func);

void remove_useless_inst(Function *func);

void tail_duplication(Program* prog, Function* func);

}
}