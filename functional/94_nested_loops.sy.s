    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$arr1:
    .skip 57600
$arr2:
    .skip 107520
    .align 3
    .globl main
    .text

    .align 1
loop1: 
BB97: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB0
BB0: 
    li t0, 0
    sw t0, -28(fp)
    j BB1
BB1: 
    lw t0, -28(fp)
    lw t1, -20(fp)
    slt t1, t0, t1
    bnez t1, BB4
    j BB3
BB2: 
    li t1, 0
    sw t1, -32(fp)
    j BB5
BB3: 
    j BB98
BB4: 
    lw t1, -28(fp)
    lw t0, -24(fp)
    slt t1, t1, t0
    bnez t1, BB2
    j BB3
BB5: 
    lw t1, -32(fp)
    slti t1, t1, 2
    bnez t1, BB6
    j BB7
BB6: 
    li t1, 0
    sw t1, -36(fp)
    j BB8
BB7: 
    lw t1, -28(fp)
    addi t1, t1, 1
    sw t1, -28(fp)
    j BB1
BB8: 
    lw t1, -36(fp)
    slti t1, t1, 3
    bnez t1, BB9
    j BB10
BB9: 
    li t1, 0
    sw t1, -40(fp)
    j BB11
BB10: 
    lw t1, -32(fp)
    addi t1, t1, 1
    sw t1, -32(fp)
    j BB5
BB11: 
    lw t1, -40(fp)
    slti t1, t1, 4
    bnez t1, BB12
    j BB13
BB12: 
    li t1, 0
    sw t1, -44(fp)
    j BB14
BB13: 
    lw t1, -36(fp)
    addi t1, t1, 1
    sw t1, -36(fp)
    j BB8
BB14: 
    lw t1, -44(fp)
    slti t1, t1, 5
    bnez t1, BB15
    j BB16
BB15: 
    li t1, 0
    sw t1, -48(fp)
    j BB17
BB16: 
    lw t1, -40(fp)
    addi t1, t1, 1
    sw t1, -40(fp)
    j BB11
BB17: 
    lw t1, -48(fp)
    slti t1, t1, 6
    bnez t1, BB18
    j BB19
BB18: 
    li t1, 0
    sw t1, -52(fp)
    j BB20
BB19: 
    lw t1, -44(fp)
    addi t1, t1, 1
    sw t1, -44(fp)
    j BB14
BB20: 
    lw t1, -52(fp)
    slti t1, t1, 2
    bnez t1, BB21
    j BB22
BB21: 
    lw t1, -28(fp)
    li t0, 1440
    mul t0, t1, t0
    lw t1, -32(fp)
    li t2, 720
    mul t2, t1, t2
    add t2, t0, t2
    lw t0, -36(fp)
    li t1, 240
    mul t1, t0, t1
    add t1, t2, t1
    lw t2, -40(fp)
    li t0, 60
    mul t0, t2, t0
    add t0, t1, t0
    lw t1, -44(fp)
    li t2, 12
    mul t2, t1, t2
    add t2, t0, t2
    lw t0, -48(fp)
    li t1, 2
    mul t1, t0, t1
    add t1, t2, t1
    lw t2, -52(fp)
    add t2, t1, t2
    lla t1, $arr1
    slli t2, t2, 2
    add t2, t1, t2
    lw t1, -28(fp)
    lw t0, -32(fp)
    add t0, t1, t0
    lw t1, -36(fp)
    add t1, t0, t1
    lw t0, -40(fp)
    add t0, t1, t0
    lw t1, -44(fp)
    add t1, t0, t1
    lw t0, -48(fp)
    add t0, t1, t0
    lw t1, -52(fp)
    add t1, t0, t1
    lw t0, -20(fp)
    add t0, t1, t0
    lw t1, -24(fp)
    add t1, t0, t1
    sw t1, 0(t2)
    lw t1, -52(fp)
    addi t1, t1, 1
    sw t1, -52(fp)
    j BB20
BB22: 
    lw t1, -48(fp)
    addi t1, t1, 1
    sw t1, -48(fp)
    j BB17
BB98: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
    .align 1
loop2: 
BB99: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    j BB23
BB23: 
    li t0, 0
    sw t0, -20(fp)
    j BB24
BB24: 
    lw t0, -20(fp)
    slti t0, t0, 10
    bnez t0, BB25
    j BB26
BB28: 
    li t0, 0
    sw t0, -28(fp)
    j BB30
BB29: 
    lw t0, -20(fp)
    addi t0, t0, 1
    sw t0, -20(fp)
    j BB24
BB30: 
    lw t0, -28(fp)
    slti t0, t0, 3
    bnez t0, BB31
    j BB32
BB31: 
    li t0, 0
    sw t0, -32(fp)
    j BB33
BB32: 
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB27
BB33: 
    lw t0, -32(fp)
    slti t0, t0, 2
    bnez t0, BB34
    j BB35
BB25: 
    li t0, 0
    sw t0, -24(fp)
    j BB27
BB39: 
    lw t0, -40(fp)
    slti t0, t0, 8
    bnez t0, BB40
    j BB41
BB36: 
    lw t0, -36(fp)
    slti t0, t0, 4
    bnez t0, BB37
    j BB38
BB26: 
    j BB100
BB35: 
    lw t0, -28(fp)
    addi t0, t0, 1
    sw t0, -28(fp)
    j BB30
BB38: 
    lw t0, -32(fp)
    addi t0, t0, 1
    sw t0, -32(fp)
    j BB33
BB37: 
    li t0, 0
    sw t0, -40(fp)
    j BB39
BB34: 
    li t0, 0
    sw t0, -36(fp)
    j BB36
BB44: 
    lw t0, -40(fp)
    addi t0, t0, 1
    sw t0, -40(fp)
    j BB39
BB40: 
    li t0, 0
    sw t0, -44(fp)
    j BB42
BB41: 
    lw t0, -36(fp)
    addi t0, t0, 1
    sw t0, -36(fp)
    j BB36
BB42: 
    lw t0, -44(fp)
    slti t0, t0, 7
    bnez t0, BB43
    j BB44
BB43: 
    lw t0, -20(fp)
    li t1, 2688
    mul t1, t0, t1
    lw t0, -24(fp)
    li t2, 1344
    mul t2, t0, t2
    add t2, t1, t2
    lw t1, -28(fp)
    li t0, 448
    mul t0, t1, t0
    add t0, t2, t0
    lw t2, -32(fp)
    li t1, 224
    mul t1, t2, t1
    add t1, t0, t1
    lw t0, -36(fp)
    li t2, 56
    mul t2, t0, t2
    add t2, t1, t2
    lw t1, -40(fp)
    li t0, 7
    mul t0, t1, t0
    add t0, t2, t0
    lw t2, -44(fp)
    add t2, t0, t2
    lla t0, $arr2
    slli t2, t2, 2
    add t2, t0, t2
    lw t0, -20(fp)
    lw t1, -24(fp)
    add t1, t0, t1
    lw t0, -32(fp)
    add t0, t1, t0
    lw t1, -44(fp)
    add t1, t0, t1
    sw t1, 0(t2)
    lw t1, -44(fp)
    addi t1, t1, 1
    sw t1, -44(fp)
    j BB42
BB27: 
    lw t0, -24(fp)
    slti t0, t0, 2
    bnez t0, BB28
    j BB29
BB100: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
    .align 1
loop3: 
BB101: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -96
    addi fp, sp, 96
    sw a0, -20(fp)
    sw a1, -24(fp)
    sw a2, -28(fp)
    sw a3, -32(fp)
    sw a4, -36(fp)
    sw a5, -40(fp)
    sw a6, -44(fp)
    j BB45
BB45: 
    li t0, 0
    sw t0, -76(fp)
    li t0, 0
    sw t0, -48(fp)
    j BB46
BB46: 
    lw t0, -48(fp)
    slti t0, t0, 10
    bnez t0, BB47
    j BB48
BB47: 
    li t0, 0
    sw t0, -52(fp)
    j BB49
BB48: 
    lw t0, -76(fp)
    mv a0, t0
    j BB102
BB49: 
    lw t0, -52(fp)
    slti t0, t0, 100
    bnez t0, BB50
    j BB51
BB50: 
    li t1, 0
    sw t1, -56(fp)
    j BB52
BB51: 
    lw t0, -48(fp)
    addi t0, t0, 1
    sw t0, -48(fp)
    j BB91
BB52: 
    lw t1, -56(fp)
    slti t1, t1, 1000
    bnez t1, BB53
    j BB54
BB53: 
    li t0, 0
    sw t0, -60(fp)
    j BB55
BB54: 
    lw t1, -52(fp)
    addi t1, t1, 1
    sw t1, -52(fp)
    j BB87
BB55: 
    lw t0, -60(fp)
    li t1, 10000
    slt t1, t0, t1
    bnez t1, BB56
    j BB57
BB56: 
    li t0, 0
    sw t0, -64(fp)
    j BB58
BB57: 
    lw t1, -56(fp)
    addi t1, t1, 1
    sw t1, -56(fp)
    j BB83
BB58: 
    lw t0, -64(fp)
    li t1, 100000
    slt t1, t0, t1
    bnez t1, BB59
    j BB60
BB59: 
    li t0, 0
    sw t0, -68(fp)
    j BB61
BB60: 
    lw t1, -60(fp)
    addi t1, t1, 1
    sw t1, -60(fp)
    j BB79
BB61: 
    lw t0, -68(fp)
    li t1, 1000000
    slt t1, t0, t1
    bnez t1, BB62
    j BB63
BB62: 
    li t0, 0
    sw t0, -72(fp)
    j BB64
BB63: 
    lw t1, -64(fp)
    addi t1, t1, 1
    sw t1, -64(fp)
    j BB75
BB64: 
    lw t0, -72(fp)
    li t1, 10000000
    slt t1, t0, t1
    bnez t1, BB65
    j BB66
BB65: 
    lw t0, -76(fp)
    li t1, 817
    rem t1, t0, t1
    lw t0, -48(fp)
    li t2, 1440
    mul t2, t0, t2
    lw t0, -52(fp)
    li t3, 720
    mul t3, t0, t3
    add t3, t2, t3
    lw t2, -56(fp)
    li t0, 240
    mul t0, t2, t0
    add t0, t3, t0
    lw t3, -60(fp)
    li t2, 60
    mul t2, t3, t2
    add t2, t0, t2
    lw t0, -64(fp)
    li t3, 12
    mul t3, t0, t3
    add t3, t2, t3
    lw t2, -68(fp)
    li t0, 2
    mul t0, t2, t0
    add t0, t3, t0
    lw t3, -72(fp)
    add t3, t0, t3
    lla t0, $arr1
    slli t3, t3, 2
    add t3, t0, t3
    lw t3, 0(t3)
    add t3, t1, t3
    lw t1, -48(fp)
    li t0, 2688
    mul t0, t1, t0
    lw t1, -52(fp)
    li t2, 1344
    mul t2, t1, t2
    add t2, t0, t2
    lw t0, -56(fp)
    li t1, 448
    mul t1, t0, t1
    add t1, t2, t1
    lw t2, -60(fp)
    li t0, 224
    mul t0, t2, t0
    add t0, t1, t0
    lw t1, -64(fp)
    li t2, 56
    mul t2, t1, t2
    add t2, t0, t2
    lw t0, -68(fp)
    li t1, 7
    mul t1, t0, t1
    add t1, t2, t1
    lw t2, -72(fp)
    add t2, t1, t2
    lla t1, $arr2
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t3, t2
    sw t2, -76(fp)
    lw t2, -72(fp)
    addi t2, t2, 1
    sw t2, -72(fp)
    j BB67
BB66: 
    lw t1, -68(fp)
    addi t1, t1, 1
    sw t1, -68(fp)
    j BB71
BB67: 
    lw t2, -72(fp)
    lw t3, -44(fp)
    slt t3, t3, t2
    xori t3, t3, 1
    bnez t3, BB68
    j BB69
BB68: 
    j BB66
BB69: 
    j BB64
BB70: 
BB71: 
    lw t1, -68(fp)
    lw t0, -40(fp)
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB72
    j BB73
BB72: 
    j BB63
BB73: 
    j BB61
BB74: 
BB75: 
    lw t1, -64(fp)
    lw t0, -36(fp)
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB76
    j BB77
BB76: 
    j BB60
BB77: 
    j BB58
BB78: 
BB79: 
    lw t1, -60(fp)
    lw t0, -32(fp)
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB80
    j BB81
BB80: 
    j BB57
BB81: 
    j BB55
BB82: 
BB83: 
    lw t1, -56(fp)
    lw t0, -28(fp)
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB84
    j BB85
BB84: 
    j BB54
BB85: 
    j BB52
BB86: 
BB87: 
    lw t1, -52(fp)
    lw t0, -24(fp)
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB88
    j BB89
BB88: 
    j BB51
BB89: 
    j BB49
BB90: 
BB91: 
    lw t0, -48(fp)
    lw t1, -20(fp)
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB92
    j BB93
BB92: 
    j BB48
BB93: 
    j BB46
BB94: 
BB102: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 96
    ret
    .align 1
main: 
BB103: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -80
    addi fp, sp, 80
    j BB95
BB95: 
    call getint
    mv t0, a0
    sw t0, -20(fp)
    call getint
    mv t0, a0
    sw t0, -24(fp)
    call getint
    mv t0, a0
    sw t0, -28(fp)
    call getint
    mv t0, a0
    sw t0, -32(fp)
    call getint
    mv t0, a0
    sw t0, -36(fp)
    call getint
    mv t0, a0
    sw t0, -40(fp)
    call getint
    mv t0, a0
    sw t0, -44(fp)
    call getint
    mv t0, a0
    sw t0, -48(fp)
    call getint
    mv t0, a0
    sw t0, -52(fp)
    lw t0, -20(fp)
    lw t1, -24(fp)
    mv a0, t0
    mv a1, t1
    call loop1
    call loop2
    lw t1, -28(fp)
    lw t0, -32(fp)
    lw t2, -36(fp)
    lw t3, -40(fp)
    lw t4, -44(fp)
    lw t5, -48(fp)
    lw t6, -52(fp)
    mv a0, t1
    mv a1, t0
    mv a2, t2
    mv a3, t3
    mv a4, t4
    mv a5, t5
    mv a6, t6
    call loop3
    mv t6, a0
    mv a0, t6
    j BB104
BB104: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 80
    ret
