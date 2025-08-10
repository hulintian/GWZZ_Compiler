    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$g:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
func: 
BB28: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    j BB0
BB0: 
    la t0, $g
    lw t0, 0(t0)
    lw t1, -20(fp)
    add t1, t0, t1
    la t0, $g
    sw t1, 0(t0)
    la t0, $g
    lw t0, 0(t0)
    mv a0, t0
    call putint
    la t0, $g
    lw t0, 0(t0)
    mv a0, t0
    j BB29
BB29: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB30: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB1
BB1: 
    call getint
    mv t0, a0
    sw t0, -20(fp)
    j BB2
BB2: 
    lw t0, -20(fp)
    li t1, 10
    slt t1, t1, t0
    bnez t1, BB6
    j BB5
BB3: 
    li t1, 1
    sw t1, -20(fp)
    j BB4
BB4: 
    call getint
    mv t1, a0
    sw t1, -20(fp)
    j BB7
BB5: 
    li t1, 0
    sw t1, -20(fp)
    j BB4
BB6: 
    lw t1, -20(fp)
    mv a0, t1
    call func
    mv t1, a0
    seqz t1, t1
    bnez t1, BB3
    j BB5
BB7: 
    lw t1, -20(fp)
    li t0, 11
    slt t0, t0, t1
    bnez t0, BB11
    j BB10
BB8: 
    li t1, 1
    sw t1, -20(fp)
    j BB9
BB9: 
    call getint
    mv t0, a0
    sw t0, -20(fp)
    j BB12
BB10: 
    li t0, 0
    sw t0, -20(fp)
    j BB9
BB11: 
    lw t0, -20(fp)
    mv a0, t0
    call func
    mv t0, a0
    seqz t0, t0
    bnez t0, BB8
    j BB10
BB12: 
    lw t0, -20(fp)
    li t1, 99
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB16
    j BB15
BB13: 
    li t1, 1
    sw t1, -20(fp)
    j BB14
BB14: 
    call getint
    mv t1, a0
    sw t1, -20(fp)
    j BB17
BB15: 
    li t1, 0
    sw t1, -20(fp)
    j BB14
BB16: 
    lw t1, -20(fp)
    mv a0, t1
    call func
    mv t1, a0
    seqz t1, t1
    bnez t1, BB13
    j BB15
BB17: 
    lw t1, -20(fp)
    li t0, 100
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB21
    j BB20
BB18: 
    li t1, 1
    sw t1, -20(fp)
    j BB19
BB19: 
    j BB22
BB20: 
    li t0, 0
    sw t0, -20(fp)
    j BB19
BB21: 
    lw t0, -20(fp)
    mv a0, t0
    call func
    mv t0, a0
    seqz t0, t0
    bnez t0, BB18
    j BB20
BB22: 
    li t0, 99
    mv a0, t0
    call func
    mv t0, a0
    li t1, 0
    xor t1, t1, t0
    snez t1, t1
    bnez t1, BB26
    j BB25
BB23: 
    li t1, 1
    sw t1, -20(fp)
    j BB24
BB24: 
    li t1, 0
    mv a0, t1
    j BB31
BB25: 
    li t1, 0
    sw t1, -20(fp)
    j BB24
BB26: 
    li t1, 100
    mv a0, t1
    call func
    mv t1, a0
    seqz t1, t1
    bnez t1, BB23
    j BB25
BB31: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
