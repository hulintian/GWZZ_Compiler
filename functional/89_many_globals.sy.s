    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$a0:
    .skip 4
$a1:
    .skip 4
$a2:
    .skip 4
$a3:
    .skip 4
$a4:
    .skip 4
$a5:
    .skip 4
$a6:
    .skip 4
$a7:
    .skip 4
$a8:
    .skip 4
$a9:
    .skip 4
$a10:
    .skip 4
$a11:
    .skip 4
$a12:
    .skip 4
$a13:
    .skip 4
$a14:
    .skip 4
$a15:
    .skip 4
$a16:
    .skip 4
$a17:
    .skip 4
$a18:
    .skip 4
$a19:
    .skip 4
$a20:
    .skip 4
$a21:
    .skip 4
$a22:
    .skip 4
$a23:
    .skip 4
$a24:
    .skip 4
$a25:
    .skip 4
$a26:
    .skip 4
$a27:
    .skip 4
$a28:
    .skip 4
$a29:
    .skip 4
$a30:
    .skip 4
$a31:
    .skip 4
$a32:
    .skip 4
$a33:
    .skip 4
$a34:
    .skip 4
$a35:
    .skip 4
$a36:
    .skip 4
$a37:
    .skip 4
$a38:
    .skip 4
$a39:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
testParam8: 
BB5: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    sw a0, -20(fp)
    sw a1, -24(fp)
    sw a2, -28(fp)
    sw a3, -32(fp)
    sw a4, -36(fp)
    sw a5, -40(fp)
    sw a6, -44(fp)
    sw a7, -48(fp)
    j BB0
BB0: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    add t1, t0, t1
    lw t0, -28(fp)
    add t0, t1, t0
    lw t1, -32(fp)
    add t0, t0, t1
    lw t1, -36(fp)
    add t1, t0, t1
    lw t0, -40(fp)
    add t0, t1, t0
    lw t1, -44(fp)
    add t1, t0, t1
    lw t0, -48(fp)
    add t0, t1, t0
    mv a0, t0
    j BB6
BB6: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
    .align 1
testParam16: 
BB7: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -96
    addi fp, sp, 96
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
    j BB1
BB1: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    add t1, t0, t1
    lw t0, -28(fp)
    add t0, t1, t0
    lw t1, -32(fp)
    sub t0, t0, t1
    lw t1, -36(fp)
    sub t1, t0, t1
    lw t0, -40(fp)
    sub t0, t1, t0
    lw t1, -44(fp)
    sub t1, t0, t1
    lw t0, -48(fp)
    sub t0, t1, t0
    lw t1, -52(fp)
    add t1, t0, t1
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
    mv a0, t0
    j BB8
BB8: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 96
    ret
    .align 1
testParam32: 
BB9: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -160
    addi fp, sp, 160
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
    j BB2
BB2: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    add t1, t0, t1
    lw t0, -28(fp)
    add t0, t1, t0
    lw t1, -32(fp)
    add t0, t0, t1
    lw t1, -36(fp)
    add t1, t0, t1
    lw t0, -40(fp)
    add t0, t1, t0
    lw t1, -44(fp)
    add t1, t0, t1
    lw t0, -48(fp)
    add t0, t1, t0
    lw t1, -52(fp)
    add t1, t0, t1
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
    lw t1, -84(fp)
    add t1, t0, t1
    lw t0, -88(fp)
    add t0, t1, t0
    lw t1, -92(fp)
    sub t1, t0, t1
    lw t0, -96(fp)
    sub t0, t1, t0
    lw t1, -100(fp)
    sub t1, t0, t1
    lw t0, -104(fp)
    sub t0, t1, t0
    lw t1, -108(fp)
    sub t1, t0, t1
    lw t0, -112(fp)
    add t0, t1, t0
    lw t1, -116(fp)
    add t1, t0, t1
    lw t0, -120(fp)
    add t0, t1, t0
    lw t1, -124(fp)
    add t1, t0, t1
    lw t0, -128(fp)
    add t0, t1, t0
    lw t1, -132(fp)
    add t1, t0, t1
    lw t0, -136(fp)
    add t0, t1, t0
    lw t1, -140(fp)
    add t1, t0, t1
    lw t0, -144(fp)
    add t0, t1, t0
    mv a0, t0
    j BB10
BB10: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 160
    ret
    .align 1
main: 
BB11: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -320
    addi fp, sp, 320
    sd s1, -24(fp)
    sd s2, -32(fp)
    sd s3, -40(fp)
    sd s4, -48(fp)
    sd s5, -56(fp)
    sd s6, -64(fp)
    sd s7, -72(fp)
    sd s8, -80(fp)
    sd s9, -88(fp)
    sd s10, -96(fp)
    sd s11, -104(fp)
    j BB3
BB3: 
    li t0, 0
    la t1, $a0
    sw t0, 0(t1)
    li t1, 1
    la t0, $a1
    sw t1, 0(t0)
    li t0, 2
    la t1, $a2
    sw t0, 0(t1)
    li t0, 3
    la t1, $a3
    sw t0, 0(t1)
    li t1, 4
    la t0, $a4
    sw t1, 0(t0)
    li t0, 5
    la t1, $a5
    sw t0, 0(t1)
    li t1, 6
    la t0, $a6
    sw t1, 0(t0)
    li t0, 7
    la t1, $a7
    sw t0, 0(t1)
    li t1, 8
    la t0, $a8
    sw t1, 0(t0)
    li t0, 9
    la t1, $a9
    sw t0, 0(t1)
    li t1, 0
    la t0, $a10
    sw t1, 0(t0)
    li t0, 1
    la t1, $a11
    sw t0, 0(t1)
    li t1, 2
    la t0, $a12
    sw t1, 0(t0)
    li t0, 3
    la t1, $a13
    sw t0, 0(t1)
    li t1, 4
    la t0, $a14
    sw t1, 0(t0)
    li t0, 5
    la t1, $a15
    sw t0, 0(t1)
    li t1, 6
    la t0, $a16
    sw t1, 0(t0)
    li t0, 7
    la t1, $a17
    sw t0, 0(t1)
    li t1, 8
    la t0, $a18
    sw t1, 0(t0)
    li t0, 9
    la t1, $a19
    sw t0, 0(t1)
    li t1, 0
    la t0, $a20
    sw t1, 0(t0)
    li t0, 1
    la t1, $a21
    sw t0, 0(t1)
    li t1, 2
    la t0, $a22
    sw t1, 0(t0)
    li t0, 3
    la t1, $a23
    sw t0, 0(t1)
    li t1, 4
    la t0, $a24
    sw t1, 0(t0)
    li t0, 5
    la t1, $a25
    sw t0, 0(t1)
    li t1, 6
    la t0, $a26
    sw t1, 0(t0)
    li t0, 7
    la t1, $a27
    sw t0, 0(t1)
    li t1, 8
    la t0, $a28
    sw t1, 0(t0)
    li t0, 9
    la t1, $a29
    sw t0, 0(t1)
    li t1, 0
    la t0, $a30
    sw t1, 0(t0)
    li t0, 1
    la t1, $a31
    sw t0, 0(t1)
    li t1, 4
    la t0, $a32
    sw t1, 0(t0)
    li t0, 5
    la t1, $a33
    sw t0, 0(t1)
    li t1, 6
    la t0, $a34
    sw t1, 0(t0)
    li t0, 7
    la t1, $a35
    sw t0, 0(t1)
    li t1, 8
    la t0, $a36
    sw t1, 0(t0)
    li t0, 9
    la t1, $a37
    sw t0, 0(t1)
    li t1, 0
    la t0, $a38
    sw t1, 0(t0)
    li t0, 1
    la t1, $a39
    sw t0, 0(t1)
    la t1, $a0
    lw t1, 0(t1)
    la t0, $a1
    lw t0, 0(t0)
    la t2, $a2
    lw t2, 0(t2)
    la t3, $a3
    lw t3, 0(t3)
    la t4, $a4
    lw t4, 0(t4)
    la t5, $a5
    lw t5, 0(t5)
    la t6, $a6
    lw t6, 0(t6)
    la s1, $a7
    lw s1, 0(s1)
    mv a0, t1
    mv a1, t0
    mv a2, t2
    mv a3, t3
    mv a4, t4
    mv a5, t5
    mv a6, t6
    mv a7, s1
    call testParam8
    mv t6, a0
    la t5, $a0
    sw t6, 0(t5)
    la t5, $a0
    lw t5, 0(t5)
    mv a0, t5
    call putint
    la t5, $a32
    lw t5, 0(t5)
    la t6, $a33
    lw t6, 0(t6)
    la t4, $a34
    lw t4, 0(t4)
    la t3, $a35
    lw t3, 0(t3)
    la t2, $a36
    lw t2, 0(t2)
    la t0, $a37
    lw t0, 0(t0)
    la t1, $a38
    lw t1, 0(t1)
    la s1, $a39
    lw s1, 0(s1)
    la s2, $a8
    lw s2, 0(s2)
    la s3, $a9
    lw s3, 0(s3)
    la s4, $a10
    lw s4, 0(s4)
    la s5, $a11
    lw s5, 0(s5)
    la s6, $a12
    lw s6, 0(s6)
    la s7, $a13
    lw s7, 0(s7)
    la s8, $a14
    lw s8, 0(s8)
    la s9, $a15
    lw s9, 0(s9)
    mv a0, t5
    mv a1, t6
    mv a2, t4
    mv a3, t3
    mv a4, t2
    mv a5, t0
    mv a6, t1
    mv a7, s1
    sw s2, 8(sp)
    sw s3, 16(sp)
    sw s4, 24(sp)
    sw s5, 32(sp)
    sw s6, 40(sp)
    sw s7, 48(sp)
    sw s8, 56(sp)
    sw s9, 64(sp)
    call testParam16
    mv t1, a0
    la t0, $a0
    sw t1, 0(t0)
    la t0, $a0
    lw t0, 0(t0)
    mv a0, t0
    call putint
    la t0, $a0
    lw t0, 0(t0)
    la t1, $a1
    lw t1, 0(t1)
    la t2, $a2
    lw t2, 0(t2)
    la t3, $a3
    lw t3, 0(t3)
    la t4, $a4
    lw t4, 0(t4)
    la t6, $a5
    lw t6, 0(t6)
    la t5, $a6
    lw t5, 0(t5)
    la s9, $a7
    lw s9, 0(s9)
    la s8, $a8
    lw s8, 0(s8)
    la s7, $a9
    lw s7, 0(s7)
    la s6, $a10
    lw s6, 0(s6)
    la s5, $a11
    lw s5, 0(s5)
    la s4, $a12
    lw s4, 0(s4)
    la s3, $a13
    lw s3, 0(s3)
    la s2, $a14
    lw s2, 0(s2)
    la s1, $a15
    lw s1, 0(s1)
    la s10, $a16
    lw s10, 0(s10)
    la s11, $a17
    lw s11, 0(s11)
    sd t0, -24(fp)
    la t0, $a18
    sd t0, -32(fp)
    ld t0, -24(fp)
    sd t0, -24(fp)
    ld t0, -32(fp)
    sd t1, -40(fp)
    lw t1, 0(t0)
    sd t1, -48(fp)
    ld t1, -40(fp)
    ld t0, -32(fp)
    sd t0, -56(fp)
    la t0, $a19
    sd t0, -64(fp)
    ld t0, -56(fp)
    sd t0, -56(fp)
    ld t0, -64(fp)
    sd t1, -72(fp)
    lw t1, 0(t0)
    sd t1, -80(fp)
    ld t1, -72(fp)
    ld t0, -64(fp)
    sd t0, -88(fp)
    la t0, $a20
    sd t0, -96(fp)
    ld t0, -88(fp)
    sd t0, -88(fp)
    ld t0, -96(fp)
    sd t1, -104(fp)
    lw t1, 0(t0)
    sd t1, -112(fp)
    ld t1, -104(fp)
    ld t0, -96(fp)
    sd t0, -120(fp)
    la t0, $a21
    sd t0, -128(fp)
    ld t0, -120(fp)
    sd t0, -120(fp)
    ld t0, -128(fp)
    sd t1, -136(fp)
    lw t1, 0(t0)
    sd t1, -144(fp)
    ld t1, -136(fp)
    ld t0, -128(fp)
    sd t0, -152(fp)
    la t0, $a22
    sd t0, -160(fp)
    ld t0, -152(fp)
    sd t0, -152(fp)
    ld t0, -160(fp)
    sd t1, -168(fp)
    lw t1, 0(t0)
    sd t1, -176(fp)
    ld t1, -168(fp)
    ld t0, -160(fp)
    sd t0, -184(fp)
    la t0, $a23
    sd t0, -192(fp)
    ld t0, -184(fp)
    sd t0, -184(fp)
    ld t0, -192(fp)
    sd t1, -200(fp)
    lw t1, 0(t0)
    sd t1, -208(fp)
    ld t1, -200(fp)
    ld t0, -192(fp)
    sd t0, -216(fp)
    la t0, $a24
    sd t0, -224(fp)
    ld t0, -216(fp)
    sd t0, -216(fp)
    ld t0, -224(fp)
    sd t1, -232(fp)
    lw t1, 0(t0)
    sd t1, -240(fp)
    ld t1, -232(fp)
    ld t0, -224(fp)
    sd t0, -248(fp)
    la t0, $a25
    sd t0, -256(fp)
    ld t0, -248(fp)
    sd t0, -248(fp)
    ld t0, -256(fp)
    sd t1, -264(fp)
    lw t1, 0(t0)
    sd t1, -272(fp)
    ld t1, -264(fp)
    ld t0, -256(fp)
    sd t0, -280(fp)
    la t0, $a26
    sd t0, -288(fp)
    ld t0, -280(fp)
    sd t0, -280(fp)
    ld t0, -288(fp)
    sd t1, -296(fp)
    lw t1, 0(t0)
    sd t1, -304(fp)
    ld t1, -296(fp)
    ld t0, -288(fp)
    sd t0, -312(fp)
    la t0, $a27
    sd t0, -320(fp)
    ld t0, -312(fp)
    sd t0, -312(fp)
    ld t0, -320(fp)
    sd t1, -328(fp)
    lw t1, 0(t0)
    sd t1, -336(fp)
    ld t1, -328(fp)
    ld t0, -320(fp)
    sd t0, -344(fp)
    la t0, $a28
    sd t0, -352(fp)
    ld t0, -344(fp)
    sd t0, -344(fp)
    ld t0, -352(fp)
    sd t1, -360(fp)
    lw t1, 0(t0)
    sd t1, -368(fp)
    ld t1, -360(fp)
    ld t0, -352(fp)
    sd t0, -376(fp)
    la t0, $a29
    sd t0, -384(fp)
    ld t0, -376(fp)
    sd t0, -376(fp)
    ld t0, -384(fp)
    sd t1, -392(fp)
    lw t1, 0(t0)
    sd t1, -400(fp)
    ld t1, -392(fp)
    ld t0, -384(fp)
    sd t0, -408(fp)
    la t0, $a30
    sd t0, -416(fp)
    ld t0, -408(fp)
    sd t0, -408(fp)
    ld t0, -416(fp)
    sd t1, -424(fp)
    lw t1, 0(t0)
    sd t1, -432(fp)
    ld t1, -424(fp)
    ld t0, -416(fp)
    sd t0, -440(fp)
    la t0, $a31
    sd t0, -448(fp)
    ld t0, -440(fp)
    sd t0, -440(fp)
    ld t0, -448(fp)
    sd t1, -456(fp)
    lw t1, 0(t0)
    sd t1, -464(fp)
    ld t1, -456(fp)
    ld t0, -448(fp)
    mv a0, t0
    mv a1, t1
    mv a2, t2
    mv a3, t3
    mv a4, t4
    mv a5, t6
    mv a6, t5
    mv a7, s9
    sw s8, 8(sp)
    sw s7, 16(sp)
    sw s6, 24(sp)
    sw s5, 32(sp)
    sw s4, 40(sp)
    sw s3, 48(sp)
    sw s2, 56(sp)
    sw s1, 64(sp)
    sw s10, 72(sp)
    sw s11, 80(sp)
    sd t0, -40(fp)
    ld t0, -48(fp)
    sw t0, 88(sp)
    ld t0, -48(fp)
    sd t0, -72(fp)
    ld t0, -80(fp)
    sw t0, 96(sp)
    ld t0, -80(fp)
    sd t0, -104(fp)
    ld t0, -112(fp)
    sw t0, 104(sp)
    ld t0, -112(fp)
    sd t0, -136(fp)
    ld t0, -144(fp)
    sw t0, 112(sp)
    ld t0, -144(fp)
    sd t0, -168(fp)
    ld t0, -176(fp)
    sw t0, 120(sp)
    ld t0, -176(fp)
    sd t0, -200(fp)
    ld t0, -208(fp)
    sw t0, 128(sp)
    ld t0, -208(fp)
    sd t0, -232(fp)
    ld t0, -240(fp)
    sw t0, 136(sp)
    ld t0, -240(fp)
    sd t0, -264(fp)
    ld t0, -272(fp)
    sw t0, 144(sp)
    ld t0, -272(fp)
    sd t0, -296(fp)
    ld t0, -304(fp)
    sw t0, 152(sp)
    ld t0, -304(fp)
    sd t0, -328(fp)
    ld t0, -336(fp)
    sw t0, 160(sp)
    ld t0, -336(fp)
    sd t0, -360(fp)
    ld t0, -368(fp)
    sw t0, 168(sp)
    ld t0, -368(fp)
    sd t0, -392(fp)
    ld t0, -400(fp)
    sw t0, 176(sp)
    ld t0, -400(fp)
    sd t0, -424(fp)
    ld t0, -432(fp)
    sw t0, 184(sp)
    ld t0, -432(fp)
    sd t0, -456(fp)
    ld t0, -464(fp)
    sw t0, 192(sp)
    ld t0, -464(fp)
    call testParam32
    mv t5, a0
    la t6, $a0
    sw t5, 0(t6)
    la t6, $a0
    lw t6, 0(t6)
    mv a0, t6
    call putint
    li t6, 0
    mv a0, t6
    j BB12
BB12: 
    ld s1, -24(fp)
    ld s2, -32(fp)
    ld s3, -40(fp)
    ld s4, -48(fp)
    ld s5, -56(fp)
    ld s6, -64(fp)
    ld s7, -72(fp)
    ld s8, -80(fp)
    ld s9, -88(fp)
    ld s10, -96(fp)
    ld s11, -104(fp)
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 320
    ret
