    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text

    .align 1
sort: 
BB22: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    sw a1, -28(fp)
    j BB0
BB0: 
    li t0, 0
    sw t0, -32(fp)
    j BB1
BB1: 
    lw t0, -32(fp)
    lw t1, -28(fp)
    addi t1, t1, -1
    slt t1, t0, t1
    bnez t1, BB2
    j BB3
BB2: 
    lw t1, -32(fp)
    addi t1, t1, 1
    sw t1, -36(fp)
    j BB4
BB3: 
    j BB23
BB4: 
    lw t1, -36(fp)
    lw t0, -28(fp)
    slt t0, t1, t0
    bnez t0, BB5
    j BB6
BB5: 
    j BB7
BB6: 
    lw t0, -32(fp)
    addi t0, t0, 1
    sw t0, -32(fp)
    j BB1
BB7: 
    lw t0, -32(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    lw t1, -36(fp)
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB8
    j BB9
BB8: 
    lw t1, -32(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    sw t1, -40(fp)
    lw t1, -32(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -36(fp)
    ld t2, -24(fp)
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    sw t0, 0(t1)
    lw t0, -36(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -40(fp)
    sw t1, 0(t0)
    j BB9
BB9: 
    lw t1, -36(fp)
    addi t1, t1, 1
    sw t1, -36(fp)
    j BB4
BB23: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
param32_rec: 
BB24: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -448
    addi fp, sp, 448
    sw a0, -20(fp)
    sw a1, -24(fp)
    sw a2, -28(fp)
    sw a3, -32(fp)
    sw a4, -36(fp)
    sw a5, -40(fp)
    sw a6, -44(fp)
    sw a7, -48(fp)
    lw t1, 8(fp)
    sw t1, -52(fp)
    lw t1, 16(fp)
    sw t1, -56(fp)
    lw t1, 24(fp)
    sw t1, -60(fp)
    lw t1, 32(fp)
    sw t1, -64(fp)
    lw t1, 40(fp)
    sw t1, -68(fp)
    lw t1, 48(fp)
    sw t1, -72(fp)
    lw t1, 56(fp)
    sw t1, -76(fp)
    lw t1, 64(fp)
    sw t1, -80(fp)
    lw t1, 72(fp)
    sw t1, -84(fp)
    lw t1, 80(fp)
    sw t1, -88(fp)
    lw t1, 88(fp)
    sw t1, -92(fp)
    lw t1, 96(fp)
    sw t1, -96(fp)
    lw t1, 104(fp)
    sw t1, -100(fp)
    lw t1, 112(fp)
    sw t1, -104(fp)
    lw t1, 120(fp)
    sw t1, -108(fp)
    lw t1, 128(fp)
    sw t1, -112(fp)
    lw t1, 136(fp)
    sw t1, -116(fp)
    lw t1, 144(fp)
    sw t1, -120(fp)
    lw t1, 152(fp)
    sw t1, -124(fp)
    lw t1, 160(fp)
    sw t1, -128(fp)
    lw t1, 168(fp)
    sw t1, -132(fp)
    lw t1, 176(fp)
    sw t1, -136(fp)
    lw t1, 184(fp)
    sw t1, -140(fp)
    lw t1, 192(fp)
    sw t1, -144(fp)
    sd s1, -152(fp)
    sd s2, -160(fp)
    sd s3, -168(fp)
    sd s4, -176(fp)
    sd s5, -184(fp)
    sd s6, -192(fp)
    sd s7, -200(fp)
    sd s8, -208(fp)
    sd s9, -216(fp)
    sd s10, -224(fp)
    sd s11, -232(fp)
    j BB10
BB10: 
    j BB11
BB11: 
    lw t0, -20(fp)
    seqz t0, t0
    bnez t0, BB12
    j BB14
BB14: 
    lw t0, -20(fp)
    addi t0, t0, -1
    lw t1, -24(fp)
    lw t2, -28(fp)
    add t1, t1, t2
    li t2, 998244353
    rem t2, t1, t2
    lw t1, -32(fp)
    lw t3, -36(fp)
    lw t4, -40(fp)
    lw t5, -44(fp)
    lw t6, -48(fp)
    lw s1, -52(fp)
    lw s2, -56(fp)
    lw s3, -60(fp)
    lw s4, -64(fp)
    lw s5, -68(fp)
    lw s6, -72(fp)
    lw s7, -76(fp)
    lw s8, -80(fp)
    lw s9, -84(fp)
    lw s10, -88(fp)
    lw s11, -92(fp)
    sd t0, -152(fp)
    lw t0, -96(fp)
    sd t0, -160(fp)
    ld t0, -152(fp)
    sd t0, -168(fp)
    lw t0, -100(fp)
    sd t0, -176(fp)
    ld t0, -168(fp)
    sd t0, -184(fp)
    lw t0, -104(fp)
    sd t0, -192(fp)
    ld t0, -184(fp)
    sd t0, -200(fp)
    lw t0, -108(fp)
    sd t0, -208(fp)
    ld t0, -200(fp)
    sd t0, -216(fp)
    lw t0, -112(fp)
    sd t0, -224(fp)
    ld t0, -216(fp)
    sd t0, -232(fp)
    lw t0, -116(fp)
    sd t0, -240(fp)
    ld t0, -232(fp)
    sd t0, -248(fp)
    lw t0, -120(fp)
    sd t0, -256(fp)
    ld t0, -248(fp)
    sd t0, -264(fp)
    lw t0, -124(fp)
    sd t0, -272(fp)
    ld t0, -264(fp)
    sd t0, -280(fp)
    lw t0, -128(fp)
    sd t0, -288(fp)
    ld t0, -280(fp)
    sd t0, -296(fp)
    lw t0, -132(fp)
    sd t0, -304(fp)
    ld t0, -296(fp)
    sd t0, -312(fp)
    lw t0, -136(fp)
    sd t0, -320(fp)
    ld t0, -312(fp)
    sd t0, -328(fp)
    lw t0, -140(fp)
    sd t0, -336(fp)
    ld t0, -328(fp)
    sd t0, -344(fp)
    lw t0, -144(fp)
    sd t0, -352(fp)
    ld t0, -344(fp)
    mv a0, t0
    mv a1, t2
    mv a2, t1
    mv a3, t3
    mv a4, t4
    mv a5, t5
    mv a6, t6
    mv a7, s1
    sw s2, 8(sp)
    sw s3, 16(sp)
    sw s4, 24(sp)
    sw s5, 32(sp)
    sw s6, 40(sp)
    sw s7, 48(sp)
    sw s8, 56(sp)
    sw s9, 64(sp)
    sw s10, 72(sp)
    sw s11, 80(sp)
    sd t0, -152(fp)
    ld t0, -160(fp)
    sw t0, 88(sp)
    ld t0, -160(fp)
    sd t0, -168(fp)
    ld t0, -176(fp)
    sw t0, 96(sp)
    ld t0, -176(fp)
    sd t0, -184(fp)
    ld t0, -192(fp)
    sw t0, 104(sp)
    ld t0, -192(fp)
    sd t0, -200(fp)
    ld t0, -208(fp)
    sw t0, 112(sp)
    ld t0, -208(fp)
    sd t0, -216(fp)
    ld t0, -224(fp)
    sw t0, 120(sp)
    ld t0, -224(fp)
    sd t0, -232(fp)
    ld t0, -240(fp)
    sw t0, 128(sp)
    ld t0, -240(fp)
    sd t0, -248(fp)
    ld t0, -256(fp)
    sw t0, 136(sp)
    ld t0, -256(fp)
    sd t0, -264(fp)
    ld t0, -272(fp)
    sw t0, 144(sp)
    ld t0, -272(fp)
    sd t0, -280(fp)
    ld t0, -288(fp)
    sw t0, 152(sp)
    ld t0, -288(fp)
    sd t0, -296(fp)
    ld t0, -304(fp)
    sw t0, 160(sp)
    ld t0, -304(fp)
    sd t0, -312(fp)
    ld t0, -320(fp)
    sw t0, 168(sp)
    ld t0, -320(fp)
    sd t0, -328(fp)
    ld t0, -336(fp)
    sw t0, 176(sp)
    ld t0, -336(fp)
    sd t0, -344(fp)
    ld t0, -352(fp)
    sw t0, 184(sp)
    ld t0, -352(fp)
    li t6, 0
    sw t6, 192(sp)
    call param32_rec
    mv t6, a0
    mv a0, t6
    j BB25
BB12: 
    lw t6, -24(fp)
    mv a0, t6
    j BB25
BB13: 
BB25: 
    ld s1, -152(fp)
    ld s2, -160(fp)
    ld s3, -168(fp)
    ld s4, -176(fp)
    ld s5, -184(fp)
    ld s6, -192(fp)
    ld s7, -200(fp)
    ld s8, -208(fp)
    ld s9, -216(fp)
    ld s10, -224(fp)
    ld s11, -232(fp)
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 448
    ret
    .align 1
param32_arr: 
BB26: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -288
    addi fp, sp, 288
    sd a0, -24(fp)
    sd a1, -32(fp)
    sd a2, -40(fp)
    sd a3, -48(fp)
    sd a4, -56(fp)
    sd a5, -64(fp)
    sd a6, -72(fp)
    sd a7, -80(fp)
    ld t1, 8(fp)
    sd t1, -88(fp)
    ld t1, 16(fp)
    sd t1, -96(fp)
    ld t1, 24(fp)
    sd t1, -104(fp)
    ld t1, 32(fp)
    sd t1, -112(fp)
    ld t1, 40(fp)
    sd t1, -120(fp)
    ld t1, 48(fp)
    sd t1, -128(fp)
    ld t1, 56(fp)
    sd t1, -136(fp)
    ld t1, 64(fp)
    sd t1, -144(fp)
    ld t1, 72(fp)
    sd t1, -152(fp)
    ld t1, 80(fp)
    sd t1, -160(fp)
    ld t1, 88(fp)
    sd t1, -168(fp)
    ld t1, 96(fp)
    sd t1, -176(fp)
    ld t1, 104(fp)
    sd t1, -184(fp)
    ld t1, 112(fp)
    sd t1, -192(fp)
    ld t1, 120(fp)
    sd t1, -200(fp)
    ld t1, 128(fp)
    sd t1, -208(fp)
    ld t1, 136(fp)
    sd t1, -216(fp)
    ld t1, 144(fp)
    sd t1, -224(fp)
    ld t1, 152(fp)
    sd t1, -232(fp)
    ld t1, 160(fp)
    sd t1, -240(fp)
    ld t1, 168(fp)
    sd t1, -248(fp)
    ld t1, 176(fp)
    sd t1, -256(fp)
    ld t1, 184(fp)
    sd t1, -264(fp)
    ld t1, 192(fp)
    sd t1, -272(fp)
    j BB15
BB15: 
    ld t0, -24(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    ld t1, -24(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -32(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -32(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -40(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -40(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -48(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -48(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -56(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -56(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -64(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -64(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -72(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -72(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -80(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -80(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -88(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -88(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -96(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -96(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -104(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -104(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -112(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -112(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -120(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -120(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -128(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -128(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -136(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -136(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -144(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -144(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -152(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -152(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -160(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -160(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -168(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -168(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -176(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -176(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -184(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -184(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -192(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -192(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -200(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -200(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -208(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -208(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -216(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -216(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -224(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -224(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -232(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -232(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -240(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -240(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -276(fp)
    lw t1, -276(fp)
    ld t0, -248(fp)
    addi t0, t0, 0
    lw t0, 0(t0)
    add t0, t1, t0
    ld t1, -248(fp)
    addi t1, t1, 4
    lw t1, 0(t1)
    add t0, t0, t1
    sw t0, -276(fp)
    lw t0, -276(fp)
    ld t1, -256(fp)
    addi t1, t1, 0
    lw t1, 0(t1)
    add t1, t0, t1
    ld t0, -256(fp)
    addi t0, t0, 4
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -276(fp)
    lw t0, -276(fp)
    ld t1, -264(fp)
    addi t1, t1, 0
    lw t1, 0(t1)
    add t1, t0, t1
    ld t0, -264(fp)
    addi t0, t0, 4
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -276(fp)
    lw t0, -276(fp)
    ld t1, -272(fp)
    addi t1, t1, 0
    lw t1, 0(t1)
    add t1, t0, t1
    ld t0, -272(fp)
    addi t0, t0, 4
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -276(fp)
    lw t0, -276(fp)
    mv a0, t0
    j BB27
BB27: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 288
    ret
    .align 1
param16: 
BB28: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -448
    addi fp, sp, 448
    sw a0, -20(fp)
    sw a1, -24(fp)
    sw a2, -28(fp)
    sw a3, -32(fp)
    sw a4, -36(fp)
    sw a5, -40(fp)
    sw a6, -44(fp)
    sw a7, -48(fp)
    lw t1, 8(fp)
    sw t1, -52(fp)
    lw t1, 16(fp)
    sw t1, -56(fp)
    lw t1, 24(fp)
    sw t1, -60(fp)
    lw t1, 32(fp)
    sw t1, -64(fp)
    lw t1, 40(fp)
    sw t1, -68(fp)
    lw t1, 48(fp)
    sw t1, -72(fp)
    lw t1, 56(fp)
    sw t1, -76(fp)
    lw t1, 64(fp)
    sw t1, -80(fp)
    sd s1, -152(fp)
    sd s2, -160(fp)
    sd s3, -168(fp)
    sd s4, -176(fp)
    sd s5, -184(fp)
    sd s6, -192(fp)
    sd s7, -200(fp)
    sd s8, -208(fp)
    sd s9, -216(fp)
    sd s10, -224(fp)
    sd s11, -232(fp)
    j BB16
BB16: 
    lw t0, -20(fp)
    addi t1, fp, -144
    sw t0, 0(t1)
    lw t1, -24(fp)
    addi t0, fp, -140
    sw t1, 0(t0)
    lw t0, -28(fp)
    addi t1, fp, -136
    sw t0, 0(t1)
    lw t0, -32(fp)
    addi t1, fp, -132
    sw t0, 0(t1)
    lw t1, -36(fp)
    addi t0, fp, -128
    sw t1, 0(t0)
    lw t0, -40(fp)
    addi t1, fp, -124
    sw t0, 0(t1)
    lw t1, -44(fp)
    addi t0, fp, -120
    sw t1, 0(t0)
    lw t0, -48(fp)
    addi t1, fp, -116
    sw t0, 0(t1)
    lw t1, -52(fp)
    addi t0, fp, -112
    sw t1, 0(t0)
    lw t0, -56(fp)
    addi t1, fp, -108
    sw t0, 0(t1)
    lw t1, -60(fp)
    addi t0, fp, -104
    sw t1, 0(t0)
    lw t0, -64(fp)
    addi t1, fp, -100
    sw t0, 0(t1)
    lw t1, -68(fp)
    addi t0, fp, -96
    sw t1, 0(t0)
    lw t0, -72(fp)
    addi t1, fp, -92
    sw t0, 0(t1)
    lw t1, -76(fp)
    addi t0, fp, -88
    sw t1, 0(t0)
    lw t0, -80(fp)
    addi t1, fp, -84
    sw t0, 0(t1)
    addi t1, fp, -144
    mv a0, t1
    li t1, 16
    mv a1, t1
    call sort
    addi t1, fp, -144
    lw t1, 0(t1)
    addi t0, fp, -140
    lw t0, 0(t0)
    addi t2, fp, -136
    lw t2, 0(t2)
    addi t3, fp, -132
    lw t3, 0(t3)
    addi t4, fp, -128
    lw t4, 0(t4)
    addi t5, fp, -124
    lw t5, 0(t5)
    addi t6, fp, -120
    lw t6, 0(t6)
    addi s1, fp, -116
    lw s1, 0(s1)
    addi s2, fp, -112
    lw s2, 0(s2)
    addi s3, fp, -108
    lw s3, 0(s3)
    addi s4, fp, -104
    lw s4, 0(s4)
    addi s5, fp, -100
    lw s5, 0(s5)
    addi s6, fp, -96
    lw s6, 0(s6)
    addi s7, fp, -92
    lw s7, 0(s7)
    addi s8, fp, -88
    lw s8, 0(s8)
    addi s9, fp, -84
    lw s9, 0(s9)
    lw s10, -20(fp)
    lw s11, -24(fp)
    sd t0, -152(fp)
    lw t0, -28(fp)
    sd t0, -160(fp)
    ld t0, -152(fp)
    sd t0, -168(fp)
    lw t0, -32(fp)
    sd t0, -176(fp)
    ld t0, -168(fp)
    sd t0, -184(fp)
    lw t0, -36(fp)
    sd t0, -192(fp)
    ld t0, -184(fp)
    sd t0, -200(fp)
    lw t0, -40(fp)
    sd t0, -208(fp)
    ld t0, -200(fp)
    sd t0, -216(fp)
    lw t0, -44(fp)
    sd t0, -224(fp)
    ld t0, -216(fp)
    sd t0, -232(fp)
    lw t0, -48(fp)
    sd t0, -240(fp)
    ld t0, -232(fp)
    sd t0, -248(fp)
    lw t0, -52(fp)
    sd t0, -256(fp)
    ld t0, -248(fp)
    sd t0, -264(fp)
    lw t0, -56(fp)
    sd t0, -272(fp)
    ld t0, -264(fp)
    sd t0, -280(fp)
    lw t0, -60(fp)
    sd t0, -288(fp)
    ld t0, -280(fp)
    sd t0, -296(fp)
    lw t0, -64(fp)
    sd t0, -304(fp)
    ld t0, -296(fp)
    sd t0, -312(fp)
    lw t0, -68(fp)
    sd t0, -320(fp)
    ld t0, -312(fp)
    sd t0, -328(fp)
    lw t0, -72(fp)
    sd t0, -336(fp)
    ld t0, -328(fp)
    sd t0, -344(fp)
    lw t0, -76(fp)
    sd t0, -352(fp)
    ld t0, -344(fp)
    sd t0, -360(fp)
    lw t0, -80(fp)
    sd t0, -368(fp)
    ld t0, -360(fp)
    mv a0, t1
    mv a1, t0
    mv a2, t2
    mv a3, t3
    mv a4, t4
    mv a5, t5
    mv a6, t6
    mv a7, s1
    sw s2, 8(sp)
    sw s3, 16(sp)
    sw s4, 24(sp)
    sw s5, 32(sp)
    sw s6, 40(sp)
    sw s7, 48(sp)
    sw s8, 56(sp)
    sw s9, 64(sp)
    sw s10, 72(sp)
    sw s11, 80(sp)
    sd t0, -152(fp)
    ld t0, -160(fp)
    sw t0, 88(sp)
    ld t0, -160(fp)
    sd t0, -168(fp)
    ld t0, -176(fp)
    sw t0, 96(sp)
    ld t0, -176(fp)
    sd t0, -184(fp)
    ld t0, -192(fp)
    sw t0, 104(sp)
    ld t0, -192(fp)
    sd t0, -200(fp)
    ld t0, -208(fp)
    sw t0, 112(sp)
    ld t0, -208(fp)
    sd t0, -216(fp)
    ld t0, -224(fp)
    sw t0, 120(sp)
    ld t0, -224(fp)
    sd t0, -232(fp)
    ld t0, -240(fp)
    sw t0, 128(sp)
    ld t0, -240(fp)
    sd t0, -248(fp)
    ld t0, -256(fp)
    sw t0, 136(sp)
    ld t0, -256(fp)
    sd t0, -264(fp)
    ld t0, -272(fp)
    sw t0, 144(sp)
    ld t0, -272(fp)
    sd t0, -280(fp)
    ld t0, -288(fp)
    sw t0, 152(sp)
    ld t0, -288(fp)
    sd t0, -296(fp)
    ld t0, -304(fp)
    sw t0, 160(sp)
    ld t0, -304(fp)
    sd t0, -312(fp)
    ld t0, -320(fp)
    sw t0, 168(sp)
    ld t0, -320(fp)
    sd t0, -328(fp)
    ld t0, -336(fp)
    sw t0, 176(sp)
    ld t0, -336(fp)
    sd t0, -344(fp)
    ld t0, -352(fp)
    sw t0, 184(sp)
    ld t0, -352(fp)
    sd t0, -360(fp)
    ld t0, -368(fp)
    sw t0, 192(sp)
    ld t0, -368(fp)
    call param32_rec
    mv t6, a0
    mv a0, t6
    j BB29
BB29: 
    ld s1, -152(fp)
    ld s2, -160(fp)
    ld s3, -168(fp)
    ld s4, -176(fp)
    ld s5, -184(fp)
    ld s6, -192(fp)
    ld s7, -200(fp)
    ld s8, -208(fp)
    ld s9, -216(fp)
    ld s10, -224(fp)
    ld s11, -232(fp)
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 448
    ret
    .align 1
main: 
BB30: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -640
    addi fp, sp, 640
    sd s1, -352(fp)
    sd s2, -360(fp)
    sd s3, -368(fp)
    sd s4, -376(fp)
    sd s5, -384(fp)
    sd s6, -392(fp)
    sd s7, -400(fp)
    sd s8, -408(fp)
    sd s9, -416(fp)
    sd s10, -424(fp)
    sd s11, -432(fp)
    j BB17
BB17: 
    call getint
    mv t0, a0
    sw t0, -20(fp)
    call getint
    mv t0, a0
    sw t0, -24(fp)
    call getint
    mv t0, a0
    sw t0, -28(fp)
    call getint
    mv t0, a0
    sw t0, -32(fp)
    call getint
    mv t0, a0
    sw t0, -36(fp)
    call getint
    mv t0, a0
    sw t0, -40(fp)
    call getint
    mv t0, a0
    sw t0, -44(fp)
    call getint
    mv t0, a0
    sw t0, -48(fp)
    call getint
    mv t0, a0
    sw t0, -52(fp)
    call getint
    mv t0, a0
    sw t0, -56(fp)
    call getint
    mv t0, a0
    sw t0, -60(fp)
    call getint
    mv t0, a0
    sw t0, -64(fp)
    call getint
    mv t0, a0
    sw t0, -68(fp)
    call getint
    mv t0, a0
    sw t0, -72(fp)
    call getint
    mv t0, a0
    sw t0, -76(fp)
    call getint
    mv t0, a0
    sw t0, -80(fp)
    lw t0, -20(fp)
    lw t1, -24(fp)
    lw t2, -28(fp)
    lw t3, -32(fp)
    lw t4, -36(fp)
    lw t5, -40(fp)
    lw t6, -44(fp)
    lw s1, -48(fp)
    lw s2, -52(fp)
    lw s3, -56(fp)
    lw s4, -60(fp)
    lw s5, -64(fp)
    lw s6, -68(fp)
    lw s7, -72(fp)
    lw s8, -76(fp)
    lw s9, -80(fp)
    mv a0, t0
    mv a1, t1
    mv a2, t2
    mv a3, t3
    mv a4, t4
    mv a5, t5
    mv a6, t6
    mv a7, s1
    sw s2, 8(sp)
    sw s3, 16(sp)
    sw s4, 24(sp)
    sw s5, 32(sp)
    sw s6, 40(sp)
    sw s7, 48(sp)
    sw s8, 56(sp)
    sw s9, 64(sp)
    call param16
    mv t6, a0
    addi t5, fp, -336
    sw t6, 0(t5)
    addi t5, fp, -332
    li t6, 8848
    sw t6, 0(t5)
    li t6, 1
    sw t6, -340(fp)
    j BB18
BB18: 
    lw t6, -340(fp)
    slti t6, t6, 32
    bnez t6, BB19
    j BB20
BB19: 
    lw t0, -340(fp)
    li t1, 2
    mul t1, t0, t1
    slli t1, t1, 2
    addi t0, fp, -336
    add t0, t0, t1
    lw t1, -340(fp)
    addi t1, t1, -1
    li t2, 2
    mul t2, t1, t2
    addi t2, t2, 1
    slli t2, t2, 2
    addi t1, fp, -336
    add t1, t1, t2
    lw t1, 0(t1)
    addi t1, t1, -1
    sw t1, 0(t0)
    lw t1, -340(fp)
    li t0, 2
    mul t0, t1, t0
    addi t0, t0, 1
    slli t0, t0, 2
    addi t1, fp, -336
    add t1, t1, t0
    lw t0, -340(fp)
    addi t0, t0, -1
    li t2, 2
    mul t2, t0, t2
    slli t2, t2, 2
    addi t0, fp, -336
    add t0, t0, t2
    lw t0, 0(t0)
    addi t0, t0, -2
    sw t0, 0(t1)
    lw t1, -340(fp)
    addi t1, t1, 1
    sw t1, -340(fp)
    j BB18
BB20: 
    li t6, 0
    li t5, 2
    mul t5, t6, t5
    slli t5, t5, 2
    addi t6, fp, -336
    add t6, t6, t5
    li t5, 1
    li t4, 2
    mul t4, t5, t4
    slli t4, t4, 2
    addi t5, fp, -336
    add t5, t5, t4
    li t4, 2
    li t3, 2
    mul t3, t4, t3
    slli t3, t3, 2
    addi t4, fp, -336
    add t4, t4, t3
    li t3, 3
    li t2, 2
    mul t2, t3, t2
    slli t2, t2, 2
    addi t3, fp, -336
    add t3, t3, t2
    li t2, 4
    li t1, 2
    mul t1, t2, t1
    slli t1, t1, 2
    addi t2, fp, -336
    add t2, t2, t1
    li t1, 5
    li t0, 2
    mul t0, t1, t0
    slli t0, t0, 2
    addi t1, fp, -336
    add t1, t1, t0
    li t0, 6
    li s9, 2
    mul t0, t0, s9
    slli t0, t0, 2
    addi s9, fp, -336
    add t0, s9, t0
    li s9, 7
    li s8, 2
    mul s8, s9, s8
    slli s8, s8, 2
    addi s9, fp, -336
    add s9, s9, s8
    li s8, 8
    li s7, 2
    mul s7, s8, s7
    slli s7, s7, 2
    addi s8, fp, -336
    add s8, s8, s7
    li s7, 9
    li s6, 2
    mul s6, s7, s6
    slli s6, s6, 2
    addi s7, fp, -336
    add s7, s7, s6
    li s6, 10
    li s5, 2
    mul s5, s6, s5
    slli s5, s5, 2
    addi s6, fp, -336
    add s6, s6, s5
    li s5, 11
    li s4, 2
    mul s4, s5, s4
    slli s4, s4, 2
    addi s5, fp, -336
    add s5, s5, s4
    li s4, 12
    li s3, 2
    mul s3, s4, s3
    slli s3, s3, 2
    addi s4, fp, -336
    add s4, s4, s3
    li s3, 13
    li s2, 2
    mul s2, s3, s2
    slli s2, s2, 2
    addi s3, fp, -336
    add s3, s3, s2
    li s2, 14
    li s1, 2
    mul s1, s2, s1
    slli s1, s1, 2
    addi s2, fp, -336
    add s2, s2, s1
    li s1, 15
    li s10, 2
    mul s10, s1, s10
    slli s10, s10, 2
    addi s1, fp, -336
    add s1, s1, s10
    li s10, 16
    li s11, 2
    mul s11, s10, s11
    slli s11, s11, 2
    addi s10, fp, -336
    add s10, s10, s11
    li s11, 17
    sd t0, -352(fp)
    li t0, 2
    sd t0, -360(fp)
    ld t0, -352(fp)
    sd t0, -352(fp)
    ld t0, -360(fp)
    mul s11, s11, t0
    ld t0, -360(fp)
    slli s11, s11, 2
    sd t0, -368(fp)
    addi t0, fp, -336
    sd t0, -376(fp)
    ld t0, -368(fp)
    sd t0, -368(fp)
    ld t0, -376(fp)
    add s11, t0, s11
    ld t0, -376(fp)
    sd t0, -384(fp)
    li t0, 18
    sd t0, -392(fp)
    ld t0, -384(fp)
    sd t0, -400(fp)
    li t0, 2
    sd t0, -408(fp)
    ld t0, -400(fp)
    sd t0, -384(fp)
    ld t0, -392(fp)
    sd t1, -400(fp)
    ld t1, -408(fp)
    sd t2, -416(fp)
    mul t2, t0, t1
    sd t2, -424(fp)
    ld t2, -416(fp)
    ld t1, -408(fp)
    ld t0, -392(fp)
    sd t0, -416(fp)
    ld t0, -424(fp)
    sd t1, -432(fp)
    slli t1, t0, 2
    sd t1, -440(fp)
    ld t1, -432(fp)
    ld t0, -424(fp)
    sd t0, -448(fp)
    addi t0, fp, -336
    sd t0, -456(fp)
    ld t0, -448(fp)
    sd t0, -448(fp)
    ld t0, -456(fp)
    sd t1, -432(fp)
    ld t1, -440(fp)
    sd t2, -464(fp)
    add t2, t0, t1
    sd t2, -472(fp)
    ld t2, -464(fp)
    ld t1, -440(fp)
    ld t0, -456(fp)
    sd t0, -480(fp)
    li t0, 19
    sd t0, -488(fp)
    ld t0, -480(fp)
    sd t0, -496(fp)
    li t0, 2
    sd t0, -504(fp)
    ld t0, -496(fp)
    sd t0, -480(fp)
    ld t0, -488(fp)
    sd t1, -496(fp)
    ld t1, -504(fp)
    sd t2, -512(fp)
    mul t2, t0, t1
    sd t2, -520(fp)
    ld t2, -512(fp)
    ld t1, -504(fp)
    ld t0, -488(fp)
    sd t0, -512(fp)
    ld t0, -520(fp)
    sd t1, -528(fp)
    slli t1, t0, 2
    sd t1, -536(fp)
    ld t1, -528(fp)
    ld t0, -520(fp)
    sd t0, -544(fp)
    addi t0, fp, -336
    sd t0, -552(fp)
    ld t0, -544(fp)
    sd t0, -544(fp)
    ld t0, -552(fp)
    sd t1, -528(fp)
    ld t1, -536(fp)
    sd t2, -560(fp)
    add t2, t0, t1
    sd t2, -568(fp)
    ld t2, -560(fp)
    ld t1, -536(fp)
    ld t0, -552(fp)
    sd t0, -576(fp)
    li t0, 20
    sd t0, -584(fp)
    ld t0, -576(fp)
    sd t0, -592(fp)
    li t0, 2
    sd t0, -600(fp)
    ld t0, -592(fp)
    sd t0, -576(fp)
    ld t0, -584(fp)
    sd t1, -592(fp)
    ld t1, -600(fp)
    sd t2, -608(fp)
    mul t2, t0, t1
    sd t2, -616(fp)
    ld t2, -608(fp)
    ld t1, -600(fp)
    ld t0, -584(fp)
    sd t0, -608(fp)
    ld t0, -616(fp)
    sd t1, -624(fp)
    slli t1, t0, 2
    sd t1, -632(fp)
    ld t1, -624(fp)
    ld t0, -616(fp)
    sd t0, -640(fp)
    addi t0, fp, -336
    sd t0, -648(fp)
    ld t0, -640(fp)
    sd t0, -640(fp)
    ld t0, -648(fp)
    sd t1, -624(fp)
    ld t1, -632(fp)
    sd t2, -656(fp)
    add t2, t0, t1
    sd t2, -664(fp)
    ld t2, -656(fp)
    ld t1, -632(fp)
    ld t0, -648(fp)
    sd t0, -672(fp)
    li t0, 21
    sd t0, -680(fp)
    ld t0, -672(fp)
    sd t0, -688(fp)
    li t0, 2
    sd t0, -696(fp)
    ld t0, -688(fp)
    sd t0, -672(fp)
    ld t0, -680(fp)
    sd t1, -688(fp)
    ld t1, -696(fp)
    sd t2, -704(fp)
    mul t2, t0, t1
    sd t2, -712(fp)
    ld t2, -704(fp)
    ld t1, -696(fp)
    ld t0, -680(fp)
    sd t0, -704(fp)
    ld t0, -712(fp)
    sd t1, -720(fp)
    slli t1, t0, 2
    sd t1, -728(fp)
    ld t1, -720(fp)
    ld t0, -712(fp)
    sd t0, -736(fp)
    addi t0, fp, -336
    sd t0, -744(fp)
    ld t0, -736(fp)
    sd t0, -736(fp)
    ld t0, -744(fp)
    sd t1, -720(fp)
    ld t1, -728(fp)
    sd t2, -752(fp)
    add t2, t0, t1
    sd t2, -760(fp)
    ld t2, -752(fp)
    ld t1, -728(fp)
    ld t0, -744(fp)
    sd t0, -768(fp)
    li t0, 22
    sd t0, -776(fp)
    ld t0, -768(fp)
    sd t0, -784(fp)
    li t0, 2
    sd t0, -792(fp)
    ld t0, -784(fp)
    sd t0, -768(fp)
    ld t0, -776(fp)
    sd t1, -784(fp)
    ld t1, -792(fp)
    sd t2, -800(fp)
    mul t2, t0, t1
    sd t2, -808(fp)
    ld t2, -800(fp)
    ld t1, -792(fp)
    ld t0, -776(fp)
    sd t0, -800(fp)
    ld t0, -808(fp)
    sd t1, -816(fp)
    slli t1, t0, 2
    sd t1, -824(fp)
    ld t1, -816(fp)
    ld t0, -808(fp)
    sd t0, -832(fp)
    addi t0, fp, -336
    sd t0, -840(fp)
    ld t0, -832(fp)
    sd t0, -832(fp)
    ld t0, -840(fp)
    sd t1, -816(fp)
    ld t1, -824(fp)
    sd t2, -848(fp)
    add t2, t0, t1
    sd t2, -856(fp)
    ld t2, -848(fp)
    ld t1, -824(fp)
    ld t0, -840(fp)
    sd t0, -864(fp)
    li t0, 23
    sd t0, -872(fp)
    ld t0, -864(fp)
    sd t0, -880(fp)
    li t0, 2
    sd t0, -888(fp)
    ld t0, -880(fp)
    sd t0, -864(fp)
    ld t0, -872(fp)
    sd t1, -880(fp)
    ld t1, -888(fp)
    sd t2, -896(fp)
    mul t2, t0, t1
    sd t2, -904(fp)
    ld t2, -896(fp)
    ld t1, -888(fp)
    ld t0, -872(fp)
    sd t0, -896(fp)
    ld t0, -904(fp)
    sd t1, -912(fp)
    slli t1, t0, 2
    sd t1, -920(fp)
    ld t1, -912(fp)
    ld t0, -904(fp)
    sd t0, -928(fp)
    addi t0, fp, -336
    sd t0, -936(fp)
    ld t0, -928(fp)
    sd t0, -928(fp)
    ld t0, -936(fp)
    sd t1, -912(fp)
    ld t1, -920(fp)
    sd t2, -944(fp)
    add t2, t0, t1
    sd t2, -952(fp)
    ld t2, -944(fp)
    ld t1, -920(fp)
    ld t0, -936(fp)
    sd t0, -960(fp)
    li t0, 24
    sd t0, -968(fp)
    ld t0, -960(fp)
    sd t0, -976(fp)
    li t0, 2
    sd t0, -984(fp)
    ld t0, -976(fp)
    sd t0, -960(fp)
    ld t0, -968(fp)
    sd t1, -976(fp)
    ld t1, -984(fp)
    sd t2, -992(fp)
    mul t2, t0, t1
    sd t2, -1000(fp)
    ld t2, -992(fp)
    ld t1, -984(fp)
    ld t0, -968(fp)
    sd t0, -992(fp)
    ld t0, -1000(fp)
    sd t1, -1008(fp)
    slli t1, t0, 2
    sd t1, -1016(fp)
    ld t1, -1008(fp)
    ld t0, -1000(fp)
    sd t0, -1024(fp)
    addi t0, fp, -336
    sd t0, -1032(fp)
    ld t0, -1024(fp)
    sd t0, -1024(fp)
    ld t0, -1032(fp)
    sd t1, -1008(fp)
    ld t1, -1016(fp)
    sd t2, -1040(fp)
    add t2, t0, t1
    sd t2, -1048(fp)
    ld t2, -1040(fp)
    ld t1, -1016(fp)
    ld t0, -1032(fp)
    sd t0, -1056(fp)
    li t0, 25
    sd t0, -1064(fp)
    ld t0, -1056(fp)
    sd t0, -1072(fp)
    li t0, 2
    sd t0, -1080(fp)
    ld t0, -1072(fp)
    sd t0, -1056(fp)
    ld t0, -1064(fp)
    sd t1, -1072(fp)
    ld t1, -1080(fp)
    sd t2, -1088(fp)
    mul t2, t0, t1
    sd t2, -1096(fp)
    ld t2, -1088(fp)
    ld t1, -1080(fp)
    ld t0, -1064(fp)
    sd t0, -1088(fp)
    ld t0, -1096(fp)
    sd t1, -1104(fp)
    slli t1, t0, 2
    sd t1, -1112(fp)
    ld t1, -1104(fp)
    ld t0, -1096(fp)
    sd t0, -1120(fp)
    addi t0, fp, -336
    sd t0, -1128(fp)
    ld t0, -1120(fp)
    sd t0, -1120(fp)
    ld t0, -1128(fp)
    sd t1, -1104(fp)
    ld t1, -1112(fp)
    sd t2, -1136(fp)
    add t2, t0, t1
    sd t2, -1144(fp)
    ld t2, -1136(fp)
    ld t1, -1112(fp)
    ld t0, -1128(fp)
    sd t0, -1152(fp)
    li t0, 26
    sd t0, -1160(fp)
    ld t0, -1152(fp)
    sd t0, -1168(fp)
    li t0, 2
    sd t0, -1176(fp)
    ld t0, -1168(fp)
    sd t0, -1152(fp)
    ld t0, -1160(fp)
    sd t1, -1168(fp)
    ld t1, -1176(fp)
    sd t2, -1184(fp)
    mul t2, t0, t1
    sd t2, -1192(fp)
    ld t2, -1184(fp)
    ld t1, -1176(fp)
    ld t0, -1160(fp)
    sd t0, -1184(fp)
    ld t0, -1192(fp)
    sd t1, -1200(fp)
    slli t1, t0, 2
    sd t1, -1208(fp)
    ld t1, -1200(fp)
    ld t0, -1192(fp)
    sd t0, -1216(fp)
    addi t0, fp, -336
    sd t0, -1224(fp)
    ld t0, -1216(fp)
    sd t0, -1216(fp)
    ld t0, -1224(fp)
    sd t1, -1200(fp)
    ld t1, -1208(fp)
    sd t2, -1232(fp)
    add t2, t0, t1
    sd t2, -1240(fp)
    ld t2, -1232(fp)
    ld t1, -1208(fp)
    ld t0, -1224(fp)
    sd t0, -1248(fp)
    li t0, 27
    sd t0, -1256(fp)
    ld t0, -1248(fp)
    sd t0, -1264(fp)
    li t0, 2
    sd t0, -1272(fp)
    ld t0, -1264(fp)
    sd t0, -1248(fp)
    ld t0, -1256(fp)
    sd t1, -1264(fp)
    ld t1, -1272(fp)
    sd t2, -1280(fp)
    mul t2, t0, t1
    sd t2, -1288(fp)
    ld t2, -1280(fp)
    ld t1, -1272(fp)
    ld t0, -1256(fp)
    sd t0, -1280(fp)
    ld t0, -1288(fp)
    sd t1, -1296(fp)
    slli t1, t0, 2
    sd t1, -1304(fp)
    ld t1, -1296(fp)
    ld t0, -1288(fp)
    sd t0, -1312(fp)
    addi t0, fp, -336
    sd t0, -1320(fp)
    ld t0, -1312(fp)
    sd t0, -1312(fp)
    ld t0, -1320(fp)
    sd t1, -1296(fp)
    ld t1, -1304(fp)
    sd t2, -1328(fp)
    add t2, t0, t1
    sd t2, -1336(fp)
    ld t2, -1328(fp)
    ld t1, -1304(fp)
    ld t0, -1320(fp)
    sd t0, -1344(fp)
    li t0, 28
    sd t0, -1352(fp)
    ld t0, -1344(fp)
    sd t0, -1360(fp)
    li t0, 2
    sd t0, -1368(fp)
    ld t0, -1360(fp)
    sd t0, -1344(fp)
    ld t0, -1352(fp)
    sd t1, -1360(fp)
    ld t1, -1368(fp)
    sd t2, -1376(fp)
    mul t2, t0, t1
    sd t2, -1384(fp)
    ld t2, -1376(fp)
    ld t1, -1368(fp)
    ld t0, -1352(fp)
    sd t0, -1376(fp)
    ld t0, -1384(fp)
    sd t1, -1392(fp)
    slli t1, t0, 2
    sd t1, -1400(fp)
    ld t1, -1392(fp)
    ld t0, -1384(fp)
    sd t0, -1408(fp)
    addi t0, fp, -336
    sd t0, -1416(fp)
    ld t0, -1408(fp)
    sd t0, -1408(fp)
    ld t0, -1416(fp)
    sd t1, -1392(fp)
    ld t1, -1400(fp)
    sd t2, -1424(fp)
    add t2, t0, t1
    sd t2, -1432(fp)
    ld t2, -1424(fp)
    ld t1, -1400(fp)
    ld t0, -1416(fp)
    sd t0, -1440(fp)
    li t0, 29
    sd t0, -1448(fp)
    ld t0, -1440(fp)
    sd t0, -1456(fp)
    li t0, 2
    sd t0, -1464(fp)
    ld t0, -1456(fp)
    sd t0, -1440(fp)
    ld t0, -1448(fp)
    sd t1, -1456(fp)
    ld t1, -1464(fp)
    sd t2, -1472(fp)
    mul t2, t0, t1
    sd t2, -1480(fp)
    ld t2, -1472(fp)
    ld t1, -1464(fp)
    ld t0, -1448(fp)
    sd t0, -1472(fp)
    ld t0, -1480(fp)
    sd t1, -1488(fp)
    slli t1, t0, 2
    sd t1, -1496(fp)
    ld t1, -1488(fp)
    ld t0, -1480(fp)
    sd t0, -1504(fp)
    addi t0, fp, -336
    sd t0, -1512(fp)
    ld t0, -1504(fp)
    sd t0, -1504(fp)
    ld t0, -1512(fp)
    sd t1, -1488(fp)
    ld t1, -1496(fp)
    sd t2, -1520(fp)
    add t2, t0, t1
    sd t2, -1528(fp)
    ld t2, -1520(fp)
    ld t1, -1496(fp)
    ld t0, -1512(fp)
    sd t0, -1536(fp)
    li t0, 30
    sd t0, -1544(fp)
    ld t0, -1536(fp)
    sd t0, -1552(fp)
    li t0, 2
    sd t0, -1560(fp)
    ld t0, -1552(fp)
    sd t0, -1536(fp)
    ld t0, -1544(fp)
    sd t1, -1552(fp)
    ld t1, -1560(fp)
    sd t2, -1568(fp)
    mul t2, t0, t1
    sd t2, -1576(fp)
    ld t2, -1568(fp)
    ld t1, -1560(fp)
    ld t0, -1544(fp)
    sd t0, -1568(fp)
    ld t0, -1576(fp)
    sd t1, -1584(fp)
    slli t1, t0, 2
    sd t1, -1592(fp)
    ld t1, -1584(fp)
    ld t0, -1576(fp)
    sd t0, -1600(fp)
    addi t0, fp, -336
    sd t0, -1608(fp)
    ld t0, -1600(fp)
    sd t0, -1600(fp)
    ld t0, -1608(fp)
    sd t1, -1584(fp)
    ld t1, -1592(fp)
    sd t2, -1616(fp)
    add t2, t0, t1
    sd t2, -1624(fp)
    ld t2, -1616(fp)
    ld t1, -1592(fp)
    ld t0, -1608(fp)
    sd t0, -1632(fp)
    li t0, 31
    sd t0, -1640(fp)
    ld t0, -1632(fp)
    sd t0, -1648(fp)
    li t0, 2
    sd t0, -1656(fp)
    ld t0, -1648(fp)
    sd t0, -1632(fp)
    ld t0, -1640(fp)
    sd t1, -1648(fp)
    ld t1, -1656(fp)
    sd t2, -1664(fp)
    mul t2, t0, t1
    sd t2, -1672(fp)
    ld t2, -1664(fp)
    ld t1, -1656(fp)
    ld t0, -1640(fp)
    sd t0, -1664(fp)
    ld t0, -1672(fp)
    sd t1, -1680(fp)
    slli t1, t0, 2
    sd t1, -1688(fp)
    ld t1, -1680(fp)
    ld t0, -1672(fp)
    sd t0, -1696(fp)
    addi t0, fp, -336
    sd t0, -1704(fp)
    ld t0, -1696(fp)
    sd t0, -1696(fp)
    ld t0, -1704(fp)
    sd t1, -1680(fp)
    ld t1, -1688(fp)
    sd t2, -1712(fp)
    add t2, t0, t1
    sd t2, -1720(fp)
    ld t2, -1712(fp)
    ld t1, -1688(fp)
    ld t0, -1704(fp)
    mv a0, t6
    mv a1, t5
    mv a2, t4
    mv a3, t3
    mv a4, t2
    mv a5, t1
    mv a6, t0
    mv a7, s9
    sd s8, 8(sp)
    sd s7, 16(sp)
    sd s6, 24(sp)
    sd s5, 32(sp)
    sd s4, 40(sp)
    sd s3, 48(sp)
    sd s2, 56(sp)
    sd s1, 64(sp)
    sd s10, 72(sp)
    sd s11, 80(sp)
    sd t0, -464(fp)
    ld t0, -472(fp)
    sd t0, 88(sp)
    ld t0, -472(fp)
    sd t0, -560(fp)
    ld t0, -568(fp)
    sd t0, 96(sp)
    ld t0, -568(fp)
    sd t0, -656(fp)
    ld t0, -664(fp)
    sd t0, 104(sp)
    ld t0, -664(fp)
    sd t0, -752(fp)
    ld t0, -760(fp)
    sd t0, 112(sp)
    ld t0, -760(fp)
    sd t0, -848(fp)
    ld t0, -856(fp)
    sd t0, 120(sp)
    ld t0, -856(fp)
    sd t0, -944(fp)
    ld t0, -952(fp)
    sd t0, 128(sp)
    ld t0, -952(fp)
    sd t0, -1040(fp)
    ld t0, -1048(fp)
    sd t0, 136(sp)
    ld t0, -1048(fp)
    sd t0, -1136(fp)
    ld t0, -1144(fp)
    sd t0, 144(sp)
    ld t0, -1144(fp)
    sd t0, -1232(fp)
    ld t0, -1240(fp)
    sd t0, 152(sp)
    ld t0, -1240(fp)
    sd t0, -1328(fp)
    ld t0, -1336(fp)
    sd t0, 160(sp)
    ld t0, -1336(fp)
    sd t0, -1424(fp)
    ld t0, -1432(fp)
    sd t0, 168(sp)
    ld t0, -1432(fp)
    sd t0, -1520(fp)
    ld t0, -1528(fp)
    sd t0, 176(sp)
    ld t0, -1528(fp)
    sd t0, -1616(fp)
    ld t0, -1624(fp)
    sd t0, 184(sp)
    ld t0, -1624(fp)
    sd t0, -1712(fp)
    ld t0, -1720(fp)
    sd t0, 192(sp)
    ld t0, -1720(fp)
    call param32_arr
    mv t0, a0
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    li t0, 0
    mv a0, t0
    j BB31
BB31: 
    ld s1, -352(fp)
    ld s2, -360(fp)
    ld s3, -368(fp)
    ld s4, -376(fp)
    ld s5, -384(fp)
    ld s6, -392(fp)
    ld s7, -400(fp)
    ld s8, -408(fp)
    ld s9, -416(fp)
    ld s10, -424(fp)
    ld s11, -432(fp)
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 640
    ret
