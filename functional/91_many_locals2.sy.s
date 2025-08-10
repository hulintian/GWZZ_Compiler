    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$n:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
main: 
BB5: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -176
    addi fp, sp, 176
    j BB0
BB0: 
    call getint
    mv t0, a0
    sw t0, -140(fp)
    j BB1
BB1: 
    lw t0, -140(fp)
    xori t0, t0, 5
    seqz t0, t0
    bnez t0, BB2
    j BB3
BB2: 
    lw t0, -140(fp)
    addi t0, t0, 1
    sw t0, -140(fp)
    j BB1
BB3: 
    li t0, 0
    sw t0, -20(fp)
    lw t0, -20(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -28(fp)
    lw t0, -28(fp)
    addi t0, t0, 1
    sw t0, -32(fp)
    lw t0, -32(fp)
    addi t0, t0, 1
    sw t0, -36(fp)
    lw t0, -36(fp)
    addi t0, t0, 1
    sw t0, -40(fp)
    lw t0, -40(fp)
    addi t0, t0, 1
    sw t0, -44(fp)
    lw t0, -44(fp)
    addi t0, t0, 1
    sw t0, -48(fp)
    lw t0, -48(fp)
    addi t0, t0, 1
    sw t0, -52(fp)
    lw t0, -52(fp)
    addi t0, t0, 1
    sw t0, -56(fp)
    lw t0, -56(fp)
    addi t0, t0, 1
    sw t0, -60(fp)
    lw t0, -60(fp)
    addi t0, t0, 1
    sw t0, -64(fp)
    lw t0, -64(fp)
    addi t0, t0, 1
    sw t0, -68(fp)
    lw t0, -68(fp)
    addi t0, t0, 1
    sw t0, -72(fp)
    lw t0, -72(fp)
    addi t0, t0, 1
    sw t0, -76(fp)
    lw t0, -76(fp)
    addi t0, t0, 1
    sw t0, -80(fp)
    lw t0, -80(fp)
    addi t0, t0, 1
    sw t0, -84(fp)
    lw t0, -84(fp)
    addi t0, t0, 1
    sw t0, -88(fp)
    lw t0, -88(fp)
    addi t0, t0, 1
    sw t0, -92(fp)
    lw t0, -92(fp)
    addi t0, t0, 1
    sw t0, -96(fp)
    lw t0, -96(fp)
    addi t0, t0, 1
    sw t0, -100(fp)
    lw t0, -100(fp)
    addi t0, t0, 1
    sw t0, -104(fp)
    lw t0, -104(fp)
    addi t0, t0, 1
    sw t0, -108(fp)
    lw t0, -108(fp)
    addi t0, t0, 1
    sw t0, -112(fp)
    lw t0, -112(fp)
    addi t0, t0, 1
    sw t0, -116(fp)
    lw t0, -116(fp)
    addi t0, t0, 1
    sw t0, -120(fp)
    lw t0, -120(fp)
    addi t0, t0, 1
    sw t0, -124(fp)
    lw t0, -124(fp)
    addi t0, t0, 1
    sw t0, -128(fp)
    lw t0, -128(fp)
    addi t0, t0, 1
    sw t0, -132(fp)
    lw t0, -132(fp)
    addi t0, t0, 1
    sw t0, -136(fp)
    lw t0, -20(fp)
    mv a0, t0
    call putint
    lw t0, -24(fp)
    mv a0, t0
    call putint
    lw t0, -28(fp)
    mv a0, t0
    call putint
    lw t0, -32(fp)
    mv a0, t0
    call putint
    lw t0, -36(fp)
    mv a0, t0
    call putint
    lw t0, -40(fp)
    mv a0, t0
    call putint
    lw t0, -44(fp)
    mv a0, t0
    call putint
    lw t0, -48(fp)
    mv a0, t0
    call putint
    lw t0, -52(fp)
    mv a0, t0
    call putint
    lw t0, -56(fp)
    mv a0, t0
    call putint
    lw t0, -60(fp)
    mv a0, t0
    call putint
    lw t0, -64(fp)
    mv a0, t0
    call putint
    lw t0, -68(fp)
    mv a0, t0
    call putint
    lw t0, -72(fp)
    mv a0, t0
    call putint
    lw t0, -76(fp)
    mv a0, t0
    call putint
    lw t0, -80(fp)
    mv a0, t0
    call putint
    lw t0, -84(fp)
    mv a0, t0
    call putint
    lw t0, -88(fp)
    mv a0, t0
    call putint
    lw t0, -92(fp)
    mv a0, t0
    call putint
    lw t0, -96(fp)
    mv a0, t0
    call putint
    lw t0, -100(fp)
    mv a0, t0
    call putint
    lw t0, -104(fp)
    mv a0, t0
    call putint
    lw t0, -108(fp)
    mv a0, t0
    call putint
    lw t0, -112(fp)
    mv a0, t0
    call putint
    lw t0, -116(fp)
    mv a0, t0
    call putint
    lw t0, -120(fp)
    mv a0, t0
    call putint
    lw t0, -124(fp)
    mv a0, t0
    call putint
    lw t0, -128(fp)
    mv a0, t0
    call putint
    lw t0, -132(fp)
    mv a0, t0
    call putint
    lw t0, -136(fp)
    mv a0, t0
    call putint
    li t0, 10
    sw t0, -148(fp)
    lw t0, -148(fp)
    mv a0, t0
    call putch
    lw t0, -140(fp)
    mv a0, t0
    call putint
    lw t0, -148(fp)
    mv a0, t0
    call putch
    lw t0, -120(fp)
    mv a0, t0
    j BB6
BB6: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 176
    ret
