    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $a1
$a1:
    .word 1
    .globl $a2
$a2:
    .word 2
    .globl $a3
$a3:
    .word 3
    .globl $a4
$a4:
    .word 4
    .globl $a5
$a5:
    .word 5
    .globl $a6
$a6:
    .word 6
    .globl $a7
$a7:
    .word 7
    .globl $a8
$a8:
    .word 8
    .globl $a9
$a9:
    .word 9
    .globl $a10
$a10:
    .word 10
    .globl $a11
$a11:
    .word 11
    .globl $a12
$a12:
    .word 12
    .globl $a13
$a13:
    .word 13
    .globl $a14
$a14:
    .word 14
    .globl $a15
$a15:
    .word 15
    .globl $a16
$a16:
    .word 16
    .globl $a17
$a17:
    .word 1
    .globl $a18
$a18:
    .word 2
    .globl $a19
$a19:
    .word 3
    .globl $a20
$a20:
    .word 4
    .globl $a21
$a21:
    .word 5
    .globl $a22
$a22:
    .word 6
    .globl $a23
$a23:
    .word 7
    .globl $a24
$a24:
    .word 8
    .globl $a25
$a25:
    .word 9
    .globl $a26
$a26:
    .word 10
    .globl $a27
$a27:
    .word 11
    .globl $a28
$a28:
    .word 12
    .globl $a29
$a29:
    .word 13
    .globl $a30
$a30:
    .word 14
    .globl $a31
$a31:
    .word 15
    .globl $a32
$a32:
    .word 16
    .align 3
    .globl main
    .text

    .align 1
func: 
BB3: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -192
    addi fp, sp, 192
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB0
BB0: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    add t1, t0, t1
    sw t1, -28(fp)
    call getint
    mv t1, a0
    sw t1, -32(fp)
    call getint
    mv t1, a0
    sw t1, -36(fp)
    call getint
    mv t1, a0
    sw t1, -40(fp)
    call getint
    mv t1, a0
    sw t1, -44(fp)
    lw t1, -32(fp)
    li t0, 1
    add t0, t0, t1
    la t1, $a1
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -48(fp)
    lw t1, -36(fp)
    li t0, 2
    add t0, t0, t1
    la t1, $a2
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -52(fp)
    lw t1, -40(fp)
    li t0, 3
    add t0, t0, t1
    la t1, $a3
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -56(fp)
    lw t1, -44(fp)
    li t0, 4
    add t0, t0, t1
    la t1, $a4
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -60(fp)
    lw t1, -48(fp)
    li t0, 1
    add t0, t0, t1
    la t1, $a5
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -64(fp)
    lw t1, -52(fp)
    li t0, 2
    add t0, t0, t1
    la t1, $a6
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -68(fp)
    lw t1, -56(fp)
    li t0, 3
    add t0, t0, t1
    la t1, $a7
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -72(fp)
    lw t1, -60(fp)
    li t0, 4
    add t0, t0, t1
    la t1, $a8
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -76(fp)
    lw t1, -64(fp)
    li t0, 1
    add t0, t0, t1
    la t1, $a9
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -80(fp)
    lw t1, -68(fp)
    li t0, 2
    add t0, t0, t1
    la t1, $a10
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -84(fp)
    lw t1, -72(fp)
    li t0, 3
    add t0, t0, t1
    la t1, $a11
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -88(fp)
    lw t1, -76(fp)
    li t0, 4
    add t0, t0, t1
    la t1, $a12
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -92(fp)
    lw t1, -80(fp)
    li t0, 1
    add t0, t0, t1
    la t1, $a13
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -96(fp)
    lw t1, -84(fp)
    li t0, 2
    add t0, t0, t1
    la t1, $a14
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -100(fp)
    lw t1, -88(fp)
    li t0, 3
    add t0, t0, t1
    la t1, $a15
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -104(fp)
    lw t1, -92(fp)
    li t0, 4
    add t0, t0, t1
    la t1, $a16
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -108(fp)
    lw t1, -96(fp)
    li t0, 1
    add t0, t0, t1
    la t1, $a17
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -112(fp)
    lw t1, -100(fp)
    li t0, 2
    add t0, t0, t1
    la t1, $a18
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -116(fp)
    lw t1, -104(fp)
    li t0, 3
    add t0, t0, t1
    la t1, $a19
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -120(fp)
    lw t1, -108(fp)
    li t0, 4
    add t0, t0, t1
    la t1, $a20
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -124(fp)
    lw t1, -112(fp)
    li t0, 1
    add t0, t0, t1
    la t1, $a21
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -128(fp)
    lw t1, -116(fp)
    li t0, 2
    add t0, t0, t1
    la t1, $a22
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -132(fp)
    lw t1, -120(fp)
    li t0, 3
    add t0, t0, t1
    la t1, $a23
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -136(fp)
    lw t1, -124(fp)
    li t0, 4
    add t0, t0, t1
    la t1, $a24
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -140(fp)
    lw t1, -128(fp)
    li t0, 1
    add t0, t0, t1
    la t1, $a25
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -144(fp)
    lw t1, -132(fp)
    li t0, 2
    add t0, t0, t1
    la t1, $a26
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -148(fp)
    lw t1, -136(fp)
    li t0, 3
    add t0, t0, t1
    la t1, $a27
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -152(fp)
    lw t1, -140(fp)
    li t0, 4
    add t0, t0, t1
    la t1, $a28
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -156(fp)
    lw t1, -144(fp)
    li t0, 1
    add t0, t0, t1
    la t1, $a29
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -160(fp)
    lw t1, -148(fp)
    li t0, 2
    add t0, t0, t1
    la t1, $a30
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -164(fp)
    lw t1, -152(fp)
    li t0, 3
    add t0, t0, t1
    la t1, $a31
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -168(fp)
    lw t1, -156(fp)
    li t0, 4
    add t0, t0, t1
    la t1, $a32
    lw t1, 0(t1)
    add t1, t0, t1
    sw t1, -172(fp)
    lw t1, -20(fp)
    lw t0, -24(fp)
    sub t0, t1, t0
    addi t0, t0, 10
    sw t0, -28(fp)
    lw t0, -144(fp)
    li t1, 1
    add t1, t1, t0
    la t0, $a29
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -160(fp)
    lw t0, -148(fp)
    li t1, 2
    add t1, t1, t0
    la t0, $a30
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -164(fp)
    lw t0, -152(fp)
    li t1, 3
    add t1, t1, t0
    la t0, $a31
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -168(fp)
    lw t0, -156(fp)
    li t1, 4
    add t1, t1, t0
    la t0, $a32
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -172(fp)
    lw t0, -128(fp)
    li t1, 1
    add t1, t1, t0
    la t0, $a25
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -144(fp)
    lw t0, -132(fp)
    li t1, 2
    add t1, t1, t0
    la t0, $a26
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -148(fp)
    lw t0, -136(fp)
    li t1, 3
    add t1, t1, t0
    la t0, $a27
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -152(fp)
    lw t0, -140(fp)
    li t1, 4
    add t1, t1, t0
    la t0, $a28
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -156(fp)
    lw t0, -112(fp)
    li t1, 1
    add t1, t1, t0
    la t0, $a21
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -128(fp)
    lw t0, -116(fp)
    li t1, 2
    add t1, t1, t0
    la t0, $a22
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -132(fp)
    lw t0, -120(fp)
    li t1, 3
    add t1, t1, t0
    la t0, $a23
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -136(fp)
    lw t0, -124(fp)
    li t1, 4
    add t1, t1, t0
    la t0, $a24
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -140(fp)
    lw t0, -96(fp)
    li t1, 1
    add t1, t1, t0
    la t0, $a17
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -112(fp)
    lw t0, -100(fp)
    li t1, 2
    add t1, t1, t0
    la t0, $a18
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -116(fp)
    lw t0, -104(fp)
    li t1, 3
    add t1, t1, t0
    la t0, $a19
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -120(fp)
    lw t0, -108(fp)
    li t1, 4
    add t1, t1, t0
    la t0, $a20
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -124(fp)
    lw t0, -80(fp)
    li t1, 1
    add t1, t1, t0
    la t0, $a13
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -96(fp)
    lw t0, -84(fp)
    li t1, 2
    add t1, t1, t0
    la t0, $a14
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -100(fp)
    lw t0, -88(fp)
    li t1, 3
    add t1, t1, t0
    la t0, $a15
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -104(fp)
    lw t0, -92(fp)
    li t1, 4
    add t1, t1, t0
    la t0, $a16
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -108(fp)
    lw t0, -64(fp)
    li t1, 1
    add t1, t1, t0
    la t0, $a9
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -80(fp)
    lw t0, -68(fp)
    li t1, 2
    add t1, t1, t0
    la t0, $a10
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -84(fp)
    lw t0, -72(fp)
    li t1, 3
    add t1, t1, t0
    la t0, $a11
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -88(fp)
    lw t0, -76(fp)
    li t1, 4
    add t1, t1, t0
    la t0, $a12
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -92(fp)
    lw t0, -48(fp)
    li t1, 1
    add t1, t1, t0
    la t0, $a5
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -64(fp)
    lw t0, -52(fp)
    li t1, 2
    add t1, t1, t0
    la t0, $a6
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -68(fp)
    lw t0, -56(fp)
    li t1, 3
    add t1, t1, t0
    la t0, $a7
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -72(fp)
    lw t0, -60(fp)
    li t1, 4
    add t1, t1, t0
    la t0, $a8
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -76(fp)
    lw t0, -32(fp)
    li t1, 1
    add t1, t1, t0
    la t0, $a1
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -48(fp)
    lw t0, -36(fp)
    li t1, 2
    add t1, t1, t0
    la t0, $a2
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -52(fp)
    lw t0, -40(fp)
    li t1, 3
    add t1, t1, t0
    la t0, $a3
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -56(fp)
    lw t0, -44(fp)
    li t1, 4
    add t1, t1, t0
    la t0, $a4
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -60(fp)
    lw t0, -32(fp)
    li t1, 1
    add t1, t1, t0
    la t0, $a1
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -48(fp)
    lw t0, -36(fp)
    li t1, 2
    add t1, t1, t0
    la t0, $a2
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -52(fp)
    lw t0, -40(fp)
    li t1, 3
    add t1, t1, t0
    la t0, $a3
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -56(fp)
    lw t0, -44(fp)
    li t1, 4
    add t1, t1, t0
    la t0, $a4
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -60(fp)
    lw t0, -28(fp)
    lw t1, -32(fp)
    add t1, t0, t1
    lw t0, -36(fp)
    add t0, t1, t0
    lw t1, -40(fp)
    add t1, t0, t1
    lw t0, -44(fp)
    add t0, t1, t0
    lw t1, -48(fp)
    sub t1, t0, t1
    lw t0, -52(fp)
    sub t0, t1, t0
    lw t1, -56(fp)
    sub t1, t0, t1
    lw t0, -60(fp)
    sub t0, t1, t0
    lw t1, -64(fp)
    add t1, t0, t1
    lw t0, -68(fp)
    add t0, t1, t0
    lw t1, -72(fp)
    add t1, t0, t1
    lw t0, -76(fp)
    add t0, t1, t0
    lw t1, -80(fp)
    sub t1, t0, t1
    lw t0, -84(fp)
    sub t0, t1, t0
    lw t1, -88(fp)
    sub t1, t0, t1
    lw t0, -92(fp)
    sub t0, t1, t0
    lw t1, -96(fp)
    add t1, t0, t1
    lw t0, -100(fp)
    add t0, t1, t0
    lw t1, -104(fp)
    add t1, t0, t1
    lw t0, -108(fp)
    add t0, t1, t0
    lw t1, -112(fp)
    sub t1, t0, t1
    lw t0, -116(fp)
    sub t0, t1, t0
    lw t1, -120(fp)
    sub t1, t0, t1
    lw t0, -124(fp)
    sub t0, t1, t0
    lw t1, -128(fp)
    add t1, t0, t1
    lw t0, -132(fp)
    add t0, t1, t0
    lw t1, -136(fp)
    add t1, t0, t1
    lw t0, -140(fp)
    add t0, t1, t0
    lw t1, -144(fp)
    sub t1, t0, t1
    lw t0, -148(fp)
    sub t0, t1, t0
    lw t1, -152(fp)
    sub t1, t0, t1
    lw t0, -156(fp)
    sub t0, t1, t0
    lw t1, -160(fp)
    add t1, t0, t1
    lw t0, -164(fp)
    add t0, t1, t0
    lw t1, -168(fp)
    add t1, t0, t1
    lw t0, -172(fp)
    add t0, t1, t0
    la t1, $a1
    lw t1, 0(t1)
    add t1, t0, t1
    la t0, $a2
    lw t0, 0(t0)
    sub t0, t1, t0
    la t1, $a3
    lw t1, 0(t1)
    add t1, t0, t1
    la t0, $a4
    lw t0, 0(t0)
    sub t0, t1, t0
    la t1, $a5
    lw t1, 0(t1)
    add t1, t0, t1
    la t0, $a6
    lw t0, 0(t0)
    sub t0, t1, t0
    la t1, $a7
    lw t1, 0(t1)
    add t1, t0, t1
    la t0, $a8
    lw t0, 0(t0)
    sub t1, t1, t0
    la t0, $a9
    lw t0, 0(t0)
    add t0, t1, t0
    la t1, $a10
    lw t1, 0(t1)
    sub t1, t0, t1
    la t0, $a11
    lw t0, 0(t0)
    add t0, t1, t0
    la t1, $a12
    lw t1, 0(t1)
    sub t1, t0, t1
    la t0, $a13
    lw t0, 0(t0)
    add t0, t1, t0
    la t1, $a14
    lw t1, 0(t1)
    sub t1, t0, t1
    la t0, $a15
    lw t0, 0(t0)
    add t0, t1, t0
    la t1, $a16
    lw t1, 0(t1)
    sub t1, t0, t1
    la t0, $a17
    lw t0, 0(t0)
    add t0, t1, t0
    la t1, $a18
    lw t1, 0(t1)
    sub t1, t0, t1
    la t0, $a19
    lw t0, 0(t0)
    add t0, t1, t0
    la t1, $a20
    lw t1, 0(t1)
    sub t1, t0, t1
    la t0, $a21
    lw t0, 0(t0)
    add t0, t1, t0
    la t1, $a22
    lw t1, 0(t1)
    sub t1, t0, t1
    la t0, $a23
    lw t0, 0(t0)
    add t0, t1, t0
    la t1, $a24
    lw t1, 0(t1)
    sub t1, t0, t1
    la t0, $a25
    lw t0, 0(t0)
    add t0, t1, t0
    la t1, $a26
    lw t1, 0(t1)
    sub t1, t0, t1
    la t0, $a27
    lw t0, 0(t0)
    add t0, t1, t0
    la t1, $a28
    lw t1, 0(t1)
    sub t1, t0, t1
    la t0, $a29
    lw t0, 0(t0)
    add t0, t1, t0
    la t1, $a30
    lw t1, 0(t1)
    sub t1, t0, t1
    la t0, $a31
    lw t0, 0(t0)
    add t0, t1, t0
    la t1, $a32
    lw t1, 0(t1)
    sub t1, t0, t1
    mv a0, t1
    j BB4
BB4: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 192
    ret
    .align 1
main: 
BB5: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB1
BB1: 
    call getint
    mv t0, a0
    sw t0, -20(fp)
    lw t0, -20(fp)
    li t1, 2
    li t2, 9
    mul t2, t1, t2
    add t2, t0, t2
    sw t2, -24(fp)
    lw t2, -20(fp)
    lw t0, -24(fp)
    mv a0, t2
    mv a1, t0
    call func
    mv t0, a0
    sw t0, -20(fp)
    lw t0, -20(fp)
    mv a0, t0
    call putint
    lw t0, -20(fp)
    mv a0, t0
    j BB6
BB6: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
