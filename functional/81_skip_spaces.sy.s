    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
main: 
BB8: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -448
    addi fp, sp, 448
    j BB0
BB0: 
    li t0, 0
    sw t0, -420(fp)
    li t0, 0
    sw t0, -424(fp)
    j BB1
BB1: 
    call getint
    mv t0, a0
    seqz t0, t0
    bnez t0, BB2
    j BB3
BB2: 
    lw t2, -420(fp)
    slli t2, t2, 2
    addi t1, fp, -416
    add t1, t1, t2
    call getint
    mv t2, a0
    sw t2, 0(t1)
    lw t2, -420(fp)
    addi t2, t2, 1
    sw t2, -420(fp)
    j BB1
BB3: 
    j BB4
BB4: 
    lw t0, -420(fp)
    seqz t0, t0
    bnez t0, BB5
    j BB6
BB5: 
    lw t1, -420(fp)
    addi t1, t1, -1
    sw t1, -420(fp)
    lw t1, -424(fp)
    lw t0, -420(fp)
    slli t0, t0, 2
    addi t2, fp, -416
    add t2, t2, t0
    lw t2, 0(t2)
    add t2, t1, t2
    sw t2, -424(fp)
    j BB4
BB6: 
    lw t0, -424(fp)
    li t1, 79
    rem t1, t0, t1
    mv a0, t1
    j BB9
BB9: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 448
    ret
