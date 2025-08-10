    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $a
$a:
    .word 1
    .globl $c
$c:
    .word 1
    .globl $d
$d:
    .word 2
    .globl $e
$e:
    .word 4
    .bss
    .align 3
$b:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
main: 
BB7: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB0
BB0: 
    li t0, 0
    sw t0, -20(fp)
    j BB1
BB1: 
    la t0, $a
    lw t0, 0(t0)
    la t1, $b
    lw t1, 0(t1)
    mul t1, t0, t1
    la t0, $c
    lw t0, 0(t0)
    div t0, t1, t0
    la t1, $e
    lw t1, 0(t1)
    la t2, $d
    lw t2, 0(t2)
    add t2, t1, t2
    xor t2, t0, t2
    seqz t2, t2
    bnez t2, BB5
    j BB4
BB2: 
    li t3, 1
    sw t3, -20(fp)
    j BB3
BB3: 
    lw t3, -20(fp)
    mv a0, t3
    call putint
    lw t3, -20(fp)
    mv a0, t3
    j BB8
BB4: 
    la t0, $a
    lw t0, 0(t0)
    la t2, $b
    lw t2, 0(t2)
    la t1, $c
    lw t1, 0(t1)
    mul t1, t2, t1
    sub t1, t0, t1
    la t0, $d
    lw t0, 0(t0)
    la t2, $a
    lw t2, 0(t2)
    la t3, $c
    lw t3, 0(t3)
    div t3, t2, t3
    sub t3, t0, t3
    xor t3, t1, t3
    seqz t3, t3
    bnez t3, BB2
    j BB3
BB5: 
    la t2, $a
    lw t2, 0(t2)
    la t0, $a
    lw t0, 0(t0)
    la t1, $b
    lw t1, 0(t1)
    add t1, t0, t1
    mul t1, t2, t1
    la t2, $c
    lw t2, 0(t2)
    add t2, t1, t2
    la t1, $d
    lw t1, 0(t1)
    la t0, $e
    lw t0, 0(t0)
    add t0, t1, t0
    slt t0, t0, t2
    xori t0, t0, 1
    bnez t0, BB2
    j BB4
BB8: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
