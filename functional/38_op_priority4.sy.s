    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$a:
    .skip 4
$b:
    .skip 4
$c:
    .skip 4
$d:
    .skip 4
$e:
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
    call getint
    mv t0, a0
    la t1, $a
    sw t0, 0(t1)
    call getint
    mv t1, a0
    la t0, $b
    sw t1, 0(t0)
    call getint
    mv t0, a0
    la t1, $c
    sw t0, 0(t1)
    call getint
    mv t0, a0
    la t1, $d
    sw t0, 0(t1)
    call getint
    mv t1, a0
    la t0, $e
    sw t1, 0(t0)
    li t0, 0
    sw t0, -20(fp)
    j BB1
BB1: 
    la t0, $a
    lw t0, 0(t0)
    la t1, $b
    lw t1, 0(t1)
    la t2, $c
    lw t2, 0(t2)
    mul t2, t1, t2
    sub t2, t0, t2
    la t0, $d
    lw t0, 0(t0)
    la t1, $a
    lw t1, 0(t1)
    la t3, $c
    lw t3, 0(t3)
    div t3, t1, t3
    sub t3, t0, t3
    xor t3, t2, t3
    snez t3, t3
    bnez t3, BB5
    j BB4
BB2: 
    li t2, 1
    sw t2, -20(fp)
    j BB3
BB3: 
    lw t2, -20(fp)
    mv a0, t2
    j BB8
BB4: 
    la t0, $a
    lw t0, 0(t0)
    la t3, $b
    lw t3, 0(t3)
    add t3, t0, t3
    la t0, $c
    lw t0, 0(t0)
    add t0, t3, t0
    la t3, $d
    lw t3, 0(t3)
    la t2, $e
    lw t2, 0(t2)
    add t2, t3, t2
    xor t2, t0, t2
    seqz t2, t2
    bnez t2, BB2
    j BB3
BB5: 
    la t3, $a
    lw t3, 0(t3)
    la t2, $b
    lw t2, 0(t2)
    mul t2, t3, t2
    la t3, $c
    lw t3, 0(t3)
    div t3, t2, t3
    la t2, $e
    lw t2, 0(t2)
    la t0, $d
    lw t0, 0(t0)
    add t0, t2, t0
    xor t0, t3, t0
    seqz t0, t0
    bnez t0, BB2
    j BB4
BB8: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
