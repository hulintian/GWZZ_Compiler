    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
move: 
BB11: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB0
BB0: 
    lw t0, -20(fp)
    mv a0, t0
    call putint
    li t0, 32
    mv a0, t0
    call putch
    lw t0, -24(fp)
    mv a0, t0
    call putint
    li t0, 44
    mv a0, t0
    call putch
    li t0, 32
    mv a0, t0
    call putch
    j BB12
BB12: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
hanoi: 
BB13: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    sw a1, -24(fp)
    sw a2, -28(fp)
    sw a3, -32(fp)
    j BB1
BB1: 
    j BB2
BB2: 
    lw t0, -20(fp)
    xori t0, t0, 1
    seqz t0, t0
    bnez t0, BB3
    j BB5
BB3: 
    lw t0, -24(fp)
    lw t1, -32(fp)
    mv a0, t0
    mv a1, t1
    call move
    j BB4
BB4: 
    j BB14
BB5: 
    lw t0, -20(fp)
    addi t0, t0, -1
    lw t1, -24(fp)
    lw t2, -32(fp)
    lw t3, -28(fp)
    mv a0, t0
    mv a1, t1
    mv a2, t2
    mv a3, t3
    call hanoi
    lw t3, -24(fp)
    lw t2, -32(fp)
    mv a0, t3
    mv a1, t2
    call move
    lw t2, -20(fp)
    addi t2, t2, -1
    lw t3, -28(fp)
    lw t1, -24(fp)
    lw t0, -32(fp)
    mv a0, t2
    mv a1, t3
    mv a2, t1
    mv a3, t0
    call hanoi
    j BB4
BB14: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB15: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB6
BB6: 
    call getint
    mv t0, a0
    sw t0, -20(fp)
    j BB7
BB7: 
    lw t0, -20(fp)
    sgtz t0, t0
    bnez t0, BB8
    j BB9
BB8: 
    call getint
    mv t0, a0
    mv a0, t0
    li t0, 1
    mv a1, t0
    li t0, 2
    mv a2, t0
    li t0, 3
    mv a3, t0
    call hanoi
    li t0, 10
    mv a0, t0
    call putch
    lw t0, -20(fp)
    addi t0, t0, -1
    sw t0, -20(fp)
    j BB7
BB9: 
    li t0, 0
    mv a0, t0
    j BB16
BB16: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
