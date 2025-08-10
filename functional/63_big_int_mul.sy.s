    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $len
$len:
    .word 20
    .align 3
    .globl main
    .text

    .align 1
main: 
BB27: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -592
    addi fp, sp, 592
    j BB0
BB0: 
    addi t0, fp, -116
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -112
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -108
    li t1, 3
    sw t1, 0(t0)
    addi t0, fp, -104
    li t1, 4
    sw t1, 0(t0)
    addi t1, fp, -100
    li t0, 5
    sw t0, 0(t1)
    addi t0, fp, -96
    li t1, 6
    sw t1, 0(t0)
    addi t1, fp, -92
    li t0, 7
    sw t0, 0(t1)
    addi t0, fp, -88
    li t1, 8
    sw t1, 0(t0)
    addi t1, fp, -84
    li t0, 9
    sw t0, 0(t1)
    addi t0, fp, -80
    li t1, 0
    sw t1, 0(t0)
    addi t1, fp, -76
    li t0, 1
    sw t0, 0(t1)
    addi t0, fp, -72
    li t1, 2
    sw t1, 0(t0)
    addi t1, fp, -68
    li t0, 3
    sw t0, 0(t1)
    addi t0, fp, -64
    li t1, 4
    sw t1, 0(t0)
    addi t1, fp, -60
    li t0, 5
    sw t0, 0(t1)
    addi t0, fp, -56
    li t1, 6
    sw t1, 0(t0)
    addi t1, fp, -52
    li t0, 7
    sw t0, 0(t1)
    addi t0, fp, -48
    li t1, 8
    sw t1, 0(t0)
    addi t1, fp, -44
    li t0, 9
    sw t0, 0(t1)
    addi t0, fp, -40
    li t1, 0
    sw t1, 0(t0)
    addi t1, fp, -196
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -192
    li t1, 3
    sw t1, 0(t0)
    addi t1, fp, -188
    li t0, 4
    sw t0, 0(t1)
    addi t0, fp, -184
    li t1, 2
    sw t1, 0(t0)
    addi t1, fp, -180
    li t0, 5
    sw t0, 0(t1)
    addi t0, fp, -176
    li t1, 7
    sw t1, 0(t0)
    addi t1, fp, -172
    li t0, 9
    sw t0, 0(t1)
    addi t0, fp, -168
    li t1, 9
    sw t1, 0(t0)
    addi t1, fp, -164
    li t0, 0
    sw t0, 0(t1)
    addi t0, fp, -160
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -156
    li t0, 9
    sw t0, 0(t1)
    addi t0, fp, -152
    li t1, 8
    sw t1, 0(t0)
    addi t1, fp, -148
    li t0, 7
    sw t0, 0(t1)
    addi t0, fp, -144
    li t1, 6
    sw t1, 0(t0)
    addi t1, fp, -140
    li t0, 4
    sw t0, 0(t1)
    addi t0, fp, -136
    li t1, 3
    sw t1, 0(t0)
    addi t1, fp, -132
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -128
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -124
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -120
    li t1, 2
    sw t1, 0(t0)
    li t1, 20
    sw t1, -200(fp)
    li t1, 20
    sw t1, -204(fp)
    li t1, 0
    sw t1, -20(fp)
    j BB1
BB1: 
    lw t1, -20(fp)
    lw t0, -200(fp)
    slt t0, t1, t0
    bnez t0, BB2
    j BB3
BB2: 
    lw t2, -20(fp)
    slli t2, t2, 2
    addi t3, fp, -304
    add t3, t3, t2
    lw t2, -20(fp)
    slli t2, t2, 2
    addi t1, fp, -116
    add t1, t1, t2
    lw t1, 0(t1)
    sw t1, 0(t3)
    lw t1, -20(fp)
    addi t1, t1, 1
    sw t1, -20(fp)
    j BB1
BB3: 
    li t0, 0
    sw t0, -20(fp)
    j BB4
BB4: 
    lw t0, -20(fp)
    lw t1, -204(fp)
    slt t1, t0, t1
    bnez t1, BB5
    j BB6
BB5: 
    lw t1, -20(fp)
    slli t1, t1, 2
    addi t3, fp, -404
    add t3, t3, t1
    lw t1, -20(fp)
    slli t1, t1, 2
    addi t2, fp, -196
    add t2, t2, t1
    lw t2, 0(t2)
    sw t2, 0(t3)
    lw t2, -20(fp)
    addi t2, t2, 1
    sw t2, -20(fp)
    j BB4
BB6: 
    lw t1, -200(fp)
    lw t0, -204(fp)
    add t0, t1, t0
    addi t0, t0, -1
    sw t0, -32(fp)
    li t0, 0
    sw t0, -20(fp)
    j BB7
BB7: 
    lw t0, -20(fp)
    lw t1, -32(fp)
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB8
    j BB9
BB8: 
    lw t1, -20(fp)
    slli t1, t1, 2
    addi t3, fp, -564
    add t3, t3, t1
    li t1, 0
    sw t1, 0(t3)
    lw t1, -20(fp)
    addi t1, t1, 1
    sw t1, -20(fp)
    j BB7
BB9: 
    li t1, 0
    sw t1, -36(fp)
    lw t1, -204(fp)
    addi t1, t1, -1
    sw t1, -20(fp)
    j BB10
BB10: 
    lw t1, -20(fp)
    li t0, 0
    addi t0, t0, -1
    slt t0, t0, t1
    bnez t0, BB11
    j BB12
BB11: 
    lw t0, -20(fp)
    slli t0, t0, 2
    addi t2, fp, -404
    add t2, t2, t0
    lw t2, 0(t2)
    sw t2, -28(fp)
    lw t2, -200(fp)
    addi t2, t2, -1
    sw t2, -24(fp)
    j BB13
BB12: 
    j BB20
BB13: 
    lw t2, -24(fp)
    li t0, 0
    addi t0, t0, -1
    slt t0, t0, t2
    bnez t0, BB14
    j BB15
BB14: 
    lw t2, -32(fp)
    slli t2, t2, 2
    addi t0, fp, -564
    add t0, t0, t2
    lw t0, 0(t0)
    lw t2, -28(fp)
    lw t1, -24(fp)
    slli t1, t1, 2
    addi t3, fp, -304
    add t3, t3, t1
    lw t3, 0(t3)
    mul t3, t2, t3
    add t3, t0, t3
    sw t3, -36(fp)
    j BB16
BB15: 
    lw t0, -32(fp)
    lw t2, -200(fp)
    add t2, t0, t2
    addi t2, t2, -1
    sw t2, -32(fp)
    lw t2, -20(fp)
    addi t2, t2, -1
    sw t2, -20(fp)
    j BB10
BB16: 
    lw t3, -36(fp)
    slti t0, t3, 10
    snez t0, t3
    bnez t0, BB17
    j BB19
BB17: 
    lw t0, -32(fp)
    slli t0, t0, 2
    addi t3, fp, -564
    add t3, t3, t0
    lw t0, -36(fp)
    sw t0, 0(t3)
    lw t0, -32(fp)
    addi t0, t0, -1
    slli t0, t0, 2
    addi t3, fp, -564
    add t3, t3, t0
    lw t0, -32(fp)
    addi t0, t0, -1
    slli t0, t0, 2
    addi t2, fp, -564
    add t2, t2, t0
    lw t2, 0(t2)
    lw t0, -36(fp)
    li t1, 10
    div t1, t0, t1
    add t1, t2, t1
    sw t1, 0(t3)
    j BB18
BB18: 
    lw t0, -24(fp)
    addi t0, t0, -1
    sw t0, -24(fp)
    lw t0, -32(fp)
    addi t0, t0, -1
    sw t0, -32(fp)
    j BB13
BB19: 
    lw t0, -32(fp)
    slli t0, t0, 2
    addi t3, fp, -564
    add t3, t3, t0
    lw t0, -36(fp)
    sw t0, 0(t3)
    j BB18
BB20: 
    addi t0, fp, -564
    lw t0, 0(t0)
    seqz t0, t0
    bnez t0, BB21
    j BB22
BB21: 
    addi t0, fp, -564
    lw t0, 0(t0)
    mv a0, t0
    call putint
    j BB22
BB22: 
    li t0, 1
    sw t0, -20(fp)
    j BB23
BB23: 
    lw t0, -20(fp)
    lw t1, -200(fp)
    lw t2, -204(fp)
    add t2, t1, t2
    addi t2, t2, -1
    slt t2, t2, t0
    xori t2, t2, 1
    bnez t2, BB24
    j BB25
BB24: 
    lw t2, -20(fp)
    slli t2, t2, 2
    addi t0, fp, -564
    add t0, t0, t2
    lw t0, 0(t0)
    mv a0, t0
    call putint
    lw t0, -20(fp)
    addi t0, t0, 1
    sw t0, -20(fp)
    j BB23
BB25: 
    li t2, 0
    mv a0, t2
    j BB28
BB28: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 592
    ret
