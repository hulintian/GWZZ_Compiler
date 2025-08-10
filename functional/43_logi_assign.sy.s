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
    j BB1
BB1: 
    la t0, $a
    lw t0, 0(t0)
    la t1, $b
    lw t1, 0(t1)
    xor t1, t0, t1
    seqz t1, t1
    bnez t1, BB5
    j BB4
BB2: 
    li t1, 1
    sw t1, -20(fp)
    j BB3
BB3: 
    lw t1, -20(fp)
    mv a0, t1
    j BB8
BB4: 
    li t1, 0
    sw t1, -20(fp)
    j BB3
BB5: 
    la t1, $a
    lw t1, 0(t1)
    xori t1, t1, 3
    snez t1, t1
    bnez t1, BB2
    j BB4
BB8: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
