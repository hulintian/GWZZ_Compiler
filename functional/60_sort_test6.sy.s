    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$n:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
counting_sort: 
BB18: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -96
    addi fp, sp, 96
    sd a0, -24(fp)
    sd a1, -32(fp)
    sw a2, -36(fp)
    j BB0
BB0: 
    li t0, 0
    sw t0, -88(fp)
    li t0, 0
    sw t0, -80(fp)
    li t0, 0
    sw t0, -84(fp)
    j BB1
BB1: 
    lw t0, -88(fp)
    slti t0, t0, 10
    bnez t0, BB2
    j BB3
BB2: 
    lw t1, -88(fp)
    slli t1, t1, 2
    addi t0, fp, -76
    add t0, t0, t1
    li t1, 0
    sw t1, 0(t0)
    lw t1, -88(fp)
    addi t1, t1, 1
    sw t1, -88(fp)
    j BB1
BB3: 
    j BB4
BB4: 
    lw t0, -80(fp)
    lw t1, -36(fp)
    slt t1, t0, t1
    bnez t1, BB5
    j BB6
BB5: 
    lw t3, -80(fp)
    ld t0, -24(fp)
    slli t3, t3, 2
    add t3, t0, t3
    lw t3, 0(t3)
    slli t3, t3, 2
    addi t0, fp, -76
    add t0, t0, t3
    lw t3, -80(fp)
    ld t1, -24(fp)
    slli t3, t3, 2
    add t3, t1, t3
    lw t3, 0(t3)
    slli t3, t3, 2
    addi t1, fp, -76
    add t1, t1, t3
    lw t1, 0(t1)
    addi t1, t1, 1
    sw t1, 0(t0)
    lw t1, -80(fp)
    addi t1, t1, 1
    sw t1, -80(fp)
    j BB4
BB6: 
    li t1, 1
    sw t1, -88(fp)
    j BB7
BB7: 
    lw t1, -88(fp)
    slti t1, t1, 10
    bnez t1, BB8
    j BB9
BB8: 
    lw t2, -88(fp)
    slli t2, t2, 2
    addi t0, fp, -76
    add t0, t0, t2
    lw t2, -88(fp)
    slli t2, t2, 2
    addi t1, fp, -76
    add t1, t1, t2
    lw t1, 0(t1)
    lw t2, -88(fp)
    addi t2, t2, -1
    slli t2, t2, 2
    addi t3, fp, -76
    add t3, t3, t2
    lw t3, 0(t3)
    add t3, t1, t3
    sw t3, 0(t0)
    lw t3, -88(fp)
    addi t3, t3, 1
    sw t3, -88(fp)
    j BB7
BB9: 
    lw t1, -36(fp)
    sw t1, -84(fp)
    j BB10
BB10: 
    lw t1, -84(fp)
    sgtz t1, t1
    bnez t1, BB11
    j BB12
BB11: 
    lw t1, -84(fp)
    addi t1, t1, -1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    slli t1, t1, 2
    addi t0, fp, -76
    add t0, t0, t1
    lw t1, -84(fp)
    addi t1, t1, -1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    slli t1, t1, 2
    addi t2, fp, -76
    add t2, t2, t1
    lw t2, 0(t2)
    addi t2, t2, -1
    sw t2, 0(t0)
    lw t2, -84(fp)
    addi t2, t2, -1
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    slli t2, t2, 2
    addi t0, fp, -76
    add t0, t0, t2
    lw t0, 0(t0)
    ld t2, -32(fp)
    slli t0, t0, 2
    add t0, t2, t0
    lw t2, -84(fp)
    addi t2, t2, -1
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    sw t2, 0(t0)
    lw t2, -84(fp)
    addi t2, t2, -1
    sw t2, -84(fp)
    j BB10
BB12: 
    li t1, 0
    mv a0, t1
    j BB19
BB19: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 96
    ret
    .align 1
main: 
BB20: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -128
    addi fp, sp, 128
    j BB13
BB13: 
    li t0, 10
    la t1, $n
    sw t0, 0(t1)
    addi t1, fp, -56
    li t0, 4
    sw t0, 0(t1)
    addi t0, fp, -52
    li t1, 3
    sw t1, 0(t0)
    addi t0, fp, -48
    li t1, 9
    sw t1, 0(t0)
    addi t1, fp, -44
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -40
    li t1, 0
    sw t1, 0(t0)
    addi t1, fp, -36
    li t0, 1
    sw t0, 0(t1)
    addi t0, fp, -32
    li t1, 6
    sw t1, 0(t0)
    addi t1, fp, -28
    li t0, 5
    sw t0, 0(t1)
    addi t0, fp, -24
    li t1, 7
    sw t1, 0(t0)
    addi t1, fp, -20
    li t0, 8
    sw t0, 0(t1)
    li t0, 0
    sw t0, -60(fp)
    la t0, $n
    lw t0, 0(t0)
    addi t1, fp, -56
    mv a0, t1
    addi t1, fp, -100
    mv a1, t1
    mv a2, t0
    call counting_sort
    mv t0, a0
    sw t0, -60(fp)
    j BB14
BB14: 
    lw t0, -60(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB15
    j BB16
BB15: 
    lw t1, -60(fp)
    slli t1, t1, 2
    addi t0, fp, -100
    add t0, t0, t1
    lw t0, 0(t0)
    sw t0, -104(fp)
    lw t0, -104(fp)
    mv a0, t0
    call putint
    li t0, 10
    sw t0, -104(fp)
    lw t0, -104(fp)
    mv a0, t0
    call putch
    lw t0, -60(fp)
    addi t0, t0, 1
    sw t0, -60(fp)
    j BB14
BB16: 
    li t1, 0
    mv a0, t1
    j BB21
BB21: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 128
    ret
