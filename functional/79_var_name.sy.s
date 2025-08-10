    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
main: 
BB5: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -128
    addi fp, sp, 128
    j BB0
BB0: 
    li t0, 2
    sw t0, -20(fp)
    li t0, 20
    sw t0, -24(fp)
    addi t0, fp, -104
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -100
    li t0, 2
    sw t0, 0(t1)
    li t1, 0
    sw t1, -108(fp)
    j BB1
BB1: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    slt t0, t1, t0
    bnez t0, BB2
    j BB3
BB2: 
    lw t0, -20(fp)
    slli t0, t0, 2
    addi t1, fp, -104
    add t1, t1, t0
    lw t0, -20(fp)
    slli t0, t0, 2
    addi t2, fp, -104
    add t2, t2, t0
    lw t2, 0(t2)
    lw t0, -20(fp)
    addi t0, t0, -1
    slli t0, t0, 2
    addi t3, fp, -104
    add t3, t3, t0
    lw t3, 0(t3)
    add t3, t2, t3
    lw t2, -20(fp)
    addi t2, t2, -2
    slli t2, t2, 2
    addi t0, fp, -104
    add t0, t0, t2
    lw t0, 0(t0)
    add t0, t3, t0
    sw t0, 0(t1)
    lw t0, -108(fp)
    lw t1, -20(fp)
    slli t1, t1, 2
    addi t3, fp, -104
    add t3, t3, t1
    lw t3, 0(t3)
    add t3, t0, t3
    sw t3, -108(fp)
    lw t3, -20(fp)
    slli t3, t3, 2
    addi t0, fp, -104
    add t0, t0, t3
    lw t0, 0(t0)
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    lw t0, -20(fp)
    addi t0, t0, 1
    sw t0, -20(fp)
    j BB1
BB3: 
    lw t0, -108(fp)
    mv a0, t0
    j BB6
BB6: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 128
    ret
