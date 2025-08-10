    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$a:
    .skip 4
$b:
    .skip 4
$d:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
set_a: 
BB65: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB0
BB0: 
    lw t0, -20(fp)
    la t1, $a
    sw t0, 0(t1)
    la t1, $a
    lw t1, 0(t1)
    mv a0, t1
    j BB66
BB66: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
set_b: 
BB67: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB1
BB1: 
    lw t0, -20(fp)
    la t1, $b
    sw t0, 0(t1)
    la t1, $b
    lw t1, 0(t1)
    mv a0, t1
    j BB68
BB68: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
set_d: 
BB69: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB2
BB2: 
    lw t0, -20(fp)
    la t1, $d
    sw t0, 0(t1)
    la t1, $d
    lw t1, 0(t1)
    mv a0, t1
    j BB70
BB70: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
main: 
BB71: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    j BB3
BB3: 
    li t0, 2
    la t1, $a
    sw t0, 0(t1)
    li t1, 3
    la t0, $b
    sw t1, 0(t0)
    j BB4
BB4: 
    li t0, 0
    mv a0, t0
    call set_a
    mv t0, a0
    seqz t0, t0
    bnez t0, BB7
    j BB6
BB5: 
    j BB6
BB6: 
    la t0, $a
    lw t0, 0(t0)
    mv a0, t0
    call putint
    li t0, 32
    mv a0, t0
    call putch
    la t0, $b
    lw t0, 0(t0)
    mv a0, t0
    call putint
    li t0, 32
    mv a0, t0
    call putch
    li t0, 2
    la t1, $a
    sw t0, 0(t1)
    li t1, 3
    la t0, $b
    sw t1, 0(t0)
    j BB8
BB7: 
    li t0, 1
    mv a0, t0
    call set_b
    mv t0, a0
    seqz t0, t0
    bnez t0, BB5
    j BB6
BB8: 
    li t0, 0
    mv a0, t0
    call set_a
    mv t0, a0
    seqz t0, t0
    bnez t0, BB11
    j BB10
BB9: 
    j BB10
BB10: 
    la t0, $a
    lw t0, 0(t0)
    mv a0, t0
    call putint
    li t0, 32
    mv a0, t0
    call putch
    la t0, $b
    lw t0, 0(t0)
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    li t0, 1
    sw t0, -20(fp)
    li t0, 2
    la t1, $d
    sw t0, 0(t1)
    j BB12
BB11: 
    li t0, 1
    mv a0, t0
    call set_b
    mv t0, a0
    seqz t0, t0
    bnez t0, BB9
    j BB10
BB12: 
    lw t1, -20(fp)
    slti t0, t1, 1
    snez t0, t1
    bnez t0, BB15
    j BB14
BB13: 
    j BB14
BB14: 
    la t0, $d
    lw t0, 0(t0)
    mv a0, t0
    call putint
    li t0, 32
    mv a0, t0
    call putch
    j BB16
BB15: 
    li t0, 3
    mv a0, t0
    call set_d
    mv t0, a0
    seqz t0, t0
    bnez t0, BB13
    j BB14
BB16: 
    lw t0, -20(fp)
    li t1, 1
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB19
    j BB18
BB17: 
    j BB18
BB18: 
    la t1, $d
    lw t1, 0(t1)
    mv a0, t1
    call putint
    li t1, 10
    mv a0, t1
    call putch
    j BB20
BB19: 
    li t1, 4
    mv a0, t1
    call set_d
    mv t1, a0
    seqz t1, t1
    bnez t1, BB17
    j BB18
BB20: 
    li t1, 2
    addi t1, t1, 1
    li t0, 3
    sub t0, t0, t1
    li t1, 16
    slt t1, t0, t1
    xori t1, t1, 1
    bnez t1, BB21
    j BB22
BB21: 
    li t0, 65
    mv a0, t0
    call putch
    j BB22
BB22: 
    j BB23
BB23: 
    li t1, 25
    addi t1, t1, -7
    li t0, 6
    li t2, 3
    mul t2, t0, t2
    li t0, 36
    sub t0, t0, t2
    xor t0, t1, t0
    snez t0, t0
    bnez t0, BB24
    j BB25
BB24: 
    li t0, 66
    mv a0, t0
    call putch
    j BB25
BB25: 
    j BB26
BB26: 
    li t0, 1
    slti t0, t0, 8
    li t1, 7
    li t2, 2
    rem t2, t1, t2
    xor t2, t0, t2
    snez t2, t2
    bnez t2, BB27
    j BB28
BB27: 
    li t0, 67
    mv a0, t0
    call putch
    j BB28
BB28: 
    j BB29
BB29: 
    li t2, 3
    li t0, 4
    slt t0, t0, t2
    seqz t0, t0
    bnez t0, BB30
    j BB31
BB30: 
    li t0, 68
    mv a0, t0
    call putch
    j BB31
BB31: 
    j BB32
BB32: 
    li t0, 102
    li t2, 63
    slt t2, t2, t0
    xori t2, t2, 1
    li t0, 1
    xor t0, t0, t2
    seqz t0, t0
    bnez t0, BB33
    j BB34
BB33: 
    li t0, 69
    mv a0, t0
    call putch
    j BB34
BB34: 
    j BB35
BB35: 
    li t0, 5
    addi t0, t0, -6
    li t2, 0
    seqz t2, t2
    li t1, 0
    sub t1, t1, t2
    xor t1, t0, t1
    seqz t1, t1
    bnez t1, BB36
    j BB37
BB36: 
    li t0, 70
    mv a0, t0
    call putch
    j BB37
BB37: 
    li t1, 10
    mv a0, t1
    call putch
    li t1, 0
    sw t1, -24(fp)
    li t1, 1
    sw t1, -28(fp)
    li t1, 2
    sw t1, -32(fp)
    li t1, 3
    sw t1, -36(fp)
    li t1, 4
    sw t1, -40(fp)
    j BB38
BB38: 
    lw t1, -24(fp)
    seqz t1, t1
    bnez t1, BB41
    j BB40
BB39: 
    li t0, 32
    mv a0, t0
    call putch
    j BB38
BB40: 
    j BB42
BB41: 
    lw t1, -28(fp)
    seqz t1, t1
    bnez t1, BB39
    j BB40
BB42: 
    lw t1, -24(fp)
    seqz t1, t1
    bnez t1, BB45
    j BB44
BB43: 
    li t0, 67
    mv a0, t0
    call putch
    j BB44
BB44: 
    j BB46
BB45: 
    lw t1, -28(fp)
    seqz t1, t1
    bnez t1, BB43
    j BB44
BB46: 
    lw t1, -24(fp)
    lw t0, -28(fp)
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB49
    j BB48
BB47: 
    li t0, 72
    mv a0, t0
    call putch
    j BB48
BB48: 
    j BB50
BB49: 
    lw t0, -28(fp)
    lw t1, -24(fp)
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB47
    j BB48
BB50: 
    lw t1, -32(fp)
    lw t0, -28(fp)
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB53
    j BB52
BB51: 
    li t0, 73
    mv a0, t0
    call putch
    j BB52
BB52: 
    j BB54
BB53: 
    lw t0, -40(fp)
    lw t1, -36(fp)
    xor t1, t0, t1
    snez t1, t1
    bnez t1, BB51
    j BB52
BB54: 
    lw t1, -24(fp)
    lw t0, -28(fp)
    li t2, 0
    xor t2, t2, t0
    snez t2, t2
    xor t2, t1, t2
    seqz t2, t2
    bnez t2, BB58
    j BB57
BB55: 
    li t0, 74
    mv a0, t0
    call putch
    j BB56
BB56: 
    j BB59
BB57: 
    lw t1, -40(fp)
    lw t2, -40(fp)
    slt t2, t2, t1
    xori t2, t2, 1
    bnez t2, BB55
    j BB56
BB58: 
    lw t2, -36(fp)
    lw t1, -36(fp)
    slt t1, t2, t1
    bnez t1, BB55
    j BB57
BB59: 
    lw t2, -24(fp)
    lw t1, -28(fp)
    li t0, 0
    xor t0, t0, t1
    snez t0, t0
    xor t0, t2, t0
    seqz t0, t0
    bnez t0, BB62
    j BB61
BB60: 
    li t0, 75
    mv a0, t0
    call putch
    j BB61
BB61: 
    li t0, 10
    mv a0, t0
    call putch
    li t0, 0
    mv a0, t0
    j BB72
BB62: 
    lw t0, -36(fp)
    lw t2, -36(fp)
    slt t2, t0, t2
    bnez t2, BB63
    j BB61
BB63: 
    lw t2, -40(fp)
    lw t0, -40(fp)
    slt t0, t0, t2
    xori t0, t0, 1
    bnez t0, BB60
    j BB61
BB72: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
