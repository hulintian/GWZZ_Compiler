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
    addi sp, sp, -64
    addi fp, sp, 64
    j BB0
BB0: 
    li t0, 5
    sw t0, -20(fp)
    li t0, 5
    sw t0, -24(fp)
    li t0, 1
    sw t0, -28(fp)
    li t0, 0
    addi t0, t0, -2
    sw t0, -32(fp)
    lw t0, -32(fp)
    li t1, 1
    mul t1, t0, t1
    li t0, 2
    div t0, t1, t0
    lw t1, -20(fp)
    lw t2, -24(fp)
    sub t2, t1, t2
    add t2, t0, t2
    lw t0, -28(fp)
    addi t0, t0, 3
    li t1, 0
    sub t1, t1, t0
    li t0, 2
    rem t0, t1, t0
    sub t0, t2, t0
    sw t0, -36(fp)
    lw t0, -36(fp)
    mv a0, t0
    call putint
    lw t0, -32(fp)
    li t2, 2
    rem t2, t0, t2
    addi t2, t2, 67
    lw t0, -20(fp)
    lw t1, -24(fp)
    sub t1, t0, t1
    li t0, 0
    sub t0, t0, t1
    add t0, t2, t0
    lw t2, -28(fp)
    addi t2, t2, 2
    li t1, 2
    rem t1, t2, t1
    li t2, 0
    sub t2, t2, t1
    sub t2, t0, t2
    sw t2, -36(fp)
    lw t2, -36(fp)
    addi t2, t2, 3
    sw t2, -36(fp)
    lw t2, -36(fp)
    mv a0, t2
    call putint
    li t2, 0
    mv a0, t2
    j BB3
BB3: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
