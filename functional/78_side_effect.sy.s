    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $a
$a:
    .word 4294967295
    .globl $b
$b:
    .word 1
    .align 3
    .globl main
    .text

    .align 1
inc_a: 
BB17: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB0
BB0: 
    la t0, $a
    lw t0, 0(t0)
    sw t0, -20(fp)
    lw t0, -20(fp)
    addi t0, t0, 1
    sw t0, -20(fp)
    lw t0, -20(fp)
    la t1, $a
    sw t0, 0(t1)
    la t0, $a
    lw t0, 0(t0)
    mv a0, t0
    j BB18
BB18: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
main: 
BB19: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB1
BB1: 
    li t0, 5
    sw t0, -20(fp)
    j BB2
BB2: 
    lw t0, -20(fp)
    sltz t1, t0
    snez t1, t0
    bnez t1, BB3
    j BB4
BB3: 
    j BB5
BB4: 
    la t1, $a
    lw t1, 0(t1)
    mv a0, t1
    call putint
    li t1, 32
    mv a0, t1
    call putch
    la t1, $b
    lw t1, 0(t1)
    mv a0, t1
    call putint
    li t1, 10
    mv a0, t1
    call putch
    la t1, $a
    lw t1, 0(t1)
    mv a0, t1
    j BB20
BB5: 
    call inc_a
    mv t1, a0
    seqz t1, t1
    bnez t1, BB9
    j BB7
BB6: 
    la t0, $a
    lw t0, 0(t0)
    mv a0, t0
    call putint
    li t0, 32
    mv a0, t0
    call putch
    la t0, $b
    lw t0, 0(t0)
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    j BB7
BB7: 
    j BB10
BB8: 
    call inc_a
    mv t1, a0
    seqz t1, t1
    bnez t1, BB6
    j BB7
BB9: 
    call inc_a
    mv t1, a0
    seqz t1, t1
    bnez t1, BB8
    j BB7
BB10: 
    call inc_a
    mv t1, a0
    slti t1, t1, 14
    bnez t1, BB14
    j BB13
BB11: 
    la t0, $a
    lw t0, 0(t0)
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    la t0, $b
    lw t0, 0(t0)
    li t1, 2
    mul t1, t0, t1
    la t0, $b
    sw t1, 0(t0)
    j BB12
BB12: 
    lw t0, -20(fp)
    addi t0, t0, -1
    sw t0, -20(fp)
    j BB2
BB13: 
    call inc_a
    mv t0, a0
    j BB12
BB14: 
    call inc_a
    mv t1, a0
    seqz t1, t1
    bnez t1, BB15
    j BB13
BB15: 
    call inc_a
    mv t1, a0
    call inc_a
    mv t0, a0
    sub t0, t1, t0
    addi t0, t0, 1
    seqz t0, t0
    bnez t0, BB11
    j BB13
BB20: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
