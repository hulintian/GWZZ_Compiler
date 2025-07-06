set args tests/t1.sy
# set args tests/t7_mlv.sy
# set args tests/test/24_if_test1.sy 

set print pretty on
set print object on

# break src/frontend/Sema.cpp:137 if (int)strcmp(name._M_dataplus._M_p, "$var_in_while_in_if") == 0


