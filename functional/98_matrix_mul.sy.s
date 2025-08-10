    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$M:
    .skip 4
$L:
    .skip 4
$N:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
mul: 
BB15: 
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
    ld t0, -72(fp)
    addi t0, t0, 0
    ld t1, -24(fp)
    addi t1, t1, 0
    flw ft0, 0(t1)
    ld t1, -48(fp)
    addi t1, t1, 0
    flw ft1, 0(t1)
    fmul.s ft1, ft0, ft1
    ld t1, -24(fp)
    addi t1, t1, 4
    flw ft0, 0(t1)
    ld t1, -56(fp)
    addi t1, t1, 0
    flw ft2, 0(t1)
    fmul.s ft2, ft0, ft2
    fadd.s ft2, ft1, ft2
    ld t1, -24(fp)
    addi t1, t1, 8
    flw ft1, 0(t1)
    ld t1, -64(fp)
    addi t1, t1, 0
    flw ft0, 0(t1)
    fmul.s ft0, ft1, ft0
    fadd.s ft0, ft2, ft0
    fsw ft0, 0(t0)
    ld t0, -72(fp)
    addi t0, t0, 4
    ld t1, -24(fp)
    addi t1, t1, 0
    flw ft0, 0(t1)
    ld t1, -48(fp)
    addi t1, t1, 4
    flw ft2, 0(t1)
    fmul.s ft2, ft0, ft2
    ld t1, -24(fp)
    addi t1, t1, 4
    flw ft0, 0(t1)
    ld t1, -56(fp)
    addi t1, t1, 4
    flw ft1, 0(t1)
    fmul.s ft1, ft0, ft1
    fadd.s ft1, ft2, ft1
    ld t1, -24(fp)
    addi t1, t1, 8
    flw ft2, 0(t1)
    ld t1, -64(fp)
    addi t1, t1, 4
    flw ft0, 0(t1)
    fmul.s ft0, ft2, ft0
    fadd.s ft0, ft1, ft0
    fsw ft0, 0(t0)
    ld t0, -72(fp)
    addi t0, t0, 8
    ld t1, -24(fp)
    addi t1, t1, 0
    flw ft0, 0(t1)
    ld t1, -48(fp)
    addi t1, t1, 8
    flw ft1, 0(t1)
    fmul.s ft1, ft0, ft1
    ld t1, -24(fp)
    addi t1, t1, 4
    flw ft0, 0(t1)
    ld t1, -56(fp)
    addi t1, t1, 8
    flw ft2, 0(t1)
    fmul.s ft2, ft0, ft2
    fadd.s ft2, ft1, ft2
    ld t1, -24(fp)
    addi t1, t1, 8
    flw ft1, 0(t1)
    ld t1, -64(fp)
    addi t1, t1, 8
    flw ft0, 0(t1)
    fmul.s ft0, ft1, ft0
    fadd.s ft0, ft2, ft0
    fsw ft0, 0(t0)
    ld t0, -80(fp)
    addi t0, t0, 0
    ld t1, -32(fp)
    addi t1, t1, 0
    flw ft0, 0(t1)
    ld t1, -48(fp)
    addi t1, t1, 0
    flw ft2, 0(t1)
    fmul.s ft2, ft0, ft2
    ld t1, -32(fp)
    addi t1, t1, 4
    flw ft0, 0(t1)
    ld t1, -56(fp)
    addi t1, t1, 0
    flw ft1, 0(t1)
    fmul.s ft1, ft0, ft1
    fadd.s ft1, ft2, ft1
    ld t1, -32(fp)
    addi t1, t1, 8
    flw ft2, 0(t1)
    ld t1, -64(fp)
    addi t1, t1, 0
    flw ft0, 0(t1)
    fmul.s ft0, ft2, ft0
    fadd.s ft0, ft1, ft0
    fsw ft0, 0(t0)
    ld t0, -80(fp)
    addi t0, t0, 4
    ld t1, -32(fp)
    addi t1, t1, 0
    flw ft0, 0(t1)
    ld t1, -48(fp)
    addi t1, t1, 4
    flw ft1, 0(t1)
    fmul.s ft1, ft0, ft1
    ld t1, -32(fp)
    addi t1, t1, 4
    flw ft0, 0(t1)
    ld t1, -56(fp)
    addi t1, t1, 4
    flw ft2, 0(t1)
    fmul.s ft2, ft0, ft2
    fadd.s ft2, ft1, ft2
    ld t1, -32(fp)
    addi t1, t1, 8
    flw ft1, 0(t1)
    ld t1, -64(fp)
    addi t1, t1, 4
    flw ft0, 0(t1)
    fmul.s ft0, ft1, ft0
    fadd.s ft0, ft2, ft0
    fsw ft0, 0(t0)
    ld t0, -80(fp)
    addi t0, t0, 8
    ld t1, -32(fp)
    addi t1, t1, 0
    flw ft0, 0(t1)
    ld t1, -48(fp)
    addi t1, t1, 8
    flw ft2, 0(t1)
    fmul.s ft2, ft0, ft2
    ld t1, -32(fp)
    addi t1, t1, 4
    flw ft0, 0(t1)
    ld t1, -56(fp)
    addi t1, t1, 8
    flw ft1, 0(t1)
    fmul.s ft1, ft0, ft1
    fadd.s ft1, ft2, ft1
    ld t1, -32(fp)
    addi t1, t1, 8
    flw ft2, 0(t1)
    ld t1, -64(fp)
    addi t1, t1, 8
    flw ft0, 0(t1)
    fmul.s ft0, ft2, ft0
    fadd.s ft0, ft1, ft0
    fsw ft0, 0(t0)
    ld t0, -88(fp)
    addi t0, t0, 0
    ld t1, -40(fp)
    addi t1, t1, 0
    flw ft0, 0(t1)
    ld t1, -48(fp)
    addi t1, t1, 0
    flw ft1, 0(t1)
    fmul.s ft1, ft0, ft1
    ld t1, -40(fp)
    addi t1, t1, 4
    flw ft0, 0(t1)
    ld t1, -56(fp)
    addi t1, t1, 0
    flw ft2, 0(t1)
    fmul.s ft2, ft0, ft2
    fadd.s ft2, ft1, ft2
    ld t1, -40(fp)
    addi t1, t1, 8
    flw ft1, 0(t1)
    ld t1, -64(fp)
    addi t1, t1, 0
    flw ft0, 0(t1)
    fmul.s ft0, ft1, ft0
    fadd.s ft0, ft2, ft0
    fsw ft0, 0(t0)
    ld t0, -88(fp)
    addi t0, t0, 4
    ld t1, -40(fp)
    addi t1, t1, 0
    flw ft0, 0(t1)
    ld t1, -48(fp)
    addi t1, t1, 4
    flw ft2, 0(t1)
    fmul.s ft2, ft0, ft2
    ld t1, -40(fp)
    addi t1, t1, 4
    flw ft0, 0(t1)
    ld t1, -56(fp)
    addi t1, t1, 4
    flw ft1, 0(t1)
    fmul.s ft1, ft0, ft1
    fadd.s ft1, ft2, ft1
    ld t1, -40(fp)
    addi t1, t1, 8
    flw ft2, 0(t1)
    ld t1, -64(fp)
    addi t1, t1, 4
    flw ft0, 0(t1)
    fmul.s ft0, ft2, ft0
    fadd.s ft0, ft1, ft0
    fsw ft0, 0(t0)
    ld t0, -88(fp)
    addi t0, t0, 8
    ld t1, -40(fp)
    addi t1, t1, 0
    flw ft0, 0(t1)
    ld t1, -48(fp)
    addi t1, t1, 8
    flw ft1, 0(t1)
    fmul.s ft1, ft0, ft1
    ld t1, -40(fp)
    addi t1, t1, 4
    flw ft0, 0(t1)
    ld t1, -56(fp)
    addi t1, t1, 8
    flw ft2, 0(t1)
    fmul.s ft2, ft0, ft2
    fadd.s ft2, ft1, ft2
    ld t1, -40(fp)
    addi t1, t1, 8
    flw ft1, 0(t1)
    ld t1, -64(fp)
    addi t1, t1, 8
    flw ft0, 0(t1)
    fmul.s ft0, ft1, ft0
    fadd.s ft0, ft2, ft0
    fsw ft0, 0(t0)
    li t0, 0
    mv a0, t0
    j BB16
BB16: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 112
    ret
    .align 1
main: 
BB17: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -176
    addi fp, sp, 176
    j BB1
BB1: 
    li t0, 3
    la t1, $N
    sw t0, 0(t1)
    li t1, 3
    la t0, $M
    sw t1, 0(t0)
    li t0, 3
    la t1, $L
    sw t0, 0(t1)
    li t1, 0
    sw t1, -140(fp)
    j BB2
BB2: 
    lw t1, -140(fp)
    la t0, $M
    lw t0, 0(t0)
    slt t0, t1, t0
    bnez t0, BB3
    j BB4
BB3: 
    lw t0, -140(fp)
    slli t0, t0, 2
    addi t1, fp, -28
    add t1, t1, t0
    lw t0, -140(fp)
    fcvt.s.w ft0, t0
    sw t0, 0(t1)
    lw t0, -140(fp)
    slli t0, t0, 2
    addi t1, fp, -40
    add t1, t1, t0
    lw t0, -140(fp)
    fcvt.s.w ft0, t0
    sw t0, 0(t1)
    lw t0, -140(fp)
    slli t0, t0, 2
    addi t1, fp, -52
    add t1, t1, t0
    lw t0, -140(fp)
    fcvt.s.w ft0, t0
    sw t0, 0(t1)
    lw t0, -140(fp)
    slli t0, t0, 2
    addi t1, fp, -64
    add t1, t1, t0
    lw t0, -140(fp)
    fcvt.s.w ft0, t0
    sw t0, 0(t1)
    lw t0, -140(fp)
    slli t0, t0, 2
    addi t1, fp, -76
    add t1, t1, t0
    lw t0, -140(fp)
    fcvt.s.w ft0, t0
    sw t0, 0(t1)
    lw t0, -140(fp)
    slli t0, t0, 2
    addi t1, fp, -88
    add t1, t1, t0
    lw t0, -140(fp)
    fcvt.s.w ft0, t0
    sw t0, 0(t1)
    lw t0, -140(fp)
    addi t0, t0, 1
    sw t0, -140(fp)
    j BB2
BB4: 
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
    call mul
    mv t0, a0
    sw t0, -140(fp)
    j BB5
BB5: 
    lw t0, -140(fp)
    la t1, $N
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB6
    j BB7
BB6: 
    lw t1, -140(fp)
    slli t1, t1, 2
    addi t0, fp, -112
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
    j BB5
BB7: 
    li t1, 10
    sw t1, -144(fp)
    li t1, 0
    sw t1, -140(fp)
    lw t1, -144(fp)
    mv a0, t1
    call putch
    j BB8
BB8: 
    lw t1, -140(fp)
    la t0, $N
    lw t0, 0(t0)
    slt t0, t1, t0
    bnez t0, BB9
    j BB10
BB9: 
    lw t0, -140(fp)
    slli t0, t0, 2
    addi t1, fp, -124
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
    la t1, $N
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB12
    j BB13
BB12: 
    lw t1, -140(fp)
    slli t1, t1, 2
    addi t0, fp, -136
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
    li t1, 10
    sw t1, -144(fp)
    lw t1, -144(fp)
    mv a0, t1
    call putch
    li t1, 0
    mv a0, t1
    j BB18
BB18: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 176
    ret
