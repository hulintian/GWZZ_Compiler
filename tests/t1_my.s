    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $c
$c:
    .word 1
    .globl $arr
$arr:
    .word 1
    .word 2
    .word 3
    .word 4
    .word 5
    .word 6
    .word 7
    .word 8
    .word 9
    .word 10
    .align 3
    .globl main
    .text

    .align 1
add: 
BB11: 
    addi sp, sp, -24
    sd fp, 16(sp)
    sd ra, 8(sp)
    addi fp, sp, 24
    sw a0, -20(fp)
    sw a1, -24(fp)
    j, BB0
BB0: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    add t1, t0, t1
    mv a0, t1
    j, BB12
BB12: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 24
    ret
    .align 1
b: 
BB13: 
    addi sp, sp, -76
    sd fp, 68(sp)
    sd ra, 60(sp)
    addi fp, sp, 76
    j, BB1
BB1: 
    li t0, 1
    mv a0, t0
    li t0, 1
    mv a1, t0
    call, add
    mv t0, a0
    mv a0, t0
    li t0, 2
    mv a1, t0
    call, add
    mv t0, a0
    sw t0, -20(fp)
    li t0, 100
    sw t0, -24(fp)
    addi t0, fp, -64
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -60
    li t0, 2
    sw t0, 0(t1)
    lw t0, -24(fp)
    addi t1, fp, -56
    sw t0, 0(t1)
    addi t1, fp, -44
    li t0, 6
    sw t0, 0(t1)
    addi t0, fp, -40
    li t1, 7
    sw t1, 0(t0)
    addi t1, fp, -36
    li t0, 8
    sw t0, 0(t1)
    addi t0, fp, -32
    li t1, 9
    sw t1, 0(t0)
    addi t1, fp, -28
    li t0, 10
    sw t0, 0(t1)
    li t0, 1074580685
    sw t0, -68(fp)
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    slli t1, t1, 2
    addi t0, fp, -64
    add t0, t0, t1
    lw t0, 0(t0)
    li t1, 2
    add t1, t1, t0
    sw t1, -72(fp)
    j, BB2
BB2: 
    lw t1, -72(fp)
    seqz t1, t1
    bnez t1, BB5
    j, BB4
BB3: 
    li t1, 33333
    sw t1, -76(fp)
    j, BB4
BB4: 
    j, BB14
    j, BB14
    j, BB14
BB5: 
    flw ft0, -68(fp)
    li t1, 0
    fcvt.w.s t1, t1
    feq.s ft0, ft0, t1
    snez ft0, ft0
    bnez ft0, BB3
    j, BB4
BB14: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 76
    ret
    .align 1
f2c: 
BB15: 
    addi sp, sp, -20
    sd fp, 12(sp)
    sd ra, 4(sp)
    addi fp, sp, 20
    fsw fa0, -20(fp)
    j, BB6
BB6: 
    flw ft0, -20(fp)
    fmv.s fa0, ft0
    j, BB16
BB16: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 20
    ret
    .align 1
arr_func2: 
BB17: 
    addi sp, sp, -24
    sd fp, 16(sp)
    sd ra, 8(sp)
    addi fp, sp, 24
    sd a0, -24(fp)
    j, BB7
BB7: 
    j, BB18
BB18: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 24
    ret
    .align 1
arr_func: 
BB19: 
    addi sp, sp, -24
    sd fp, 16(sp)
    sd ra, 8(sp)
    addi fp, sp, 24
    sd a0, -24(fp)
    j, BB8
BB8: 
    li t0, 0
    li t1, 10
    mul t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t0, t0, t1
    li t1, 11111
    sw t1, 0(t0)
    li t1, 1
    li t0, 10
    mul t0, t1, t0
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    mv a0, t0
    call, arr_func2
    j, BB20
BB20: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 24
    ret
    .align 1
main: 
BB21: 
    addi sp, sp, -96
    sd fp, 88(sp)
    sd ra, 80(sp)
    addi fp, sp, 96
    j, BB9
BB9: 
    li t0, 0
    li t1, 5
    mul t1, t0, t1
    lla t0, $arr
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 11111
    sw t0, 0(t1)
    li t0, 0
    li t1, 10
    mul t1, t0, t1
    slli t1, t1, 2
    addi t0, fp, -96
    add t0, t0, t1
    li t1, 10086
    sw t1, 0(t0)
    li t1, -96
    add t1, t1, fp
    mv a0, t1
    call, arr_func
    li t1, 0
    mv a0, t1
    j, BB22
BB22: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 96
    ret
