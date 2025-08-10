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
insertsort: 
BB13: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    j BB0
BB0: 
    li t0, 1
    sw t0, -28(fp)
    j BB1
BB1: 
    lw t0, -28(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB2
    j BB3
BB2: 
    lw t1, -28(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    sw t1, -32(fp)
    lw t1, -28(fp)
    addi t1, t1, -1
    sw t1, -36(fp)
    j BB4
BB3: 
    li t1, 0
    mv a0, t1
    j BB14
BB4: 
    lw t1, -36(fp)
    li t0, 0
    addi t0, t0, -1
    slt t0, t0, t1
    bnez t0, BB7
    j BB6
BB5: 
    lw t0, -36(fp)
    addi t0, t0, 1
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -36(fp)
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    sw t1, 0(t0)
    lw t1, -36(fp)
    addi t1, t1, -1
    sw t1, -36(fp)
    j BB4
BB6: 
    lw t1, -36(fp)
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -32(fp)
    sw t0, 0(t1)
    lw t0, -28(fp)
    addi t0, t0, 1
    sw t0, -28(fp)
    j BB1
BB7: 
    lw t0, -32(fp)
    lw t1, -36(fp)
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB5
    j BB6
BB14: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB15: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -80
    addi fp, sp, 80
    j BB8
BB8: 
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
    addi t0, fp, -56
    mv a0, t0
    call insertsort
    mv t0, a0
    sw t0, -60(fp)
    j BB9
BB9: 
    lw t0, -60(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB10
    j BB11
BB10: 
    lw t1, -60(fp)
    slli t1, t1, 2
    addi t0, fp, -56
    add t0, t0, t1
    lw t0, 0(t0)
    sw t0, -64(fp)
    lw t0, -64(fp)
    mv a0, t0
    call putint
    li t0, 10
    sw t0, -64(fp)
    lw t0, -64(fp)
    mv a0, t0
    call putch
    lw t0, -60(fp)
    addi t0, t0, 1
    sw t0, -60(fp)
    j BB9
BB11: 
    li t1, 0
    mv a0, t1
    j BB16
BB16: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 80
    ret
