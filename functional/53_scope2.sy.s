    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$k:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
main: 
BB11: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB0
BB0: 
    li t0, 3389
    la t1, $k
    sw t0, 0(t1)
    j BB1
BB1: 
    la t1, $k
    lw t1, 0(t1)
    li t0, 10000
    slt t0, t1, t0
    bnez t0, BB2
    j BB3
BB2: 
    la t0, $k
    lw t0, 0(t0)
    addi t0, t0, 1
    la t1, $k
    sw t0, 0(t1)
    li t1, 112
    sw t1, -20(fp)
    j BB4
BB3: 
    lw t0, -20(fp)
    mv a0, t0
    j BB12
BB4: 
    lw t1, -20(fp)
    li t0, 10
    slt t0, t0, t1
    bnez t0, BB5
    j BB6
BB5: 
    lw t0, -20(fp)
    addi t0, t0, -88
    sw t0, -20(fp)
    j BB7
BB6: 
    lw t0, -20(fp)
    mv a0, t0
    call putint
    j BB3
BB7: 
    lw t0, -20(fp)
    slti t0, t0, 1000
    bnez t0, BB8
    j BB9
BB8: 
    li t0, 9
    sw t0, -24(fp)
    li t0, 11
    sw t0, -28(fp)
    li t0, 10
    sw t0, -24(fp)
    lw t0, -20(fp)
    lw t1, -24(fp)
    sub t1, t0, t1
    sw t1, -20(fp)
    li t1, 11
    sw t1, -32(fp)
    lw t1, -20(fp)
    lw t0, -32(fp)
    add t0, t1, t0
    lw t1, -28(fp)
    add t1, t0, t1
    sw t1, -20(fp)
    j BB9
BB9: 
    j BB4
BB12: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
