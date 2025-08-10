    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
main: 
BB6: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB0
BB0: 
    li t0, 10
    sw t0, -20(fp)
    j BB1
BB1: 
    lw t0, -20(fp)
    li t1, 0
    xor t1, t1, t0
    snez t1, t1
    li t0, 0
    xor t1, t0, t1
    snez t1, t1
    li t0, 0
    xor t0, t0, t1
    snez t0, t0
    li t1, 0
    sub t1, t1, t0
    seqz t1, t1
    bnez t1, BB2
    j BB4
BB2: 
    li t1, 0
    addi t1, t1, -1
    li t0, 0
    sub t0, t0, t1
    li t1, 0
    sub t1, t1, t0
    sw t1, -20(fp)
    j BB3
BB3: 
    lw t1, -20(fp)
    mv a0, t1
    j BB7
BB4: 
    li t1, 0
    sw t1, -20(fp)
    j BB3
BB7: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
