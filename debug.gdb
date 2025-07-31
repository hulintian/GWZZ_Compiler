# set args -S -o  tests/myt1.s tests/t1.sy 
# set args tests/to2.sy 
# set args tests/t6_fib.sy
# set args tests/test/24_if_test1.sy 
# set args RISCV-性能/01_mm1.sy

# set args -S -o test/speed_t1.s ~/compiler2025/RISCV-性能/01_mm1.sy
# set args -S -o tmp/tests_t86.s ~/compiler2025/functional/functional_recover/functional/86_long_code2.sy
set args -S -o tmp/tests_t76.s ~/compiler2025/functional/functional_recover/functional/76_n_queens.sy

set print pretty on
set print object on

# b src/IR/Function.cpp:29
# b src/frontend/codegen.cpp:440
# break src/frontend/Sema.cpp:137 if (int)strcmp(name._M_dataplus._M_p, "$var_in_while_in_if") == 0


