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
    addi t0, fp, -80
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -76
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -72
    li t1, 3
    sw t1, 0(t0)
    addi t0, fp, -68
    li t1, 4
    sw t1, 0(t0)
    addi t1, fp, -64
    li t0, 5
    sw t0, 0(t1)
    addi t0, fp, -60
    li t1, 6
    sw t1, 0(t0)
    addi t1, fp, -56
    li t0, 7
    sw t0, 0(t1)
    addi t0, fp, -52
    li t1, 8
    sw t1, 0(t0)
    addi t1, fp, -112
    li t0, 1
    sw t0, 0(t1)
    addi t0, fp, -108
    li t1, 2
    sw t1, 0(t0)
    addi t1, fp, -104
    li t0, 3
    sw t0, 0(t1)
    addi t0, fp, -100
    li t1, 4
    sw t1, 0(t0)
    addi t1, fp, -96
    li t0, 5
    sw t0, 0(t1)
    addi t0, fp, -92
    li t1, 6
    sw t1, 0(t0)
    addi t1, fp, -88
    li t0, 7
    sw t0, 0(t1)
    addi t0, fp, -84
    li t1, 8
    sw t1, 0(t0)
    addi t1, fp, -144
    li t0, 1
    sw t0, 0(t1)
    addi t0, fp, -140
    li t1, 2
    sw t1, 0(t0)
    addi t1, fp, -136
    li t0, 3
    sw t0, 0(t1)
    addi t0, fp, -128
    li t1, 5
    sw t1, 0(t0)
    addi t1, fp, -120
    li t0, 7
    sw t0, 0(t1)
    addi t0, fp, -116
    li t1, 8
    sw t1, 0(t0)
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    addi t0, t0, 1
    slli t0, t0, 2
    addi t1, fp, -144
    add t1, t1, t0
    lw t1, 0(t1)
    addi t0, fp, -176
    sw t1, 0(t0)
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    addi t1, t1, 1
    slli t1, t1, 2
    addi t0, fp, -112
    add t0, t0, t1
    lw t0, 0(t0)
    addi t1, fp, -172
    sw t0, 0(t1)
    addi t1, fp, -168
    li t0, 3
    sw t0, 0(t1)
    addi t0, fp, -164
    li t1, 4
    sw t1, 0(t0)
    addi t1, fp, -160
    li t0, 5
    sw t0, 0(t1)
    addi t0, fp, -156
    li t1, 6
    sw t1, 0(t0)
    addi t1, fp, -152
    li t0, 7
    sw t0, 0(t1)
    addi t0, fp, -148
    li t1, 8
    sw t1, 0(t0)
    li t1, 3
    li t0, 2
    mul t0, t1, t0
    addi t0, t0, 1
    slli t0, t0, 2
    addi t1, fp, -176
    add t1, t1, t0
    lw t1, 0(t1)
    li t0, 0
    li t2, 2
    mul t2, t0, t2
    slli t2, t2, 2
    addi t0, fp, -176
    add t0, t0, t2
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 0
    li t2, 2
    mul t2, t1, t2
    addi t2, t2, 1
    slli t2, t2, 2
    addi t1, fp, -176
    add t1, t1, t2
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    slli t2, t2, 2
    addi t0, fp, -48
    add t0, t0, t2
    lw t0, 0(t0)
    add t0, t1, t0
    mv a0, t0
    j BB3
BB3: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 192
    ret
