    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
MAX: 
BB26: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB0
BB0: 
    j BB1
BB1: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    xor t1, t0, t1
    seqz t1, t1
    bnez t1, BB2
    j BB4
BB2: 
    lw t1, -20(fp)
    mv a0, t1
    j BB27
BB3: 
BB4: 
    j BB5
BB5: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    slt t1, t0, t1
    bnez t1, BB6
    j BB8
BB6: 
    lw t1, -20(fp)
    mv a0, t1
    j BB27
BB7: 
BB8: 
    lw t1, -24(fp)
    mv a0, t1
    j BB27
BB27: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
max_sum_nonadjacent: 
BB28: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -112
    addi fp, sp, 112
    sd a0, -24(fp)
    sw a1, -28(fp)
    j BB9
BB9: 
    addi t0, fp, -92
    ld t1, -24(fp)
    addi t1, t1, 0
    lw t1, 0(t1)
    sw t1, 0(t0)
    addi t1, fp, -88
    ld t0, -24(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    ld t2, -24(fp)
    addi t2, t2, 4
    lw t2, 0(t2)
    mv a0, t0
    mv a1, t2
    call MAX
    mv t2, a0
    sw t2, 0(t1)
    li t2, 2
    sw t2, -96(fp)
    j BB10
BB10: 
    lw t2, -96(fp)
    lw t1, -28(fp)
    slt t1, t2, t1
    bnez t1, BB11
    j BB12
BB11: 
    lw t2, -96(fp)
    slli t2, t2, 2
    addi t1, fp, -92
    add t1, t1, t2
    lw t2, -96(fp)
    addi t2, t2, -2
    slli t2, t2, 2
    addi t0, fp, -92
    add t0, t0, t2
    lw t0, 0(t0)
    lw t2, -96(fp)
    ld t3, -24(fp)
    slli t2, t2, 2
    add t2, t3, t2
    lw t2, 0(t2)
    add t2, t0, t2
    lw t0, -96(fp)
    addi t0, t0, -1
    slli t0, t0, 2
    addi t3, fp, -92
    add t3, t3, t0
    lw t3, 0(t3)
    mv a0, t2
    mv a1, t3
    call MAX
    mv t3, a0
    sw t3, 0(t1)
    lw t3, -96(fp)
    addi t3, t3, 1
    sw t3, -96(fp)
    j BB10
BB12: 
    lw t1, -28(fp)
    addi t1, t1, -1
    slli t1, t1, 2
    addi t2, fp, -92
    add t2, t2, t1
    lw t2, 0(t2)
    mv a0, t2
    j BB29
BB29: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 112
    ret
    .align 1
longest_common_subseq: 
BB30: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -1088
    addi fp, sp, 1088
    sd a0, -24(fp)
    sw a1, -28(fp)
    sd a2, -36(fp)
    sw a3, -40(fp)
    j BB13
BB13: 
    li t0, 1
    sw t0, -1068(fp)
    j BB14
BB14: 
    lw t0, -1068(fp)
    lw t1, -28(fp)
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB15
    j BB16
BB15: 
    li t0, 1
    sw t0, -1072(fp)
    j BB17
BB16: 
    lw t1, -28(fp)
    li t0, 16
    mul t0, t1, t0
    lw t1, -40(fp)
    add t1, t0, t1
    slli t1, t1, 2
    addi t0, fp, -1064
    add t0, t0, t1
    lw t0, 0(t0)
    mv a0, t0
    j BB31
BB17: 
    lw t0, -1072(fp)
    lw t1, -40(fp)
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB18
    j BB19
BB18: 
    j BB20
BB19: 
    lw t1, -1068(fp)
    addi t1, t1, 1
    sw t1, -1068(fp)
    j BB14
BB20: 
    lw t1, -1068(fp)
    addi t1, t1, -1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    lw t0, -1072(fp)
    addi t0, t0, -1
    ld t2, -36(fp)
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    xor t0, t1, t0
    seqz t0, t0
    bnez t0, BB21
    j BB23
BB21: 
    lw t3, -1068(fp)
    li t1, 16
    mul t1, t3, t1
    lw t3, -1072(fp)
    add t3, t1, t3
    slli t3, t3, 2
    addi t1, fp, -1064
    add t1, t1, t3
    lw t3, -1068(fp)
    addi t3, t3, -1
    li t2, 16
    mul t2, t3, t2
    lw t3, -1072(fp)
    addi t3, t3, -1
    add t3, t2, t3
    slli t3, t3, 2
    addi t2, fp, -1064
    add t2, t2, t3
    lw t2, 0(t2)
    addi t2, t2, 1
    sw t2, 0(t1)
    j BB22
BB22: 
    lw t3, -1072(fp)
    addi t3, t3, 1
    sw t3, -1072(fp)
    j BB17
BB23: 
    lw t0, -1068(fp)
    li t1, 16
    mul t1, t0, t1
    lw t0, -1072(fp)
    add t0, t1, t0
    slli t0, t0, 2
    addi t1, fp, -1064
    add t1, t1, t0
    lw t0, -1068(fp)
    addi t0, t0, -1
    li t2, 16
    mul t2, t0, t2
    lw t0, -1072(fp)
    add t0, t2, t0
    slli t0, t0, 2
    addi t2, fp, -1064
    add t2, t2, t0
    lw t2, 0(t2)
    lw t0, -1068(fp)
    li t3, 16
    mul t3, t0, t3
    lw t0, -1072(fp)
    addi t0, t0, -1
    add t0, t3, t0
    slli t0, t0, 2
    addi t3, fp, -1064
    add t3, t3, t0
    lw t3, 0(t3)
    mv a0, t2
    mv a1, t3
    call MAX
    mv t3, a0
    sw t3, 0(t1)
    j BB22
BB31: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 1088
    ret
    .align 1
main: 
BB32: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -160
    addi fp, sp, 160
    j BB24
BB24: 
    addi t0, fp, -76
    li t1, 8
    sw t1, 0(t0)
    addi t1, fp, -72
    li t0, 7
    sw t0, 0(t1)
    addi t1, fp, -68
    li t0, 4
    sw t0, 0(t1)
    addi t0, fp, -64
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -60
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -56
    li t1, 7
    sw t1, 0(t0)
    addi t1, fp, -52
    li t0, 0
    sw t0, 0(t1)
    addi t0, fp, -48
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -44
    li t0, 9
    sw t0, 0(t1)
    addi t0, fp, -40
    li t1, 3
    sw t1, 0(t0)
    addi t1, fp, -36
    li t0, 4
    sw t0, 0(t1)
    addi t0, fp, -32
    li t1, 8
    sw t1, 0(t0)
    addi t1, fp, -28
    li t0, 3
    sw t0, 0(t1)
    addi t0, fp, -24
    li t1, 7
    sw t1, 0(t0)
    addi t1, fp, -20
    li t0, 0
    sw t0, 0(t1)
    addi t0, fp, -128
    li t1, 3
    sw t1, 0(t0)
    addi t1, fp, -124
    li t0, 9
    sw t0, 0(t1)
    addi t0, fp, -120
    li t1, 7
    sw t1, 0(t0)
    addi t1, fp, -116
    li t0, 1
    sw t0, 0(t1)
    addi t0, fp, -112
    li t1, 4
    sw t1, 0(t0)
    addi t1, fp, -108
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -104
    li t1, 4
    sw t1, 0(t0)
    addi t1, fp, -100
    li t0, 3
    sw t0, 0(t1)
    addi t0, fp, -96
    li t1, 6
    sw t1, 0(t0)
    addi t1, fp, -92
    li t0, 8
    sw t0, 0(t1)
    addi t0, fp, -88
    li t1, 0
    sw t1, 0(t0)
    addi t1, fp, -84
    li t0, 1
    sw t0, 0(t1)
    addi t0, fp, -80
    li t1, 5
    sw t1, 0(t0)
    addi t1, fp, -76
    mv a0, t1
    li t1, 15
    mv a1, t1
    call max_sum_nonadjacent
    mv t1, a0
    mv a0, t1
    call putint
    li t1, 10
    mv a0, t1
    call putch
    addi t1, fp, -76
    mv a0, t1
    li t1, 15
    mv a1, t1
    addi t1, fp, -128
    mv a2, t1
    li t1, 13
    mv a3, t1
    call longest_common_subseq
    mv t1, a0
    mv a0, t1
    call putint
    li t1, 10
    mv a0, t1
    call putch
    li t1, 0
    mv a0, t1
    j BB33
BB33: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 160
    ret
