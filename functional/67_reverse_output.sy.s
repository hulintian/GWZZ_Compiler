    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
reverse: 
BB7: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    j BB0
BB0: 
    j BB1
BB1: 
    lw t0, -20(fp)
    li t1, 1
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB2
    j BB4
BB2: 
    call getint
    mv t1, a0
    sw t1, -24(fp)
    lw t1, -24(fp)
    mv a0, t1
    call putint
    j BB3
BB3: 
    j BB8
BB4: 
    call getint
    mv t1, a0
    sw t1, -24(fp)
    lw t1, -20(fp)
    addi t1, t1, -1
    mv a0, t1
    call reverse
    lw t1, -24(fp)
    mv a0, t1
    call putint
    j BB3
BB8: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB9: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB5
BB5: 
    li t0, 200
    sw t0, -20(fp)
    lw t0, -20(fp)
    mv a0, t0
    call reverse
    li t0, 0
    mv a0, t0
    j BB10
BB10: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
