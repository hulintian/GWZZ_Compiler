    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
relu_reg: 
BB26: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB0
BB0: 
    j BB1
BB1: 
    lw t0, -20(fp)
    li t1, 127
    slt t1, t1, t0
    bnez t1, BB2
    j BB3
BB2: 
    li t1, 127
    mv a0, t1
    j BB27
BB3: 
    j BB4
BB4: 
    lw t1, -20(fp)
    sltz t1, t1
    bnez t1, BB5
    j BB6
BB5: 
    li t1, 0
    mv a0, t1
    j BB27
BB6: 
    lw t1, -20(fp)
    mv a0, t1
    j BB27
BB27: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
model: 
BB28: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    j BB7
BB7: 
    j BB8
BB8: 
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 85
    mul t0, t1, t0
    li t1, 0
    li t2, 5
    mul t2, t1, t2
    addi t2, t2, 1
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 23
    mul t1, t2, t1
    add t1, t0, t1
    li t0, 0
    li t2, 5
    mul t2, t0, t2
    addi t2, t2, 2
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 0
    addi t0, t0, -82
    mul t0, t2, t0
    add t0, t1, t0
    li t1, 0
    li t2, 5
    mul t2, t1, t2
    addi t2, t2, 3
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 0
    addi t1, t1, -103
    mul t1, t2, t1
    add t1, t0, t1
    li t0, 0
    li t2, 5
    mul t2, t0, t2
    addi t2, t2, 4
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 0
    addi t0, t0, -123
    mul t0, t2, t0
    add t0, t1, t0
    li t1, 1
    li t2, 5
    mul t2, t1, t2
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 64
    mul t1, t2, t1
    add t1, t0, t1
    li t0, 1
    li t2, 5
    mul t2, t0, t2
    addi t2, t2, 1
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 0
    addi t0, t0, -120
    mul t0, t2, t0
    add t0, t1, t0
    li t1, 1
    li t2, 5
    mul t2, t1, t2
    addi t2, t2, 2
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 50
    mul t1, t2, t1
    add t1, t0, t1
    li t0, 1
    li t2, 5
    mul t2, t0, t2
    addi t2, t2, 3
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 0
    addi t0, t0, -59
    mul t0, t2, t0
    add t0, t1, t0
    li t1, 1
    li t2, 5
    mul t2, t1, t2
    addi t2, t2, 4
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 47
    mul t1, t2, t1
    add t1, t0, t1
    li t0, 2
    li t2, 5
    mul t2, t0, t2
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 0
    addi t0, t0, -111
    mul t0, t2, t0
    add t0, t1, t0
    li t1, 2
    li t2, 5
    mul t2, t1, t2
    addi t2, t2, 1
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 0
    addi t1, t1, -67
    mul t1, t2, t1
    add t1, t0, t1
    li t0, 2
    li t2, 5
    mul t2, t0, t2
    addi t2, t2, 2
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 0
    addi t0, t0, -106
    mul t0, t2, t0
    add t0, t1, t0
    li t1, 2
    li t2, 5
    mul t2, t1, t2
    addi t2, t2, 3
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 0
    addi t1, t1, -75
    mul t1, t2, t1
    add t1, t0, t1
    li t0, 2
    li t2, 5
    mul t2, t0, t2
    addi t2, t2, 4
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 0
    addi t0, t0, -102
    mul t0, t2, t0
    add t0, t1, t0
    li t1, 3
    li t2, 5
    mul t2, t1, t2
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 34
    mul t1, t2, t1
    add t1, t0, t1
    li t0, 3
    li t2, 5
    mul t2, t0, t2
    addi t2, t2, 1
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 0
    addi t0, t0, -39
    mul t0, t2, t0
    add t0, t1, t0
    li t1, 3
    li t2, 5
    mul t2, t1, t2
    addi t2, t2, 2
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 65
    mul t1, t2, t1
    add t1, t0, t1
    li t0, 3
    li t2, 5
    mul t2, t0, t2
    addi t2, t2, 3
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 47
    mul t0, t2, t0
    add t0, t1, t0
    li t1, 3
    li t2, 5
    mul t2, t1, t2
    addi t2, t2, 4
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 113
    mul t1, t2, t1
    add t1, t0, t1
    li t0, 4
    li t2, 5
    mul t2, t0, t2
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 110
    mul t0, t2, t0
    add t0, t1, t0
    li t1, 4
    li t2, 5
    mul t2, t1, t2
    addi t2, t2, 1
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 47
    mul t1, t2, t1
    add t1, t0, t1
    li t0, 4
    li t2, 5
    mul t2, t0, t2
    addi t2, t2, 2
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 0
    addi t0, t0, -4
    mul t0, t2, t0
    add t1, t1, t0
    li t0, 4
    li t2, 5
    mul t2, t0, t2
    addi t2, t2, 3
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 80
    mul t0, t2, t0
    add t0, t1, t0
    li t1, 4
    li t2, 5
    mul t2, t1, t2
    addi t2, t2, 4
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 46
    mul t1, t2, t1
    add t1, t0, t1
    mv a0, t1
    call relu_reg
    mv t1, a0
    li t0, 39
    mul t0, t1, t0
    li t1, 0
    li t2, 5
    mul t2, t1, t2
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 0
    addi t1, t1, -106
    mul t1, t2, t1
    li t2, 0
    li t3, 5
    mul t3, t2, t3
    addi t3, t3, 1
    ld t2, -24(fp)
    slli t3, t3, 2
    add t3, t2, t3
    lw t3, 0(t3)
    li t2, 126
    mul t2, t3, t2
    add t2, t1, t2
    li t1, 0
    li t3, 5
    mul t3, t1, t3
    addi t3, t3, 2
    ld t1, -24(fp)
    slli t3, t3, 2
    add t3, t1, t3
    lw t3, 0(t3)
    li t1, 0
    addi t1, t1, -18
    mul t1, t3, t1
    add t1, t2, t1
    li t2, 0
    li t3, 5
    mul t3, t2, t3
    addi t3, t3, 3
    ld t2, -24(fp)
    slli t3, t3, 2
    add t3, t2, t3
    lw t3, 0(t3)
    li t2, 0
    addi t2, t2, -31
    mul t2, t3, t2
    add t2, t1, t2
    li t1, 0
    li t3, 5
    mul t3, t1, t3
    addi t3, t3, 4
    ld t1, -24(fp)
    slli t3, t3, 2
    add t3, t1, t3
    lw t3, 0(t3)
    li t1, 0
    addi t1, t1, -8
    mul t1, t3, t1
    add t1, t2, t1
    li t2, 1
    li t3, 5
    mul t3, t2, t3
    ld t2, -24(fp)
    slli t3, t3, 2
    add t3, t2, t3
    lw t3, 0(t3)
    li t2, 47
    mul t2, t3, t2
    add t2, t1, t2
    li t1, 1
    li t3, 5
    mul t3, t1, t3
    addi t3, t3, 1
    ld t1, -24(fp)
    slli t3, t3, 2
    add t3, t1, t3
    lw t3, 0(t3)
    li t1, 0
    addi t1, t1, -4
    mul t1, t3, t1
    add t1, t2, t1
    li t2, 1
    li t3, 5
    mul t3, t2, t3
    addi t3, t3, 2
    ld t2, -24(fp)
    slli t3, t3, 2
    add t3, t2, t3
    lw t3, 0(t3)
    li t2, 67
    mul t2, t3, t2
    add t2, t1, t2
    li t1, 1
    li t3, 5
    mul t3, t1, t3
    addi t3, t3, 3
    ld t1, -24(fp)
    slli t3, t3, 2
    add t3, t1, t3
    lw t3, 0(t3)
    li t1, 0
    addi t1, t1, -94
    mul t1, t3, t1
    add t1, t2, t1
    li t2, 1
    li t3, 5
    mul t3, t2, t3
    addi t3, t3, 4
    ld t2, -24(fp)
    slli t3, t3, 2
    add t3, t2, t3
    lw t3, 0(t3)
    li t2, 0
    addi t2, t2, -121
    mul t2, t3, t2
    add t2, t1, t2
    li t1, 2
    li t3, 5
    mul t3, t1, t3
    ld t1, -24(fp)
    slli t3, t3, 2
    add t3, t1, t3
    lw t3, 0(t3)
    li t1, 7
    mul t1, t3, t1
    add t1, t2, t1
    li t2, 2
    li t3, 5
    mul t3, t2, t3
    addi t3, t3, 1
    ld t2, -24(fp)
    slli t3, t3, 2
    add t3, t2, t3
    lw t3, 0(t3)
    li t2, 0
    addi t2, t2, -21
    mul t2, t3, t2
    add t2, t1, t2
    li t1, 2
    li t3, 5
    mul t3, t1, t3
    addi t3, t3, 2
    ld t1, -24(fp)
    slli t3, t3, 2
    add t3, t1, t3
    lw t3, 0(t3)
    li t1, 0
    addi t1, t1, -60
    mul t1, t3, t1
    add t1, t2, t1
    li t2, 2
    li t3, 5
    mul t3, t2, t3
    addi t3, t3, 3
    ld t2, -24(fp)
    slli t3, t3, 2
    add t3, t2, t3
    lw t3, 0(t3)
    li t2, 0
    addi t2, t2, -43
    mul t2, t3, t2
    add t2, t1, t2
    li t1, 2
    li t3, 5
    mul t3, t1, t3
    addi t3, t3, 4
    ld t1, -24(fp)
    slli t3, t3, 2
    add t3, t1, t3
    lw t3, 0(t3)
    li t1, 105
    mul t1, t3, t1
    add t1, t2, t1
    li t2, 3
    li t3, 5
    mul t3, t2, t3
    ld t2, -24(fp)
    slli t3, t3, 2
    add t3, t2, t3
    lw t3, 0(t3)
    li t2, 0
    addi t2, t2, -42
    mul t2, t3, t2
    add t2, t1, t2
    li t1, 3
    li t3, 5
    mul t3, t1, t3
    addi t3, t3, 1
    ld t1, -24(fp)
    slli t3, t3, 2
    add t3, t1, t3
    lw t3, 0(t3)
    li t1, 87
    mul t1, t3, t1
    add t1, t2, t1
    li t2, 3
    li t3, 5
    mul t3, t2, t3
    addi t3, t3, 2
    ld t2, -24(fp)
    slli t3, t3, 2
    add t3, t2, t3
    lw t3, 0(t3)
    li t2, 29
    mul t2, t3, t2
    add t2, t1, t2
    li t1, 3
    li t3, 5
    mul t3, t1, t3
    addi t3, t3, 3
    ld t1, -24(fp)
    slli t3, t3, 2
    add t3, t1, t3
    lw t3, 0(t3)
    li t1, 0
    addi t1, t1, -106
    mul t1, t3, t1
    add t1, t2, t1
    li t2, 3
    li t3, 5
    mul t3, t2, t3
    addi t3, t3, 4
    ld t2, -24(fp)
    slli t3, t3, 2
    add t3, t2, t3
    lw t3, 0(t3)
    li t2, 0
    addi t2, t2, -31
    mul t2, t3, t2
    add t2, t1, t2
    li t1, 4
    li t3, 5
    mul t1, t1, t3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -110
    mul t3, t1, t3
    add t2, t2, t3
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -100
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -22
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -75
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -125
    mul t2, t1, t2
    add t2, t3, t2
    mv a0, t2
    call relu_reg
    mv t2, a0
    li t3, 77
    mul t3, t2, t3
    add t3, t0, t3
    li t0, 0
    li t2, 5
    mul t2, t0, t2
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 26
    mul t0, t2, t0
    li t2, 0
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 76
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -70
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 0
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 3
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 29
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -95
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 1
    li t1, 5
    mul t1, t2, t1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 96
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 52
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 1
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -68
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -5
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 1
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 34
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -34
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 2
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 102
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 6
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 2
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 3
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -38
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 27
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 3
    li t1, 5
    mul t1, t2, t1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 110
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 116
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 3
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 39
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -63
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 3
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -99
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 65
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 120
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -39
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 3
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -6
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 94
    mul t0, t1, t0
    add t0, t2, t0
    mv a0, t0
    call relu_reg
    mv t0, a0
    li t2, 127
    mul t2, t0, t2
    add t2, t3, t2
    li t3, 0
    li t0, 5
    mul t0, t3, t0
    ld t3, -24(fp)
    slli t0, t0, 2
    add t0, t3, t0
    lw t0, 0(t0)
    li t3, 0
    addi t3, t3, -23
    mul t3, t0, t3
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -63
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 0
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 2
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 49
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 50
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 0
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 4
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 72
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 85
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 1
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -30
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 12
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 1
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 125
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -117
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 2
    li t1, 5
    mul t1, t3, t1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -65
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -67
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 2
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 2
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 125
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 110
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 2
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 4
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -31
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -123
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 3
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 83
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 122
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 3
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 11
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -23
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -47
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -32
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 2
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -117
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 95
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 4
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 118
    mul t3, t1, t3
    add t3, t0, t3
    mv a0, t3
    call relu_reg
    mv t3, a0
    li t0, 0
    addi t0, t0, -106
    mul t0, t3, t0
    add t0, t2, t0
    li t2, 0
    li t3, 5
    mul t3, t2, t3
    ld t2, -24(fp)
    slli t3, t3, 2
    add t3, t2, t3
    lw t3, 0(t3)
    li t2, 8
    mul t2, t3, t2
    li t3, 0
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 82
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 0
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -104
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 0
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 101
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 0
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -116
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 1
    li t1, 5
    mul t1, t3, t1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -63
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 1
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -16
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 1
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 2
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -70
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 1
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 3
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 125
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 1
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 4
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 75
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 2
    li t1, 5
    mul t1, t2, t1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 66
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 2
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -96
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 2
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -101
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 2
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -114
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 2
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 59
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 3
    li t1, 5
    mul t1, t3, t1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 12
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 3
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 5
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 3
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 2
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -95
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 3
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 3
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 116
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 3
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 4
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -93
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 15
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 79
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 3
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 49
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -124
    mul t2, t1, t2
    add t2, t3, t2
    mv a0, t2
    call relu_reg
    mv t2, a0
    li t3, 0
    addi t3, t3, -3
    mul t3, t2, t3
    add t3, t0, t3
    li t0, 0
    li t2, 5
    mul t2, t0, t2
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 81
    mul t0, t2, t0
    li t2, 0
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 68
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -102
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 0
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 3
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -74
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 121
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 1
    li t1, 5
    mul t1, t2, t1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -15
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 55
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 1
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 101
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -13
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 1
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -62
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 64
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 2
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 114
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 38
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 2
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 3
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -21
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 112
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 3
    li t1, 5
    mul t1, t2, t1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 114
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 112
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 3
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -10
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -16
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 3
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -50
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -112
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -116
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -54
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 3
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 82
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -72
    mul t0, t1, t0
    add t0, t2, t0
    mv a0, t0
    call relu_reg
    mv t0, a0
    li t2, 32
    mul t2, t0, t2
    add t2, t3, t2
    li t3, 0
    li t0, 5
    mul t0, t3, t0
    ld t3, -24(fp)
    slli t0, t0, 2
    add t0, t3, t0
    lw t0, 0(t0)
    li t3, 15
    mul t3, t0, t3
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -77
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 0
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 2
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 66
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -90
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 0
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 4
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -6
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -30
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 1
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -8
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 81
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 1
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 2
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -110
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 2
    li t1, 5
    mul t1, t3, t1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -95
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 59
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 2
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 2
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 52
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 15
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 2
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 4
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 55
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -33
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 3
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 14
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 58
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 3
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 67
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 86
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -79
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 48
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 2
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -13
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -15
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 4
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 66
    mul t3, t1, t3
    add t3, t0, t3
    mv a0, t3
    call relu_reg
    mv t3, a0
    li t0, 0
    addi t0, t0, -95
    mul t0, t3, t0
    add t0, t2, t0
    li t2, 0
    li t3, 5
    mul t3, t2, t3
    ld t2, -24(fp)
    slli t3, t3, 2
    add t3, t2, t3
    lw t3, 0(t3)
    li t2, 33
    mul t2, t3, t2
    li t3, 0
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 82
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 0
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 67
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 0
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 30
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 0
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -2
    mul t2, t1, t2
    add t3, t3, t2
    li t2, 1
    li t1, 5
    mul t1, t2, t1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 65
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 1
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 120
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 1
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -13
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 1
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 18
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 1
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 5
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 2
    li t1, 5
    mul t1, t3, t1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 104
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 2
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -119
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 2
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 2
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -7
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 2
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 3
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 71
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 2
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 4
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 107
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 3
    li t1, 5
    mul t1, t2, t1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 24
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 3
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 82
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 3
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -96
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 3
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -104
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 3
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -121
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 65
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 97
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 2
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 83
    mul t3, t1, t3
    add t3, t2, t3
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 3
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 46
    mul t2, t1, t2
    add t2, t3, t2
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 4
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -84
    mul t3, t1, t3
    add t3, t2, t3
    mv a0, t3
    call relu_reg
    mv t3, a0
    li t2, 0
    addi t2, t2, -50
    mul t2, t3, t2
    add t2, t0, t2
    li t0, 0
    li t3, 5
    mul t3, t0, t3
    ld t0, -24(fp)
    slli t3, t3, 2
    add t3, t0, t3
    lw t3, 0(t3)
    li t0, 0
    addi t0, t0, -29
    mul t0, t3, t0
    li t3, 0
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 7
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -70
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 0
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 38
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -90
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 1
    li t1, 5
    mul t1, t3, t1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -15
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -32
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 1
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 2
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 37
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 36
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 1
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 4
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -62
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -125
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 2
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -46
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -70
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 2
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 37
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -73
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 3
    li t1, 5
    mul t1, t3, t1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -34
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -87
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 3
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 2
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -75
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 71
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 3
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 4
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -77
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 53
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 1
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 37
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -103
    mul t0, t1, t0
    add t0, t3, t0
    li t3, 4
    li t1, 5
    mul t1, t3, t1
    addi t1, t1, 3
    ld t3, -24(fp)
    slli t1, t1, 2
    add t1, t3, t1
    lw t1, 0(t1)
    li t3, 0
    addi t3, t3, -13
    mul t3, t1, t3
    add t3, t0, t3
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -114
    mul t0, t1, t0
    add t0, t3, t0
    mv a0, t0
    call relu_reg
    mv t0, a0
    li t3, 0
    addi t3, t3, -23
    mul t3, t0, t3
    add t3, t2, t3
    li t2, 0
    li t0, 5
    mul t0, t2, t0
    ld t2, -24(fp)
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 67
    mul t2, t0, t2
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 42
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 0
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 41
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -123
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 0
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -92
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 10
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 1
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -77
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 75
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 1
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 3
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 96
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 1
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -51
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 2
    li t1, 5
    mul t1, t2, t1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 109
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -74
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 2
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -7
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 2
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -122
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 2
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 67
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 47
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 3
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 22
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 2
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -68
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 3
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 3
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 38
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 3
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 4
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 29
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 115
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -121
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 2
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 36
    mul t2, t1, t2
    add t2, t0, t2
    li t0, 4
    li t1, 5
    mul t1, t0, t1
    addi t1, t1, 3
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -49
    mul t0, t1, t0
    add t0, t2, t0
    li t2, 4
    li t1, 5
    mul t1, t2, t1
    addi t1, t1, 4
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 85
    mul t2, t1, t2
    add t2, t0, t2
    mv a0, t2
    call relu_reg
    mv t2, a0
    li t0, 46
    mul t0, t2, t0
    add t0, t3, t0
    sgtz t0, t0
    bnez t0, BB9
    j BB10
BB9: 
    li t0, 1
    mv a0, t0
    j BB29
BB10: 
    li t0, 0
    mv a0, t0
    j BB29
BB29: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB30: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -144
    addi fp, sp, 144
    j BB11
BB11: 
    call getint
    mv t0, a0
    sw t0, -20(fp)
    j BB12
BB12: 
    lw t0, -20(fp)
    sgtz t0, t0
    bnez t0, BB13
    j BB14
BB13: 
    li t0, 0
    sw t0, -124(fp)
    j BB15
BB14: 
    li t0, 0
    mv a0, t0
    j BB31
BB15: 
    lw t0, -124(fp)
    slti t0, t0, 5
    bnez t0, BB16
    j BB17
BB16: 
    li t0, 0
    sw t0, -128(fp)
    j BB18
BB17: 
    j BB21
BB18: 
    lw t0, -128(fp)
    slti t0, t0, 5
    bnez t0, BB19
    j BB20
BB19: 
    lw t0, -124(fp)
    li t1, 5
    mul t1, t0, t1
    lw t0, -128(fp)
    add t0, t1, t0
    slli t0, t0, 2
    addi t1, fp, -120
    add t1, t1, t0
    call getint
    mv t0, a0
    sw t0, 0(t1)
    lw t0, -128(fp)
    addi t0, t0, 1
    sw t0, -128(fp)
    j BB18
BB20: 
    lw t0, -124(fp)
    addi t0, t0, 1
    sw t0, -124(fp)
    j BB15
BB21: 
    addi t0, fp, -120
    mv a0, t0
    call model
    mv t0, a0
    seqz t0, t0
    bnez t0, BB22
    j BB24
BB22: 
    li t0, 99
    mv a0, t0
    call putch
    li t0, 97
    mv a0, t0
    call putch
    li t0, 116
    mv a0, t0
    call putch
    li t0, 10
    mv a0, t0
    call putch
    j BB23
BB23: 
    lw t0, -20(fp)
    addi t0, t0, -1
    sw t0, -20(fp)
    j BB12
BB24: 
    li t0, 100
    mv a0, t0
    call putch
    li t0, 111
    mv a0, t0
    call putch
    li t0, 103
    mv a0, t0
    call putch
    li t0, 10
    mv a0, t0
    call putch
    j BB23
BB31: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 144
    ret
