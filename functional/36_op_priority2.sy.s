    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
main: 
BB2: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB0
BB0: 
    li t0, 10
    sw t0, -20(fp)
    li t0, 4
    sw t0, -24(fp)
    li t0, 2
    sw t0, -28(fp)
    li t0, 2
    sw t0, -32(fp)
    lw t0, -28(fp)
    lw t1, -20(fp)
    add t0, t0, t1
    lw t1, -24(fp)
    lw t2, -32(fp)
    sub t2, t1, t2
    mul t2, t0, t2
    mv a0, t2
    j BB3
BB3: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
