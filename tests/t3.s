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
    .align 3
    .globl main
    .text
    .align 1
main:
.entry_main:
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -16
    addi fp, sp, 16
    j .L0
.L0:
    la t1, $arr
    li t0, -1342177281
    li a0, 0
    addi t1, t1, 4
    sw t0, 0(t1)
    j .exit_main
.exit_main:
    addi sp, sp, 16
    ld fp, -8(sp)
    ld ra, -16(sp)
    ret
