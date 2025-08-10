    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $TOKEN_OTHER
$TOKEN_OTHER:
    .word 1
    .globl $last_char
$last_char:
    .word 32
    .bss
    .align 3
$TOKEN_NUM:
    .skip 4
$num:
    .skip 4
$other:
    .skip 4
$cur_token:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
next_char: 
BB81: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB0
BB0: 
    call getch
    mv t0, a0
    la t1, $last_char
    sw t0, 0(t1)
    la t1, $last_char
    lw t1, 0(t1)
    mv a0, t1
    j BB82
BB82: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
is_space: 
BB83: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB1
BB1: 
    j BB2
BB2: 
    lw t0, -20(fp)
    xori t0, t0, 32
    seqz t0, t0
    bnez t0, BB6
    j BB5
BB3: 
    li t0, 1
    mv a0, t0
    j BB84
BB4: 
BB5: 
    li t0, 0
    mv a0, t0
    j BB84
BB6: 
    lw t0, -20(fp)
    xori t0, t0, 10
    seqz t0, t0
    bnez t0, BB3
    j BB5
BB84: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
is_num: 
BB85: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB7
BB7: 
    j BB8
BB8: 
    lw t0, -20(fp)
    slti t1, t0, 48
    snez t1, t0
    bnez t1, BB12
    j BB11
BB9: 
    li t0, 1
    mv a0, t0
    j BB86
BB10: 
BB11: 
    li t0, 0
    mv a0, t0
    j BB86
BB12: 
    lw t1, -20(fp)
    li t0, 57
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB9
    j BB11
BB86: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
next_token: 
BB87: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB13
BB13: 
    j BB14
BB14: 
    la t0, $last_char
    lw t0, 0(t0)
    mv a0, t0
    call is_space
    mv t0, a0
    seqz t0, t0
    bnez t0, BB15
    j BB16
BB15: 
    call next_char
    mv t1, a0
    j BB14
BB16: 
    j BB17
BB17: 
    la t0, $last_char
    lw t0, 0(t0)
    mv a0, t0
    call is_num
    mv t0, a0
    seqz t0, t0
    bnez t0, BB18
    j BB20
BB18: 
    la t0, $last_char
    lw t0, 0(t0)
    addi t0, t0, -48
    la t1, $num
    sw t0, 0(t1)
    j BB21
BB19: 
    la t0, $cur_token
    lw t0, 0(t0)
    mv a0, t0
    j BB88
BB20: 
    la t0, $last_char
    lw t0, 0(t0)
    la t1, $other
    sw t0, 0(t1)
    call next_char
    mv t1, a0
    la t1, $TOKEN_OTHER
    lw t1, 0(t1)
    la t0, $cur_token
    sw t1, 0(t0)
    j BB19
BB21: 
    call next_char
    mv t1, a0
    mv a0, t1
    call is_num
    mv t1, a0
    seqz t1, t1
    bnez t1, BB22
    j BB23
BB22: 
    la t0, $num
    lw t0, 0(t0)
    li t1, 10
    mul t1, t0, t1
    la t0, $last_char
    lw t0, 0(t0)
    add t0, t1, t0
    addi t0, t0, -48
    la t1, $num
    sw t0, 0(t1)
    j BB21
BB23: 
    la t1, $TOKEN_NUM
    lw t1, 0(t1)
    la t0, $cur_token
    sw t1, 0(t0)
    j BB19
BB88: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
panic: 
BB89: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB24
BB24: 
    li t0, 112
    mv a0, t0
    call putch
    li t0, 97
    mv a0, t0
    call putch
    li t0, 110
    mv a0, t0
    call putch
    li t0, 105
    mv a0, t0
    call putch
    li t0, 99
    mv a0, t0
    call putch
    li t0, 33
    mv a0, t0
    call putch
    li t0, 10
    mv a0, t0
    call putch
    li t0, 0
    addi t0, t0, -1
    mv a0, t0
    j BB90
BB90: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
get_op_prec: 
BB91: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB25
BB25: 
    j BB26
BB26: 
    lw t0, -20(fp)
    xori t0, t0, 43
    seqz t0, t0
    bnez t0, BB29
    j BB28
BB27: 
    li t0, 10
    mv a0, t0
    j BB92
BB28: 
    j BB30
BB29: 
    lw t0, -20(fp)
    xori t0, t0, 45
    seqz t0, t0
    bnez t0, BB27
    j BB28
BB30: 
    lw t0, -20(fp)
    xori t0, t0, 42
    seqz t0, t0
    bnez t0, BB34
    j BB33
BB31: 
    li t0, 20
    mv a0, t0
    j BB92
BB32: 
    li t0, 0
    mv a0, t0
    j BB92
BB33: 
    lw t0, -20(fp)
    xori t0, t0, 37
    seqz t0, t0
    bnez t0, BB31
    j BB32
BB34: 
    lw t0, -20(fp)
    xori t0, t0, 47
    seqz t0, t0
    bnez t0, BB31
    j BB33
BB92: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
stack_push: 
BB93: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    sw a1, -28(fp)
    j BB35
BB35: 
    ld t0, -24(fp)
    addi t0, t0, 0
    ld t1, -24(fp)
    addi t1, t1, 0
    lw t1, 0(t1)
    addi t1, t1, 1
    sw t1, 0(t0)
    ld t0, -24(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -28(fp)
    sw t1, 0(t0)
    j BB94
BB94: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
stack_pop: 
BB95: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    j BB36
BB36: 
    ld t0, -24(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    sw t0, -28(fp)
    ld t0, -24(fp)
    addi t0, t0, 0
    ld t1, -24(fp)
    addi t1, t1, 0
    lw t1, 0(t1)
    addi t1, t1, -1
    sw t1, 0(t0)
    lw t1, -28(fp)
    mv a0, t1
    j BB96
BB96: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
stack_peek: 
BB97: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sd a0, -24(fp)
    j BB37
BB37: 
    ld t0, -24(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    mv a0, t0
    j BB98
BB98: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
stack_size: 
BB99: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sd a0, -24(fp)
    j BB38
BB38: 
    ld t0, -24(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    mv a0, t0
    j BB100
BB100: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
eval_op: 
BB101: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    sw a1, -24(fp)
    sw a2, -28(fp)
    j BB39
BB39: 
    j BB40
BB40: 
    lw t0, -20(fp)
    xori t0, t0, 43
    seqz t0, t0
    bnez t0, BB41
    j BB42
BB41: 
    lw t0, -24(fp)
    lw t1, -28(fp)
    add t1, t0, t1
    mv a0, t1
    j BB102
BB42: 
    j BB43
BB43: 
    lw t0, -20(fp)
    xori t0, t0, 45
    seqz t0, t0
    bnez t0, BB44
    j BB45
BB44: 
    lw t1, -24(fp)
    lw t0, -28(fp)
    sub t0, t1, t0
    mv a0, t0
    j BB102
BB45: 
    j BB46
BB46: 
    lw t0, -20(fp)
    xori t0, t0, 42
    seqz t0, t0
    bnez t0, BB47
    j BB48
BB47: 
    lw t0, -24(fp)
    lw t1, -28(fp)
    mul t1, t0, t1
    mv a0, t1
    j BB102
BB48: 
    j BB49
BB49: 
    lw t0, -20(fp)
    xori t0, t0, 47
    seqz t0, t0
    bnez t0, BB50
    j BB51
BB50: 
    lw t1, -24(fp)
    lw t0, -28(fp)
    div t0, t1, t0
    mv a0, t0
    j BB102
BB51: 
    j BB52
BB52: 
    lw t0, -20(fp)
    xori t0, t0, 37
    seqz t0, t0
    bnez t0, BB53
    j BB54
BB53: 
    lw t0, -24(fp)
    lw t1, -28(fp)
    rem t1, t0, t1
    mv a0, t1
    j BB102
BB54: 
    li t0, 0
    mv a0, t0
    j BB102
BB102: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
eval: 
BB103: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    li t0, -2112
    add sp, sp, t0
    li t0, 2112
    add fp, sp, t0
    j BB55
BB55: 
    j BB56
BB56: 
    la t0, $cur_token
    lw t0, 0(t0)
    la t1, $TOKEN_NUM
    lw t1, 0(t1)
    xor t1, t0, t1
    snez t1, t1
    bnez t1, BB57
    j BB58
BB57: 
    call panic
    mv t1, a0
    mv a0, t1
    j BB104
BB58: 
    la t1, $num
    lw t1, 0(t1)
    addi t0, fp, -1040
    mv a0, t0
    mv a1, t1
    call stack_push
    call next_token
    mv t1, a0
    j BB59
BB59: 
    la t1, $cur_token
    lw t1, 0(t1)
    la t0, $TOKEN_OTHER
    lw t0, 0(t0)
    xor t0, t1, t0
    seqz t0, t0
    bnez t0, BB60
    j BB61
BB60: 
    la t2, $other
    lw t2, 0(t2)
    li t0, -2068
    add t0, fp, t0
    sw t2, 0(t0)
    j BB62
BB61: 
    call next_token
    mv t0, a0
    j BB73
BB62: 
    li t0, -2068
    add t0, fp, t0
    lw t0, 0(t0)
    mv a0, t0
    call get_op_prec
    mv t0, a0
    li t2, 0
    xor t2, t2, t0
    snez t2, t2
    bnez t2, BB63
    j BB64
BB63: 
    j BB61
BB64: 
    call next_token
    mv t2, a0
    j BB66
BB65: 
BB66: 
    li t2, -2064
    add t2, t2, fp
    mv a0, t2
    call stack_size
    mv t2, a0
    seqz t2, t2
    bnez t2, BB69
    j BB68
BB67: 
    li t2, -2064
    add t2, t2, fp
    mv a0, t2
    call stack_pop
    mv t2, a0
    li t0, -2072
    add t0, fp, t0
    sw t2, 0(t0)
    addi t0, fp, -1040
    mv a0, t0
    call stack_pop
    mv t0, a0
    li t2, -2076
    add t2, fp, t2
    sw t0, 0(t2)
    addi t2, fp, -1040
    mv a0, t2
    call stack_pop
    mv t2, a0
    li t0, -2080
    add t0, fp, t0
    sw t2, 0(t0)
    li t0, -2072
    add t0, fp, t0
    lw t0, 0(t0)
    li t2, -2080
    add t2, fp, t2
    lw t2, 0(t2)
    li t1, -2076
    add t1, fp, t1
    lw t1, 0(t1)
    mv a0, t0
    mv a1, t2
    mv a2, t1
    call eval_op
    mv t1, a0
    addi t2, fp, -1040
    mv a0, t2
    mv a1, t1
    call stack_push
    j BB66
BB68: 
    li t0, -2068
    add t0, fp, t0
    lw t0, 0(t0)
    li t2, -2064
    add t2, t2, fp
    mv a0, t2
    mv a1, t0
    call stack_push
    j BB70
BB69: 
    li t2, -2064
    add t2, t2, fp
    mv a0, t2
    call stack_peek
    mv t2, a0
    mv a0, t2
    call get_op_prec
    mv t2, a0
    li t0, -2068
    add t0, fp, t0
    lw t0, 0(t0)
    mv a0, t0
    call get_op_prec
    mv t0, a0
    slt t0, t0, t2
    xori t0, t0, 1
    bnez t0, BB67
    j BB68
BB70: 
    la t0, $cur_token
    lw t0, 0(t0)
    la t2, $TOKEN_NUM
    lw t2, 0(t2)
    xor t2, t0, t2
    snez t2, t2
    bnez t2, BB71
    j BB72
BB71: 
    call panic
    mv t2, a0
    mv a0, t2
    j BB104
BB72: 
    la t2, $num
    lw t2, 0(t2)
    addi t0, fp, -1040
    mv a0, t0
    mv a1, t2
    call stack_push
    call next_token
    mv t2, a0
    j BB59
BB73: 
    li t0, -2064
    add t0, t0, fp
    mv a0, t0
    call stack_size
    mv t0, a0
    seqz t0, t0
    bnez t0, BB74
    j BB75
BB74: 
    li t0, -2064
    add t0, t0, fp
    mv a0, t0
    call stack_pop
    mv t0, a0
    li t1, -2084
    add t1, fp, t1
    sw t0, 0(t1)
    addi t1, fp, -1040
    mv a0, t1
    call stack_pop
    mv t1, a0
    li t0, -2088
    add t0, fp, t0
    sw t1, 0(t0)
    addi t0, fp, -1040
    mv a0, t0
    call stack_pop
    mv t0, a0
    li t1, -2092
    add t1, fp, t1
    sw t0, 0(t1)
    li t1, -2084
    add t1, fp, t1
    lw t1, 0(t1)
    li t0, -2092
    add t0, fp, t0
    lw t0, 0(t0)
    li t2, -2088
    add t2, fp, t2
    lw t2, 0(t2)
    mv a0, t1
    mv a1, t0
    mv a2, t2
    call eval_op
    mv t2, a0
    addi t0, fp, -1040
    mv a0, t0
    mv a1, t2
    call stack_push
    j BB73
BB75: 
    addi t0, fp, -1040
    mv a0, t0
    call stack_peek
    mv t0, a0
    mv a0, t0
    j BB104
BB104: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    li t0, 2112
    add sp, sp, t0
    ret
    .align 1
main: 
BB105: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB76
BB76: 
    call getint
    mv t0, a0
    sw t0, -20(fp)
    call getch
    mv t0, a0
    call next_token
    mv t0, a0
    j BB77
BB77: 
    lw t0, -20(fp)
    seqz t0, t0
    bnez t0, BB78
    j BB79
BB78: 
    call eval
    mv t0, a0
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    lw t0, -20(fp)
    addi t0, t0, -1
    sw t0, -20(fp)
    j BB77
BB79: 
    li t0, 0
    mv a0, t0
    j BB106
BB106: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
