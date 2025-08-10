    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $n
$n:
    .word 10
    .bss
    .align 3
$k:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
main: 
BB5: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB0
BB0: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 1
    la t1, $k
    sw t0, 0(t1)
    j BB1
BB1: 
    lw t1, -20(fp)
    la t0, $n
    lw t0, 0(t0)
    addi t0, t0, -1
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB2
    j BB3
BB2: 
    lw t0, -20(fp)
    addi t0, t0, 1
    sw t0, -20(fp)
    la t0, $k
    lw t0, 0(t0)
    addi t0, t0, 1
    la t0, $k
    lw t0, 0(t0)
    la t1, $k
    lw t1, 0(t1)
    add t1, t0, t1
    la t0, $k
    sw t1, 0(t0)
    j BB1
BB3: 
    la t0, $k
    lw t0, 0(t0)
    mv a0, t0
    call putint
    la t0, $k
    lw t0, 0(t0)
    mv a0, t0
    j BB6
BB6: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
