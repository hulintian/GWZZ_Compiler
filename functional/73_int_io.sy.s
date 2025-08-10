    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $ascii_0
$ascii_0:
    .word 48
    .align 3
    .globl main
    .text

    .align 1
my_getint: 
BB32: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB0
BB0: 
    li t0, 0
    sw t0, -20(fp)
    j BB1
BB1: 
    li t0, 1
    seqz t0, t0
    bnez t0, BB2
    j BB3
BB2: 
    call getch
    mv t1, a0
    la t0, $ascii_0
    lw t0, 0(t0)
    sub t0, t1, t0
    sw t0, -24(fp)
    j BB4
BB3: 
    lw t0, -24(fp)
    sw t0, -20(fp)
    j BB11
BB4: 
    lw t0, -24(fp)
    sltz t0, t0
    bnez t0, BB8
    j BB7
BB5: 
    j BB1
BB6: 
BB7: 
    j BB3
BB8: 
    lw t0, -24(fp)
    li t1, 9
    slt t1, t1, t0
    bnez t1, BB5
    j BB7
BB9: 
BB10: 
BB11: 
    li t0, 1
    seqz t0, t0
    bnez t0, BB12
    j BB13
BB12: 
    call getch
    mv t0, a0
    la t1, $ascii_0
    lw t1, 0(t1)
    sub t1, t0, t1
    sw t1, -24(fp)
    j BB14
BB13: 
    lw t0, -20(fp)
    mv a0, t0
    j BB33
BB14: 
    lw t1, -24(fp)
    sltz t0, t1
    snez t0, t1
    bnez t0, BB18
    j BB17
BB15: 
    lw t1, -20(fp)
    li t0, 10
    mul t0, t1, t0
    lw t1, -24(fp)
    add t1, t0, t1
    sw t1, -20(fp)
    j BB16
BB16: 
    j BB11
BB17: 
    j BB13
BB18: 
    lw t0, -24(fp)
    li t1, 9
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB15
    j BB17
BB19: 
BB33: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
my_putint: 
BB34: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -112
    addi fp, sp, 112
    sw a0, -20(fp)
    j BB20
BB20: 
    li t0, 0
    sw t0, -88(fp)
    j BB21
BB21: 
    lw t0, -20(fp)
    sgtz t0, t0
    bnez t0, BB22
    j BB23
BB22: 
    lw t1, -88(fp)
    slli t1, t1, 2
    addi t0, fp, -84
    add t0, t0, t1
    lw t1, -20(fp)
    li t2, 10
    rem t2, t1, t2
    la t1, $ascii_0
    lw t1, 0(t1)
    add t1, t2, t1
    sw t1, 0(t0)
    lw t1, -20(fp)
    li t0, 10
    div t0, t1, t0
    sw t0, -20(fp)
    lw t0, -88(fp)
    addi t0, t0, 1
    sw t0, -88(fp)
    j BB21
BB23: 
    j BB24
BB24: 
    lw t0, -88(fp)
    sgtz t0, t0
    bnez t0, BB25
    j BB26
BB25: 
    lw t0, -88(fp)
    addi t0, t0, -1
    sw t0, -88(fp)
    lw t0, -88(fp)
    slli t0, t0, 2
    addi t1, fp, -84
    add t1, t1, t0
    lw t1, 0(t1)
    mv a0, t1
    call putch
    j BB24
BB26: 
    j BB35
BB35: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 112
    ret
    .align 1
main: 
BB36: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB27
BB27: 
    call my_getint
    mv t0, a0
    sw t0, -20(fp)
    j BB28
BB28: 
    lw t0, -20(fp)
    sgtz t0, t0
    bnez t0, BB29
    j BB30
BB29: 
    call my_getint
    mv t0, a0
    sw t0, -24(fp)
    lw t0, -24(fp)
    mv a0, t0
    call my_putint
    li t0, 10
    mv a0, t0
    call putch
    lw t0, -20(fp)
    addi t0, t0, -1
    sw t0, -20(fp)
    j BB28
BB30: 
    li t0, 0
    mv a0, t0
    j BB37
BB37: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
