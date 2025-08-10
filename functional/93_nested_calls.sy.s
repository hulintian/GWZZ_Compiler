    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
func1: 
BB37: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    sw a1, -24(fp)
    sw a2, -28(fp)
    j BB0
BB0: 
    j BB1
BB1: 
    lw t0, -28(fp)
    seqz t0, t0
    bnez t0, BB2
    j BB4
BB2: 
    lw t2, -20(fp)
    lw t0, -24(fp)
    mul t0, t2, t0
    mv a0, t0
    j BB38
BB3: 
BB4: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    lw t2, -28(fp)
    sub t2, t1, t2
    mv a0, t0
    mv a1, t2
    li t2, 0
    mv a2, t2
    call func1
    mv t2, a0
    mv a0, t2
    j BB38
BB38: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
func2: 
BB39: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB5
BB5: 
    j BB6
BB6: 
    lw t0, -24(fp)
    seqz t0, t0
    bnez t0, BB7
    j BB9
BB7: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    rem t1, t0, t1
    mv a0, t1
    li t1, 0
    mv a1, t1
    call func2
    mv t1, a0
    mv a0, t1
    j BB40
BB8: 
BB9: 
    lw t0, -20(fp)
    mv a0, t0
    j BB40
BB40: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
func3: 
BB41: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB10
BB10: 
    j BB11
BB11: 
    lw t0, -24(fp)
    seqz t0, t0
    bnez t0, BB12
    j BB14
BB12: 
    lw t1, -20(fp)
    addi t1, t1, 1
    mv a0, t1
    j BB42
BB13: 
BB14: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    add t1, t0, t1
    mv a0, t1
    li t1, 0
    mv a1, t1
    call func3
    mv t1, a0
    mv a0, t1
    j BB42
BB42: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
func4: 
BB43: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    sw a1, -24(fp)
    sw a2, -28(fp)
    j BB15
BB15: 
    j BB16
BB16: 
    lw t0, -20(fp)
    seqz t0, t0
    bnez t0, BB17
    j BB19
BB17: 
    lw t0, -24(fp)
    mv a0, t0
    j BB44
BB18: 
BB19: 
    lw t0, -28(fp)
    mv a0, t0
    j BB44
BB44: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
func5: 
BB45: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB20
BB20: 
    lw t0, -20(fp)
    li t1, 0
    sub t1, t1, t0
    mv a0, t1
    j BB46
BB46: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
func6: 
BB47: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB21
BB21: 
    j BB22
BB22: 
    lw t0, -20(fp)
    seqz t0, t0
    bnez t0, BB26
    j BB25
BB23: 
    li t0, 1
    mv a0, t0
    j BB48
BB24: 
BB25: 
    li t0, 0
    mv a0, t0
    j BB48
BB26: 
    lw t0, -24(fp)
    seqz t0, t0
    bnez t0, BB23
    j BB25
BB48: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
func7: 
BB49: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB27
BB27: 
    j BB28
BB28: 
    lw t0, -20(fp)
    li t1, 0
    xor t1, t1, t0
    snez t1, t1
    bnez t1, BB29
    j BB31
BB29: 
    li t1, 1
    mv a0, t1
    j BB50
BB30: 
BB31: 
    li t1, 0
    mv a0, t1
    j BB50
BB50: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
main: 
BB51: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -96
    addi fp, sp, 96
    j BB32
BB32: 
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
    li t0, 0
    sw t0, -76(fp)
    j BB33
BB33: 
    lw t0, -76(fp)
    slti t0, t0, 10
    bnez t0, BB34
    j BB35
BB34: 
    lw t5, -76(fp)
    slli t5, t5, 2
    addi t0, fp, -72
    add t0, t0, t5
    call getint
    mv t5, a0
    sw t5, 0(t0)
    lw t5, -76(fp)
    addi t5, t5, 1
    sw t5, -76(fp)
    j BB33
BB35: 
    lw t0, -20(fp)
    mv a0, t0
    call func7
    mv t0, a0
    lw t1, -24(fp)
    mv a0, t1
    call func5
    mv t1, a0
    mv a0, t0
    mv a1, t1
    call func6
    mv t1, a0
    lw t0, -28(fp)
    mv a0, t1
    mv a1, t0
    call func2
    mv t0, a0
    lw t1, -32(fp)
    mv a0, t0
    mv a1, t1
    call func3
    mv t1, a0
    mv a0, t1
    call func5
    mv t1, a0
    addi t0, fp, -72
    lw t0, 0(t0)
    addi t2, fp, -68
    lw t2, 0(t2)
    mv a0, t2
    call func5
    mv t2, a0
    addi t3, fp, -64
    lw t3, 0(t3)
    addi t4, fp, -60
    lw t4, 0(t4)
    mv a0, t4
    call func7
    mv t4, a0
    mv a0, t3
    mv a1, t4
    call func6
    mv t4, a0
    addi t3, fp, -56
    lw t3, 0(t3)
    addi t5, fp, -52
    lw t5, 0(t5)
    mv a0, t5
    call func7
    mv t5, a0
    mv a0, t3
    mv a1, t5
    call func2
    mv t5, a0
    mv a0, t2
    mv a1, t4
    mv a2, t5
    call func4
    mv t5, a0
    addi t4, fp, -48
    lw t4, 0(t4)
    mv a0, t5
    mv a1, t4
    call func3
    mv t4, a0
    addi t5, fp, -44
    lw t5, 0(t5)
    mv a0, t4
    mv a1, t5
    call func2
    mv t5, a0
    addi t4, fp, -40
    lw t4, 0(t4)
    addi t2, fp, -36
    lw t2, 0(t2)
    mv a0, t2
    call func7
    mv t2, a0
    mv a0, t4
    mv a1, t2
    call func3
    mv t2, a0
    lw t4, -20(fp)
    mv a0, t5
    mv a1, t2
    mv a2, t4
    call func1
    mv t4, a0
    mv a0, t1
    mv a1, t0
    mv a2, t4
    call func4
    mv t4, a0
    lw t0, -24(fp)
    lw t1, -28(fp)
    mv a0, t1
    call func7
    mv t1, a0
    lw t2, -32(fp)
    mv a0, t1
    mv a1, t2
    call func3
    mv t2, a0
    mv a0, t0
    mv a1, t2
    call func2
    mv t2, a0
    mv a0, t4
    mv a1, t2
    call func3
    mv t2, a0
    addi t4, fp, -72
    lw t4, 0(t4)
    addi t0, fp, -68
    lw t0, 0(t0)
    mv a0, t2
    mv a1, t4
    mv a2, t0
    call func1
    mv t0, a0
    addi t4, fp, -64
    lw t4, 0(t4)
    mv a0, t0
    mv a1, t4
    call func2
    mv t4, a0
    addi t0, fp, -60
    lw t0, 0(t0)
    addi t2, fp, -56
    lw t2, 0(t2)
    addi t1, fp, -52
    lw t1, 0(t1)
    mv a0, t1
    call func5
    mv t1, a0
    mv a0, t2
    mv a1, t1
    call func3
    mv t1, a0
    addi t2, fp, -48
    lw t2, 0(t2)
    mv a0, t2
    call func5
    mv t2, a0
    mv a0, t1
    mv a1, t2
    call func2
    mv t2, a0
    addi t1, fp, -44
    lw t1, 0(t1)
    addi t5, fp, -40
    lw t5, 0(t5)
    mv a0, t5
    call func7
    mv t5, a0
    mv a0, t2
    mv a1, t1
    mv a2, t5
    call func1
    mv t5, a0
    addi t1, fp, -36
    lw t1, 0(t1)
    mv a0, t1
    call func5
    mv t1, a0
    mv a0, t5
    mv a1, t1
    call func2
    mv t1, a0
    lw t5, -20(fp)
    mv a0, t1
    mv a1, t5
    call func3
    mv t5, a0
    mv a0, t4
    mv a1, t0
    mv a2, t5
    call func1
    mv t5, a0
    sw t5, -80(fp)
    lw t5, -80(fp)
    mv a0, t5
    j BB52
BB52: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 96
    ret
