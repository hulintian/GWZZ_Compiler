    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
deepWhileBr: 
BB15: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB0
BB0: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    add t1, t0, t1
    sw t1, -28(fp)
    j BB1
BB1: 
    lw t1, -28(fp)
    slti t1, t1, 75
    bnez t1, BB2
    j BB3
BB2: 
    li t1, 42
    sw t1, -32(fp)
    j BB4
BB3: 
    lw t1, -28(fp)
    mv a0, t1
    j BB16
BB4: 
    lw t1, -28(fp)
    slti t1, t1, 100
    bnez t1, BB5
    j BB6
BB5: 
    lw t1, -28(fp)
    lw t0, -32(fp)
    add t0, t1, t0
    sw t0, -28(fp)
    j BB7
BB6: 
    j BB1
BB7: 
    lw t0, -28(fp)
    li t1, 99
    slt t1, t1, t0
    bnez t1, BB8
    j BB9
BB8: 
    lw t1, -32(fp)
    li t0, 2
    mul t0, t1, t0
    sw t0, -36(fp)
    j BB10
BB9: 
    j BB6
BB10: 
    li t0, 1
    xori t0, t0, 1
    seqz t0, t0
    bnez t0, BB11
    j BB12
BB11: 
    lw t0, -36(fp)
    li t1, 2
    mul t1, t0, t1
    sw t1, -28(fp)
    j BB12
BB12: 
    j BB9
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
    addi sp, sp, -48
    addi fp, sp, 48
    j BB13
BB13: 
    li t0, 2
    sw t0, -20(fp)
    lw t0, -20(fp)
    lw t1, -20(fp)
    mv a0, t0
    mv a1, t1
    call deepWhileBr
    mv t1, a0
    mv a0, t1
    j BB18
BB18: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
