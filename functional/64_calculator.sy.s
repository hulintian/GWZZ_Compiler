    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $ii
$ii:
    .word 1
    .bss
    .align 3
$ints:
    .skip 40000
$intt:
    .skip 4
$chas:
    .skip 40000
$chat:
    .skip 4
$i:
    .skip 4
$c:
    .skip 4
$get:
    .skip 40000
$get2:
    .skip 40000
    .align 3
    .globl main
    .text

    .align 1
isdigit: 
BB152: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB0
BB0: 
    j BB1
BB1: 
    lw t0, -20(fp)
    slti t1, t0, 48
    snez t1, t0
    bnez t1, BB4
    j BB3
BB2: 
    li t0, 1
    mv a0, t0
    j BB153
BB3: 
    li t0, 0
    mv a0, t0
    j BB153
BB4: 
    lw t1, -20(fp)
    li t0, 57
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB2
    j BB3
BB153: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
power: 
BB154: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB5
BB5: 
    li t0, 1
    sw t0, -28(fp)
    j BB6
BB6: 
    lw t0, -24(fp)
    seqz t0, t0
    bnez t0, BB7
    j BB8
BB7: 
    lw t0, -28(fp)
    lw t1, -20(fp)
    mul t0, t0, t1
    sw t0, -28(fp)
    lw t0, -24(fp)
    addi t0, t0, -1
    sw t0, -24(fp)
    j BB6
BB8: 
    lw t0, -28(fp)
    mv a0, t0
    j BB155
BB155: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
getstr: 
BB156: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    j BB9
BB9: 
    call getch
    mv t0, a0
    sw t0, -28(fp)
    li t0, 0
    sw t0, -32(fp)
    j BB10
BB10: 
    lw t0, -28(fp)
    xori t0, t0, 13
    snez t0, t0
    bnez t0, BB13
    j BB12
BB11: 
    lw t0, -32(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -28(fp)
    sw t1, 0(t0)
    lw t1, -32(fp)
    addi t1, t1, 1
    sw t1, -32(fp)
    call getch
    mv t1, a0
    sw t1, -28(fp)
    j BB10
BB12: 
    lw t0, -32(fp)
    mv a0, t0
    j BB157
BB13: 
    lw t0, -28(fp)
    xori t0, t0, 10
    snez t0, t0
    bnez t0, BB11
    j BB12
BB157: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
intpush: 
BB158: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB14
BB14: 
    la t0, $intt
    lw t0, 0(t0)
    addi t0, t0, 1
    la t1, $intt
    sw t0, 0(t1)
    la t1, $intt
    lw t1, 0(t1)
    lla t0, $ints
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -20(fp)
    sw t0, 0(t1)
    j BB159
BB159: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
chapush: 
BB160: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB15
BB15: 
    la t0, $chat
    lw t0, 0(t0)
    addi t0, t0, 1
    la t1, $chat
    sw t0, 0(t1)
    la t1, $chat
    lw t1, 0(t1)
    lla t0, $chas
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -20(fp)
    sw t0, 0(t1)
    j BB161
BB161: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
intpop: 
BB162: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB16
BB16: 
    la t0, $intt
    lw t0, 0(t0)
    addi t0, t0, -1
    la t1, $intt
    sw t0, 0(t1)
    la t1, $intt
    lw t1, 0(t1)
    addi t1, t1, 1
    lla t0, $ints
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    mv a0, t1
    j BB163
BB163: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
chapop: 
BB164: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB17
BB17: 
    la t0, $chat
    lw t0, 0(t0)
    addi t0, t0, -1
    la t1, $chat
    sw t0, 0(t1)
    la t1, $chat
    lw t1, 0(t1)
    addi t1, t1, 1
    lla t0, $chas
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    mv a0, t1
    j BB165
BB165: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
intadd: 
BB166: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB18
BB18: 
    la t0, $intt
    lw t0, 0(t0)
    lla t1, $ints
    slli t0, t0, 2
    add t0, t1, t0
    la t1, $intt
    lw t1, 0(t1)
    lla t2, $ints
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 10
    mul t2, t1, t2
    sw t2, 0(t0)
    la t2, $intt
    lw t2, 0(t2)
    lla t0, $ints
    slli t2, t2, 2
    add t2, t0, t2
    la t0, $intt
    lw t0, 0(t0)
    lla t1, $ints
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    lw t1, -20(fp)
    add t1, t0, t1
    sw t1, 0(t2)
    j BB167
BB167: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
find: 
BB168: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB19
BB19: 
    call chapop
    mv t0, a0
    la t1, $c
    sw t0, 0(t1)
    la t1, $ii
    lw t1, 0(t1)
    lla t0, $get2
    slli t1, t1, 2
    add t0, t0, t1
    li t1, 32
    sw t1, 0(t0)
    la t1, $ii
    lw t1, 0(t1)
    addi t1, t1, 1
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    la t0, $c
    lw t0, 0(t0)
    sw t0, 0(t1)
    la t0, $ii
    lw t0, 0(t0)
    addi t0, t0, 2
    la t1, $ii
    sw t0, 0(t1)
    j BB20
BB20: 
    la t1, $chat
    lw t1, 0(t1)
    seqz t1, t1
    bnez t1, BB21
    j BB22
BB21: 
    li t1, 0
    mv a0, t1
    j BB169
BB22: 
    li t1, 1
    mv a0, t1
    j BB169
BB169: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
main: 
BB170: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    j BB23
BB23: 
    li t0, 0
    la t1, $intt
    sw t0, 0(t1)
    li t1, 0
    la t0, $chat
    sw t1, 0(t0)
    la t0, $get
    mv a0, t0
    call getstr
    mv t0, a0
    sw t0, -20(fp)
    j BB24
BB24: 
    la t0, $i
    lw t0, 0(t0)
    lw t1, -20(fp)
    slt t1, t0, t1
    bnez t1, BB25
    j BB26
BB25: 
    j BB27
BB26: 
    j BB112
BB27: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    mv a0, t1
    call isdigit
    mv t1, a0
    xori t1, t1, 1
    seqz t1, t1
    bnez t1, BB28
    j BB30
BB28: 
    la t1, $ii
    lw t1, 0(t1)
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    la t0, $i
    lw t0, 0(t0)
    lla t2, $get
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    sw t0, 0(t1)
    la t0, $ii
    lw t0, 0(t0)
    addi t0, t0, 1
    la t1, $ii
    sw t0, 0(t1)
    j BB29
BB29: 
    la t1, $i
    lw t1, 0(t1)
    addi t1, t1, 1
    la t0, $i
    sw t1, 0(t0)
    j BB24
BB30: 
    j BB31
BB31: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 40
    seqz t1, t1
    bnez t1, BB32
    j BB33
BB32: 
    li t1, 40
    mv a0, t1
    call chapush
    j BB33
BB33: 
    j BB34
BB34: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 94
    seqz t1, t1
    bnez t1, BB35
    j BB36
BB35: 
    li t1, 94
    mv a0, t1
    call chapush
    j BB36
BB36: 
    j BB37
BB37: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 41
    seqz t1, t1
    bnez t1, BB38
    j BB39
BB38: 
    call chapop
    mv t0, a0
    la t1, $c
    sw t0, 0(t1)
    j BB40
BB39: 
    j BB43
BB40: 
    la t1, $c
    lw t1, 0(t1)
    xori t1, t1, 40
    snez t1, t1
    bnez t1, BB41
    j BB42
BB41: 
    la t1, $ii
    lw t1, 0(t1)
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 32
    sw t0, 0(t1)
    la t0, $ii
    lw t0, 0(t0)
    addi t0, t0, 1
    lla t1, $get2
    slli t0, t0, 2
    add t0, t1, t0
    la t1, $c
    lw t1, 0(t1)
    sw t1, 0(t0)
    la t1, $ii
    lw t1, 0(t1)
    addi t1, t1, 2
    la t0, $ii
    sw t1, 0(t0)
    call chapop
    mv t0, a0
    la t1, $c
    sw t0, 0(t1)
    j BB40
BB42: 
    j BB39
BB43: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 43
    seqz t1, t1
    bnez t1, BB44
    j BB45
BB44: 
    j BB46
BB45: 
    j BB58
BB46: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 43
    seqz t0, t0
    bnez t0, BB53
    j BB52
BB47: 
    j BB54
BB48: 
    li t0, 43
    mv a0, t0
    call chapush
    j BB45
BB49: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 94
    seqz t0, t0
    bnez t0, BB47
    j BB48
BB50: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 37
    seqz t0, t0
    bnez t0, BB47
    j BB49
BB51: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 47
    seqz t0, t0
    bnez t0, BB47
    j BB50
BB52: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 42
    seqz t0, t0
    bnez t0, BB47
    j BB51
BB53: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 45
    seqz t0, t0
    bnez t0, BB47
    j BB52
BB54: 
    call find
    mv t0, a0
    seqz t0, t0
    bnez t0, BB55
    j BB56
BB55: 
    j BB48
BB56: 
    j BB46
BB57: 
BB58: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 45
    seqz t1, t1
    bnez t1, BB59
    j BB60
BB59: 
    j BB61
BB60: 
    j BB73
BB61: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 43
    seqz t0, t0
    bnez t0, BB68
    j BB67
BB62: 
    j BB69
BB63: 
    li t0, 45
    mv a0, t0
    call chapush
    j BB60
BB64: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 94
    seqz t0, t0
    bnez t0, BB62
    j BB63
BB65: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 37
    seqz t0, t0
    bnez t0, BB62
    j BB64
BB66: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 47
    seqz t0, t0
    bnez t0, BB62
    j BB65
BB67: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 42
    seqz t0, t0
    bnez t0, BB62
    j BB66
BB68: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 45
    seqz t0, t0
    bnez t0, BB62
    j BB67
BB69: 
    call find
    mv t0, a0
    seqz t0, t0
    bnez t0, BB70
    j BB71
BB70: 
    j BB63
BB71: 
    j BB61
BB72: 
BB73: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 42
    seqz t1, t1
    bnez t1, BB74
    j BB75
BB74: 
    j BB76
BB75: 
    j BB86
BB76: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 42
    seqz t0, t0
    bnez t0, BB81
    j BB80
BB77: 
    j BB82
BB78: 
    li t0, 42
    mv a0, t0
    call chapush
    j BB75
BB79: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 94
    seqz t0, t0
    bnez t0, BB77
    j BB78
BB80: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 37
    seqz t0, t0
    bnez t0, BB77
    j BB79
BB81: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 47
    seqz t0, t0
    bnez t0, BB77
    j BB80
BB82: 
    call find
    mv t0, a0
    seqz t0, t0
    bnez t0, BB83
    j BB84
BB83: 
    j BB78
BB84: 
    j BB76
BB85: 
BB86: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 47
    seqz t1, t1
    bnez t1, BB87
    j BB88
BB87: 
    j BB89
BB88: 
    j BB99
BB89: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 42
    seqz t0, t0
    bnez t0, BB94
    j BB93
BB90: 
    j BB95
BB91: 
    li t0, 47
    mv a0, t0
    call chapush
    j BB88
BB92: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 94
    seqz t0, t0
    bnez t0, BB90
    j BB91
BB93: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 37
    seqz t0, t0
    bnez t0, BB90
    j BB92
BB94: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 47
    seqz t0, t0
    bnez t0, BB90
    j BB93
BB95: 
    call find
    mv t0, a0
    seqz t0, t0
    bnez t0, BB96
    j BB97
BB96: 
    j BB91
BB97: 
    j BB89
BB98: 
BB99: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 37
    seqz t1, t1
    bnez t1, BB100
    j BB101
BB100: 
    j BB102
BB101: 
    la t1, $ii
    lw t1, 0(t1)
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 32
    sw t0, 0(t1)
    la t0, $ii
    lw t0, 0(t0)
    addi t0, t0, 1
    la t1, $ii
    sw t0, 0(t1)
    j BB29
BB102: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 42
    seqz t0, t0
    bnez t0, BB107
    j BB106
BB103: 
    j BB108
BB104: 
    li t0, 37
    mv a0, t0
    call chapush
    j BB101
BB105: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 94
    seqz t0, t0
    bnez t0, BB103
    j BB104
BB106: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 37
    seqz t0, t0
    bnez t0, BB103
    j BB105
BB107: 
    la t0, $chat
    lw t0, 0(t0)
    lla t1, $chas
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 47
    seqz t0, t0
    bnez t0, BB103
    j BB106
BB108: 
    call find
    mv t0, a0
    seqz t0, t0
    bnez t0, BB109
    j BB110
BB109: 
    j BB104
BB110: 
    j BB102
BB111: 
BB112: 
    la t1, $chat
    lw t1, 0(t1)
    sgtz t1, t1
    bnez t1, BB113
    j BB114
BB113: 
    call chapop
    mv t0, a0
    sw t0, -24(fp)
    la t0, $ii
    lw t0, 0(t0)
    lla t1, $get2
    slli t0, t0, 2
    add t0, t1, t0
    li t1, 32
    sw t1, 0(t0)
    la t1, $ii
    lw t1, 0(t1)
    addi t1, t1, 1
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -24(fp)
    sw t0, 0(t1)
    la t0, $ii
    lw t0, 0(t0)
    addi t0, t0, 2
    la t1, $ii
    sw t0, 0(t1)
    j BB112
BB114: 
    la t1, $ii
    lw t1, 0(t1)
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 64
    sw t0, 0(t1)
    li t0, 1
    la t1, $i
    sw t0, 0(t1)
    j BB115
BB115: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 64
    snez t1, t1
    bnez t1, BB116
    j BB117
BB116: 
    j BB118
BB117: 
    lla t1, $ints
    addi t1, fp, 4
    lw t1, 0(t1)
    mv a0, t1
    call putint
    li t1, 0
    mv a0, t1
    j BB171
BB118: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 43
    seqz t1, t1
    bnez t1, BB126
    j BB125
BB119: 
    call intpop
    mv t0, a0
    sw t0, -28(fp)
    call intpop
    mv t0, a0
    sw t0, -32(fp)
    li t0, 0
    sw t0, -36(fp)
    j BB127
BB120: 
    la t1, $i
    lw t1, 0(t1)
    addi t1, t1, 1
    la t0, $i
    sw t1, 0(t0)
    j BB115
BB121: 
    j BB145
BB122: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 94
    seqz t1, t1
    bnez t1, BB119
    j BB121
BB123: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 37
    seqz t1, t1
    bnez t1, BB119
    j BB122
BB124: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 47
    seqz t1, t1
    bnez t1, BB119
    j BB123
BB125: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 42
    seqz t1, t1
    bnez t1, BB119
    j BB124
BB126: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 45
    seqz t1, t1
    bnez t1, BB119
    j BB125
BB127: 
    la t0, $i
    lw t0, 0(t0)
    lla t1, $get2
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 43
    seqz t0, t0
    bnez t0, BB128
    j BB129
BB128: 
    lw t1, -28(fp)
    lw t0, -32(fp)
    add t0, t1, t0
    sw t0, -36(fp)
    j BB129
BB129: 
    j BB130
BB130: 
    la t0, $i
    lw t0, 0(t0)
    lla t1, $get2
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 45
    seqz t0, t0
    bnez t0, BB131
    j BB132
BB131: 
    lw t0, -32(fp)
    lw t1, -28(fp)
    sub t1, t0, t1
    sw t1, -36(fp)
    j BB132
BB132: 
    j BB133
BB133: 
    la t0, $i
    lw t0, 0(t0)
    lla t1, $get2
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 42
    seqz t0, t0
    bnez t0, BB134
    j BB135
BB134: 
    lw t1, -28(fp)
    lw t0, -32(fp)
    mul t0, t1, t0
    sw t0, -36(fp)
    j BB135
BB135: 
    j BB136
BB136: 
    la t0, $i
    lw t0, 0(t0)
    lla t1, $get2
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 47
    seqz t0, t0
    bnez t0, BB137
    j BB138
BB137: 
    lw t0, -32(fp)
    lw t1, -28(fp)
    div t1, t0, t1
    sw t1, -36(fp)
    j BB138
BB138: 
    j BB139
BB139: 
    la t0, $i
    lw t0, 0(t0)
    lla t1, $get2
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 37
    seqz t0, t0
    bnez t0, BB140
    j BB141
BB140: 
    lw t1, -32(fp)
    lw t0, -28(fp)
    rem t0, t1, t0
    sw t0, -36(fp)
    j BB141
BB141: 
    j BB142
BB142: 
    la t0, $i
    lw t0, 0(t0)
    lla t1, $get2
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 94
    seqz t0, t0
    bnez t0, BB143
    j BB144
BB143: 
    lw t0, -32(fp)
    lw t1, -28(fp)
    mv a0, t0
    mv a1, t1
    call power
    mv t1, a0
    sw t1, -36(fp)
    j BB144
BB144: 
    lw t0, -36(fp)
    mv a0, t0
    call intpush
    j BB120
BB145: 
    la t1, $i
    lw t1, 0(t1)
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 32
    snez t1, t1
    bnez t1, BB146
    j BB147
BB146: 
    la t0, $i
    lw t0, 0(t0)
    lla t1, $get2
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    addi t0, t0, -48
    mv a0, t0
    call intpush
    li t0, 1
    la t1, $ii
    sw t0, 0(t1)
    j BB148
BB147: 
    j BB120
BB148: 
    la t1, $i
    lw t1, 0(t1)
    la t0, $ii
    lw t0, 0(t0)
    add t0, t1, t0
    lla t1, $get2
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    xori t0, t0, 32
    snez t0, t0
    bnez t0, BB149
    j BB150
BB149: 
    la t0, $i
    lw t0, 0(t0)
    la t1, $ii
    lw t1, 0(t1)
    add t1, t0, t1
    lla t0, $get2
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    addi t1, t1, -48
    mv a0, t1
    call intadd
    la t1, $ii
    lw t1, 0(t1)
    addi t1, t1, 1
    la t0, $ii
    sw t1, 0(t0)
    j BB148
BB150: 
    la t0, $i
    lw t0, 0(t0)
    la t1, $ii
    lw t1, 0(t1)
    add t1, t0, t1
    addi t1, t1, -1
    la t0, $i
    sw t1, 0(t0)
    j BB147
BB171: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
