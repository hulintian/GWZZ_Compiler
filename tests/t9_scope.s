    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text
    .align 1
foo:
.entry_foo:
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -40
    addi fp, sp, 40
    mv t1, a0
    j .L0
.L0:
    addi a3, sp, 0
    addi a2, sp, 4
    addi a0, sp, 8
    li t6, 1804289383
    addi t5, sp, 12
    li t4, 846930886
    addi t3, sp, 16
    li t2, 1681692777
    li t0, 0
    sw t1, 0(a3)
    sw a1, 0(a2)
    sw t6, 0(a0)
    sw t4, 0(t5)
    lw t1, 0(a3)
    sw t1, 0(t5)
    sw t2, 0(t3)
    lw t1, 0(a0)
    sw t1, 0(t3)
    mv a0, t0
    j .exit_foo
.exit_foo:
    addi sp, sp, 40
    ld fp, -8(sp)
    ld ra, -16(sp)
    ret
