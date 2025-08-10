    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$ans:
    .skip 200
$sum:
    .skip 4
$n:
    .skip 4
$row:
    .skip 200
$line1:
    .skip 200
$line2:
    .skip 400
    .align 3
    .globl main
    .text

    .align 1
printans: 
BB25: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB0
BB0: 
    la t0, $sum
    lw t0, 0(t0)
    addi t0, t0, 1
    la t1, $sum
    sw t0, 0(t1)
    li t1, 1
    sw t1, -20(fp)
    j BB1
BB1: 
    lw t1, -20(fp)
    la t0, $n
    lw t0, 0(t0)
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB2
    j BB3
BB2: 
    lw t0, -20(fp)
    lla t1, $ans
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    mv a0, t0
    call putint
    j BB4
BB3: 
    j BB26
BB4: 
    lw t0, -20(fp)
    la t1, $n
    lw t1, 0(t1)
    xor t1, t0, t1
    seqz t1, t1
    bnez t1, BB5
    j BB7
BB5: 
    li t1, 10
    mv a0, t1
    call putch
    j BB26
BB6: 
    lw t1, -20(fp)
    addi t1, t1, 1
    sw t1, -20(fp)
    j BB1
BB7: 
    li t1, 32
    mv a0, t1
    call putch
    j BB6
BB26: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
f: 
BB27: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    j BB8
BB8: 
    li t0, 1
    sw t0, -24(fp)
    j BB9
BB9: 
    lw t0, -24(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB10
    j BB11
BB10: 
    j BB12
BB11: 
    j BB28
BB12: 
    lw t1, -24(fp)
    lla t0, $row
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    xori t1, t1, 1
    snez t1, t1
    bnez t1, BB16
    j BB14
BB13: 
    lw t1, -20(fp)
    lla t0, $ans
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -24(fp)
    sw t0, 0(t1)
    j BB17
BB14: 
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB9
BB15: 
    la t0, $n
    lw t0, 0(t0)
    lw t1, -20(fp)
    add t1, t0, t1
    lw t0, -24(fp)
    sub t0, t1, t0
    lla t1, $line2
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 0
    xor t1, t1, t0
    snez t1, t1
    bnez t1, BB13
    j BB14
BB16: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    add t0, t1, t0
    lla t1, $line1
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    seqz t0, t0
    bnez t0, BB15
    j BB14
BB17: 
    lw t0, -20(fp)
    la t1, $n
    lw t1, 0(t1)
    xor t1, t0, t1
    seqz t1, t1
    bnez t1, BB18
    j BB19
BB18: 
    call printans
    j BB19
BB19: 
    lw t1, -24(fp)
    lla t0, $row
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 1
    sw t0, 0(t1)
    lw t0, -20(fp)
    lw t1, -24(fp)
    add t1, t0, t1
    lla t0, $line1
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 1
    sw t0, 0(t1)
    la t0, $n
    lw t0, 0(t0)
    lw t1, -20(fp)
    add t1, t0, t1
    lw t0, -24(fp)
    sub t0, t1, t0
    lla t1, $line2
    slli t0, t0, 2
    add t0, t1, t0
    li t1, 1
    sw t1, 0(t0)
    lw t1, -20(fp)
    addi t1, t1, 1
    mv a0, t1
    call f
    lw t1, -24(fp)
    lla t0, $row
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 0
    sw t0, 0(t1)
    lw t0, -20(fp)
    lw t1, -24(fp)
    add t1, t0, t1
    lla t0, $line1
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 0
    sw t0, 0(t1)
    la t0, $n
    lw t0, 0(t0)
    lw t1, -20(fp)
    add t1, t0, t1
    lw t0, -24(fp)
    sub t0, t1, t0
    lla t1, $line2
    slli t0, t0, 2
    add t0, t1, t0
    li t1, 0
    sw t1, 0(t0)
    j BB14
BB28: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB29: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB20
BB20: 
    call getint
    mv t0, a0
    sw t0, -20(fp)
    j BB21
BB21: 
    lw t0, -20(fp)
    sgtz t0, t0
    bnez t0, BB22
    j BB23
BB22: 
    call getint
    mv t0, a0
    la t1, $n
    sw t0, 0(t1)
    li t1, 1
    mv a0, t1
    call f
    lw t1, -20(fp)
    addi t1, t1, -1
    sw t1, -20(fp)
    j BB21
BB23: 
    la t0, $sum
    lw t0, 0(t0)
    mv a0, t0
    j BB30
BB30: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
