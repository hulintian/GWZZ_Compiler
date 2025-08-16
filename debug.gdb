# set args -S -o  tests/myt1.s tests/t1.sy 
# set args tests/to2.sy 
# set args tests/t6_fib.sy
# set args tests/test/24_if_test1.sy 
# set args RISCV-性能/01_mm1.sy

# set args -S -o test/speed_t1.s ~/compiler2025/RISCV-性能/01_mm1.sy
# set args -S -o tmp/tests_t86.s ~/compiler2025/functional/functional_recover/functional/86_long_code2.sy
# set args -S -o tmp/tests_t89.s ~/compiler2025/functional/functional_recover/functional/89_many_globals.sy
# set args -S -o tmp/tests_th39.s ~/compiler2025/functional/functional_recover/h_functional/39_fp_params.sy
# set args -S -o tmp/tests_t78.s ~/compiler2025/functional/functional_recover/functional/78_side_effect.sy
# set args -S -o tmp/tests_t79.s /tmp/test/t79.sy
# set args -S -o tmp/tests_t89.s ~/compiler2025/functional/functional_recover/functional/89_many_globals.sy
# set args -S -o tmp/tests_t00.s ~/compiler2025/functional/functional_recover/functional/00_main.sy
# set args -S -O1 -o tmp/test_xn_01.s tmp/RVXN/01_mm1.sy
# set args -S -O1 -o tmp/test_xn_transpose0.s tmp/RVXN/transpose0.sy
# set args -S -O1 -o tmp/03_sort2.s tmp/RVXN/03_sort2.sy
# set args -S -O1 -o tmp/h-9-02.s tmp/RVXN/h-9-02.sy
# set args -S -O1 -o tmp/test63.s tmp/functional/63_big_int_mul.sy
set args -S -O1 -o tmp/test64.s tmp/functional/64_calculator.sy

set print pretty on
set print object on

# b src/IR/Function.cpp:29
# b src/frontend/codegen.cpp:440
# break src/frontend/Sema.cpp:137 if (int)strcmp(name._M_dataplus._M_p, "$var_in_while_in_if") == 0


