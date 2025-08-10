    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$array:
    .skip 440
$n:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
init: 
BB54: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB0
BB0: 
    li t0, 1
    sw t0, -24(fp)
    j BB1
BB1: 
    lw t0, -24(fp)
    lw t1, -20(fp)
    lw t2, -20(fp)
    mul t2, t1, t2
    addi t2, t2, 1
    slt t2, t2, t0
    xori t2, t2, 1
    bnez t2, BB2
    j BB3
BB2: 
    lw t2, -24(fp)
    lla t0, $array
    slli t2, t2, 2
    add t2, t0, t2
    li t0, 0
    addi t0, t0, -1
    sw t0, 0(t2)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB1
BB3: 
    j BB55
BB55: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
findfa: 
BB56: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    j BB4
BB4: 
    j BB5
BB5: 
    lw t0, -20(fp)
    lla t1, $array
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    lw t1, -20(fp)
    xor t0, t0, t1
    seqz t0, t0
    bnez t0, BB6
    j BB8
BB6: 
    lw t1, -20(fp)
    mv a0, t1
    j BB57
BB7: 
BB8: 
    lw t0, -20(fp)
    lla t1, $array
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -20(fp)
    lla t2, $array
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    mv a0, t1
    call findfa
    mv t1, a0
    sw t1, 0(t0)
    lw t1, -20(fp)
    lla t0, $array
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    mv a0, t1
    j BB57
BB57: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
mmerge: 
BB58: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB9
BB9: 
    lw t0, -20(fp)
    mv a0, t0
    call findfa
    mv t0, a0
    sw t0, -28(fp)
    lw t0, -24(fp)
    mv a0, t0
    call findfa
    mv t0, a0
    sw t0, -32(fp)
    j BB10
BB10: 
    lw t0, -28(fp)
    lw t1, -32(fp)
    xor t0, t0, t1
    snez t0, t0
    bnez t0, BB11
    j BB12
BB11: 
    lw t0, -28(fp)
    lla t1, $array
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -32(fp)
    sw t1, 0(t0)
    j BB12
BB12: 
    j BB59
BB59: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB60: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -80
    addi fp, sp, 80
    j BB13
BB13: 
    li t0, 1
    sw t0, -20(fp)
    j BB14
BB14: 
    lw t0, -20(fp)
    seqz t0, t0
    bnez t0, BB15
    j BB16
BB15: 
    lw t0, -20(fp)
    addi t0, t0, -1
    sw t0, -20(fp)
    li t0, 4
    la t1, $n
    sw t0, 0(t1)
    li t1, 10
    sw t1, -24(fp)
    li t1, 0
    sw t1, -36(fp)
    li t1, 0
    sw t1, -40(fp)
    la t1, $n
    lw t1, 0(t1)
    mv a0, t1
    call init
    la t1, $n
    lw t1, 0(t1)
    la t0, $n
    lw t0, 0(t0)
    mul t0, t1, t0
    addi t0, t0, 1
    sw t0, -44(fp)
    j BB17
BB16: 
    li t0, 0
    mv a0, t0
    j BB61
BB17: 
    lw t0, -36(fp)
    lw t1, -24(fp)
    slt t1, t0, t1
    bnez t1, BB18
    j BB19
BB18: 
    call getint
    mv t0, a0
    sw t0, -28(fp)
    call getint
    mv t0, a0
    sw t0, -32(fp)
    j BB20
BB19: 
    j BB50
BB20: 
    lw t0, -40(fp)
    li t1, 0
    xor t1, t1, t0
    snez t1, t1
    bnez t1, BB21
    j BB22
BB21: 
    la t1, $n
    lw t1, 0(t1)
    lw t0, -28(fp)
    addi t0, t0, -1
    mul t0, t1, t0
    lw t1, -32(fp)
    add t1, t0, t1
    sw t1, -48(fp)
    lw t1, -48(fp)
    lla t0, $array
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -48(fp)
    sw t0, 0(t1)
    j BB23
BB22: 
    lw t1, -36(fp)
    addi t1, t1, 1
    sw t1, -36(fp)
    j BB17
BB23: 
    lw t0, -28(fp)
    xori t0, t0, 1
    seqz t0, t0
    bnez t0, BB24
    j BB25
BB24: 
    lla t1, $array
    addi t1, fp, 0
    li t2, 0
    sw t2, 0(t1)
    lw t2, -48(fp)
    mv a0, t2
    li t2, 0
    mv a1, t2
    call mmerge
    j BB25
BB25: 
    j BB26
BB26: 
    lw t0, -28(fp)
    la t1, $n
    lw t1, 0(t1)
    xor t1, t0, t1
    seqz t1, t1
    bnez t1, BB27
    j BB28
BB27: 
    lw t1, -44(fp)
    lla t2, $array
    slli t1, t1, 2
    add t1, t2, t1
    lw t2, -44(fp)
    sw t2, 0(t1)
    lw t2, -48(fp)
    lw t1, -44(fp)
    mv a0, t2
    mv a1, t1
    call mmerge
    j BB28
BB28: 
    j BB29
BB29: 
    lw t1, -32(fp)
    la t0, $n
    lw t0, 0(t0)
    slt t0, t1, t0
    bnez t0, BB32
    j BB31
BB30: 
    lw t2, -48(fp)
    lw t1, -48(fp)
    addi t1, t1, 1
    mv a0, t2
    mv a1, t1
    call mmerge
    j BB31
BB31: 
    j BB33
BB32: 
    lw t0, -48(fp)
    addi t0, t0, 1
    lla t1, $array
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 0
    addi t1, t1, -1
    xor t1, t0, t1
    snez t1, t1
    bnez t1, BB30
    j BB31
BB33: 
    lw t1, -32(fp)
    li t0, 1
    slt t0, t0, t1
    bnez t0, BB36
    j BB35
BB34: 
    lw t1, -48(fp)
    lw t2, -48(fp)
    addi t2, t2, -1
    mv a0, t1
    mv a1, t2
    call mmerge
    j BB35
BB35: 
    j BB37
BB36: 
    lw t0, -48(fp)
    addi t0, t0, -1
    lla t1, $array
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 0
    addi t1, t1, -1
    xor t1, t0, t1
    snez t1, t1
    bnez t1, BB34
    j BB35
BB37: 
    lw t1, -28(fp)
    la t0, $n
    lw t0, 0(t0)
    slt t0, t1, t0
    bnez t0, BB40
    j BB39
BB38: 
    lw t2, -48(fp)
    lw t0, -48(fp)
    la t1, $n
    lw t1, 0(t1)
    add t1, t0, t1
    mv a0, t2
    mv a1, t1
    call mmerge
    j BB39
BB39: 
    j BB41
BB40: 
    lw t0, -48(fp)
    la t1, $n
    lw t1, 0(t1)
    add t1, t0, t1
    lla t0, $array
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -1
    xor t0, t1, t0
    snez t0, t0
    bnez t0, BB38
    j BB39
BB41: 
    lw t0, -28(fp)
    li t1, 1
    slt t1, t1, t0
    bnez t1, BB44
    j BB43
BB42: 
    lw t0, -48(fp)
    lw t1, -48(fp)
    la t2, $n
    lw t2, 0(t2)
    sub t2, t1, t2
    mv a0, t0
    mv a1, t2
    call mmerge
    j BB43
BB43: 
    j BB45
BB44: 
    lw t1, -48(fp)
    la t0, $n
    lw t0, 0(t0)
    sub t0, t1, t0
    lla t1, $array
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 0
    addi t1, t1, -1
    xor t1, t0, t1
    snez t1, t1
    bnez t1, BB42
    j BB43
BB45: 
    lla t1, $array
    addi t1, fp, 0
    lw t1, 0(t1)
    li t0, 0
    addi t0, t0, -1
    xor t0, t1, t0
    snez t0, t0
    bnez t0, BB49
    j BB47
BB46: 
    li t0, 1
    sw t0, -40(fp)
    lw t0, -36(fp)
    addi t0, t0, 1
    sw t0, -52(fp)
    lw t0, -52(fp)
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    j BB47
BB47: 
    j BB22
BB48: 
    li t1, 0
    mv a0, t1
    call findfa
    mv t1, a0
    lw t0, -44(fp)
    mv a0, t0
    call findfa
    mv t0, a0
    xor t0, t1, t0
    seqz t0, t0
    bnez t0, BB46
    j BB47
BB49: 
    lw t0, -44(fp)
    lla t1, $array
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 0
    addi t1, t1, -1
    xor t1, t0, t1
    snez t1, t1
    bnez t1, BB48
    j BB47
BB50: 
    lw t1, -40(fp)
    li t0, 0
    xor t0, t0, t1
    snez t0, t0
    bnez t0, BB51
    j BB52
BB51: 
    li t0, 0
    addi t0, t0, -1
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    j BB52
BB52: 
    j BB14
BB61: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 80
    ret
