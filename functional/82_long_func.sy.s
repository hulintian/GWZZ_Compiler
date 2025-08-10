    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $SHIFT_TABLE
$SHIFT_TABLE:
    .word 1
    .word 2
    .word 4
    .word 8
    .word 16
    .word 32
    .word 64
    .word 128
    .word 256
    .word 512
    .word 1024
    .word 2048
    .word 4096
    .word 8192
    .word 16384
    .word 32768
    .align 3
    .globl main
    .text

    .align 1
long_func: 
BB904: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -400
    addi fp, sp, 400
    j BB0
BB0: 
    li t0, 2
    sw t0, -40(fp)
    li t0, 0
    sw t0, -44(fp)
    li t0, 1
    sw t0, -48(fp)
    j BB1
BB1: 
    lw t0, -44(fp)
    sgtz t0, t0
    bnez t0, BB2
    j BB3
BB2: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -44(fp)
    sw t0, -28(fp)
    li t0, 1
    sw t0, -32(fp)
    j BB4
BB3: 
    lw t0, -48(fp)
    sw t0, -20(fp)
    lw t0, -20(fp)
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    li t0, 2
    sw t0, -124(fp)
    li t0, 1
    sw t0, -128(fp)
    li t0, 1
    sw t0, -132(fp)
    j BB224
BB4: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB5
    j BB6
BB5: 
    j BB7
BB6: 
    j BB11
BB7: 
    lw t1, -28(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB10
    j BB9
BB8: 
    lw t1, -20(fp)
    lw t2, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 1
    mul t0, t0, t2
    add t0, t1, t0
    sw t0, -20(fp)
    j BB9
BB9: 
    lw t1, -28(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB4
BB10: 
    lw t2, -32(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB8
    j BB9
BB11: 
    lw t0, -20(fp)
    seqz t0, t0
    bnez t0, BB12
    j BB13
BB12: 
    lw t1, -48(fp)
    sw t1, -52(fp)
    lw t1, -40(fp)
    sw t1, -56(fp)
    li t1, 0
    sw t1, -60(fp)
    j BB14
BB13: 
    lw t0, -40(fp)
    sw t0, -88(fp)
    lw t0, -40(fp)
    sw t0, -92(fp)
    li t0, 0
    sw t0, -96(fp)
    j BB111
BB14: 
    lw t1, -56(fp)
    seqz t1, t1
    bnez t1, BB15
    j BB16
BB15: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -56(fp)
    sw t1, -28(fp)
    li t1, 1
    sw t1, -32(fp)
    j BB17
BB16: 
    lw t1, -60(fp)
    sw t1, -20(fp)
    lw t1, -20(fp)
    sw t1, -48(fp)
    j BB13
BB17: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB18
    j BB19
BB18: 
    j BB20
BB19: 
    j BB24
BB20: 
    lw t2, -28(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB23
    j BB22
BB21: 
    lw t2, -20(fp)
    lw t0, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 1
    mul t1, t1, t0
    add t1, t2, t1
    sw t1, -20(fp)
    j BB22
BB22: 
    lw t2, -28(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB17
BB23: 
    lw t0, -32(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB21
    j BB22
BB24: 
    lw t1, -20(fp)
    seqz t1, t1
    bnez t1, BB25
    j BB26
BB25: 
    lw t1, -60(fp)
    sw t1, -64(fp)
    lw t1, -52(fp)
    sw t1, -68(fp)
    j BB27
BB26: 
    lw t1, -52(fp)
    sw t1, -76(fp)
    lw t1, -52(fp)
    sw t1, -80(fp)
    j BB61
BB27: 
    lw t1, -68(fp)
    seqz t1, t1
    bnez t1, BB28
    j BB29
BB28: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -64(fp)
    sw t1, -28(fp)
    lw t1, -68(fp)
    sw t1, -32(fp)
    j BB30
BB29: 
    lw t1, -64(fp)
    sw t1, -20(fp)
    lw t1, -20(fp)
    sw t1, -60(fp)
    j BB26
BB30: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB31
    j BB32
BB31: 
    j BB33
BB32: 
    lw t1, -20(fp)
    sw t1, -72(fp)
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -64(fp)
    sw t1, -28(fp)
    lw t1, -68(fp)
    sw t1, -32(fp)
    j BB43
BB33: 
    lw t0, -28(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB34
    j BB36
BB34: 
    j BB37
BB35: 
    lw t0, -28(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB30
BB36: 
    j BB40
BB37: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB38
    j BB39
BB38: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB39
BB39: 
    j BB35
BB40: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB41
    j BB42
BB41: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB42
BB42: 
    j BB35
BB43: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB44
    j BB45
BB44: 
    j BB46
BB45: 
    lw t1, -20(fp)
    sw t1, -68(fp)
    j BB50
BB46: 
    lw t2, -28(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB49
    j BB48
BB47: 
    lw t2, -20(fp)
    lw t1, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 1
    mul t0, t0, t1
    add t0, t2, t0
    sw t0, -20(fp)
    j BB48
BB48: 
    lw t2, -28(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB43
BB49: 
    lw t1, -32(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB47
    j BB48
BB50: 
    li t1, 1
    li t0, 15
    slt t0, t0, t1
    bnez t0, BB51
    j BB53
BB51: 
    li t2, 0
    sw t2, -20(fp)
    j BB52
BB52: 
    lw t1, -20(fp)
    sw t1, -68(fp)
    lw t1, -72(fp)
    sw t1, -64(fp)
    j BB27
BB53: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -68(fp)
    lla t1, $SHIFT_TABLE
    addi t1, fp, 4
    lw t1, 0(t1)
    mul t1, t0, t1
    sw t1, -28(fp)
    li t1, 65535
    sw t1, -32(fp)
    j BB54
BB54: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB55
    j BB56
BB55: 
    j BB57
BB56: 
    j BB52
BB57: 
    lw t1, -28(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB60
    j BB59
BB58: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 1
    mul t2, t2, t0
    add t2, t1, t2
    sw t2, -20(fp)
    j BB59
BB59: 
    lw t1, -28(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB54
BB60: 
    lw t0, -32(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB58
    j BB59
BB61: 
    lw t1, -80(fp)
    seqz t1, t1
    bnez t1, BB62
    j BB63
BB62: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -76(fp)
    sw t2, -28(fp)
    lw t2, -80(fp)
    sw t2, -32(fp)
    j BB64
BB63: 
    lw t1, -76(fp)
    sw t1, -20(fp)
    lw t1, -20(fp)
    sw t1, -52(fp)
    lw t1, -56(fp)
    sw t1, -28(fp)
    li t1, 1
    sw t1, -32(fp)
    j BB95
BB64: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB65
    j BB66
BB65: 
    j BB67
BB66: 
    lw t2, -20(fp)
    sw t2, -84(fp)
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -76(fp)
    sw t2, -28(fp)
    lw t2, -80(fp)
    sw t2, -32(fp)
    j BB77
BB67: 
    lw t0, -28(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB68
    j BB70
BB68: 
    j BB71
BB69: 
    lw t0, -28(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB64
BB70: 
    j BB74
BB71: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB72
    j BB73
BB72: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB73
BB73: 
    j BB69
BB74: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB75
    j BB76
BB75: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB76
BB76: 
    j BB69
BB77: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB78
    j BB79
BB78: 
    j BB80
BB79: 
    lw t2, -20(fp)
    sw t2, -80(fp)
    j BB84
BB80: 
    lw t1, -28(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB83
    j BB82
BB81: 
    lw t1, -20(fp)
    lw t2, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 1
    mul t0, t0, t2
    add t0, t1, t0
    sw t0, -20(fp)
    j BB82
BB82: 
    lw t1, -28(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB77
BB83: 
    lw t2, -32(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB81
    j BB82
BB84: 
    li t2, 1
    li t0, 15
    slt t0, t0, t2
    bnez t0, BB85
    j BB87
BB85: 
    li t1, 0
    sw t1, -20(fp)
    j BB86
BB86: 
    lw t2, -20(fp)
    sw t2, -80(fp)
    lw t2, -84(fp)
    sw t2, -76(fp)
    j BB61
BB87: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -80(fp)
    lla t2, $SHIFT_TABLE
    addi t2, fp, 4
    lw t2, 0(t2)
    mul t2, t0, t2
    sw t2, -28(fp)
    li t2, 65535
    sw t2, -32(fp)
    j BB88
BB88: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB89
    j BB90
BB89: 
    j BB91
BB90: 
    j BB86
BB91: 
    lw t2, -28(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB94
    j BB93
BB92: 
    lw t2, -20(fp)
    lw t0, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 1
    mul t1, t1, t0
    add t1, t2, t1
    sw t1, -20(fp)
    j BB93
BB93: 
    lw t2, -28(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB88
BB94: 
    lw t0, -32(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB92
    j BB93
BB95: 
    lw t1, -32(fp)
    slti t0, t1, 15
    snez t0, t1
    bnez t0, BB96
    j BB98
BB96: 
    j BB99
BB97: 
    lw t0, -20(fp)
    sw t0, -56(fp)
    j BB14
BB98: 
    j BB103
BB99: 
    lw t2, -28(fp)
    sltz t2, t2
    bnez t2, BB100
    j BB102
BB100: 
    li t2, 65535
    sw t2, -20(fp)
    j BB101
BB101: 
    j BB97
BB102: 
    li t2, 0
    sw t2, -20(fp)
    j BB101
BB103: 
    lw t0, -32(fp)
    sgtz t0, t0
    bnez t0, BB104
    j BB106
BB104: 
    j BB107
BB105: 
    j BB97
BB106: 
    lw t0, -28(fp)
    sw t0, -20(fp)
    j BB105
BB107: 
    lw t0, -28(fp)
    li t1, 32767
    slt t1, t1, t0
    bnez t1, BB108
    j BB110
BB108: 
    lw t0, -28(fp)
    lw t1, -32(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -28(fp)
    li t0, 65536
    add t0, t1, t0
    lw t1, -32(fp)
    li t2, 15
    sub t2, t2, t1
    addi t2, t2, 1
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    sub t2, t0, t2
    sw t2, -20(fp)
    j BB109
BB109: 
    j BB105
BB110: 
    lw t1, -28(fp)
    lw t0, -32(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    div t0, t1, t0
    sw t0, -20(fp)
    j BB109
BB111: 
    lw t0, -92(fp)
    seqz t0, t0
    bnez t0, BB112
    j BB113
BB112: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -92(fp)
    sw t1, -28(fp)
    li t1, 1
    sw t1, -32(fp)
    j BB114
BB113: 
    lw t0, -96(fp)
    sw t0, -20(fp)
    lw t0, -20(fp)
    sw t0, -40(fp)
    lw t0, -44(fp)
    sw t0, -28(fp)
    li t0, 1
    sw t0, -32(fp)
    j BB208
BB114: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB115
    j BB116
BB115: 
    j BB117
BB116: 
    j BB121
BB117: 
    lw t0, -28(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB120
    j BB119
BB118: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB119
BB119: 
    lw t0, -28(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB114
BB120: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB118
    j BB119
BB121: 
    lw t1, -20(fp)
    seqz t1, t1
    bnez t1, BB122
    j BB123
BB122: 
    lw t1, -96(fp)
    sw t1, -100(fp)
    lw t1, -88(fp)
    sw t1, -104(fp)
    j BB124
BB123: 
    lw t1, -88(fp)
    sw t1, -112(fp)
    lw t1, -88(fp)
    sw t1, -116(fp)
    j BB158
BB124: 
    lw t1, -104(fp)
    seqz t1, t1
    bnez t1, BB125
    j BB126
BB125: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -100(fp)
    sw t1, -28(fp)
    lw t1, -104(fp)
    sw t1, -32(fp)
    j BB127
BB126: 
    lw t1, -100(fp)
    sw t1, -20(fp)
    lw t1, -20(fp)
    sw t1, -96(fp)
    j BB123
BB127: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB128
    j BB129
BB128: 
    j BB130
BB129: 
    lw t1, -20(fp)
    sw t1, -108(fp)
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -100(fp)
    sw t1, -28(fp)
    lw t1, -104(fp)
    sw t1, -32(fp)
    j BB140
BB130: 
    lw t2, -28(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB131
    j BB133
BB131: 
    j BB134
BB132: 
    lw t2, -28(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB127
BB133: 
    j BB137
BB134: 
    lw t1, -32(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB135
    j BB136
BB135: 
    lw t2, -20(fp)
    lw t1, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 1
    mul t0, t0, t1
    add t0, t2, t0
    sw t0, -20(fp)
    j BB136
BB136: 
    j BB132
BB137: 
    lw t0, -32(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB138
    j BB139
BB138: 
    lw t2, -20(fp)
    lw t0, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 1
    mul t1, t1, t0
    add t1, t2, t1
    sw t1, -20(fp)
    j BB139
BB139: 
    j BB132
BB140: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB141
    j BB142
BB141: 
    j BB143
BB142: 
    lw t1, -20(fp)
    sw t1, -104(fp)
    j BB147
BB143: 
    lw t0, -28(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB146
    j BB145
BB144: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB145
BB145: 
    lw t0, -28(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB140
BB146: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB144
    j BB145
BB147: 
    li t1, 1
    li t2, 15
    slt t2, t2, t1
    bnez t2, BB148
    j BB150
BB148: 
    li t0, 0
    sw t0, -20(fp)
    j BB149
BB149: 
    lw t1, -20(fp)
    sw t1, -104(fp)
    lw t1, -108(fp)
    sw t1, -100(fp)
    j BB124
BB150: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -104(fp)
    lla t1, $SHIFT_TABLE
    addi t1, fp, 4
    lw t1, 0(t1)
    mul t1, t2, t1
    sw t1, -28(fp)
    li t1, 65535
    sw t1, -32(fp)
    j BB151
BB151: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB152
    j BB153
BB152: 
    j BB154
BB153: 
    j BB149
BB154: 
    lw t1, -28(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB157
    j BB156
BB155: 
    lw t1, -20(fp)
    lw t2, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 1
    mul t0, t0, t2
    add t0, t1, t0
    sw t0, -20(fp)
    j BB156
BB156: 
    lw t1, -28(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB151
BB157: 
    lw t2, -32(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB155
    j BB156
BB158: 
    lw t1, -116(fp)
    seqz t1, t1
    bnez t1, BB159
    j BB160
BB159: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -112(fp)
    sw t0, -28(fp)
    lw t0, -116(fp)
    sw t0, -32(fp)
    j BB161
BB160: 
    lw t1, -112(fp)
    sw t1, -20(fp)
    lw t1, -20(fp)
    sw t1, -88(fp)
    lw t1, -92(fp)
    sw t1, -28(fp)
    li t1, 1
    sw t1, -32(fp)
    j BB192
BB161: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB162
    j BB163
BB162: 
    j BB164
BB163: 
    lw t0, -20(fp)
    sw t0, -120(fp)
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -112(fp)
    sw t0, -28(fp)
    lw t0, -116(fp)
    sw t0, -32(fp)
    j BB174
BB164: 
    lw t2, -28(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB165
    j BB167
BB165: 
    j BB168
BB166: 
    lw t2, -28(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB161
BB167: 
    j BB171
BB168: 
    lw t0, -32(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB169
    j BB170
BB169: 
    lw t2, -20(fp)
    lw t0, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 1
    mul t1, t1, t0
    add t1, t2, t1
    sw t1, -20(fp)
    j BB170
BB170: 
    j BB166
BB171: 
    lw t1, -32(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB172
    j BB173
BB172: 
    lw t2, -20(fp)
    lw t1, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 1
    mul t0, t0, t1
    add t0, t2, t0
    sw t0, -20(fp)
    j BB173
BB173: 
    j BB166
BB174: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB175
    j BB176
BB175: 
    j BB177
BB176: 
    lw t0, -20(fp)
    sw t0, -116(fp)
    j BB181
BB177: 
    lw t1, -28(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB180
    j BB179
BB178: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 1
    mul t2, t2, t0
    add t2, t1, t2
    sw t2, -20(fp)
    j BB179
BB179: 
    lw t1, -28(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB174
BB180: 
    lw t0, -32(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB178
    j BB179
BB181: 
    li t0, 1
    li t2, 15
    slt t2, t2, t0
    bnez t2, BB182
    j BB184
BB182: 
    li t1, 0
    sw t1, -20(fp)
    j BB183
BB183: 
    lw t0, -20(fp)
    sw t0, -116(fp)
    lw t0, -120(fp)
    sw t0, -112(fp)
    j BB158
BB184: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -116(fp)
    lla t0, $SHIFT_TABLE
    addi t0, fp, 4
    lw t0, 0(t0)
    mul t0, t2, t0
    sw t0, -28(fp)
    li t0, 65535
    sw t0, -32(fp)
    j BB185
BB185: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB186
    j BB187
BB186: 
    j BB188
BB187: 
    j BB183
BB188: 
    lw t0, -28(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB191
    j BB190
BB189: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB190
BB190: 
    lw t0, -28(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB185
BB191: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB189
    j BB190
BB192: 
    lw t1, -32(fp)
    slti t2, t1, 15
    snez t2, t1
    bnez t2, BB193
    j BB195
BB193: 
    j BB196
BB194: 
    lw t2, -20(fp)
    sw t2, -92(fp)
    j BB111
BB195: 
    j BB200
BB196: 
    lw t0, -28(fp)
    sltz t0, t0
    bnez t0, BB197
    j BB199
BB197: 
    li t0, 65535
    sw t0, -20(fp)
    j BB198
BB198: 
    j BB194
BB199: 
    li t0, 0
    sw t0, -20(fp)
    j BB198
BB200: 
    lw t2, -32(fp)
    sgtz t2, t2
    bnez t2, BB201
    j BB203
BB201: 
    j BB204
BB202: 
    j BB194
BB203: 
    lw t2, -28(fp)
    sw t2, -20(fp)
    j BB202
BB204: 
    lw t2, -28(fp)
    li t1, 32767
    slt t1, t1, t2
    bnez t1, BB205
    j BB207
BB205: 
    lw t2, -28(fp)
    lw t1, -32(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    div t1, t2, t1
    sw t1, -28(fp)
    lw t1, -28(fp)
    li t2, 65536
    add t2, t1, t2
    lw t1, -32(fp)
    li t0, 15
    sub t0, t0, t1
    addi t0, t0, 1
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    sub t0, t2, t0
    sw t0, -20(fp)
    j BB206
BB206: 
    j BB202
BB207: 
    lw t1, -28(fp)
    lw t2, -32(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    div t2, t1, t2
    sw t2, -20(fp)
    j BB206
BB208: 
    lw t0, -32(fp)
    slti t2, t0, 15
    snez t2, t0
    bnez t2, BB209
    j BB211
BB209: 
    j BB212
BB210: 
    lw t2, -20(fp)
    sw t2, -44(fp)
    j BB1
BB211: 
    j BB216
BB212: 
    lw t1, -28(fp)
    sltz t1, t1
    bnez t1, BB213
    j BB215
BB213: 
    li t1, 65535
    sw t1, -20(fp)
    j BB214
BB214: 
    j BB210
BB215: 
    li t1, 0
    sw t1, -20(fp)
    j BB214
BB216: 
    lw t2, -32(fp)
    sgtz t2, t2
    bnez t2, BB217
    j BB219
BB217: 
    j BB220
BB218: 
    j BB210
BB219: 
    lw t2, -28(fp)
    sw t2, -20(fp)
    j BB218
BB220: 
    lw t2, -28(fp)
    li t0, 32767
    slt t0, t0, t2
    bnez t0, BB221
    j BB223
BB221: 
    lw t2, -28(fp)
    lw t0, -32(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    div t0, t2, t0
    sw t0, -28(fp)
    lw t0, -28(fp)
    li t2, 65536
    add t2, t0, t2
    lw t0, -32(fp)
    li t1, 15
    sub t1, t1, t0
    addi t1, t1, 1
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    sub t1, t2, t1
    sw t1, -20(fp)
    j BB222
BB222: 
    j BB218
BB223: 
    lw t0, -28(fp)
    lw t2, -32(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    div t2, t0, t2
    sw t2, -20(fp)
    j BB222
BB224: 
    lw t0, -128(fp)
    sgtz t0, t0
    bnez t0, BB225
    j BB226
BB225: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -128(fp)
    sw t0, -28(fp)
    li t0, 1
    sw t0, -32(fp)
    j BB227
BB226: 
    lw t0, -132(fp)
    sw t0, -20(fp)
    lw t0, -20(fp)
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    li t0, 2
    sw t0, -36(fp)
    j BB447
BB227: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB228
    j BB229
BB228: 
    j BB230
BB229: 
    j BB234
BB230: 
    lw t2, -28(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB233
    j BB232
BB231: 
    lw t2, -20(fp)
    lw t1, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 1
    mul t0, t0, t1
    add t0, t2, t0
    sw t0, -20(fp)
    j BB232
BB232: 
    lw t2, -28(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB227
BB233: 
    lw t1, -32(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB231
    j BB232
BB234: 
    lw t0, -20(fp)
    seqz t0, t0
    bnez t0, BB235
    j BB236
BB235: 
    lw t2, -132(fp)
    sw t2, -136(fp)
    lw t2, -124(fp)
    sw t2, -140(fp)
    li t2, 0
    sw t2, -144(fp)
    j BB237
BB236: 
    lw t0, -124(fp)
    sw t0, -172(fp)
    lw t0, -124(fp)
    sw t0, -176(fp)
    li t0, 0
    sw t0, -180(fp)
    j BB334
BB237: 
    lw t2, -140(fp)
    seqz t2, t2
    bnez t2, BB238
    j BB239
BB238: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -140(fp)
    sw t2, -28(fp)
    li t2, 1
    sw t2, -32(fp)
    j BB240
BB239: 
    lw t2, -144(fp)
    sw t2, -20(fp)
    lw t2, -20(fp)
    sw t2, -132(fp)
    j BB236
BB240: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB241
    j BB242
BB241: 
    j BB243
BB242: 
    j BB247
BB243: 
    lw t1, -28(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB246
    j BB245
BB244: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 1
    mul t2, t2, t0
    add t2, t1, t2
    sw t2, -20(fp)
    j BB245
BB245: 
    lw t1, -28(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB240
BB246: 
    lw t0, -32(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB244
    j BB245
BB247: 
    lw t2, -20(fp)
    seqz t2, t2
    bnez t2, BB248
    j BB249
BB248: 
    lw t2, -144(fp)
    sw t2, -148(fp)
    lw t2, -136(fp)
    sw t2, -152(fp)
    j BB250
BB249: 
    lw t2, -136(fp)
    sw t2, -160(fp)
    lw t2, -136(fp)
    sw t2, -164(fp)
    j BB284
BB250: 
    lw t2, -152(fp)
    seqz t2, t2
    bnez t2, BB251
    j BB252
BB251: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -148(fp)
    sw t2, -28(fp)
    lw t2, -152(fp)
    sw t2, -32(fp)
    j BB253
BB252: 
    lw t2, -148(fp)
    sw t2, -20(fp)
    lw t2, -20(fp)
    sw t2, -144(fp)
    j BB249
BB253: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB254
    j BB255
BB254: 
    j BB256
BB255: 
    lw t2, -20(fp)
    sw t2, -156(fp)
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -148(fp)
    sw t2, -28(fp)
    lw t2, -152(fp)
    sw t2, -32(fp)
    j BB266
BB256: 
    lw t0, -28(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB257
    j BB259
BB257: 
    j BB260
BB258: 
    lw t0, -28(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB253
BB259: 
    j BB263
BB260: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB261
    j BB262
BB261: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB262
BB262: 
    j BB258
BB263: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB264
    j BB265
BB264: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB265
BB265: 
    j BB258
BB266: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB267
    j BB268
BB267: 
    j BB269
BB268: 
    lw t2, -20(fp)
    sw t2, -152(fp)
    j BB273
BB269: 
    lw t1, -28(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB272
    j BB271
BB270: 
    lw t1, -20(fp)
    lw t2, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 1
    mul t0, t0, t2
    add t0, t1, t0
    sw t0, -20(fp)
    j BB271
BB271: 
    lw t1, -28(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB266
BB272: 
    lw t2, -32(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB270
    j BB271
BB273: 
    li t2, 1
    li t0, 15
    slt t0, t0, t2
    bnez t0, BB274
    j BB276
BB274: 
    li t1, 0
    sw t1, -20(fp)
    j BB275
BB275: 
    lw t2, -20(fp)
    sw t2, -152(fp)
    lw t2, -156(fp)
    sw t2, -148(fp)
    j BB250
BB276: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -152(fp)
    lla t2, $SHIFT_TABLE
    addi t2, fp, 4
    lw t2, 0(t2)
    mul t2, t0, t2
    sw t2, -28(fp)
    li t2, 65535
    sw t2, -32(fp)
    j BB277
BB277: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB278
    j BB279
BB278: 
    j BB280
BB279: 
    j BB275
BB280: 
    lw t2, -28(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB283
    j BB282
BB281: 
    lw t2, -20(fp)
    lw t0, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 1
    mul t1, t1, t0
    add t1, t2, t1
    sw t1, -20(fp)
    j BB282
BB282: 
    lw t2, -28(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB277
BB283: 
    lw t0, -32(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB281
    j BB282
BB284: 
    lw t2, -164(fp)
    seqz t2, t2
    bnez t2, BB285
    j BB286
BB285: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -160(fp)
    sw t1, -28(fp)
    lw t1, -164(fp)
    sw t1, -32(fp)
    j BB287
BB286: 
    lw t2, -160(fp)
    sw t2, -20(fp)
    lw t2, -20(fp)
    sw t2, -136(fp)
    lw t2, -140(fp)
    sw t2, -28(fp)
    li t2, 1
    sw t2, -32(fp)
    j BB318
BB287: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB288
    j BB289
BB288: 
    j BB290
BB289: 
    lw t1, -20(fp)
    sw t1, -168(fp)
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -160(fp)
    sw t1, -28(fp)
    lw t1, -164(fp)
    sw t1, -32(fp)
    j BB300
BB290: 
    lw t0, -28(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB291
    j BB293
BB291: 
    j BB294
BB292: 
    lw t0, -28(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB287
BB293: 
    j BB297
BB294: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB295
    j BB296
BB295: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB296
BB296: 
    j BB292
BB297: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB298
    j BB299
BB298: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB299
BB299: 
    j BB292
BB300: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB301
    j BB302
BB301: 
    j BB303
BB302: 
    lw t1, -20(fp)
    sw t1, -164(fp)
    j BB307
BB303: 
    lw t2, -28(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB306
    j BB305
BB304: 
    lw t2, -20(fp)
    lw t1, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 1
    mul t0, t0, t1
    add t0, t2, t0
    sw t0, -20(fp)
    j BB305
BB305: 
    lw t2, -28(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB300
BB306: 
    lw t1, -32(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB304
    j BB305
BB307: 
    li t1, 1
    li t0, 15
    slt t0, t0, t1
    bnez t0, BB308
    j BB310
BB308: 
    li t2, 0
    sw t2, -20(fp)
    j BB309
BB309: 
    lw t1, -20(fp)
    sw t1, -164(fp)
    lw t1, -168(fp)
    sw t1, -160(fp)
    j BB284
BB310: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -164(fp)
    lla t1, $SHIFT_TABLE
    addi t1, fp, 4
    lw t1, 0(t1)
    mul t1, t0, t1
    sw t1, -28(fp)
    li t1, 65535
    sw t1, -32(fp)
    j BB311
BB311: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB312
    j BB313
BB312: 
    j BB314
BB313: 
    j BB309
BB314: 
    lw t1, -28(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB317
    j BB316
BB315: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 1
    mul t2, t2, t0
    add t2, t1, t2
    sw t2, -20(fp)
    j BB316
BB316: 
    lw t1, -28(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB311
BB317: 
    lw t0, -32(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB315
    j BB316
BB318: 
    lw t2, -32(fp)
    slti t0, t2, 15
    snez t0, t2
    bnez t0, BB319
    j BB321
BB319: 
    j BB322
BB320: 
    lw t0, -20(fp)
    sw t0, -140(fp)
    j BB237
BB321: 
    j BB326
BB322: 
    lw t1, -28(fp)
    sltz t1, t1
    bnez t1, BB323
    j BB325
BB323: 
    li t1, 65535
    sw t1, -20(fp)
    j BB324
BB324: 
    j BB320
BB325: 
    li t1, 0
    sw t1, -20(fp)
    j BB324
BB326: 
    lw t0, -32(fp)
    sgtz t0, t0
    bnez t0, BB327
    j BB329
BB327: 
    j BB330
BB328: 
    j BB320
BB329: 
    lw t0, -28(fp)
    sw t0, -20(fp)
    j BB328
BB330: 
    lw t0, -28(fp)
    li t2, 32767
    slt t2, t2, t0
    bnez t2, BB331
    j BB333
BB331: 
    lw t0, -28(fp)
    lw t2, -32(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    div t2, t0, t2
    sw t2, -28(fp)
    lw t2, -28(fp)
    li t0, 65536
    add t0, t2, t0
    lw t2, -32(fp)
    li t1, 15
    sub t1, t1, t2
    addi t1, t1, 1
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    sub t1, t0, t1
    sw t1, -20(fp)
    j BB332
BB332: 
    j BB328
BB333: 
    lw t2, -28(fp)
    lw t0, -32(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    div t0, t2, t0
    sw t0, -20(fp)
    j BB332
BB334: 
    lw t0, -176(fp)
    seqz t0, t0
    bnez t0, BB335
    j BB336
BB335: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -176(fp)
    sw t2, -28(fp)
    li t2, 1
    sw t2, -32(fp)
    j BB337
BB336: 
    lw t0, -180(fp)
    sw t0, -20(fp)
    lw t0, -20(fp)
    sw t0, -124(fp)
    lw t0, -128(fp)
    sw t0, -28(fp)
    li t0, 1
    sw t0, -32(fp)
    j BB431
BB337: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB338
    j BB339
BB338: 
    j BB340
BB339: 
    j BB344
BB340: 
    lw t0, -28(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB343
    j BB342
BB341: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB342
BB342: 
    lw t0, -28(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB337
BB343: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB341
    j BB342
BB344: 
    lw t2, -20(fp)
    seqz t2, t2
    bnez t2, BB345
    j BB346
BB345: 
    lw t2, -180(fp)
    sw t2, -184(fp)
    lw t2, -172(fp)
    sw t2, -188(fp)
    j BB347
BB346: 
    lw t2, -172(fp)
    sw t2, -196(fp)
    lw t2, -172(fp)
    sw t2, -200(fp)
    j BB381
BB347: 
    lw t2, -188(fp)
    seqz t2, t2
    bnez t2, BB348
    j BB349
BB348: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -184(fp)
    sw t2, -28(fp)
    lw t2, -188(fp)
    sw t2, -32(fp)
    j BB350
BB349: 
    lw t2, -184(fp)
    sw t2, -20(fp)
    lw t2, -20(fp)
    sw t2, -180(fp)
    j BB346
BB350: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB351
    j BB352
BB351: 
    j BB353
BB352: 
    lw t2, -20(fp)
    sw t2, -192(fp)
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -184(fp)
    sw t2, -28(fp)
    lw t2, -188(fp)
    sw t2, -32(fp)
    j BB363
BB353: 
    lw t1, -28(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB354
    j BB356
BB354: 
    j BB357
BB355: 
    lw t1, -28(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB350
BB356: 
    j BB360
BB357: 
    lw t2, -32(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB358
    j BB359
BB358: 
    lw t1, -20(fp)
    lw t2, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 1
    mul t0, t0, t2
    add t0, t1, t0
    sw t0, -20(fp)
    j BB359
BB359: 
    j BB355
BB360: 
    lw t0, -32(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB361
    j BB362
BB361: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 1
    mul t2, t2, t0
    add t2, t1, t2
    sw t2, -20(fp)
    j BB362
BB362: 
    j BB355
BB363: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB364
    j BB365
BB364: 
    j BB366
BB365: 
    lw t2, -20(fp)
    sw t2, -188(fp)
    j BB370
BB366: 
    lw t0, -28(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB369
    j BB368
BB367: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB368
BB368: 
    lw t0, -28(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB363
BB369: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB367
    j BB368
BB370: 
    li t2, 1
    li t1, 15
    slt t1, t1, t2
    bnez t1, BB371
    j BB373
BB371: 
    li t0, 0
    sw t0, -20(fp)
    j BB372
BB372: 
    lw t2, -20(fp)
    sw t2, -188(fp)
    lw t2, -192(fp)
    sw t2, -184(fp)
    j BB347
BB373: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -188(fp)
    lla t2, $SHIFT_TABLE
    addi t2, fp, 4
    lw t2, 0(t2)
    mul t2, t1, t2
    sw t2, -28(fp)
    li t2, 65535
    sw t2, -32(fp)
    j BB374
BB374: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB375
    j BB376
BB375: 
    j BB377
BB376: 
    j BB372
BB377: 
    lw t2, -28(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB380
    j BB379
BB378: 
    lw t2, -20(fp)
    lw t1, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 1
    mul t0, t0, t1
    add t0, t2, t0
    sw t0, -20(fp)
    j BB379
BB379: 
    lw t2, -28(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB374
BB380: 
    lw t1, -32(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB378
    j BB379
BB381: 
    lw t2, -200(fp)
    seqz t2, t2
    bnez t2, BB382
    j BB383
BB382: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -196(fp)
    sw t0, -28(fp)
    lw t0, -200(fp)
    sw t0, -32(fp)
    j BB384
BB383: 
    lw t2, -196(fp)
    sw t2, -20(fp)
    lw t2, -20(fp)
    sw t2, -172(fp)
    lw t2, -176(fp)
    sw t2, -28(fp)
    li t2, 1
    sw t2, -32(fp)
    j BB415
BB384: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB385
    j BB386
BB385: 
    j BB387
BB386: 
    lw t0, -20(fp)
    sw t0, -204(fp)
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -196(fp)
    sw t0, -28(fp)
    lw t0, -200(fp)
    sw t0, -32(fp)
    j BB397
BB387: 
    lw t1, -28(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB388
    j BB390
BB388: 
    j BB391
BB389: 
    lw t1, -28(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB384
BB390: 
    j BB394
BB391: 
    lw t0, -32(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB392
    j BB393
BB392: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 1
    mul t2, t2, t0
    add t2, t1, t2
    sw t2, -20(fp)
    j BB393
BB393: 
    j BB389
BB394: 
    lw t2, -32(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB395
    j BB396
BB395: 
    lw t1, -20(fp)
    lw t2, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 1
    mul t0, t0, t2
    add t0, t1, t0
    sw t0, -20(fp)
    j BB396
BB396: 
    j BB389
BB397: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB398
    j BB399
BB398: 
    j BB400
BB399: 
    lw t0, -20(fp)
    sw t0, -200(fp)
    j BB404
BB400: 
    lw t2, -28(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB403
    j BB402
BB401: 
    lw t2, -20(fp)
    lw t0, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 1
    mul t1, t1, t0
    add t1, t2, t1
    sw t1, -20(fp)
    j BB402
BB402: 
    lw t2, -28(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB397
BB403: 
    lw t0, -32(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB401
    j BB402
BB404: 
    li t0, 1
    li t1, 15
    slt t1, t1, t0
    bnez t1, BB405
    j BB407
BB405: 
    li t2, 0
    sw t2, -20(fp)
    j BB406
BB406: 
    lw t0, -20(fp)
    sw t0, -200(fp)
    lw t0, -204(fp)
    sw t0, -196(fp)
    j BB381
BB407: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -200(fp)
    lla t0, $SHIFT_TABLE
    addi t0, fp, 4
    lw t0, 0(t0)
    mul t0, t1, t0
    sw t0, -28(fp)
    li t0, 65535
    sw t0, -32(fp)
    j BB408
BB408: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB409
    j BB410
BB409: 
    j BB411
BB410: 
    j BB406
BB411: 
    lw t0, -28(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB414
    j BB413
BB412: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB413
BB413: 
    lw t0, -28(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB408
BB414: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB412
    j BB413
BB415: 
    lw t2, -32(fp)
    slti t1, t2, 15
    snez t1, t2
    bnez t1, BB416
    j BB418
BB416: 
    j BB419
BB417: 
    lw t1, -20(fp)
    sw t1, -176(fp)
    j BB334
BB418: 
    j BB423
BB419: 
    lw t0, -28(fp)
    sltz t0, t0
    bnez t0, BB420
    j BB422
BB420: 
    li t0, 65535
    sw t0, -20(fp)
    j BB421
BB421: 
    j BB417
BB422: 
    li t0, 0
    sw t0, -20(fp)
    j BB421
BB423: 
    lw t1, -32(fp)
    sgtz t1, t1
    bnez t1, BB424
    j BB426
BB424: 
    j BB427
BB425: 
    j BB417
BB426: 
    lw t1, -28(fp)
    sw t1, -20(fp)
    j BB425
BB427: 
    lw t1, -28(fp)
    li t2, 32767
    slt t2, t2, t1
    bnez t2, BB428
    j BB430
BB428: 
    lw t1, -28(fp)
    lw t2, -32(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    div t2, t1, t2
    sw t2, -28(fp)
    lw t2, -28(fp)
    li t1, 65536
    add t1, t2, t1
    lw t2, -32(fp)
    li t0, 15
    sub t0, t0, t2
    addi t0, t0, 1
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    sub t0, t1, t0
    sw t0, -20(fp)
    j BB429
BB429: 
    j BB425
BB430: 
    lw t2, -28(fp)
    lw t1, -32(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    div t1, t2, t1
    sw t1, -20(fp)
    j BB429
BB431: 
    lw t0, -32(fp)
    slti t1, t0, 15
    snez t1, t0
    bnez t1, BB432
    j BB434
BB432: 
    j BB435
BB433: 
    lw t1, -20(fp)
    sw t1, -128(fp)
    j BB224
BB434: 
    j BB439
BB435: 
    lw t2, -28(fp)
    sltz t2, t2
    bnez t2, BB436
    j BB438
BB436: 
    li t2, 65535
    sw t2, -20(fp)
    j BB437
BB437: 
    j BB433
BB438: 
    li t2, 0
    sw t2, -20(fp)
    j BB437
BB439: 
    lw t1, -32(fp)
    sgtz t1, t1
    bnez t1, BB440
    j BB442
BB440: 
    j BB443
BB441: 
    j BB433
BB442: 
    lw t1, -28(fp)
    sw t1, -20(fp)
    j BB441
BB443: 
    lw t1, -28(fp)
    li t0, 32767
    slt t0, t0, t1
    bnez t0, BB444
    j BB446
BB444: 
    lw t1, -28(fp)
    lw t0, -32(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    div t0, t1, t0
    sw t0, -28(fp)
    lw t0, -28(fp)
    li t1, 65536
    add t1, t0, t1
    lw t0, -32(fp)
    li t2, 15
    sub t2, t2, t0
    addi t2, t2, 1
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    sub t2, t1, t2
    sw t2, -20(fp)
    j BB445
BB445: 
    j BB441
BB446: 
    lw t0, -28(fp)
    lw t1, -32(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    div t1, t0, t1
    sw t1, -20(fp)
    j BB445
BB447: 
    lw t0, -36(fp)
    slti t0, t0, 16
    bnez t0, BB448
    j BB449
BB448: 
    li t0, 2
    sw t0, -208(fp)
    lw t0, -36(fp)
    sw t0, -212(fp)
    li t0, 1
    sw t0, -216(fp)
    j BB450
BB449: 
    li t0, 0
    sw t0, -36(fp)
    j BB673
BB450: 
    lw t0, -212(fp)
    sgtz t0, t0
    bnez t0, BB451
    j BB452
BB451: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -212(fp)
    sw t0, -28(fp)
    li t0, 1
    sw t0, -32(fp)
    j BB453
BB452: 
    lw t0, -216(fp)
    sw t0, -20(fp)
    lw t0, -20(fp)
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    lw t0, -36(fp)
    addi t0, t0, 1
    sw t0, -36(fp)
    j BB447
BB453: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB454
    j BB455
BB454: 
    j BB456
BB455: 
    j BB460
BB456: 
    lw t1, -28(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB459
    j BB458
BB457: 
    lw t1, -20(fp)
    lw t2, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 1
    mul t0, t0, t2
    add t0, t1, t0
    sw t0, -20(fp)
    j BB458
BB458: 
    lw t1, -28(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB453
BB459: 
    lw t2, -32(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB457
    j BB458
BB460: 
    lw t0, -20(fp)
    seqz t0, t0
    bnez t0, BB461
    j BB462
BB461: 
    lw t1, -216(fp)
    sw t1, -220(fp)
    lw t1, -208(fp)
    sw t1, -224(fp)
    li t1, 0
    sw t1, -228(fp)
    j BB463
BB462: 
    lw t0, -208(fp)
    sw t0, -256(fp)
    lw t0, -208(fp)
    sw t0, -260(fp)
    li t0, 0
    sw t0, -264(fp)
    j BB560
BB463: 
    lw t1, -224(fp)
    seqz t1, t1
    bnez t1, BB464
    j BB465
BB464: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -224(fp)
    sw t1, -28(fp)
    li t1, 1
    sw t1, -32(fp)
    j BB466
BB465: 
    lw t1, -228(fp)
    sw t1, -20(fp)
    lw t1, -20(fp)
    sw t1, -216(fp)
    j BB462
BB466: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB467
    j BB468
BB467: 
    j BB469
BB468: 
    j BB473
BB469: 
    lw t2, -28(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB472
    j BB471
BB470: 
    lw t2, -20(fp)
    lw t0, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 1
    mul t1, t1, t0
    add t1, t2, t1
    sw t1, -20(fp)
    j BB471
BB471: 
    lw t2, -28(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB466
BB472: 
    lw t0, -32(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB470
    j BB471
BB473: 
    lw t1, -20(fp)
    seqz t1, t1
    bnez t1, BB474
    j BB475
BB474: 
    lw t1, -228(fp)
    sw t1, -232(fp)
    lw t1, -220(fp)
    sw t1, -236(fp)
    j BB476
BB475: 
    lw t1, -220(fp)
    sw t1, -244(fp)
    lw t1, -220(fp)
    sw t1, -248(fp)
    j BB510
BB476: 
    lw t1, -236(fp)
    seqz t1, t1
    bnez t1, BB477
    j BB478
BB477: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -232(fp)
    sw t1, -28(fp)
    lw t1, -236(fp)
    sw t1, -32(fp)
    j BB479
BB478: 
    lw t1, -232(fp)
    sw t1, -20(fp)
    lw t1, -20(fp)
    sw t1, -228(fp)
    j BB475
BB479: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB480
    j BB481
BB480: 
    j BB482
BB481: 
    lw t1, -20(fp)
    sw t1, -240(fp)
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -232(fp)
    sw t1, -28(fp)
    lw t1, -236(fp)
    sw t1, -32(fp)
    j BB492
BB482: 
    lw t0, -28(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB483
    j BB485
BB483: 
    j BB486
BB484: 
    lw t0, -28(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB479
BB485: 
    j BB489
BB486: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB487
    j BB488
BB487: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB488
BB488: 
    j BB484
BB489: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB490
    j BB491
BB490: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB491
BB491: 
    j BB484
BB492: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB493
    j BB494
BB493: 
    j BB495
BB494: 
    lw t1, -20(fp)
    sw t1, -236(fp)
    j BB499
BB495: 
    lw t2, -28(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB498
    j BB497
BB496: 
    lw t2, -20(fp)
    lw t1, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 1
    mul t0, t0, t1
    add t0, t2, t0
    sw t0, -20(fp)
    j BB497
BB497: 
    lw t2, -28(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB492
BB498: 
    lw t1, -32(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB496
    j BB497
BB499: 
    li t1, 1
    li t0, 15
    slt t0, t0, t1
    bnez t0, BB500
    j BB502
BB500: 
    li t2, 0
    sw t2, -20(fp)
    j BB501
BB501: 
    lw t1, -20(fp)
    sw t1, -236(fp)
    lw t1, -240(fp)
    sw t1, -232(fp)
    j BB476
BB502: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -236(fp)
    lla t1, $SHIFT_TABLE
    addi t1, fp, 4
    lw t1, 0(t1)
    mul t1, t0, t1
    sw t1, -28(fp)
    li t1, 65535
    sw t1, -32(fp)
    j BB503
BB503: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB504
    j BB505
BB504: 
    j BB506
BB505: 
    j BB501
BB506: 
    lw t1, -28(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB509
    j BB508
BB507: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 1
    mul t2, t2, t0
    add t2, t1, t2
    sw t2, -20(fp)
    j BB508
BB508: 
    lw t1, -28(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB503
BB509: 
    lw t0, -32(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB507
    j BB508
BB510: 
    lw t1, -248(fp)
    seqz t1, t1
    bnez t1, BB511
    j BB512
BB511: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -244(fp)
    sw t2, -28(fp)
    lw t2, -248(fp)
    sw t2, -32(fp)
    j BB513
BB512: 
    lw t1, -244(fp)
    sw t1, -20(fp)
    lw t1, -20(fp)
    sw t1, -220(fp)
    lw t1, -224(fp)
    sw t1, -28(fp)
    li t1, 1
    sw t1, -32(fp)
    j BB544
BB513: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB514
    j BB515
BB514: 
    j BB516
BB515: 
    lw t2, -20(fp)
    sw t2, -252(fp)
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -244(fp)
    sw t2, -28(fp)
    lw t2, -248(fp)
    sw t2, -32(fp)
    j BB526
BB516: 
    lw t0, -28(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB517
    j BB519
BB517: 
    j BB520
BB518: 
    lw t0, -28(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB513
BB519: 
    j BB523
BB520: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB521
    j BB522
BB521: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB522
BB522: 
    j BB518
BB523: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB524
    j BB525
BB524: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB525
BB525: 
    j BB518
BB526: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB527
    j BB528
BB527: 
    j BB529
BB528: 
    lw t2, -20(fp)
    sw t2, -248(fp)
    j BB533
BB529: 
    lw t1, -28(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB532
    j BB531
BB530: 
    lw t1, -20(fp)
    lw t2, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 1
    mul t0, t0, t2
    add t0, t1, t0
    sw t0, -20(fp)
    j BB531
BB531: 
    lw t1, -28(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB526
BB532: 
    lw t2, -32(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB530
    j BB531
BB533: 
    li t2, 1
    li t0, 15
    slt t0, t0, t2
    bnez t0, BB534
    j BB536
BB534: 
    li t1, 0
    sw t1, -20(fp)
    j BB535
BB535: 
    lw t2, -20(fp)
    sw t2, -248(fp)
    lw t2, -252(fp)
    sw t2, -244(fp)
    j BB510
BB536: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -248(fp)
    lla t2, $SHIFT_TABLE
    addi t2, fp, 4
    lw t2, 0(t2)
    mul t2, t0, t2
    sw t2, -28(fp)
    li t2, 65535
    sw t2, -32(fp)
    j BB537
BB537: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB538
    j BB539
BB538: 
    j BB540
BB539: 
    j BB535
BB540: 
    lw t2, -28(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB543
    j BB542
BB541: 
    lw t2, -20(fp)
    lw t0, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 1
    mul t1, t1, t0
    add t1, t2, t1
    sw t1, -20(fp)
    j BB542
BB542: 
    lw t2, -28(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB537
BB543: 
    lw t0, -32(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB541
    j BB542
BB544: 
    lw t1, -32(fp)
    slti t0, t1, 15
    snez t0, t1
    bnez t0, BB545
    j BB547
BB545: 
    j BB548
BB546: 
    lw t0, -20(fp)
    sw t0, -224(fp)
    j BB463
BB547: 
    j BB552
BB548: 
    lw t2, -28(fp)
    sltz t2, t2
    bnez t2, BB549
    j BB551
BB549: 
    li t2, 65535
    sw t2, -20(fp)
    j BB550
BB550: 
    j BB546
BB551: 
    li t2, 0
    sw t2, -20(fp)
    j BB550
BB552: 
    lw t0, -32(fp)
    sgtz t0, t0
    bnez t0, BB553
    j BB555
BB553: 
    j BB556
BB554: 
    j BB546
BB555: 
    lw t0, -28(fp)
    sw t0, -20(fp)
    j BB554
BB556: 
    lw t0, -28(fp)
    li t1, 32767
    slt t1, t1, t0
    bnez t1, BB557
    j BB559
BB557: 
    lw t0, -28(fp)
    lw t1, -32(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -28(fp)
    li t0, 65536
    add t0, t1, t0
    lw t1, -32(fp)
    li t2, 15
    sub t2, t2, t1
    addi t2, t2, 1
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    sub t2, t0, t2
    sw t2, -20(fp)
    j BB558
BB558: 
    j BB554
BB559: 
    lw t1, -28(fp)
    lw t0, -32(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    div t0, t1, t0
    sw t0, -20(fp)
    j BB558
BB560: 
    lw t0, -260(fp)
    seqz t0, t0
    bnez t0, BB561
    j BB562
BB561: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -260(fp)
    sw t1, -28(fp)
    li t1, 1
    sw t1, -32(fp)
    j BB563
BB562: 
    lw t0, -264(fp)
    sw t0, -20(fp)
    lw t0, -20(fp)
    sw t0, -208(fp)
    lw t0, -212(fp)
    sw t0, -28(fp)
    li t0, 1
    sw t0, -32(fp)
    j BB657
BB563: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB564
    j BB565
BB564: 
    j BB566
BB565: 
    j BB570
BB566: 
    lw t0, -28(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB569
    j BB568
BB567: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB568
BB568: 
    lw t0, -28(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB563
BB569: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB567
    j BB568
BB570: 
    lw t1, -20(fp)
    seqz t1, t1
    bnez t1, BB571
    j BB572
BB571: 
    lw t1, -264(fp)
    sw t1, -268(fp)
    lw t1, -256(fp)
    sw t1, -272(fp)
    j BB573
BB572: 
    lw t1, -256(fp)
    sw t1, -280(fp)
    lw t1, -256(fp)
    sw t1, -284(fp)
    j BB607
BB573: 
    lw t1, -272(fp)
    seqz t1, t1
    bnez t1, BB574
    j BB575
BB574: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -268(fp)
    sw t1, -28(fp)
    lw t1, -272(fp)
    sw t1, -32(fp)
    j BB576
BB575: 
    lw t1, -268(fp)
    sw t1, -20(fp)
    lw t1, -20(fp)
    sw t1, -264(fp)
    j BB572
BB576: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB577
    j BB578
BB577: 
    j BB579
BB578: 
    lw t1, -20(fp)
    sw t1, -276(fp)
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -268(fp)
    sw t1, -28(fp)
    lw t1, -272(fp)
    sw t1, -32(fp)
    j BB589
BB579: 
    lw t2, -28(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB580
    j BB582
BB580: 
    j BB583
BB581: 
    lw t2, -28(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB576
BB582: 
    j BB586
BB583: 
    lw t1, -32(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB584
    j BB585
BB584: 
    lw t2, -20(fp)
    lw t1, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 1
    mul t0, t0, t1
    add t0, t2, t0
    sw t0, -20(fp)
    j BB585
BB585: 
    j BB581
BB586: 
    lw t0, -32(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB587
    j BB588
BB587: 
    lw t2, -20(fp)
    lw t0, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 1
    mul t1, t1, t0
    add t1, t2, t1
    sw t1, -20(fp)
    j BB588
BB588: 
    j BB581
BB589: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB590
    j BB591
BB590: 
    j BB592
BB591: 
    lw t1, -20(fp)
    sw t1, -272(fp)
    j BB596
BB592: 
    lw t0, -28(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB595
    j BB594
BB593: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB594
BB594: 
    lw t0, -28(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB589
BB595: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB593
    j BB594
BB596: 
    li t1, 1
    li t2, 15
    slt t2, t2, t1
    bnez t2, BB597
    j BB599
BB597: 
    li t0, 0
    sw t0, -20(fp)
    j BB598
BB598: 
    lw t1, -20(fp)
    sw t1, -272(fp)
    lw t1, -276(fp)
    sw t1, -268(fp)
    j BB573
BB599: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -272(fp)
    lla t1, $SHIFT_TABLE
    addi t1, fp, 4
    lw t1, 0(t1)
    mul t1, t2, t1
    sw t1, -28(fp)
    li t1, 65535
    sw t1, -32(fp)
    j BB600
BB600: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB601
    j BB602
BB601: 
    j BB603
BB602: 
    j BB598
BB603: 
    lw t1, -28(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB606
    j BB605
BB604: 
    lw t1, -20(fp)
    lw t2, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 1
    mul t0, t0, t2
    add t0, t1, t0
    sw t0, -20(fp)
    j BB605
BB605: 
    lw t1, -28(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB600
BB606: 
    lw t2, -32(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB604
    j BB605
BB607: 
    lw t1, -284(fp)
    seqz t1, t1
    bnez t1, BB608
    j BB609
BB608: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -280(fp)
    sw t0, -28(fp)
    lw t0, -284(fp)
    sw t0, -32(fp)
    j BB610
BB609: 
    lw t1, -280(fp)
    sw t1, -20(fp)
    lw t1, -20(fp)
    sw t1, -256(fp)
    lw t1, -260(fp)
    sw t1, -28(fp)
    li t1, 1
    sw t1, -32(fp)
    j BB641
BB610: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB611
    j BB612
BB611: 
    j BB613
BB612: 
    lw t0, -20(fp)
    sw t0, -288(fp)
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -280(fp)
    sw t0, -28(fp)
    lw t0, -284(fp)
    sw t0, -32(fp)
    j BB623
BB613: 
    lw t2, -28(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB614
    j BB616
BB614: 
    j BB617
BB615: 
    lw t2, -28(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB610
BB616: 
    j BB620
BB617: 
    lw t0, -32(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB618
    j BB619
BB618: 
    lw t2, -20(fp)
    lw t0, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 1
    mul t1, t1, t0
    add t1, t2, t1
    sw t1, -20(fp)
    j BB619
BB619: 
    j BB615
BB620: 
    lw t1, -32(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB621
    j BB622
BB621: 
    lw t2, -20(fp)
    lw t1, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 1
    mul t0, t0, t1
    add t0, t2, t0
    sw t0, -20(fp)
    j BB622
BB622: 
    j BB615
BB623: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB624
    j BB625
BB624: 
    j BB626
BB625: 
    lw t0, -20(fp)
    sw t0, -284(fp)
    j BB630
BB626: 
    lw t1, -28(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB629
    j BB628
BB627: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 1
    mul t2, t2, t0
    add t2, t1, t2
    sw t2, -20(fp)
    j BB628
BB628: 
    lw t1, -28(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB623
BB629: 
    lw t0, -32(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB627
    j BB628
BB630: 
    li t0, 1
    li t2, 15
    slt t2, t2, t0
    bnez t2, BB631
    j BB633
BB631: 
    li t1, 0
    sw t1, -20(fp)
    j BB632
BB632: 
    lw t0, -20(fp)
    sw t0, -284(fp)
    lw t0, -288(fp)
    sw t0, -280(fp)
    j BB607
BB633: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -284(fp)
    lla t0, $SHIFT_TABLE
    addi t0, fp, 4
    lw t0, 0(t0)
    mul t0, t2, t0
    sw t0, -28(fp)
    li t0, 65535
    sw t0, -32(fp)
    j BB634
BB634: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB635
    j BB636
BB635: 
    j BB637
BB636: 
    j BB632
BB637: 
    lw t0, -28(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB640
    j BB639
BB638: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB639
BB639: 
    lw t0, -28(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB634
BB640: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB638
    j BB639
BB641: 
    lw t1, -32(fp)
    slti t2, t1, 15
    snez t2, t1
    bnez t2, BB642
    j BB644
BB642: 
    j BB645
BB643: 
    lw t2, -20(fp)
    sw t2, -260(fp)
    j BB560
BB644: 
    j BB649
BB645: 
    lw t0, -28(fp)
    sltz t0, t0
    bnez t0, BB646
    j BB648
BB646: 
    li t0, 65535
    sw t0, -20(fp)
    j BB647
BB647: 
    j BB643
BB648: 
    li t0, 0
    sw t0, -20(fp)
    j BB647
BB649: 
    lw t2, -32(fp)
    sgtz t2, t2
    bnez t2, BB650
    j BB652
BB650: 
    j BB653
BB651: 
    j BB643
BB652: 
    lw t2, -28(fp)
    sw t2, -20(fp)
    j BB651
BB653: 
    lw t2, -28(fp)
    li t1, 32767
    slt t1, t1, t2
    bnez t1, BB654
    j BB656
BB654: 
    lw t2, -28(fp)
    lw t1, -32(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    div t1, t2, t1
    sw t1, -28(fp)
    lw t1, -28(fp)
    li t2, 65536
    add t2, t1, t2
    lw t1, -32(fp)
    li t0, 15
    sub t0, t0, t1
    addi t0, t0, 1
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    sub t0, t2, t0
    sw t0, -20(fp)
    j BB655
BB655: 
    j BB651
BB656: 
    lw t1, -28(fp)
    lw t2, -32(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    div t2, t1, t2
    sw t2, -20(fp)
    j BB655
BB657: 
    lw t0, -32(fp)
    slti t2, t0, 15
    snez t2, t0
    bnez t2, BB658
    j BB660
BB658: 
    j BB661
BB659: 
    lw t2, -20(fp)
    sw t2, -212(fp)
    j BB450
BB660: 
    j BB665
BB661: 
    lw t1, -28(fp)
    sltz t1, t1
    bnez t1, BB662
    j BB664
BB662: 
    li t1, 65535
    sw t1, -20(fp)
    j BB663
BB663: 
    j BB659
BB664: 
    li t1, 0
    sw t1, -20(fp)
    j BB663
BB665: 
    lw t2, -32(fp)
    sgtz t2, t2
    bnez t2, BB666
    j BB668
BB666: 
    j BB669
BB667: 
    j BB659
BB668: 
    lw t2, -28(fp)
    sw t2, -20(fp)
    j BB667
BB669: 
    lw t2, -28(fp)
    li t0, 32767
    slt t0, t0, t2
    bnez t0, BB670
    j BB672
BB670: 
    lw t2, -28(fp)
    lw t0, -32(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    div t0, t2, t0
    sw t0, -28(fp)
    lw t0, -28(fp)
    li t2, 65536
    add t2, t0, t2
    lw t0, -32(fp)
    li t1, 15
    sub t1, t1, t0
    addi t1, t1, 1
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    sub t1, t2, t1
    sw t1, -20(fp)
    j BB671
BB671: 
    j BB667
BB672: 
    lw t0, -28(fp)
    lw t2, -32(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    div t2, t0, t2
    sw t2, -20(fp)
    j BB671
BB673: 
    lw t0, -36(fp)
    slti t0, t0, 16
    bnez t0, BB674
    j BB675
BB674: 
    li t0, 2
    sw t0, -292(fp)
    lw t0, -36(fp)
    sw t0, -296(fp)
    li t0, 1
    sw t0, -300(fp)
    j BB676
BB675: 
    li t0, 0
    mv a0, t0
    j BB905
BB676: 
    lw t0, -296(fp)
    sgtz t0, t0
    bnez t0, BB677
    j BB678
BB677: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -296(fp)
    sw t1, -28(fp)
    li t1, 1
    sw t1, -32(fp)
    j BB679
BB678: 
    lw t0, -300(fp)
    sw t0, -20(fp)
    j BB899
BB679: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB680
    j BB681
BB680: 
    j BB682
BB681: 
    j BB686
BB682: 
    lw t2, -28(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB685
    j BB684
BB683: 
    lw t2, -20(fp)
    lw t1, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 1
    mul t0, t0, t1
    add t0, t2, t0
    sw t0, -20(fp)
    j BB684
BB684: 
    lw t2, -28(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB679
BB685: 
    lw t1, -32(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB683
    j BB684
BB686: 
    lw t1, -20(fp)
    seqz t1, t1
    bnez t1, BB687
    j BB688
BB687: 
    lw t2, -300(fp)
    sw t2, -304(fp)
    lw t2, -292(fp)
    sw t2, -308(fp)
    li t2, 0
    sw t2, -312(fp)
    j BB689
BB688: 
    lw t1, -292(fp)
    sw t1, -340(fp)
    lw t1, -292(fp)
    sw t1, -344(fp)
    li t1, 0
    sw t1, -348(fp)
    j BB786
BB689: 
    lw t2, -308(fp)
    seqz t2, t2
    bnez t2, BB690
    j BB691
BB690: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -308(fp)
    sw t2, -28(fp)
    li t2, 1
    sw t2, -32(fp)
    j BB692
BB691: 
    lw t2, -312(fp)
    sw t2, -20(fp)
    lw t2, -20(fp)
    sw t2, -300(fp)
    j BB688
BB692: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB693
    j BB694
BB693: 
    j BB695
BB694: 
    j BB699
BB695: 
    lw t1, -28(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB698
    j BB697
BB696: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 1
    mul t2, t2, t0
    add t2, t1, t2
    sw t2, -20(fp)
    j BB697
BB697: 
    lw t1, -28(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB692
BB698: 
    lw t0, -32(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB696
    j BB697
BB699: 
    lw t2, -20(fp)
    seqz t2, t2
    bnez t2, BB700
    j BB701
BB700: 
    lw t2, -312(fp)
    sw t2, -316(fp)
    lw t2, -304(fp)
    sw t2, -320(fp)
    j BB702
BB701: 
    lw t2, -304(fp)
    sw t2, -328(fp)
    lw t2, -304(fp)
    sw t2, -332(fp)
    j BB736
BB702: 
    lw t2, -320(fp)
    seqz t2, t2
    bnez t2, BB703
    j BB704
BB703: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -316(fp)
    sw t2, -28(fp)
    lw t2, -320(fp)
    sw t2, -32(fp)
    j BB705
BB704: 
    lw t2, -316(fp)
    sw t2, -20(fp)
    lw t2, -20(fp)
    sw t2, -312(fp)
    j BB701
BB705: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB706
    j BB707
BB706: 
    j BB708
BB707: 
    lw t2, -20(fp)
    sw t2, -324(fp)
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -316(fp)
    sw t2, -28(fp)
    lw t2, -320(fp)
    sw t2, -32(fp)
    j BB718
BB708: 
    lw t0, -28(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB709
    j BB711
BB709: 
    j BB712
BB710: 
    lw t0, -28(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB705
BB711: 
    j BB715
BB712: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB713
    j BB714
BB713: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB714
BB714: 
    j BB710
BB715: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB716
    j BB717
BB716: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB717
BB717: 
    j BB710
BB718: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB719
    j BB720
BB719: 
    j BB721
BB720: 
    lw t2, -20(fp)
    sw t2, -320(fp)
    j BB725
BB721: 
    lw t1, -28(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB724
    j BB723
BB722: 
    lw t1, -20(fp)
    lw t2, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 1
    mul t0, t0, t2
    add t0, t1, t0
    sw t0, -20(fp)
    j BB723
BB723: 
    lw t1, -28(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB718
BB724: 
    lw t2, -32(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB722
    j BB723
BB725: 
    li t2, 1
    li t0, 15
    slt t0, t0, t2
    bnez t0, BB726
    j BB728
BB726: 
    li t1, 0
    sw t1, -20(fp)
    j BB727
BB727: 
    lw t2, -20(fp)
    sw t2, -320(fp)
    lw t2, -324(fp)
    sw t2, -316(fp)
    j BB702
BB728: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -320(fp)
    lla t2, $SHIFT_TABLE
    addi t2, fp, 4
    lw t2, 0(t2)
    mul t2, t0, t2
    sw t2, -28(fp)
    li t2, 65535
    sw t2, -32(fp)
    j BB729
BB729: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB730
    j BB731
BB730: 
    j BB732
BB731: 
    j BB727
BB732: 
    lw t2, -28(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB735
    j BB734
BB733: 
    lw t2, -20(fp)
    lw t0, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 1
    mul t1, t1, t0
    add t1, t2, t1
    sw t1, -20(fp)
    j BB734
BB734: 
    lw t2, -28(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB729
BB735: 
    lw t0, -32(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB733
    j BB734
BB736: 
    lw t2, -332(fp)
    seqz t2, t2
    bnez t2, BB737
    j BB738
BB737: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -328(fp)
    sw t0, -28(fp)
    lw t0, -332(fp)
    sw t0, -32(fp)
    j BB739
BB738: 
    lw t2, -328(fp)
    sw t2, -20(fp)
    lw t2, -20(fp)
    sw t2, -304(fp)
    lw t2, -308(fp)
    sw t2, -28(fp)
    li t2, 1
    sw t2, -32(fp)
    j BB770
BB739: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB740
    j BB741
BB740: 
    j BB742
BB741: 
    lw t0, -20(fp)
    sw t0, -336(fp)
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -328(fp)
    sw t0, -28(fp)
    lw t0, -332(fp)
    sw t0, -32(fp)
    j BB752
BB742: 
    lw t0, -28(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB743
    j BB745
BB743: 
    j BB746
BB744: 
    lw t0, -28(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB739
BB745: 
    j BB749
BB746: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB747
    j BB748
BB747: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB748
BB748: 
    j BB744
BB749: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB750
    j BB751
BB750: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB751
BB751: 
    j BB744
BB752: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB753
    j BB754
BB753: 
    j BB755
BB754: 
    lw t0, -20(fp)
    sw t0, -332(fp)
    j BB759
BB755: 
    lw t2, -28(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB758
    j BB757
BB756: 
    lw t2, -20(fp)
    lw t1, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 1
    mul t0, t0, t1
    add t0, t2, t0
    sw t0, -20(fp)
    j BB757
BB757: 
    lw t2, -28(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB752
BB758: 
    lw t1, -32(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB756
    j BB757
BB759: 
    li t0, 1
    li t1, 15
    slt t1, t1, t0
    bnez t1, BB760
    j BB762
BB760: 
    li t2, 0
    sw t2, -20(fp)
    j BB761
BB761: 
    lw t0, -20(fp)
    sw t0, -332(fp)
    lw t0, -336(fp)
    sw t0, -328(fp)
    j BB736
BB762: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -332(fp)
    lla t0, $SHIFT_TABLE
    addi t0, fp, 4
    lw t0, 0(t0)
    mul t0, t1, t0
    sw t0, -28(fp)
    li t0, 65535
    sw t0, -32(fp)
    j BB763
BB763: 
    lw t0, -24(fp)
    slti t0, t0, 16
    bnez t0, BB764
    j BB765
BB764: 
    j BB766
BB765: 
    j BB761
BB766: 
    lw t0, -28(fp)
    li t1, 2
    rem t0, t0, t1
    seqz t0, t0
    bnez t0, BB769
    j BB768
BB767: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 1
    mul t2, t2, t0
    add t2, t1, t2
    sw t2, -20(fp)
    j BB768
BB768: 
    lw t1, -28(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB763
BB769: 
    lw t0, -32(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB767
    j BB768
BB770: 
    lw t2, -32(fp)
    slti t1, t2, 15
    snez t1, t2
    bnez t1, BB771
    j BB773
BB771: 
    j BB774
BB772: 
    lw t1, -20(fp)
    sw t1, -308(fp)
    j BB689
BB773: 
    j BB778
BB774: 
    lw t0, -28(fp)
    sltz t0, t0
    bnez t0, BB775
    j BB777
BB775: 
    li t0, 65535
    sw t0, -20(fp)
    j BB776
BB776: 
    j BB772
BB777: 
    li t0, 0
    sw t0, -20(fp)
    j BB776
BB778: 
    lw t1, -32(fp)
    sgtz t1, t1
    bnez t1, BB779
    j BB781
BB779: 
    j BB782
BB780: 
    j BB772
BB781: 
    lw t1, -28(fp)
    sw t1, -20(fp)
    j BB780
BB782: 
    lw t1, -28(fp)
    li t2, 32767
    slt t2, t2, t1
    bnez t2, BB783
    j BB785
BB783: 
    lw t1, -28(fp)
    lw t2, -32(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    div t2, t1, t2
    sw t2, -28(fp)
    lw t2, -28(fp)
    li t1, 65536
    add t1, t2, t1
    lw t2, -32(fp)
    li t0, 15
    sub t0, t0, t2
    addi t0, t0, 1
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    sub t0, t1, t0
    sw t0, -20(fp)
    j BB784
BB784: 
    j BB780
BB785: 
    lw t2, -28(fp)
    lw t1, -32(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    div t1, t2, t1
    sw t1, -20(fp)
    j BB784
BB786: 
    lw t1, -344(fp)
    seqz t1, t1
    bnez t1, BB787
    j BB788
BB787: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -344(fp)
    sw t2, -28(fp)
    li t2, 1
    sw t2, -32(fp)
    j BB789
BB788: 
    lw t1, -348(fp)
    sw t1, -20(fp)
    lw t1, -20(fp)
    sw t1, -292(fp)
    lw t1, -296(fp)
    sw t1, -28(fp)
    li t1, 1
    sw t1, -32(fp)
    j BB883
BB789: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB790
    j BB791
BB790: 
    j BB792
BB791: 
    j BB796
BB792: 
    lw t1, -28(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB795
    j BB794
BB793: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 1
    mul t2, t2, t0
    add t2, t1, t2
    sw t2, -20(fp)
    j BB794
BB794: 
    lw t1, -28(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB789
BB795: 
    lw t0, -32(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB793
    j BB794
BB796: 
    lw t2, -20(fp)
    seqz t2, t2
    bnez t2, BB797
    j BB798
BB797: 
    lw t2, -348(fp)
    sw t2, -352(fp)
    lw t2, -340(fp)
    sw t2, -356(fp)
    j BB799
BB798: 
    lw t2, -340(fp)
    sw t2, -364(fp)
    lw t2, -340(fp)
    sw t2, -368(fp)
    j BB833
BB799: 
    lw t2, -356(fp)
    seqz t2, t2
    bnez t2, BB800
    j BB801
BB800: 
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -352(fp)
    sw t2, -28(fp)
    lw t2, -356(fp)
    sw t2, -32(fp)
    j BB802
BB801: 
    lw t2, -352(fp)
    sw t2, -20(fp)
    lw t2, -20(fp)
    sw t2, -348(fp)
    j BB798
BB802: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB803
    j BB804
BB803: 
    j BB805
BB804: 
    lw t2, -20(fp)
    sw t2, -360(fp)
    li t2, 0
    sw t2, -20(fp)
    li t2, 0
    sw t2, -24(fp)
    lw t2, -352(fp)
    sw t2, -28(fp)
    lw t2, -356(fp)
    sw t2, -32(fp)
    j BB815
BB805: 
    lw t0, -28(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB806
    j BB808
BB806: 
    j BB809
BB807: 
    lw t0, -28(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB802
BB808: 
    j BB812
BB809: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB810
    j BB811
BB810: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB811
BB811: 
    j BB807
BB812: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB813
    j BB814
BB813: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB814
BB814: 
    j BB807
BB815: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB816
    j BB817
BB816: 
    j BB818
BB817: 
    lw t2, -20(fp)
    sw t2, -356(fp)
    j BB822
BB818: 
    lw t1, -28(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB821
    j BB820
BB819: 
    lw t1, -20(fp)
    lw t2, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    li t0, 1
    mul t0, t0, t2
    add t0, t1, t0
    sw t0, -20(fp)
    j BB820
BB820: 
    lw t1, -28(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB815
BB821: 
    lw t2, -32(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB819
    j BB820
BB822: 
    li t2, 1
    li t0, 15
    slt t0, t0, t2
    bnez t0, BB823
    j BB825
BB823: 
    li t1, 0
    sw t1, -20(fp)
    j BB824
BB824: 
    lw t2, -20(fp)
    sw t2, -356(fp)
    lw t2, -360(fp)
    sw t2, -352(fp)
    j BB799
BB825: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -356(fp)
    lla t2, $SHIFT_TABLE
    addi t2, fp, 4
    lw t2, 0(t2)
    mul t2, t0, t2
    sw t2, -28(fp)
    li t2, 65535
    sw t2, -32(fp)
    j BB826
BB826: 
    lw t2, -24(fp)
    slti t2, t2, 16
    bnez t2, BB827
    j BB828
BB827: 
    j BB829
BB828: 
    j BB824
BB829: 
    lw t2, -28(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB832
    j BB831
BB830: 
    lw t2, -20(fp)
    lw t0, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 1
    mul t1, t1, t0
    add t1, t2, t1
    sw t1, -20(fp)
    j BB831
BB831: 
    lw t2, -28(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB826
BB832: 
    lw t0, -32(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB830
    j BB831
BB833: 
    lw t2, -368(fp)
    seqz t2, t2
    bnez t2, BB834
    j BB835
BB834: 
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -364(fp)
    sw t1, -28(fp)
    lw t1, -368(fp)
    sw t1, -32(fp)
    j BB836
BB835: 
    lw t2, -364(fp)
    sw t2, -20(fp)
    lw t2, -20(fp)
    sw t2, -340(fp)
    lw t2, -344(fp)
    sw t2, -28(fp)
    li t2, 1
    sw t2, -32(fp)
    j BB867
BB836: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB837
    j BB838
BB837: 
    j BB839
BB838: 
    lw t1, -20(fp)
    sw t1, -372(fp)
    li t1, 0
    sw t1, -20(fp)
    li t1, 0
    sw t1, -24(fp)
    lw t1, -364(fp)
    sw t1, -28(fp)
    lw t1, -368(fp)
    sw t1, -32(fp)
    j BB849
BB839: 
    lw t0, -28(fp)
    li t2, 2
    rem t2, t0, t2
    seqz t2, t2
    bnez t2, BB840
    j BB842
BB840: 
    j BB843
BB841: 
    lw t0, -28(fp)
    li t2, 2
    div t2, t0, t2
    sw t2, -28(fp)
    lw t2, -32(fp)
    li t0, 2
    div t0, t2, t0
    sw t0, -32(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB836
BB842: 
    j BB846
BB843: 
    lw t1, -32(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB844
    j BB845
BB844: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 1
    mul t2, t2, t1
    add t2, t0, t2
    sw t2, -20(fp)
    j BB845
BB845: 
    j BB841
BB846: 
    lw t2, -32(fp)
    li t0, 2
    rem t0, t2, t0
    seqz t0, t0
    bnez t0, BB847
    j BB848
BB847: 
    lw t0, -20(fp)
    lw t2, -24(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 1
    mul t1, t1, t2
    add t1, t0, t1
    sw t1, -20(fp)
    j BB848
BB848: 
    j BB841
BB849: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB850
    j BB851
BB850: 
    j BB852
BB851: 
    lw t1, -20(fp)
    sw t1, -368(fp)
    j BB856
BB852: 
    lw t2, -28(fp)
    li t1, 2
    rem t1, t2, t1
    seqz t1, t1
    bnez t1, BB855
    j BB854
BB853: 
    lw t2, -20(fp)
    lw t1, -24(fp)
    lla t0, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 1
    mul t0, t0, t1
    add t0, t2, t0
    sw t0, -20(fp)
    j BB854
BB854: 
    lw t2, -28(fp)
    li t1, 2
    div t1, t2, t1
    sw t1, -28(fp)
    lw t1, -32(fp)
    li t2, 2
    div t2, t1, t2
    sw t2, -32(fp)
    lw t2, -24(fp)
    addi t2, t2, 1
    sw t2, -24(fp)
    j BB849
BB855: 
    lw t1, -32(fp)
    li t2, 2
    rem t2, t1, t2
    seqz t2, t2
    bnez t2, BB853
    j BB854
BB856: 
    li t1, 1
    li t0, 15
    slt t0, t0, t1
    bnez t0, BB857
    j BB859
BB857: 
    li t2, 0
    sw t2, -20(fp)
    j BB858
BB858: 
    lw t1, -20(fp)
    sw t1, -368(fp)
    lw t1, -372(fp)
    sw t1, -364(fp)
    j BB833
BB859: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    lw t0, -368(fp)
    lla t1, $SHIFT_TABLE
    addi t1, fp, 4
    lw t1, 0(t1)
    mul t1, t0, t1
    sw t1, -28(fp)
    li t1, 65535
    sw t1, -32(fp)
    j BB860
BB860: 
    lw t1, -24(fp)
    slti t1, t1, 16
    bnez t1, BB861
    j BB862
BB861: 
    j BB863
BB862: 
    j BB858
BB863: 
    lw t1, -28(fp)
    li t0, 2
    rem t0, t1, t0
    seqz t0, t0
    bnez t0, BB866
    j BB865
BB864: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 1
    mul t2, t2, t0
    add t2, t1, t2
    sw t2, -20(fp)
    j BB865
BB865: 
    lw t1, -28(fp)
    li t0, 2
    div t0, t1, t0
    sw t0, -28(fp)
    lw t0, -32(fp)
    li t1, 2
    div t1, t0, t1
    sw t1, -32(fp)
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB860
BB866: 
    lw t0, -32(fp)
    li t1, 2
    rem t1, t0, t1
    seqz t1, t1
    bnez t1, BB864
    j BB865
BB867: 
    lw t2, -32(fp)
    slti t0, t2, 15
    snez t0, t2
    bnez t0, BB868
    j BB870
BB868: 
    j BB871
BB869: 
    lw t0, -20(fp)
    sw t0, -344(fp)
    j BB786
BB870: 
    j BB875
BB871: 
    lw t1, -28(fp)
    sltz t1, t1
    bnez t1, BB872
    j BB874
BB872: 
    li t1, 65535
    sw t1, -20(fp)
    j BB873
BB873: 
    j BB869
BB874: 
    li t1, 0
    sw t1, -20(fp)
    j BB873
BB875: 
    lw t0, -32(fp)
    sgtz t0, t0
    bnez t0, BB876
    j BB878
BB876: 
    j BB879
BB877: 
    j BB869
BB878: 
    lw t0, -28(fp)
    sw t0, -20(fp)
    j BB877
BB879: 
    lw t0, -28(fp)
    li t2, 32767
    slt t2, t2, t0
    bnez t2, BB880
    j BB882
BB880: 
    lw t0, -28(fp)
    lw t2, -32(fp)
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    div t2, t0, t2
    sw t2, -28(fp)
    lw t2, -28(fp)
    li t0, 65536
    add t0, t2, t0
    lw t2, -32(fp)
    li t1, 15
    sub t1, t1, t2
    addi t1, t1, 1
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    sub t1, t0, t1
    sw t1, -20(fp)
    j BB881
BB881: 
    j BB877
BB882: 
    lw t2, -28(fp)
    lw t0, -32(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    div t0, t2, t0
    sw t0, -20(fp)
    j BB881
BB883: 
    lw t1, -32(fp)
    slti t0, t1, 15
    snez t0, t1
    bnez t0, BB884
    j BB886
BB884: 
    j BB887
BB885: 
    lw t0, -20(fp)
    sw t0, -296(fp)
    j BB676
BB886: 
    j BB891
BB887: 
    lw t2, -28(fp)
    sltz t2, t2
    bnez t2, BB888
    j BB890
BB888: 
    li t2, 65535
    sw t2, -20(fp)
    j BB889
BB889: 
    j BB885
BB890: 
    li t2, 0
    sw t2, -20(fp)
    j BB889
BB891: 
    lw t0, -32(fp)
    sgtz t0, t0
    bnez t0, BB892
    j BB894
BB892: 
    j BB895
BB893: 
    j BB885
BB894: 
    lw t0, -28(fp)
    sw t0, -20(fp)
    j BB893
BB895: 
    lw t0, -28(fp)
    li t1, 32767
    slt t1, t1, t0
    bnez t1, BB896
    j BB898
BB896: 
    lw t0, -28(fp)
    lw t1, -32(fp)
    lla t2, $SHIFT_TABLE
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -28(fp)
    li t0, 65536
    add t0, t1, t0
    lw t1, -32(fp)
    li t2, 15
    sub t2, t2, t1
    addi t2, t2, 1
    lla t1, $SHIFT_TABLE
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    sub t2, t0, t2
    sw t2, -20(fp)
    j BB897
BB897: 
    j BB893
BB898: 
    lw t1, -28(fp)
    lw t0, -32(fp)
    lla t2, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    div t0, t1, t0
    sw t0, -20(fp)
    j BB897
BB899: 
    lw t0, -36(fp)
    lla t1, $SHIFT_TABLE
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    lw t1, -20(fp)
    xor t1, t0, t1
    snez t1, t1
    bnez t1, BB900
    j BB901
BB900: 
    li t1, 1
    mv a0, t1
    j BB905
BB901: 
    lw t1, -36(fp)
    addi t1, t1, 1
    sw t1, -36(fp)
    j BB673
BB905: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 400
    ret
    .align 1
main: 
BB906: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB902
BB902: 
    call long_func
    mv t0, a0
    mv a0, t0
    j BB907
BB907: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
