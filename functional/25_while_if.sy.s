    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
get_one: 
BB16: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB0
BB0: 
    li t0, 1
    mv a0, t0
    j BB17
BB17: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
deepWhileBr: 
BB18: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB1
BB1: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    add t1, t0, t1
    sw t1, -28(fp)
    j BB2
BB2: 
    lw t1, -28(fp)
    slti t1, t1, 75
    bnez t1, BB3
    j BB4
BB3: 
    li t1, 42
    sw t1, -32(fp)
    j BB5
BB4: 
    lw t1, -28(fp)
    mv a0, t1
    j BB19
BB5: 
    lw t1, -28(fp)
    slti t1, t1, 100
    bnez t1, BB6
    j BB7
BB6: 
    lw t1, -28(fp)
    lw t0, -32(fp)
    add t0, t1, t0
    sw t0, -28(fp)
    j BB8
BB7: 
    j BB2
BB8: 
    lw t0, -28(fp)
    li t1, 99
    slt t1, t1, t0
    bnez t1, BB9
    j BB10
BB9: 
    lw t1, -32(fp)
    li t0, 2
    mul t0, t1, t0
    sw t0, -36(fp)
    j BB11
BB10: 
    j BB7
BB11: 
    li t0, 0
    mv a0, t0
    call get_one
    mv t0, a0
    xori t0, t0, 1
    seqz t0, t0
    bnez t0, BB12
    j BB13
BB12: 
    lw t0, -36(fp)
    li t1, 2
    mul t1, t0, t1
    sw t1, -28(fp)
    j BB13
BB13: 
    j BB10
BB19: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
    .align 1
main: 
BB20: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB14
BB14: 
    li t0, 2
    sw t0, -20(fp)
    lw t0, -20(fp)
    lw t1, -20(fp)
    mv a0, t0
    mv a1, t1
    call deepWhileBr
    mv t1, a0
    sw t1, -20(fp)
    lw t1, -20(fp)
    mv a0, t1
    call putint
    li t1, 0
    mv a0, t1
    j BB21
BB21: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
