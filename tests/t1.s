    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $c
    $c:
        .word 1
    .align 3
    .globl main
    .text
    .align 1
add:
.entry_add:
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -24
    addi fp, sp, 24
    mv t0, a0
    j .L0
.L0:
    addi t1, sp, 0
    addi t2, sp, 4
    sw t0, 0(t1)
    sw a1, 0(t2)
    lw t1, 0(t1)
    lw t0, 0(t2)
    addw a0, t1, t0
    j .exit_add
.exit_add:
    addi sp, sp, 24
    ld fp, -8(sp)
    ld ra, -16(sp)
    ret
    .align 1
b:
.entry_b:
    sd s1, -8(sp)
    sd fp, -16(sp)
    sd ra, -24(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j .L1
.L1:
    addi s1, sp, 0
    li a0, 1
    li a1, 2
    call add
    sw a0, 0(s1)
    lw a0, 0(s1)
    call putint
    call putline
    lw t1, 0(s1)
    li t0, 1066192077
    fmv.s.x ft1, t0
    fcvt.s.w ft0, t1
    fadd.s fa0, ft1, ft0
    j .exit_b
.exit_b:
    addi sp, sp, 32
    ld s1, -8(sp)
    ld fp, -16(sp)
    ld ra, -24(sp)
    ret
    .align 1
main:
.entry_main:
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -16
    addi fp, sp, 16
    j .L2
.L2:
    call b
    call putfloat
    call putline
    la t0, $c
    lw a0, 0(t0)
    call putintl
    li a0, 0
    j .exit_main
.exit_main:
    addi sp, sp, 16
    ld fp, -8(sp)
    ld ra, -16(sp)
    ret
