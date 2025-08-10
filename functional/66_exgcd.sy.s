    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
exgcd: 
BB7: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    sw a0, -20(fp)
    sw a1, -24(fp)
    sd a2, -32(fp)
    sd a3, -40(fp)
    j BB0
BB0: 
    j BB1
BB1: 
    lw t0, -24(fp)
    seqz t0, t0
    bnez t0, BB2
    j BB4
BB2: 
    ld t1, -32(fp)
    addi t1, t1, 0
    li t0, 1
    sw t0, 0(t1)
    ld t0, -40(fp)
    addi t0, t0, 0
    li t1, 0
    sw t1, 0(t0)
    lw t1, -20(fp)
    mv a0, t1
    j BB8
BB3: 
BB4: 
    lw t0, -24(fp)
    lw t1, -20(fp)
    lw t2, -24(fp)
    rem t2, t1, t2
    mv a0, t0
    mv a1, t2
    addi t2, fp, -32
    mv a2, t2
    addi t2, fp, -40
    mv a3, t2
    call exgcd
    mv t2, a0
    sw t2, -44(fp)
    ld t2, -32(fp)
    addi t2, t2, 0
    lw t2, 0(t2)
    sw t2, -48(fp)
    ld t2, -32(fp)
    addi t2, t2, 0
    ld t0, -40(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    sw t0, 0(t2)
    ld t0, -40(fp)
    addi t0, t0, 0
    lw t2, -48(fp)
    lw t1, -20(fp)
    lw t3, -24(fp)
    div t3, t1, t3
    ld t1, -40(fp)
    addi t1, t1, 0
    lw t1, 0(t1)
    mul t1, t3, t1
    sub t1, t2, t1
    sw t1, 0(t0)
    lw t1, -44(fp)
    mv a0, t1
    j BB8
BB8: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
    .align 1
main: 
BB9: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB5
BB5: 
    li t0, 7
    sw t0, -20(fp)
    li t0, 15
    sw t0, -24(fp)
    addi t0, fp, -28
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -32
    li t0, 1
    sw t0, 0(t1)
    lw t1, -20(fp)
    lw t0, -24(fp)
    mv a0, t1
    mv a1, t0
    addi t0, fp, -28
    mv a2, t0
    addi t0, fp, -32
    mv a3, t0
    call exgcd
    mv t0, a0
    addi t0, fp, -28
    addi t1, fp, -28
    lw t1, 0(t1)
    lw t2, -24(fp)
    rem t2, t1, t2
    lw t1, -24(fp)
    add t1, t2, t1
    lw t2, -24(fp)
    rem t2, t1, t2
    sw t2, 0(t0)
    addi t2, fp, -28
    lw t2, 0(t2)
    mv a0, t2
    call putint
    li t2, 0
    mv a0, t2
    j BB10
BB10: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
