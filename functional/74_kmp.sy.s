    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
get_next: 
BB33: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    sd a1, -32(fp)
    j BB0
BB0: 
    ld t0, -32(fp)
    addi t0, t0, 0
    li t1, 0
    addi t1, t1, -1
    sw t1, 0(t0)
    li t1, 0
    sw t1, -36(fp)
    li t1, -1
    sw t1, -40(fp)
    j BB1
BB1: 
    lw t1, -36(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    seqz t1, t1
    bnez t1, BB2
    j BB3
BB2: 
    j BB4
BB3: 
    j BB34
BB4: 
    lw t1, -40(fp)
    li t0, 0
    addi t0, t0, -1
    xor t0, t1, t0
    seqz t0, t0
    bnez t0, BB8
    j BB7
BB5: 
    lw t1, -40(fp)
    addi t1, t1, 1
    sw t1, -40(fp)
    lw t1, -36(fp)
    addi t1, t1, 1
    sw t1, -36(fp)
    lw t1, -36(fp)
    ld t0, -32(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -40(fp)
    sw t0, 0(t1)
    j BB6
BB6: 
    j BB1
BB7: 
    lw t1, -40(fp)
    ld t0, -32(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    sw t1, -40(fp)
    j BB6
BB8: 
    lw t0, -36(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    lw t1, -40(fp)
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    xor t1, t0, t1
    seqz t1, t1
    bnez t1, BB5
    j BB7
BB34: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
KMP: 
BB35: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    li t0, -16448
    add sp, sp, t0
    li t0, 16448
    add fp, sp, t0
    sd a0, -24(fp)
    sd a1, -32(fp)
    j BB9
BB9: 
    addi t0, fp, -24
    mv a0, t0
    li t0, -16416
    add t0, t0, fp
    mv a1, t0
    call get_next
    li t0, 0
    li t1, -16420
    add t1, fp, t1
    sw t0, 0(t1)
    li t0, 0
    li t1, -16424
    add t1, fp, t1
    sw t0, 0(t1)
    j BB10
BB10: 
    li t1, -16424
    add t1, fp, t1
    lw t1, 0(t1)
    ld t0, -32(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    seqz t1, t1
    bnez t1, BB11
    j BB12
BB11: 
    j BB13
BB12: 
    li t1, 0
    addi t1, t1, -1
    mv a0, t1
    j BB36
BB13: 
    li t1, -16420
    add t1, fp, t1
    lw t1, 0(t1)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, -16424
    add t0, fp, t0
    lw t0, 0(t0)
    ld t2, -32(fp)
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    xor t0, t1, t0
    seqz t0, t0
    bnez t0, BB14
    j BB16
BB14: 
    li t1, -16420
    add t1, fp, t1
    lw t1, 0(t1)
    addi t1, t1, 1
    li t0, -16420
    add t0, fp, t0
    sw t1, 0(t0)
    li t0, -16424
    add t0, fp, t0
    lw t0, 0(t0)
    addi t0, t0, 1
    li t1, -16424
    add t1, fp, t1
    sw t0, 0(t1)
    j BB17
BB15: 
    j BB10
BB16: 
    li t0, -16420
    add t0, fp, t0
    lw t0, 0(t0)
    slli t0, t0, 2
    li t1, -16416
    add t1, t0, t1
    add t1, fp, t1
    lw t1, 0(t1)
    li t0, -16420
    add t0, fp, t0
    sw t1, 0(t0)
    j BB20
BB17: 
    li t1, -16420
    add t1, fp, t1
    lw t1, 0(t1)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    xor t0, t0, t1
    snez t0, t0
    bnez t0, BB18
    j BB19
BB18: 
    li t0, -16424
    add t0, fp, t0
    lw t0, 0(t0)
    mv a0, t0
    j BB36
BB19: 
    j BB15
BB20: 
    li t0, -16420
    add t0, fp, t0
    lw t0, 0(t0)
    li t1, 0
    addi t1, t1, -1
    xor t1, t0, t1
    seqz t1, t1
    bnez t1, BB21
    j BB22
BB21: 
    li t1, -16420
    add t1, fp, t1
    lw t1, 0(t1)
    addi t1, t1, 1
    li t0, -16420
    add t0, fp, t0
    sw t1, 0(t0)
    li t0, -16424
    add t0, fp, t0
    lw t0, 0(t0)
    addi t0, t0, 1
    li t1, -16424
    add t1, fp, t1
    sw t0, 0(t1)
    j BB22
BB22: 
    j BB15
BB36: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    li t0, 16448
    add sp, sp, t0
    ret
    .align 1
read_str: 
BB37: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    j BB23
BB23: 
    li t0, 0
    sw t0, -28(fp)
    j BB24
BB24: 
    li t0, 1
    seqz t0, t0
    bnez t0, BB25
    j BB26
BB25: 
    lw t0, -28(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    call getch
    mv t1, a0
    sw t1, 0(t0)
    j BB27
BB26: 
    lw t0, -28(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t1, t1, t0
    li t0, 0
    sw t0, 0(t1)
    lw t0, -28(fp)
    mv a0, t0
    j BB38
BB27: 
    lw t1, -28(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 10
    seqz t1, t1
    bnez t1, BB28
    j BB29
BB28: 
    j BB26
BB29: 
    lw t1, -28(fp)
    addi t1, t1, 1
    sw t1, -28(fp)
    j BB24
BB30: 
BB38: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB39: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    li t0, -32800
    add sp, sp, t0
    li t0, 32800
    add fp, sp, t0
    j BB31
BB31: 
    li t0, -16400
    add t0, t0, fp
    mv a0, t0
    call read_str
    mv t0, a0
    li t0, -32784
    add t0, t0, fp
    mv a0, t0
    call read_str
    mv t0, a0
    li t0, -16400
    add t0, t0, fp
    mv a0, t0
    li t0, -32784
    add t0, t0, fp
    mv a1, t0
    call KMP
    mv t0, a0
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    li t0, 0
    mv a0, t0
    j BB40
BB40: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    li t0, 32800
    add sp, sp, t0
    ret
