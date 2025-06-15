    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $arr
    $arr:
        .word 1
        .word 2
        .word 3
        .word 4
        .word 5
    .globl $g_c
    $g_c:
        .word 3
    .align 3
    .globl main
    .text
    .align 1
main:
.entry_main:
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -24
    addi fp, sp, 24
    j .L0
.L0:
    addi t4, sp, 0
    li t3, 3
    li t2, 3
    la t1, $arr
    li t0, -1342177281
    addw t2, t3, t2
    addi t1, t1, 4
    sw t2, 0(t4)
    sw t0, 0(t1)
    lw a0, 0(t4)
    call putintl
    li a0, 0
    j .exit_main
.exit_main:
    addi sp, sp, 24
    ld fp, -8(sp)
    ld ra, -16(sp)
    ret
    .align 1
foo:
.entry_foo:
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -416
    addi fp, sp, 416
    j .L1
.L1:
    li a0, 0
    j .exit_foo
.exit_foo:
    addi sp, sp, 416
    ld fp, -8(sp)
    ld ra, -16(sp)
    ret
