    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
whileIf: 
BB14: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB0
BB0: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    j BB1
BB1: 
    lw t0, -20(fp)
    slti t0, t0, 100
    bnez t0, BB2
    j BB3
BB2: 
    j BB4
BB3: 
    lw t0, -24(fp)
    mv a0, t0
    j BB15
BB4: 
    lw t0, -20(fp)
    xori t0, t0, 5
    seqz t0, t0
    bnez t0, BB5
    j BB7
BB5: 
    li t1, 25
    sw t1, -24(fp)
    j BB6
BB6: 
    lw t1, -20(fp)
    addi t1, t1, 1
    sw t1, -20(fp)
    j BB1
BB7: 
    j BB8
BB8: 
    lw t0, -20(fp)
    xori t0, t0, 10
    seqz t0, t0
    bnez t0, BB9
    j BB11
BB9: 
    li t1, 42
    sw t1, -24(fp)
    j BB10
BB10: 
    j BB6
BB11: 
    lw t0, -20(fp)
    li t1, 2
    mul t1, t0, t1
    sw t1, -24(fp)
    j BB10
BB15: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
main: 
BB16: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB12
BB12: 
    call whileIf
    mv t0, a0
    mv a0, t0
    j BB17
BB17: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
