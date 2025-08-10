    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
ifElseIf: 
BB18: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB0
BB0: 
    li t0, 5
    sw t0, -20(fp)
    li t0, 10
    sw t0, -24(fp)
    j BB1
BB1: 
    lw t0, -20(fp)
    xori t0, t0, 6
    seqz t0, t0
    bnez t0, BB5
    j BB4
BB2: 
    lw t0, -20(fp)
    mv a0, t0
    j BB19
BB3: 
    lw t0, -20(fp)
    mv a0, t0
    j BB19
BB4: 
    j BB6
BB5: 
    lw t0, -24(fp)
    xori t0, t0, 11
    seqz t0, t0
    bnez t0, BB2
    j BB4
BB6: 
    lw t0, -24(fp)
    xori t0, t0, 10
    seqz t0, t0
    bnez t0, BB10
    j BB9
BB7: 
    li t0, 25
    sw t0, -20(fp)
    j BB8
BB8: 
    j BB3
BB9: 
    j BB11
BB10: 
    lw t0, -20(fp)
    xori t0, t0, 1
    seqz t0, t0
    bnez t0, BB7
    j BB9
BB11: 
    lw t0, -24(fp)
    xori t0, t0, 10
    seqz t0, t0
    bnez t0, BB15
    j BB14
BB12: 
    lw t0, -20(fp)
    addi t0, t0, 15
    sw t0, -20(fp)
    j BB13
BB13: 
    j BB8
BB14: 
    lw t1, -20(fp)
    li t0, 0
    sub t0, t0, t1
    sw t0, -20(fp)
    j BB13
BB15: 
    lw t0, -20(fp)
    li t1, 0
    addi t1, t1, -5
    xor t1, t0, t1
    seqz t1, t1
    bnez t1, BB12
    j BB14
BB19: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
main: 
BB20: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB16
BB16: 
    call ifElseIf
    mv t0, a0
    mv a0, t0
    call putint
    li t0, 0
    mv a0, t0
    j BB21
BB21: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
