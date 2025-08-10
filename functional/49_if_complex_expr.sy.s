    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
main: 
BB12: 
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
    li t0, 2
    sw t0, -36(fp)
    j BB1
BB1: 
    lw t0, -32(fp)
    li t1, 1
    mul t1, t0, t1
    li t0, 2
    div t0, t1, t0
    sltz t0, t0
    bnez t0, BB4
    j BB3
BB2: 
    lw t1, -36(fp)
    mv a0, t1
    call putint
    j BB3
BB3: 
    j BB6
BB4: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    sub t1, t0, t1
    seqz t1, t1
    bnez t1, BB5
    j BB3
BB5: 
    lw t1, -28(fp)
    addi t1, t1, 3
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB2
    j BB3
BB6: 
    lw t0, -32(fp)
    li t1, 2
    rem t1, t0, t1
    addi t1, t1, 67
    sltz t1, t1
    bnez t1, BB9
    j BB8
BB7: 
    li t1, 4
    sw t1, -36(fp)
    lw t1, -36(fp)
    mv a0, t1
    call putint
    j BB8
BB8: 
    li t1, 0
    mv a0, t1
    j BB13
BB9: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    sub t0, t1, t0
    seqz t0, t0
    bnez t0, BB10
    j BB8
BB10: 
    lw t0, -28(fp)
    addi t0, t0, 2
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB7
    j BB8
BB13: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
