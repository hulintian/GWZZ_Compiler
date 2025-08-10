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
    addi sp, sp, -192
    addi fp, sp, 192
    j BB0
BB0: 
    addi t0, fp, -48
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -44
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -40
    li t1, 3
    sw t1, 0(t0)
    addi t0, fp, -36
    li t1, 4
    sw t1, 0(t0)
    addi t1, fp, -24
    li t0, 7
    sw t0, 0(t1)
    addi t0, fp, -112
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -108
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -104
    li t1, 3
    sw t1, 0(t0)
    addi t1, fp, -100
    li t0, 4
    sw t0, 0(t1)
    addi t0, fp, -96
    li t1, 5
    sw t1, 0(t0)
    addi t1, fp, -92
    li t0, 6
    sw t0, 0(t1)
    addi t0, fp, -88
    li t1, 7
    sw t1, 0(t0)
    addi t1, fp, -84
    li t0, 8
    sw t0, 0(t1)
    addi t0, fp, -144
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -140
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -136
    li t1, 3
    sw t1, 0(t0)
    addi t1, fp, -128
    li t0, 5
    sw t0, 0(t1)
    addi t0, fp, -120
    li t1, 7
    sw t1, 0(t0)
    addi t1, fp, -116
    li t0, 8
    sw t0, 0(t1)
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    addi t1, t1, 1
    slli t1, t1, 2
    addi t0, fp, -144
    add t0, t0, t1
    lw t0, 0(t0)
    addi t1, fp, -176
    sw t0, 0(t1)
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    addi t0, t0, 1
    slli t0, t0, 2
    addi t1, fp, -112
    add t1, t1, t0
    lw t1, 0(t1)
    addi t0, fp, -172
    sw t1, 0(t0)
    addi t0, fp, -168
    li t1, 3
    sw t1, 0(t0)
    addi t1, fp, -164
    li t0, 4
    sw t0, 0(t1)
    addi t0, fp, -160
    li t1, 5
    sw t1, 0(t0)
    addi t1, fp, -156
    li t0, 6
    sw t0, 0(t1)
    addi t0, fp, -152
    li t1, 7
    sw t1, 0(t0)
    addi t1, fp, -148
    li t0, 8
    sw t0, 0(t1)
    li t0, 3
    li t1, 2
    mul t1, t0, t1
    li t0, 1
    li t2, 1
    mul t2, t0, t2
    add t2, t1, t2
    slli t2, t2, 2
    addi t1, fp, -176
    add t1, t1, t2
    lw t1, 0(t1)
    li t2, 0
    li t0, 2
    mul t0, t2, t0
    li t2, 0
    li t3, 1
    mul t3, t2, t3
    add t3, t0, t3
    slli t3, t3, 2
    addi t0, fp, -176
    add t0, t0, t3
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 0
    li t3, 2
    mul t3, t1, t3
    li t1, 1
    li t2, 1
    mul t2, t1, t2
    add t2, t3, t2
    slli t2, t2, 2
    addi t3, fp, -176
    add t3, t3, t2
    lw t3, 0(t3)
    add t3, t0, t3
    li t0, 3
    li t2, 2
    mul t2, t0, t2
    slli t2, t2, 2
    addi t0, fp, -144
    add t0, t0, t2
    lw t0, 0(t0)
    add t0, t3, t0
    mv a0, t0
    j BB3
BB3: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 192
    ret
