    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $RADIUS
$RADIUS:
    .word 1085276160
    .globl $PI
$PI:
    .word 1078530011
    .globl $EPS
$EPS:
    .word 897988541
    .globl $PI_HEX
$PI_HEX:
    .word 1078530011
    .globl $HEX2
$HEX2:
    .word 1033895936
    .globl $FACT
$FACT:
    .word 3338725376
    .globl $EVAL1
$EVAL1:
    .word 1119752446
    .globl $EVAL2
$EVAL2:
    .word 1107966695
    .globl $EVAL3
$EVAL3:
    .word 1107966695
    .globl $CONV1
$CONV1:
    .word 1130954752
    .globl $CONV2
$CONV2:
    .word 1166012416
    .globl $MAX
$MAX:
    .word 1000000000
    .globl $TWO
$TWO:
    .word 2
    .globl $THREE
$THREE:
    .word 3
    .globl $FIVE
$FIVE:
    .word 5
    .align 3
    .globl main
    .text

    .align 1
float_abs: 
BB41: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    fsw fa0, -20(fp)
    j BB0
BB0: 
    j BB1
BB1: 
    flw ft0, -20(fp)
    li t0, 0
    fcvt.s.w ft1, t0
    flt.s t0, ft0, ft1
    bnez t0, BB2
    j BB3
BB2: 
    flw ft1, -20(fp)
    li t0, 0
    fcvt.s.w ft0, t0
    fsub.s ft0, ft0, ft1
    fmv.s fa0, ft0
    j BB42
BB3: 
    flw ft1, -20(fp)
    fmv.s fa0, ft1
    j BB42
BB42: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
circle_area: 
BB43: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB4
BB4: 
    la t0, $PI
    flw ft0, 0(t0)
    lw t0, -20(fp)
    fcvt.s.w ft1, t0
    fmul.s ft1, ft0, ft1
    lw t0, -20(fp)
    fcvt.s.w ft0, t0
    fmul.s ft0, ft1, ft0
    lw t0, -20(fp)
    lw t1, -20(fp)
    mul t1, t0, t1
    la t0, $PI
    flw ft1, 0(t0)
    fcvt.s.w ft2, t1
    fmul.s ft2, ft2, ft1
    fadd.s ft2, ft0, ft2
    li t1, 2
    fcvt.s.w ft0, t1
    fdiv.s ft0, ft2, ft0
    fmv.s fa0, ft0
    j BB44
BB44: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
float_eq: 
BB45: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    fsw fa0, -20(fp)
    fsw fa1, -24(fp)
    j BB5
BB5: 
    j BB6
BB6: 
    flw ft0, -20(fp)
    flw ft1, -24(fp)
    fsub.s ft1, ft0, ft1
    fmv.s fa0, ft1
    call float_abs
    fmv.s ft1, fa0
    la t0, $EPS
    flw ft0, 0(t0)
    flt.s t0, ft1, ft0
    bnez t0, BB7
    j BB9
BB7: 
    li t0, 1
    fcvt.s.w ft1, t0
    li t0, 1073741824
    fmv.w.x ft0, t0
    fmul.s ft0, ft1, ft0
    li t0, 2
    fcvt.s.w ft1, t0
    fdiv.s ft1, ft0, ft1
    fcvt.w.s t0, ft1
    mv a0, t0
    j BB46
BB8: 
BB9: 
    li t0, 0
    mv a0, t0
    j BB46
BB46: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
error: 
BB47: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB10
BB10: 
    li t0, 101
    mv a0, t0
    call putch
    li t0, 114
    mv a0, t0
    call putch
    li t0, 114
    mv a0, t0
    call putch
    li t0, 111
    mv a0, t0
    call putch
    li t0, 114
    mv a0, t0
    call putch
    li t0, 10
    mv a0, t0
    call putch
    j BB48
BB48: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
ok: 
BB49: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB11
BB11: 
    li t0, 111
    mv a0, t0
    call putch
    li t0, 107
    mv a0, t0
    call putch
    li t0, 10
    mv a0, t0
    call putch
    j BB50
BB50: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
assert: 
BB51: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    j BB12
BB12: 
    j BB13
BB13: 
    lw t0, -20(fp)
    li t1, 0
    xor t1, t1, t0
    snez t1, t1
    bnez t1, BB14
    j BB16
BB14: 
    call error
    j BB15
BB15: 
    j BB52
BB16: 
    call ok
    j BB15
BB52: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
assert_not: 
BB53: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    j BB17
BB17: 
    j BB18
BB18: 
    lw t0, -20(fp)
    seqz t0, t0
    bnez t0, BB19
    j BB21
BB19: 
    call error
    j BB20
BB20: 
    j BB54
BB21: 
    call ok
    j BB20
BB54: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB55: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -96
    addi fp, sp, 96
    j BB22
BB22: 
    la t0, $HEX2
    flw ft0, 0(t0)
    la t0, $FACT
    flw ft1, 0(t0)
    fmv.s fa0, ft0
    fmv.s fa1, ft1
    call float_eq
    mv t0, a0
    mv a0, t0
    call assert_not
    la t0, $EVAL1
    flw ft1, 0(t0)
    la t0, $EVAL2
    flw ft0, 0(t0)
    fmv.s fa0, ft1
    fmv.s fa1, ft0
    call float_eq
    mv t0, a0
    mv a0, t0
    call assert_not
    la t0, $EVAL2
    flw ft0, 0(t0)
    la t0, $EVAL3
    flw ft1, 0(t0)
    fmv.s fa0, ft0
    fmv.s fa1, ft1
    call float_eq
    mv t0, a0
    mv a0, t0
    call assert
    la t0, $RADIUS
    flw ft1, 0(t0)
    fmv.s fa0, ft1
    call circle_area
    fmv.s ft1, fa0
    la t0, $FIVE
    lw t0, 0(t0)
    mv a0, t0
    call circle_area
    fmv.s ft0, fa0
    fmv.s fa0, ft1
    fmv.s fa1, ft0
    call float_eq
    mv t0, a0
    mv a0, t0
    call assert
    la t0, $CONV1
    flw ft0, 0(t0)
    la t0, $CONV2
    flw ft1, 0(t0)
    fmv.s fa0, ft0
    fmv.s fa1, ft1
    call float_eq
    mv t0, a0
    mv a0, t0
    call assert_not
    j BB23
BB23: 
    li t0, 0
    fcvt.s.w ft1, t0
    li t0, 1069547520
    fmv.w.x ft0, t0
    feq.s t0, ft0, ft1
    snez t0, t0
    bnez t0, BB24
    j BB25
BB24: 
    call ok
    j BB25
BB25: 
    j BB26
BB26: 
    li t0, 0
    fcvt.s.w ft0, t0
    li t0, 1079194419
    fmv.w.x ft1, t0
    feq.s t0, ft0, ft1
    snez t0, t0
    li t1, 0
    xor t1, t1, t0
    snez t1, t1
    bnez t1, BB27
    j BB28
BB27: 
    call ok
    j BB28
BB28: 
    j BB29
BB29: 
    li t1, 0
    fcvt.s.w ft1, t1
    li t1, 0
    fmv.w.x ft0, t1
    feq.s t1, ft0, ft1
    snez t1, t1
    bnez t1, BB32
    j BB31
BB30: 
    call error
    j BB31
BB31: 
    j BB33
BB32: 
    li t1, 3
    seqz t1, t1
    bnez t1, BB30
    j BB31
BB33: 
    li t1, 0
    seqz t1, t1
    bnez t1, BB36
    j BB35
BB34: 
    call ok
    j BB35
BB35: 
    li t1, 1
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    addi t1, fp, -64
    li t0, 1065353216
    sw t0, 0(t1)
    addi t0, fp, -60
    li t1, 1073741824
    sw t1, 0(t0)
    addi t1, fp, -64
    mv a0, t1
    call getfarray
    mv t1, a0
    sw t1, -68(fp)
    j BB37
BB36: 
    li t1, 0
    fcvt.s.w ft0, t1
    li t1, 1050253722
    fmv.w.x ft1, t1
    feq.s t1, ft1, ft0
    snez t1, t1
    bnez t1, BB34
    j BB35
BB37: 
    lw t1, -20(fp)
    la t0, $MAX
    lw t0, 0(t0)
    slt t0, t1, t0
    bnez t0, BB38
    j BB39
BB38: 
    call getfloat
    fmv.s ft1, fa0
    fsw ft1, -72(fp)
    la t0, $PI
    flw ft1, 0(t0)
    flw ft0, -72(fp)
    fmul.s ft0, ft1, ft0
    flw ft1, -72(fp)
    fmul.s ft1, ft0, ft1
    fsw ft1, -76(fp)
    flw ft1, -72(fp)
    fmv.s fa0, ft1
    call circle_area
    fmv.s ft1, fa0
    fsw ft1, -80(fp)
    lw t0, -24(fp)
    slli t0, t0, 2
    addi t1, fp, -64
    add t1, t1, t0
    lw t0, -24(fp)
    slli t0, t0, 2
    addi t2, fp, -64
    add t2, t2, t0
    flw ft1, 0(t2)
    flw ft0, -72(fp)
    fadd.s ft0, ft1, ft0
    fsw ft0, 0(t1)
    flw ft0, -76(fp)
    fmv.s fa0, ft0
    call putfloat
    li t1, 32
    mv a0, t1
    call putch
    flw ft0, -80(fp)
    fmv.s fa0, ft0
    call putint
    li t1, 10
    mv a0, t1
    call putch
    lw t1, -20(fp)
    li t2, 0
    fcvt.s.w ft0, t2
    li t2, 1092616192
    fmv.w.x ft1, t2
    fsub.s ft1, ft0, ft1
    li t2, 0
    fcvt.s.w ft0, t2
    fsub.s ft0, ft0, ft1
    fcvt.s.w ft1, t1
    fmul.s ft1, ft1, ft0
    fcvt.w.s t1, ft1
    fsw ft1, -20(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB37
BB39: 
    lw t0, -68(fp)
    mv a0, t0
    addi t0, fp, -64
    mv a1, t0
    call putfarray
    li t0, 0
    mv a0, t0
    j BB56
BB56: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 96
    ret
