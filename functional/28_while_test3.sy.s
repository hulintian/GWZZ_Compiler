    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$g:
    .skip 4
$h:
    .skip 4
$f:
    .skip 4
$e:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
EightWhile: 
BB27: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB0
BB0: 
    li t0, 5
    sw t0, -20(fp)
    li t0, 6
    sw t0, -24(fp)
    li t0, 7
    sw t0, -28(fp)
    li t0, 10
    sw t0, -32(fp)
    j BB1
BB1: 
    lw t0, -20(fp)
    slti t0, t0, 20
    bnez t0, BB2
    j BB3
BB2: 
    lw t1, -20(fp)
    addi t1, t1, 3
    sw t1, -20(fp)
    j BB4
BB3: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lw t2, -32(fp)
    add t2, t1, t2
    add t2, t0, t2
    lw t0, -28(fp)
    add t0, t2, t0
    la t2, $e
    lw t2, 0(t2)
    lw t1, -32(fp)
    add t1, t2, t1
    la t2, $g
    lw t2, 0(t2)
    sub t2, t1, t2
    la t1, $h
    lw t1, 0(t1)
    add t1, t2, t1
    sub t1, t0, t1
    mv a0, t1
    j BB28
BB4: 
    lw t1, -24(fp)
    slti t1, t1, 10
    bnez t1, BB5
    j BB6
BB5: 
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB7
BB6: 
    lw t1, -24(fp)
    addi t1, t1, -2
    sw t1, -24(fp)
    j BB1
BB7: 
    lw t1, -28(fp)
    xori t1, t1, 7
    seqz t1, t1
    bnez t1, BB8
    j BB9
BB8: 
    lw t1, -28(fp)
    addi t1, t1, -1
    sw t1, -28(fp)
    j BB10
BB9: 
    lw t1, -28(fp)
    addi t1, t1, 1
    sw t1, -28(fp)
    j BB4
BB10: 
    lw t1, -32(fp)
    slti t1, t1, 20
    bnez t1, BB11
    j BB12
BB11: 
    lw t1, -32(fp)
    addi t1, t1, 3
    sw t1, -32(fp)
    j BB13
BB12: 
    lw t1, -32(fp)
    addi t1, t1, -1
    sw t1, -32(fp)
    j BB7
BB13: 
    la t1, $e
    lw t1, 0(t1)
    li t0, 1
    slt t0, t0, t1
    bnez t0, BB14
    j BB15
BB14: 
    la t1, $e
    lw t1, 0(t1)
    addi t1, t1, -1
    la t0, $e
    sw t1, 0(t0)
    j BB16
BB15: 
    la t0, $e
    lw t0, 0(t0)
    addi t0, t0, 1
    la t1, $e
    sw t0, 0(t1)
    j BB10
BB16: 
    la t0, $f
    lw t0, 0(t0)
    li t1, 2
    slt t1, t1, t0
    bnez t1, BB17
    j BB18
BB17: 
    la t0, $f
    lw t0, 0(t0)
    addi t0, t0, -2
    la t1, $f
    sw t0, 0(t1)
    j BB19
BB18: 
    la t1, $f
    lw t1, 0(t1)
    addi t1, t1, 1
    la t0, $f
    sw t1, 0(t0)
    j BB13
BB19: 
    la t1, $g
    lw t1, 0(t1)
    slti t1, t1, 3
    bnez t1, BB20
    j BB21
BB20: 
    la t0, $g
    lw t0, 0(t0)
    addi t0, t0, 10
    la t1, $g
    sw t0, 0(t1)
    j BB22
BB21: 
    la t1, $g
    lw t1, 0(t1)
    addi t1, t1, -8
    la t0, $g
    sw t1, 0(t0)
    j BB16
BB22: 
    la t1, $h
    lw t1, 0(t1)
    slti t1, t1, 10
    bnez t1, BB23
    j BB24
BB23: 
    la t0, $h
    lw t0, 0(t0)
    addi t0, t0, 8
    la t1, $h
    sw t0, 0(t1)
    j BB22
BB24: 
    la t1, $h
    lw t1, 0(t1)
    addi t1, t1, -1
    la t0, $h
    sw t1, 0(t0)
    j BB19
BB28: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB29: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB25
BB25: 
    li t0, 1
    la t1, $g
    sw t0, 0(t1)
    li t0, 2
    la t1, $h
    sw t0, 0(t1)
    li t0, 4
    la t1, $e
    sw t0, 0(t1)
    li t1, 6
    la t0, $f
    sw t1, 0(t0)
    call EightWhile
    mv t0, a0
    mv a0, t0
    j BB30
BB30: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
