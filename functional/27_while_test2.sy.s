    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
FourWhile: 
BB15: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB0
BB0: 
    li t0, 5
    sw t0, -20(fp)
    li t0, 6
    sw t0, -24(fp)
    li t0, 7
    sw t0, -28(fp)
    li t0, 10
    sw t0, -32(fp)
    j BB1
BB1: 
    lw t0, -20(fp)
    slti t0, t0, 20
    bnez t0, BB2
    j BB3
BB2: 
    lw t0, -20(fp)
    addi t0, t0, 3
    sw t0, -20(fp)
    j BB4
BB3: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lw t2, -32(fp)
    add t2, t1, t2
    add t2, t0, t2
    lw t0, -28(fp)
    add t0, t2, t0
    mv a0, t0
    j BB16
BB4: 
    lw t0, -24(fp)
    slti t0, t0, 10
    bnez t0, BB5
    j BB6
BB5: 
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB7
BB6: 
    lw t0, -24(fp)
    addi t0, t0, -2
    sw t0, -24(fp)
    j BB1
BB7: 
    lw t0, -28(fp)
    xori t0, t0, 7
    seqz t0, t0
    bnez t0, BB8
    j BB9
BB8: 
    lw t0, -28(fp)
    addi t0, t0, -1
    sw t0, -28(fp)
    j BB10
BB9: 
    lw t0, -28(fp)
    addi t0, t0, 1
    sw t0, -28(fp)
    j BB4
BB10: 
    lw t0, -32(fp)
    slti t0, t0, 20
    bnez t0, BB11
    j BB12
BB11: 
    lw t0, -32(fp)
    addi t0, t0, 3
    sw t0, -32(fp)
    j BB10
BB12: 
    lw t0, -32(fp)
    addi t0, t0, -1
    sw t0, -32(fp)
    j BB7
BB16: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB17: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB13
BB13: 
    call FourWhile
    mv t0, a0
    mv a0, t0
    j BB18
BB18: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
