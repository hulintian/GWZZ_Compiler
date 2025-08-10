    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $TAPE_LEN
$TAPE_LEN:
    .word 65536
    .globl $BUFFER_LEN
$BUFFER_LEN:
    .word 32768
    .bss
    .align 3
$tape:
    .skip 262144
$program:
    .skip 131072
$ptr11:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
read_program: 
BB48: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB0
BB0: 
    li t0, 0
    sw t0, -20(fp)
    call getint
    mv t0, a0
    sw t0, -24(fp)
    j BB1
BB1: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    slt t1, t0, t1
    bnez t1, BB2
    j BB3
BB2: 
    lw t0, -20(fp)
    lla t1, $program
    slli t0, t0, 2
    add t0, t1, t0
    call getch
    mv t1, a0
    sw t1, 0(t0)
    lw t1, -20(fp)
    addi t1, t1, 1
    sw t1, -20(fp)
    j BB1
BB3: 
    lw t1, -20(fp)
    lla t0, $program
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 0
    sw t0, 0(t1)
    j BB49
BB49: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
interpret: 
BB50: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    sd a0, -24(fp)
    j BB4
BB4: 
    li t0, 0
    sw t0, -36(fp)
    j BB5
BB5: 
    lw t0, -36(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    seqz t0, t0
    bnez t0, BB6
    j BB7
BB6: 
    lw t0, -36(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    sw t0, -28(fp)
    j BB8
BB7: 
    j BB51
BB8: 
    lw t0, -28(fp)
    xori t0, t0, 62
    seqz t0, t0
    bnez t0, BB9
    j BB11
BB9: 
    la t0, $ptr11
    lw t0, 0(t0)
    addi t0, t0, 1
    la t1, $ptr11
    sw t0, 0(t1)
    j BB10
BB10: 
    lw t0, -36(fp)
    addi t0, t0, 1
    sw t0, -36(fp)
    j BB5
BB11: 
    j BB12
BB12: 
    lw t0, -28(fp)
    xori t0, t0, 60
    seqz t0, t0
    bnez t0, BB13
    j BB15
BB13: 
    la t1, $ptr11
    lw t1, 0(t1)
    addi t1, t1, -1
    la t0, $ptr11
    sw t1, 0(t0)
    j BB14
BB14: 
    j BB10
BB15: 
    j BB16
BB16: 
    lw t0, -28(fp)
    xori t0, t0, 43
    seqz t0, t0
    bnez t0, BB17
    j BB19
BB17: 
    la t0, $ptr11
    lw t0, 0(t0)
    lla t1, $tape
    slli t0, t0, 2
    add t0, t1, t0
    la t1, $ptr11
    lw t1, 0(t1)
    lla t2, $tape
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    addi t1, t1, 1
    sw t1, 0(t0)
    j BB18
BB18: 
    j BB14
BB19: 
    j BB20
BB20: 
    lw t0, -28(fp)
    xori t0, t0, 45
    seqz t0, t0
    bnez t0, BB21
    j BB23
BB21: 
    la t1, $ptr11
    lw t1, 0(t1)
    lla t0, $tape
    slli t1, t1, 2
    add t1, t0, t1
    la t0, $ptr11
    lw t0, 0(t0)
    lla t2, $tape
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    addi t0, t0, -1
    sw t0, 0(t1)
    j BB22
BB22: 
    j BB18
BB23: 
    j BB24
BB24: 
    lw t0, -28(fp)
    xori t0, t0, 46
    seqz t0, t0
    bnez t0, BB25
    j BB27
BB25: 
    la t1, $ptr11
    lw t1, 0(t1)
    lla t0, $tape
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    mv a0, t1
    call putch
    j BB26
BB26: 
    j BB22
BB27: 
    j BB28
BB28: 
    lw t0, -28(fp)
    xori t0, t0, 44
    seqz t0, t0
    bnez t0, BB29
    j BB31
BB29: 
    la t0, $ptr11
    lw t0, 0(t0)
    lla t1, $tape
    slli t0, t0, 2
    add t0, t1, t0
    call getch
    mv t1, a0
    sw t1, 0(t0)
    j BB30
BB30: 
    j BB26
BB31: 
    j BB32
BB32: 
    lw t0, -28(fp)
    xori t0, t0, 93
    seqz t0, t0
    bnez t0, BB35
    j BB34
BB33: 
    li t0, 1
    sw t0, -32(fp)
    j BB36
BB34: 
    j BB30
BB35: 
    la t0, $ptr11
    lw t0, 0(t0)
    lla t1, $tape
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    seqz t0, t0
    bnez t0, BB33
    j BB34
BB36: 
    lw t0, -32(fp)
    sgtz t0, t0
    bnez t0, BB37
    j BB38
BB37: 
    lw t0, -36(fp)
    addi t0, t0, -1
    sw t0, -36(fp)
    lw t0, -36(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    sw t0, -28(fp)
    j BB39
BB38: 
    j BB34
BB39: 
    lw t0, -28(fp)
    xori t0, t0, 91
    seqz t0, t0
    bnez t0, BB40
    j BB42
BB40: 
    lw t0, -32(fp)
    addi t0, t0, -1
    sw t0, -32(fp)
    j BB41
BB41: 
    j BB36
BB42: 
    j BB43
BB43: 
    lw t0, -28(fp)
    xori t0, t0, 93
    seqz t0, t0
    bnez t0, BB44
    j BB45
BB44: 
    lw t0, -32(fp)
    addi t0, t0, 1
    sw t0, -32(fp)
    j BB45
BB45: 
    j BB41
BB51: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
    .align 1
main: 
BB52: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB46
BB46: 
    call read_program
    la t0, $program
    mv a0, t0
    call interpret
    li t0, 0
    mv a0, t0
    j BB53
BB53: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
