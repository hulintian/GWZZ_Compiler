    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
main: 
BB9: 
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
    j BB10
BB4: 
    lw t0, -20(fp)
    xori t0, t0, 50
    seqz t0, t0
    bnez t0, BB5
    j BB6
BB5: 
    j BB3
BB6: 
    lw t0, -24(fp)
    lw t1, -20(fp)
    add t1, t0, t1
    sw t1, -24(fp)
    lw t1, -20(fp)
    addi t1, t1, 1
    sw t1, -20(fp)
    j BB1
BB7: 
BB10: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
