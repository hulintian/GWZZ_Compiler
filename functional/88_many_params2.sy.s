    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
func: 
BB12: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -96
    addi fp, sp, 96
    sw a0, -20(fp)
    sd a1, -28(fp)
    sw a2, -32(fp)
    sd a3, -40(fp)
    sw a4, -44(fp)
    sw a5, -48(fp)
    sd a6, -56(fp)
    sw a7, -60(fp)
    lw t1, 8(fp)
    sw t1, -64(fp)
    j BB0
BB0: 
    li t0, 0
    sw t0, -68(fp)
    j BB1
BB1: 
    lw t0, -68(fp)
    slti t0, t0, 10
    bnez t0, BB2
    j BB3
BB2: 
    lw t0, -20(fp)
    li t1, 59
    mul t1, t0, t1
    lw t0, -68(fp)
    add t0, t1, t0
    ld t1, -28(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    mv a0, t0
    call putint
    lw t0, -68(fp)
    addi t0, t0, 1
    sw t0, -68(fp)
    j BB1
BB3: 
    li t0, 10
    mv a0, t0
    call putch
    lw t0, -32(fp)
    ld t1, -40(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    j BB4
BB4: 
    lw t0, -64(fp)
    slti t0, t0, 10
    bnez t0, BB5
    j BB6
BB5: 
    lw t1, -64(fp)
    ld t0, -56(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -60(fp)
    li t2, 128875
    mul t2, t0, t2
    li t0, 3724
    rem t0, t2, t0
    sw t0, 0(t1)
    lw t0, -64(fp)
    addi t0, t0, 1
    sw t0, -64(fp)
    lw t0, -60(fp)
    addi t0, t0, 7
    sw t0, -60(fp)
    j BB4
BB6: 
    lw t0, -44(fp)
    lw t1, -48(fp)
    add t1, t0, t1
    mv a0, t1
    j BB13
BB13: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 96
    ret
    .align 1
main: 
BB14: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    li t0, -28928
    add sp, sp, t0
    li t0, 28928
    add fp, sp, t0
    li t0, -28888
    add t0, fp, t0
    sd s1, 0(t0)
    li t0, -28896
    add t0, fp, t0
    sd s2, 0(t0)
    j BB7
BB7: 
    li t0, 17
    li t1, 67
    mul t1, t0, t1
    addi t1, t1, 1
    slli t1, t1, 2
    li t0, -16364
    add t1, t1, t0
    add t1, fp, t1
    li t0, 6
    sw t0, 0(t1)
    li t0, 17
    li t1, 67
    mul t1, t0, t1
    addi t1, t1, 3
    slli t1, t1, 2
    li t0, -16364
    add t0, t1, t0
    add t0, fp, t0
    li t1, 7
    sw t1, 0(t0)
    li t1, 17
    li t0, 67
    mul t0, t1, t0
    addi t0, t0, 4
    slli t0, t0, 2
    li t1, -16364
    add t1, t0, t1
    add t1, fp, t1
    li t0, 4
    sw t0, 0(t1)
    li t0, 17
    li t1, 67
    mul t1, t0, t1
    addi t1, t1, 7
    slli t1, t1, 2
    li t0, -16364
    add t0, t1, t0
    add t0, fp, t0
    li t1, 9
    sw t1, 0(t0)
    li t1, 17
    li t0, 67
    mul t0, t1, t0
    addi t0, t0, 11
    slli t0, t0, 2
    li t1, -16364
    add t1, t0, t1
    add t1, fp, t1
    li t0, 11
    sw t0, 0(t1)
    li t0, 6
    li t1, 59
    mul t1, t0, t1
    addi t1, t1, 1
    slli t1, t1, 2
    li t0, -28872
    add t0, t1, t0
    add t0, fp, t0
    li t1, 1
    sw t1, 0(t0)
    li t1, 6
    li t0, 59
    mul t0, t1, t0
    addi t0, t0, 2
    slli t0, t0, 2
    li t1, -28872
    add t1, t0, t1
    add t1, fp, t1
    li t0, 2
    sw t0, 0(t1)
    li t0, 6
    li t1, 59
    mul t1, t0, t1
    addi t1, t1, 3
    slli t1, t1, 2
    li t0, -28872
    add t0, t1, t0
    add t0, fp, t0
    li t1, 3
    sw t1, 0(t0)
    li t1, 6
    li t0, 59
    mul t0, t1, t0
    addi t0, t0, 9
    slli t0, t0, 2
    li t1, -28872
    add t1, t0, t1
    add t1, fp, t1
    li t0, 9
    sw t0, 0(t1)
    li t0, 17
    li t1, 67
    mul t1, t0, t1
    addi t1, t1, 1
    slli t1, t1, 2
    li t0, -16364
    add t0, t1, t0
    add t0, fp, t0
    lw t0, 0(t0)
    li t1, 17
    li t2, 67
    mul t2, t1, t2
    addi t2, t2, 3
    slli t2, t2, 2
    li t1, -16364
    add t1, t2, t1
    add t1, fp, t1
    lw t1, 0(t1)
    li t2, 17
    li t3, 67
    mul t3, t2, t3
    slli t3, t3, 2
    li t2, -16364
    add t2, t3, t2
    add t2, fp, t2
    li t3, 6
    li t4, 59
    mul t4, t3, t4
    addi t4, t4, 3
    slli t4, t4, 2
    li t3, -28872
    add t3, t4, t3
    add t3, fp, t3
    lw t3, 0(t3)
    li t4, 6
    li t5, 59
    mul t5, t4, t5
    slli t5, t5, 2
    li t4, -28872
    add t4, t5, t4
    add t4, fp, t4
    lw t4, 0(t4)
    li t5, 6
    li t6, 59
    mul t6, t5, t6
    slli t6, t6, 2
    li t5, -28872
    add t5, t6, t5
    add t5, fp, t5
    li t6, 34
    li s1, 59
    mul t6, t6, s1
    addi t6, t6, 4
    slli t6, t6, 2
    li s1, -28872
    add t6, t6, s1
    add t6, fp, t6
    lw t6, 0(t6)
    li s1, 51
    li s2, 59
    mul s2, s1, s2
    addi s2, s2, 18
    slli s2, s2, 2
    li s1, -28872
    add s1, s2, s1
    add s1, fp, s1
    lw s1, 0(s1)
    mv a0, t0
    li t0, -28872
    add t0, t0, fp
    mv a1, t0
    mv a2, t1
    mv a3, t2
    mv a4, t3
    mv a5, t4
    mv a6, t5
    mv a7, t6
    sw s1, 8(sp)
    call func
    mv t6, a0
    li t5, 3
    mul t5, t6, t5
    li t6, -28876
    add t6, fp, t6
    sw t5, 0(t6)
    j BB8
BB8: 
    li t6, -28876
    add t6, fp, t6
    lw t6, 0(t6)
    sltz t5, t6
    snez t5, t6
    bnez t5, BB9
    j BB10
BB9: 
    li t5, 6
    li t6, 59
    mul t6, t5, t6
    li t5, -28876
    add t5, fp, t5
    lw t5, 0(t5)
    add t5, t6, t5
    slli t5, t5, 2
    li t6, -28872
    add t6, t5, t6
    add t6, fp, t6
    lw t6, 0(t6)
    mv a0, t6
    call putint
    li t6, 32
    mv a0, t6
    call putch
    li t6, -28876
    add t6, fp, t6
    lw t6, 0(t6)
    addi t6, t6, -1
    li t5, -28876
    add t5, fp, t5
    sw t6, 0(t5)
    j BB8
BB10: 
    li t5, 10
    mv a0, t5
    call putch
    li t5, 0
    mv a0, t5
    j BB15
BB15: 
    li t0, -28888
    add t0, fp, t0
    ld s1, 0(t0)
    li t0, -28896
    add t0, fp, t0
    ld s2, 0(t0)
    ld ra, -16(fp)
    ld fp, -8(fp)
    li t0, 28928
    add sp, sp, t0
    ret
