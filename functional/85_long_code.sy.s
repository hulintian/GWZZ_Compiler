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
bubblesort: 
BB108: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    j BB0
BB0: 
    li t0, 0
    sw t0, -28(fp)
    j BB1
BB1: 
    lw t0, -28(fp)
    la t1, $n
    lw t1, 0(t1)
    addi t1, t1, -1
    slt t1, t0, t1
    bnez t1, BB2
    j BB3
BB2: 
    li t1, 0
    sw t1, -32(fp)
    j BB4
BB3: 
    li t1, 0
    mv a0, t1
    j BB109
BB4: 
    lw t1, -32(fp)
    la t0, $n
    lw t0, 0(t0)
    lw t2, -28(fp)
    sub t2, t0, t2
    addi t2, t2, -1
    slt t2, t1, t2
    bnez t2, BB5
    j BB6
BB5: 
    j BB7
BB6: 
    lw t2, -28(fp)
    addi t2, t2, 1
    sw t2, -28(fp)
    j BB1
BB7: 
    lw t2, -32(fp)
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    lw t1, -32(fp)
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    slt t1, t1, t2
    bnez t1, BB8
    j BB9
BB8: 
    lw t1, -32(fp)
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    sw t1, -36(fp)
    lw t1, -32(fp)
    addi t1, t1, 1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t2, -32(fp)
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    sw t2, 0(t1)
    lw t2, -32(fp)
    ld t1, -24(fp)
    slli t2, t2, 2
    add t2, t1, t2
    lw t1, -36(fp)
    sw t1, 0(t2)
    j BB9
BB9: 
    lw t1, -32(fp)
    addi t1, t1, 1
    sw t1, -32(fp)
    j BB4
BB109: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
insertsort: 
BB110: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    j BB10
BB10: 
    li t0, 1
    sw t0, -28(fp)
    j BB11
BB11: 
    lw t0, -28(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB12
    j BB13
BB12: 
    lw t1, -28(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    sw t1, -32(fp)
    lw t1, -28(fp)
    addi t1, t1, -1
    sw t1, -36(fp)
    j BB14
BB13: 
    li t1, 0
    mv a0, t1
    j BB111
BB14: 
    lw t1, -36(fp)
    li t0, 0
    addi t0, t0, -1
    slt t0, t0, t1
    bnez t0, BB17
    j BB16
BB15: 
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
    j BB14
BB16: 
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
    j BB11
BB17: 
    lw t0, -32(fp)
    lw t1, -36(fp)
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB15
    j BB16
BB111: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
QuickSort: 
BB112: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    sd a0, -24(fp)
    sw a1, -28(fp)
    sw a2, -32(fp)
    j BB18
BB18: 
    j BB19
BB19: 
    lw t0, -28(fp)
    lw t1, -32(fp)
    slt t1, t0, t1
    bnez t1, BB20
    j BB21
BB20: 
    lw t1, -28(fp)
    sw t1, -36(fp)
    lw t1, -32(fp)
    sw t1, -40(fp)
    lw t1, -28(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    sw t1, -44(fp)
    j BB22
BB21: 
    li t1, 0
    mv a0, t1
    j BB113
BB22: 
    lw t1, -36(fp)
    lw t0, -40(fp)
    slt t0, t1, t0
    bnez t0, BB23
    j BB24
BB23: 
    j BB25
BB24: 
    lw t0, -36(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -44(fp)
    sw t1, 0(t0)
    lw t1, -36(fp)
    addi t1, t1, -1
    sw t1, -48(fp)
    lw t1, -28(fp)
    lw t0, -48(fp)
    addi t2, fp, -24
    mv a0, t2
    mv a1, t1
    mv a2, t0
    call QuickSort
    mv t0, a0
    sw t0, -48(fp)
    lw t0, -36(fp)
    addi t0, t0, 1
    sw t0, -48(fp)
    lw t0, -48(fp)
    lw t1, -32(fp)
    addi t2, fp, -24
    mv a0, t2
    mv a1, t0
    mv a2, t1
    call QuickSort
    mv t1, a0
    sw t1, -48(fp)
    j BB21
BB25: 
    lw t1, -36(fp)
    lw t0, -40(fp)
    slt t0, t1, t0
    bnez t0, BB28
    j BB27
BB26: 
    lw t1, -40(fp)
    addi t1, t1, -1
    sw t1, -40(fp)
    j BB25
BB27: 
    j BB29
BB28: 
    lw t0, -40(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    lw t1, -44(fp)
    addi t1, t1, -1
    slt t1, t1, t0
    bnez t1, BB26
    j BB27
BB29: 
    lw t1, -36(fp)
    lw t0, -40(fp)
    slt t0, t1, t0
    bnez t0, BB30
    j BB31
BB30: 
    lw t0, -36(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -40(fp)
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    sw t1, 0(t0)
    lw t1, -36(fp)
    addi t1, t1, 1
    sw t1, -36(fp)
    j BB31
BB31: 
    j BB32
BB32: 
    lw t0, -36(fp)
    lw t1, -40(fp)
    slt t1, t0, t1
    bnez t1, BB35
    j BB34
BB33: 
    lw t0, -36(fp)
    addi t0, t0, 1
    sw t0, -36(fp)
    j BB32
BB34: 
    j BB36
BB35: 
    lw t1, -36(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    lw t0, -44(fp)
    slt t0, t1, t0
    bnez t0, BB33
    j BB34
BB36: 
    lw t0, -36(fp)
    lw t1, -40(fp)
    slt t1, t0, t1
    bnez t1, BB37
    j BB38
BB37: 
    lw t1, -40(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -36(fp)
    ld t2, -24(fp)
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    sw t0, 0(t1)
    lw t0, -40(fp)
    addi t0, t0, -1
    sw t0, -40(fp)
    j BB38
BB38: 
    j BB22
BB113: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
    .align 1
getMid: 
BB114: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    j BB39
BB39: 
    j BB40
BB40: 
    la t0, $n
    lw t0, 0(t0)
    li t1, 2
    rem t0, t0, t1
    seqz t0, t0
    bnez t0, BB41
    j BB43
BB41: 
    la t1, $n
    lw t1, 0(t1)
    li t0, 2
    div t0, t1, t0
    sw t0, -28(fp)
    lw t0, -28(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    lw t1, -28(fp)
    addi t1, t1, -1
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    div t0, t1, t0
    mv a0, t0
    j BB115
BB42: 
BB43: 
    la t0, $n
    lw t0, 0(t0)
    li t1, 2
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -28(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    mv a0, t1
    j BB115
BB115: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
getMost: 
BB116: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    li t0, -4048
    add sp, sp, t0
    li t0, 4048
    add fp, sp, t0
    sd a0, -24(fp)
    j BB44
BB44: 
    li t0, 0
    li t1, -4028
    add t1, fp, t1
    sw t0, 0(t1)
    j BB45
BB45: 
    li t1, -4028
    add t1, fp, t1
    lw t1, 0(t1)
    slti t1, t1, 1000
    bnez t1, BB46
    j BB47
BB46: 
    li t2, -4028
    add t2, fp, t2
    lw t2, 0(t2)
    slli t2, t2, 2
    li t0, -4024
    add t0, t2, t0
    add t0, fp, t0
    li t2, 0
    sw t2, 0(t0)
    li t2, -4028
    add t2, fp, t2
    lw t2, 0(t2)
    addi t2, t2, 1
    li t0, -4028
    add t0, fp, t0
    sw t2, 0(t0)
    j BB45
BB47: 
    li t1, 0
    li t0, -4028
    add t0, fp, t0
    sw t1, 0(t0)
    li t0, 0
    li t1, -4032
    add t1, fp, t1
    sw t0, 0(t1)
    j BB48
BB48: 
    li t1, -4028
    add t1, fp, t1
    lw t1, 0(t1)
    la t0, $n
    lw t0, 0(t0)
    slt t0, t1, t0
    bnez t0, BB49
    j BB50
BB49: 
    li t0, -4028
    add t0, fp, t0
    lw t0, 0(t0)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, -4040
    add t1, fp, t1
    sw t0, 0(t1)
    li t1, -4040
    add t1, fp, t1
    lw t1, 0(t1)
    slli t1, t1, 2
    li t0, -4024
    add t0, t1, t0
    add t0, fp, t0
    li t1, -4040
    add t1, fp, t1
    lw t1, 0(t1)
    slli t1, t1, 2
    li t2, -4024
    add t2, t1, t2
    add t2, fp, t2
    lw t2, 0(t2)
    addi t2, t2, 1
    sw t2, 0(t0)
    j BB51
BB50: 
    li t0, -4036
    add t0, fp, t0
    lw t0, 0(t0)
    mv a0, t0
    j BB117
BB51: 
    li t2, -4040
    add t2, fp, t2
    lw t2, 0(t2)
    slli t2, t2, 2
    li t0, -4024
    add t0, t2, t0
    add t0, fp, t0
    lw t0, 0(t0)
    li t2, -4032
    add t2, fp, t2
    lw t2, 0(t2)
    slt t2, t2, t0
    bnez t2, BB52
    j BB53
BB52: 
    li t0, -4040
    add t0, fp, t0
    lw t0, 0(t0)
    slli t0, t0, 2
    li t2, -4024
    add t2, t0, t2
    add t2, fp, t2
    lw t2, 0(t2)
    li t0, -4032
    add t0, fp, t0
    sw t2, 0(t0)
    li t0, -4040
    add t0, fp, t0
    lw t0, 0(t0)
    li t2, -4036
    add t2, fp, t2
    sw t0, 0(t2)
    j BB53
BB53: 
    li t2, -4028
    add t2, fp, t2
    lw t2, 0(t2)
    addi t2, t2, 1
    li t0, -4028
    add t0, fp, t0
    sw t2, 0(t0)
    j BB48
BB117: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    li t0, 4048
    add sp, sp, t0
    ret
    .align 1
revert: 
BB118: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    j BB54
BB54: 
    li t0, 0
    sw t0, -32(fp)
    li t0, 0
    sw t0, -36(fp)
    j BB55
BB55: 
    lw t0, -32(fp)
    lw t1, -36(fp)
    slt t1, t0, t1
    bnez t1, BB56
    j BB57
BB56: 
    lw t1, -32(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    sw t1, -28(fp)
    lw t1, -32(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -36(fp)
    ld t2, -24(fp)
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    sw t0, 0(t1)
    lw t0, -36(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -28(fp)
    sw t1, 0(t0)
    lw t1, -32(fp)
    addi t1, t1, 1
    sw t1, -32(fp)
    lw t1, -36(fp)
    addi t1, t1, -1
    sw t1, -36(fp)
    j BB55
BB57: 
    li t1, 0
    mv a0, t1
    j BB119
BB119: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
arrCopy: 
BB120: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    sd a1, -32(fp)
    j BB58
BB58: 
    li t0, 0
    sw t0, -36(fp)
    j BB59
BB59: 
    lw t0, -36(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB60
    j BB61
BB60: 
    lw t1, -36(fp)
    ld t0, -32(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -36(fp)
    ld t2, -24(fp)
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    sw t0, 0(t1)
    lw t0, -36(fp)
    addi t0, t0, 1
    sw t0, -36(fp)
    j BB59
BB61: 
    li t1, 0
    mv a0, t1
    j BB121
BB121: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
calSum: 
BB122: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    sw a1, -28(fp)
    j BB62
BB62: 
    li t0, 0
    sw t0, -32(fp)
    li t0, 0
    sw t0, -36(fp)
    j BB63
BB63: 
    lw t0, -36(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB64
    j BB65
BB64: 
    lw t1, -32(fp)
    lw t0, -36(fp)
    ld t2, -24(fp)
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -32(fp)
    j BB66
BB65: 
    li t1, 0
    mv a0, t1
    j BB123
BB66: 
    lw t0, -36(fp)
    lw t1, -28(fp)
    rem t1, t0, t1
    lw t0, -28(fp)
    addi t0, t0, -1
    xor t0, t1, t0
    snez t0, t0
    bnez t0, BB67
    j BB69
BB67: 
    lw t1, -36(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 0
    sw t0, 0(t1)
    j BB68
BB68: 
    lw t1, -36(fp)
    addi t1, t1, 1
    sw t1, -36(fp)
    j BB63
BB69: 
    lw t0, -36(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -32(fp)
    sw t1, 0(t0)
    li t1, 0
    sw t1, -32(fp)
    j BB68
BB123: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
avgPooling: 
BB124: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    sw a1, -28(fp)
    j BB70
BB71: 
    lw t0, -36(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB72
    j BB73
BB70: 
    li t0, 0
    sw t0, -36(fp)
    li t0, 0
    sw t0, -32(fp)
    j BB71
BB72: 
    j BB74
BB73: 
    la t1, $n
    lw t1, 0(t1)
    lw t0, -28(fp)
    sub t0, t1, t0
    addi t0, t0, 1
    sw t0, -36(fp)
    j BB82
BB74: 
    lw t0, -36(fp)
    lw t1, -28(fp)
    addi t1, t1, -1
    slt t1, t0, t1
    bnez t1, BB75
    j BB77
BB75: 
    lw t1, -32(fp)
    lw t2, -36(fp)
    ld t0, -24(fp)
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    sw t2, -32(fp)
    j BB76
BB76: 
    lw t2, -36(fp)
    addi t2, t2, 1
    sw t2, -36(fp)
    j BB71
BB77: 
    j BB78
BB78: 
    lw t1, -36(fp)
    lw t0, -28(fp)
    addi t0, t0, -1
    xor t0, t1, t0
    seqz t0, t0
    bnez t0, BB79
    j BB81
BB79: 
    ld t2, -24(fp)
    addi t2, t2, 0
    lw t2, 0(t2)
    sw t2, -40(fp)
    ld t2, -24(fp)
    addi t2, t2, 0
    lw t0, -32(fp)
    lw t1, -28(fp)
    div t1, t0, t1
    sw t1, 0(t2)
    j BB80
BB80: 
    j BB76
BB81: 
    lw t0, -32(fp)
    lw t1, -36(fp)
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    lw t0, -40(fp)
    sub t0, t1, t0
    sw t0, -32(fp)
    lw t0, -36(fp)
    lw t1, -28(fp)
    sub t1, t0, t1
    addi t1, t1, 1
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    sw t1, -40(fp)
    lw t1, -36(fp)
    lw t0, -28(fp)
    sub t0, t1, t0
    addi t0, t0, 1
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -32(fp)
    lw t2, -28(fp)
    div t2, t1, t2
    sw t2, 0(t0)
    j BB80
BB82: 
    lw t0, -36(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB83
    j BB84
BB83: 
    lw t1, -36(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 0
    sw t0, 0(t1)
    lw t0, -36(fp)
    addi t0, t0, 1
    sw t0, -36(fp)
    j BB82
BB84: 
    li t1, 0
    mv a0, t1
    j BB125
BB125: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB126: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -304
    addi fp, sp, 304
    j BB85
BB85: 
    li t0, 32
    la t1, $n
    sw t0, 0(t1)
    addi t1, fp, -144
    li t0, 7
    sw t0, 0(t1)
    addi t0, fp, -140
    li t1, 23
    sw t1, 0(t0)
    addi t0, fp, -136
    li t1, 89
    sw t1, 0(t0)
    addi t1, fp, -132
    li t0, 26
    sw t0, 0(t1)
    addi t0, fp, -128
    li t1, 282
    sw t1, 0(t0)
    addi t1, fp, -124
    li t0, 254
    sw t0, 0(t1)
    addi t0, fp, -120
    li t1, 27
    sw t1, 0(t0)
    addi t1, fp, -116
    li t0, 5
    sw t0, 0(t1)
    addi t0, fp, -112
    li t1, 83
    sw t1, 0(t0)
    addi t1, fp, -108
    li t0, 273
    sw t0, 0(t1)
    addi t0, fp, -104
    li t1, 574
    sw t1, 0(t0)
    addi t1, fp, -100
    li t0, 905
    sw t0, 0(t1)
    addi t0, fp, -96
    li t1, 354
    sw t1, 0(t0)
    addi t1, fp, -92
    li t0, 657
    sw t0, 0(t1)
    addi t0, fp, -88
    li t1, 935
    sw t1, 0(t0)
    addi t1, fp, -84
    li t0, 264
    sw t0, 0(t1)
    addi t0, fp, -80
    li t1, 639
    sw t1, 0(t0)
    addi t1, fp, -76
    li t0, 459
    sw t0, 0(t1)
    addi t0, fp, -72
    li t1, 29
    sw t1, 0(t0)
    addi t1, fp, -68
    li t0, 68
    sw t0, 0(t1)
    addi t0, fp, -64
    li t1, 929
    sw t1, 0(t0)
    addi t1, fp, -60
    li t0, 756
    sw t0, 0(t1)
    addi t0, fp, -56
    li t1, 452
    sw t1, 0(t0)
    addi t1, fp, -52
    li t0, 279
    sw t0, 0(t1)
    addi t0, fp, -48
    li t1, 58
    sw t1, 0(t0)
    addi t1, fp, -44
    li t0, 87
    sw t0, 0(t1)
    addi t0, fp, -40
    li t1, 96
    sw t1, 0(t0)
    addi t1, fp, -36
    li t0, 36
    sw t0, 0(t1)
    addi t0, fp, -32
    li t1, 39
    sw t1, 0(t0)
    addi t1, fp, -28
    li t0, 28
    sw t0, 0(t1)
    addi t0, fp, -24
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -20
    li t0, 290
    sw t0, 0(t1)
    addi t0, fp, -144
    mv a0, t0
    addi t0, fp, -272
    mv a1, t0
    call arrCopy
    mv t0, a0
    sw t0, -276(fp)
    addi t0, fp, -272
    mv a0, t0
    call revert
    mv t0, a0
    sw t0, -276(fp)
    li t0, 0
    sw t0, -280(fp)
    j BB86
BB86: 
    lw t0, -280(fp)
    slti t0, t0, 32
    bnez t0, BB87
    j BB88
BB87: 
    lw t1, -280(fp)
    slli t1, t1, 2
    addi t0, fp, -272
    add t0, t0, t1
    lw t0, 0(t0)
    sw t0, -276(fp)
    lw t0, -276(fp)
    mv a0, t0
    call putint
    lw t0, -280(fp)
    addi t0, t0, 1
    sw t0, -280(fp)
    j BB86
BB88: 
    addi t0, fp, -272
    mv a0, t0
    call bubblesort
    mv t0, a0
    sw t0, -276(fp)
    li t0, 0
    sw t0, -280(fp)
    j BB89
BB89: 
    lw t0, -280(fp)
    slti t0, t0, 32
    bnez t0, BB90
    j BB91
BB90: 
    lw t0, -280(fp)
    slli t0, t0, 2
    addi t1, fp, -272
    add t1, t1, t0
    lw t1, 0(t1)
    sw t1, -276(fp)
    lw t1, -276(fp)
    mv a0, t1
    call putint
    lw t1, -280(fp)
    addi t1, t1, 1
    sw t1, -280(fp)
    j BB89
BB91: 
    addi t0, fp, -272
    mv a0, t0
    call getMid
    mv t0, a0
    sw t0, -276(fp)
    lw t0, -276(fp)
    mv a0, t0
    call putint
    addi t0, fp, -272
    mv a0, t0
    call getMost
    mv t0, a0
    sw t0, -276(fp)
    lw t0, -276(fp)
    mv a0, t0
    call putint
    addi t0, fp, -144
    mv a0, t0
    addi t0, fp, -272
    mv a1, t0
    call arrCopy
    mv t0, a0
    sw t0, -276(fp)
    addi t0, fp, -272
    mv a0, t0
    call bubblesort
    mv t0, a0
    sw t0, -276(fp)
    li t0, 0
    sw t0, -280(fp)
    j BB92
BB92: 
    lw t0, -280(fp)
    slti t0, t0, 32
    bnez t0, BB93
    j BB94
BB93: 
    lw t1, -280(fp)
    slli t1, t1, 2
    addi t0, fp, -272
    add t0, t0, t1
    lw t0, 0(t0)
    sw t0, -276(fp)
    lw t0, -276(fp)
    mv a0, t0
    call putint
    lw t0, -280(fp)
    addi t0, t0, 1
    sw t0, -280(fp)
    j BB92
BB94: 
    addi t0, fp, -144
    mv a0, t0
    addi t0, fp, -272
    mv a1, t0
    call arrCopy
    mv t0, a0
    sw t0, -276(fp)
    addi t0, fp, -272
    mv a0, t0
    call insertsort
    mv t0, a0
    sw t0, -276(fp)
    li t0, 0
    sw t0, -280(fp)
    j BB95
BB95: 
    lw t0, -280(fp)
    slti t0, t0, 32
    bnez t0, BB96
    j BB97
BB96: 
    lw t0, -280(fp)
    slli t0, t0, 2
    addi t1, fp, -272
    add t1, t1, t0
    lw t1, 0(t1)
    sw t1, -276(fp)
    lw t1, -276(fp)
    mv a0, t1
    call putint
    lw t1, -280(fp)
    addi t1, t1, 1
    sw t1, -280(fp)
    j BB95
BB97: 
    addi t0, fp, -144
    mv a0, t0
    addi t0, fp, -272
    mv a1, t0
    call arrCopy
    mv t0, a0
    sw t0, -276(fp)
    li t0, 0
    sw t0, -280(fp)
    li t0, 31
    sw t0, -276(fp)
    lw t0, -280(fp)
    lw t1, -276(fp)
    addi t2, fp, -272
    mv a0, t2
    mv a1, t0
    mv a2, t1
    call QuickSort
    mv t1, a0
    sw t1, -276(fp)
    j BB98
BB98: 
    lw t1, -280(fp)
    slti t1, t1, 32
    bnez t1, BB99
    j BB100
BB99: 
    lw t1, -280(fp)
    slli t1, t1, 2
    addi t0, fp, -272
    add t0, t0, t1
    lw t0, 0(t0)
    sw t0, -276(fp)
    lw t0, -276(fp)
    mv a0, t0
    call putint
    lw t0, -280(fp)
    addi t0, t0, 1
    sw t0, -280(fp)
    j BB98
BB100: 
    addi t1, fp, -144
    mv a0, t1
    addi t1, fp, -272
    mv a1, t1
    call arrCopy
    mv t1, a0
    sw t1, -276(fp)
    addi t1, fp, -272
    mv a0, t1
    li t1, 4
    mv a1, t1
    call calSum
    mv t1, a0
    sw t1, -276(fp)
    li t1, 0
    sw t1, -280(fp)
    j BB101
BB101: 
    lw t1, -280(fp)
    slti t1, t1, 32
    bnez t1, BB102
    j BB103
BB102: 
    lw t0, -280(fp)
    slli t0, t0, 2
    addi t1, fp, -272
    add t1, t1, t0
    lw t1, 0(t1)
    sw t1, -276(fp)
    lw t1, -276(fp)
    mv a0, t1
    call putint
    lw t1, -280(fp)
    addi t1, t1, 1
    sw t1, -280(fp)
    j BB101
BB103: 
    addi t1, fp, -144
    mv a0, t1
    addi t1, fp, -272
    mv a1, t1
    call arrCopy
    mv t1, a0
    sw t1, -276(fp)
    addi t1, fp, -272
    mv a0, t1
    li t1, 3
    mv a1, t1
    call avgPooling
    mv t1, a0
    sw t1, -276(fp)
    li t1, 0
    sw t1, -280(fp)
    j BB104
BB104: 
    lw t1, -280(fp)
    slti t1, t1, 32
    bnez t1, BB105
    j BB106
BB105: 
    lw t1, -280(fp)
    slli t1, t1, 2
    addi t0, fp, -272
    add t0, t0, t1
    lw t0, 0(t0)
    sw t0, -276(fp)
    lw t0, -276(fp)
    mv a0, t0
    call putint
    lw t0, -280(fp)
    addi t0, t0, 1
    sw t0, -280(fp)
    j BB104
BB106: 
    li t1, 0
    mv a0, t1
    j BB127
BB127: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 304
    ret
