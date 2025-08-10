    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$N:
    .skip 4
$M:
    .skip 4
$L:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
sub: 
BB18: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -112
    addi fp, sp, 112
    sd a0, -24(fp)
    sd a1, -32(fp)
    sd a2, -40(fp)
    sd a3, -48(fp)
    sd a4, -56(fp)
    sd a5, -64(fp)
    sd a6, -72(fp)
    sd a7, -80(fp)
    ld t1, 8(fp)
    sd t1, -88(fp)
    j BB0
BB0: 
    li t0, 0
    sw t0, -92(fp)
    j BB1
BB1: 
    lw t0, -92(fp)
    slti t0, t0, 3
    bnez t0, BB2
    j BB3
BB2: 
    lw t0, -92(fp)
    ld t1, -72(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -92(fp)
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    flw ft0, 0(t1)
    lw t1, -92(fp)
    ld t2, -48(fp)
    slli t1, t1, 2
    add t1, t2, t1
    flw ft1, 0(t1)
    fsub.s ft1, ft0, ft1
    fsw ft1, 0(t0)
    lw t0, -92(fp)
    ld t1, -80(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -92(fp)
    ld t2, -32(fp)
    slli t1, t1, 2
    add t1, t2, t1
    flw ft1, 0(t1)
    lw t1, -92(fp)
    ld t2, -56(fp)
    slli t1, t1, 2
    add t1, t2, t1
    flw ft0, 0(t1)
    fsub.s ft0, ft1, ft0
    fsw ft0, 0(t0)
    lw t0, -92(fp)
    ld t1, -88(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -92(fp)
    ld t2, -40(fp)
    slli t1, t1, 2
    add t1, t2, t1
    flw ft0, 0(t1)
    lw t1, -92(fp)
    ld t2, -64(fp)
    slli t1, t1, 2
    add t1, t2, t1
    flw ft1, 0(t1)
    fsub.s ft1, ft0, ft1
    fsw ft1, 0(t0)
    lw t0, -92(fp)
    addi t0, t0, 1
    sw t0, -92(fp)
    j BB1
BB3: 
    li t0, 0
    mv a0, t0
    j BB19
BB19: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 112
    ret
    .align 1
main: 
BB20: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -176
    addi fp, sp, 176
    j BB4
BB4: 
    li t0, 3
    la t1, $N
    sw t0, 0(t1)
    li t1, 3
    la t0, $M
    sw t1, 0(t0)
    li t0, 3
    la t1, $L
    sw t0, 0(t1)
    li t0, 0
    sw t0, -140(fp)
    j BB5
BB5: 
    lw t0, -140(fp)
    slti t0, t0, 3
    bnez t0, BB6
    j BB7
BB6: 
    lw t1, -140(fp)
    slli t1, t1, 2
    addi t0, fp, -28
    add t0, t0, t1
    lw t1, -140(fp)
    fcvt.s.w ft0, t1
    sw t1, 0(t0)
    lw t1, -140(fp)
    slli t1, t1, 2
    addi t0, fp, -40
    add t0, t0, t1
    lw t1, -140(fp)
    fcvt.s.w ft0, t1
    sw t1, 0(t0)
    lw t1, -140(fp)
    slli t1, t1, 2
    addi t0, fp, -52
    add t0, t0, t1
    lw t1, -140(fp)
    fcvt.s.w ft0, t1
    sw t1, 0(t0)
    lw t1, -140(fp)
    slli t1, t1, 2
    addi t0, fp, -64
    add t0, t0, t1
    lw t1, -140(fp)
    fcvt.s.w ft0, t1
    sw t1, 0(t0)
    lw t1, -140(fp)
    slli t1, t1, 2
    addi t0, fp, -76
    add t0, t0, t1
    lw t1, -140(fp)
    fcvt.s.w ft0, t1
    sw t1, 0(t0)
    lw t1, -140(fp)
    slli t1, t1, 2
    addi t0, fp, -88
    add t0, t0, t1
    lw t1, -140(fp)
    fcvt.s.w ft0, t1
    sw t1, 0(t0)
    lw t1, -140(fp)
    addi t1, t1, 1
    sw t1, -140(fp)
    j BB5
BB7: 
    addi t0, fp, -28
    mv a0, t0
    addi t0, fp, -40
    mv a1, t0
    addi t0, fp, -52
    mv a2, t0
    addi t0, fp, -64
    mv a3, t0
    addi t0, fp, -76
    mv a4, t0
    addi t0, fp, -88
    mv a5, t0
    addi t0, fp, -112
    mv a6, t0
    addi t0, fp, -124
    mv a7, t0
    addi t0, fp, -136
    sd t0, 8(sp)
    call sub
    mv t0, a0
    sw t0, -140(fp)
    j BB8
BB8: 
    lw t0, -140(fp)
    slti t0, t0, 3
    bnez t0, BB9
    j BB10
BB9: 
    lw t0, -140(fp)
    slli t0, t0, 2
    addi t1, fp, -112
    add t1, t1, t0
    flw ft0, 0(t1)
    fcvt.w.s t1, ft0
    fsw ft0, -144(fp)
    lw t1, -144(fp)
    mv a0, t1
    call putint
    lw t1, -140(fp)
    addi t1, t1, 1
    sw t1, -140(fp)
    j BB8
BB10: 
    li t0, 10
    sw t0, -144(fp)
    li t0, 0
    sw t0, -140(fp)
    lw t0, -144(fp)
    mv a0, t0
    call putch
    j BB11
BB11: 
    lw t0, -140(fp)
    slti t0, t0, 3
    bnez t0, BB12
    j BB13
BB12: 
    lw t1, -140(fp)
    slli t1, t1, 2
    addi t0, fp, -124
    add t0, t0, t1
    flw ft0, 0(t0)
    fcvt.w.s t0, ft0
    fsw ft0, -144(fp)
    lw t0, -144(fp)
    mv a0, t0
    call putint
    lw t0, -140(fp)
    addi t0, t0, 1
    sw t0, -140(fp)
    j BB11
BB13: 
    li t0, 10
    sw t0, -144(fp)
    li t0, 0
    sw t0, -140(fp)
    lw t0, -144(fp)
    mv a0, t0
    call putch
    j BB14
BB14: 
    lw t0, -140(fp)
    slti t0, t0, 3
    bnez t0, BB15
    j BB16
BB15: 
    lw t0, -140(fp)
    slli t0, t0, 2
    addi t1, fp, -136
    add t1, t1, t0
    flw ft0, 0(t1)
    fcvt.w.s t1, ft0
    fsw ft0, -144(fp)
    lw t1, -144(fp)
    mv a0, t1
    call putint
    lw t1, -140(fp)
    addi t1, t1, 1
    sw t1, -140(fp)
    j BB14
BB16: 
    li t0, 10
    sw t0, -144(fp)
    lw t0, -144(fp)
    mv a0, t0
    call putch
    li t0, 0
    mv a0, t0
    j BB21
BB21: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 176
    ret
