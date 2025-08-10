    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $b
$b:
    .word 5
    .globl $c
$c:
    .word 6
    .word 7
    .word 8
    .word 9
    .align 3
    .globl main
    .text

    .align 1
main: 
BB12: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -256
    addi fp, sp, 256
    j BB0
BB1: 
    lw t0, -20(fp)
    slti t0, t0, 5
    bnez t0, BB2
    j BB3
BB0: 
    li t0, 1
    sw t0, -20(fp)
    li t0, 2
    sw t0, -24(fp)
    li t0, 3
    sw t0, -24(fp)
    lw t0, -24(fp)
    mv a0, t0
    call putint
    lw t0, -24(fp)
    mv a0, t0
    call putint
    lw t0, -20(fp)
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    j BB1
BB2: 
    li t0, 0
    sw t0, -28(fp)
    lw t0, -28(fp)
    addi t0, t0, 1
    sw t0, -28(fp)
    j BB4
BB3: 
    lw t0, -20(fp)
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    lla t0, $c
    addi t0, fp, 8
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -92
    li t0, 0
    sw t0, 0(t1)
    addi t0, fp, -88
    li t1, 9
    sw t1, 0(t0)
    addi t1, fp, -60
    li t0, 8
    sw t0, 0(t1)
    addi t0, fp, -56
    li t1, 3
    sw t1, 0(t0)
    li t1, 2
    sw t1, -96(fp)
    j BB8
BB4: 
    lw t0, -28(fp)
    seqz t0, t0
    bnez t0, BB5
    j BB6
BB5: 
    j BB3
BB6: 
    j BB1
BB7: 
BB8: 
    addi t1, fp, -84
    lw t1, 0(t1)
    seqz t1, t1
    bnez t1, BB9
    j BB10
BB9: 
    addi t1, fp, -196
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -192
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -188
    li t0, 8
    sw t0, 0(t1)
    lw t0, -96(fp)
    li t1, 5
    mul t1, t0, t1
    li t0, 0
    li t2, 5
    mul t2, t0, t2
    add t2, t1, t2
    slli t2, t2, 2
    addi t1, fp, -236
    add t1, t1, t2
    lw t1, 0(t1)
    mv a0, t1
    call putint
    lw t1, -96(fp)
    li t2, 5
    mul t2, t1, t2
    li t1, 0
    li t0, 5
    mul t0, t1, t0
    add t0, t2, t0
    addi t0, t0, 1
    slli t0, t0, 2
    addi t2, fp, -236
    add t2, t2, t0
    lw t2, 0(t2)
    mv a0, t2
    call putint
    lw t2, -96(fp)
    li t0, 5
    mul t0, t2, t0
    li t2, 0
    li t1, 5
    mul t1, t2, t1
    add t1, t0, t1
    addi t1, t1, 2
    slli t1, t1, 2
    addi t0, fp, -236
    add t0, t0, t1
    lw t0, 0(t0)
    mv a0, t0
    call putint
    j BB10
BB10: 
    li t1, 10
    mv a0, t1
    call putch
    lw t1, -96(fp)
    mv a0, t1
    call putint
    li t1, 10
    mv a0, t1
    call putch
    addi t1, fp, -92
    lw t1, 0(t1)
    mv a0, t1
    call putint
    addi t1, fp, -88
    lw t1, 0(t1)
    mv a0, t1
    call putint
    addi t1, fp, -84
    lw t1, 0(t1)
    mv a0, t1
    call putint
    addi t1, fp, -80
    lw t1, 0(t1)
    mv a0, t1
    call putint
    li t1, 10
    mv a0, t1
    call putch
    li t1, 0
    mv a0, t1
    j BB13
BB13: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 256
    ret
