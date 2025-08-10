    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
foo: 
BB3: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -160
    addi fp, sp, 160
    j BB0
BB0: 
    addi t0, fp, -80
    li t1, 0
    sw t1, 0(t0)
    addi t1, fp, -76
    li t0, 1
    sw t0, 0(t1)
    addi t0, fp, -72
    li t1, 2
    sw t1, 0(t0)
    addi t0, fp, -68
    li t1, 3
    sw t1, 0(t0)
    addi t1, fp, -64
    li t0, 0
    sw t0, 0(t1)
    addi t0, fp, -60
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -56
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -52
    li t1, 3
    sw t1, 0(t0)
    addi t1, fp, -48
    li t0, 0
    sw t0, 0(t1)
    addi t0, fp, -44
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -40
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -36
    li t1, 3
    sw t1, 0(t0)
    addi t1, fp, -32
    li t0, 0
    sw t0, 0(t1)
    addi t0, fp, -28
    li t1, 1
    sw t1, 0(t0)
    addi t1, fp, -24
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -20
    li t1, 3
    sw t1, 0(t0)
    li t1, 3
    sw t1, -84(fp)
    li t1, 7
    sw t1, -88(fp)
    li t1, 5
    sw t1, -92(fp)
    li t1, 6
    sw t1, -96(fp)
    li t1, 1
    sw t1, -100(fp)
    li t1, 0
    sw t1, -104(fp)
    li t1, 3
    sw t1, -108(fp)
    li t1, 5
    sw t1, -112(fp)
    li t1, 4
    sw t1, -116(fp)
    li t1, 2
    sw t1, -120(fp)
    li t1, 7
    sw t1, -124(fp)
    li t1, 9
    sw t1, -128(fp)
    li t1, 8
    sw t1, -132(fp)
    li t1, 1
    sw t1, -136(fp)
    li t1, 4
    sw t1, -140(fp)
    li t1, 6
    sw t1, -144(fp)
    lw t1, -84(fp)
    lw t0, -88(fp)
    add t0, t1, t0
    lw t1, -92(fp)
    add t1, t0, t1
    lw t0, -96(fp)
    add t0, t1, t0
    lw t1, -100(fp)
    add t1, t0, t1
    lw t0, -104(fp)
    add t0, t1, t0
    lw t1, -108(fp)
    add t1, t0, t1
    lw t0, -112(fp)
    add t0, t1, t0
    sw t0, -148(fp)
    lw t0, -116(fp)
    lw t1, -120(fp)
    add t1, t0, t1
    lw t0, -124(fp)
    add t0, t1, t0
    lw t1, -128(fp)
    add t1, t0, t1
    lw t0, -132(fp)
    add t0, t1, t0
    lw t1, -136(fp)
    add t1, t0, t1
    lw t0, -140(fp)
    add t0, t1, t0
    lw t1, -144(fp)
    add t1, t0, t1
    sw t1, -152(fp)
    lw t1, -148(fp)
    lw t0, -152(fp)
    add t0, t1, t0
    lw t1, -84(fp)
    slli t1, t1, 2
    addi t2, fp, -80
    add t2, t2, t1
    lw t2, 0(t2)
    add t2, t0, t2
    mv a0, t2
    j BB4
BB4: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 160
    ret
    .align 1
main: 
BB5: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -144
    addi fp, sp, 144
    j BB1
BB1: 
    li t0, 3
    sw t0, -20(fp)
    li t0, 7
    sw t0, -24(fp)
    li t0, 5
    sw t0, -28(fp)
    li t0, 6
    sw t0, -32(fp)
    li t0, 1
    sw t0, -36(fp)
    li t0, 0
    sw t0, -40(fp)
    li t0, 3
    sw t0, -44(fp)
    li t0, 5
    sw t0, -48(fp)
    li t0, 4
    sw t0, -52(fp)
    li t0, 2
    sw t0, -56(fp)
    li t0, 7
    sw t0, -60(fp)
    li t0, 9
    sw t0, -64(fp)
    li t0, 8
    sw t0, -68(fp)
    li t0, 1
    sw t0, -72(fp)
    li t0, 4
    sw t0, -76(fp)
    li t0, 6
    sw t0, -80(fp)
    lw t0, -20(fp)
    lw t1, -24(fp)
    add t1, t0, t1
    lw t0, -28(fp)
    add t0, t1, t0
    lw t1, -32(fp)
    add t1, t0, t1
    lw t0, -36(fp)
    add t0, t1, t0
    lw t1, -40(fp)
    add t1, t0, t1
    lw t0, -44(fp)
    add t0, t1, t0
    lw t1, -48(fp)
    add t1, t0, t1
    sw t1, -84(fp)
    lw t1, -52(fp)
    lw t0, -56(fp)
    add t0, t1, t0
    lw t1, -60(fp)
    add t1, t0, t1
    lw t0, -64(fp)
    add t0, t1, t0
    lw t1, -68(fp)
    add t1, t0, t1
    lw t0, -72(fp)
    add t0, t1, t0
    lw t1, -76(fp)
    add t1, t0, t1
    lw t0, -80(fp)
    add t0, t1, t0
    sw t0, -88(fp)
    lw t0, -84(fp)
    call foo
    mv t1, a0
    add t1, t0, t1
    sw t1, -84(fp)
    li t1, 4
    sw t1, -92(fp)
    li t1, 7
    sw t1, -96(fp)
    li t1, 2
    sw t1, -100(fp)
    li t1, 5
    sw t1, -104(fp)
    li t1, 8
    sw t1, -108(fp)
    li t1, 0
    sw t1, -112(fp)
    li t1, 6
    sw t1, -116(fp)
    li t1, 3
    sw t1, -120(fp)
    lw t1, -88(fp)
    call foo
    mv t0, a0
    add t0, t1, t0
    sw t0, -88(fp)
    lw t0, -52(fp)
    sw t0, -20(fp)
    lw t0, -56(fp)
    sw t0, -24(fp)
    lw t0, -60(fp)
    sw t0, -28(fp)
    lw t0, -64(fp)
    sw t0, -32(fp)
    lw t0, -68(fp)
    sw t0, -36(fp)
    lw t0, -72(fp)
    sw t0, -40(fp)
    lw t0, -76(fp)
    sw t0, -44(fp)
    lw t0, -80(fp)
    sw t0, -48(fp)
    lw t0, -92(fp)
    lw t1, -96(fp)
    add t1, t0, t1
    lw t0, -100(fp)
    add t0, t1, t0
    lw t1, -104(fp)
    add t1, t0, t1
    lw t0, -108(fp)
    add t0, t1, t0
    lw t1, -112(fp)
    add t1, t0, t1
    lw t0, -116(fp)
    add t0, t1, t0
    lw t1, -120(fp)
    add t1, t0, t1
    sw t1, -124(fp)
    lw t1, -84(fp)
    lw t0, -88(fp)
    add t0, t1, t0
    lw t1, -124(fp)
    add t1, t0, t1
    sw t1, -128(fp)
    lw t1, -128(fp)
    mv a0, t1
    call putint
    li t1, 10
    mv a0, t1
    call putch
    li t1, 0
    mv a0, t1
    j BB6
BB6: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 144
    ret
