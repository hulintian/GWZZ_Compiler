    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
if_if_Else: 
BB10: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB0
BB0: 
    li t0, 5
    sw t0, -20(fp)
    li t0, 10
    sw t0, -24(fp)
    j BB1
BB1: 
    lw t0, -20(fp)
    xori t0, t0, 5
    seqz t0, t0
    bnez t0, BB2
    j BB4
BB2: 
    j BB5
BB3: 
    lw t0, -20(fp)
    mv a0, t0
    j BB11
BB4: 
    lw t0, -20(fp)
    addi t0, t0, 15
    sw t0, -20(fp)
    j BB3
BB5: 
    lw t0, -24(fp)
    xori t0, t0, 10
    seqz t0, t0
    bnez t0, BB6
    j BB7
BB6: 
    li t0, 25
    sw t0, -20(fp)
    j BB7
BB7: 
    j BB3
BB11: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
main: 
BB12: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB8
BB8: 
    call if_if_Else
    mv t0, a0
    mv a0, t0
    j BB13
BB13: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
