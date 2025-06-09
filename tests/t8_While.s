    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text
    .align 1
doubleWhile:
.entry_doubleWhile:
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -24
    addi fp, sp, 24
    j .L0
.L0:
    addi t5, sp, 0
    li t4, 1804289383
    li t3, 5
    addi t2, sp, 4
    li t1, 846930886
    li t0, 7
    sw t4, 0(t5)
    sw t3, 0(t5)
    sw t1, 0(t2)
    sw t0, 0(t2)
    j .L1
.L1:
    lw t1, 0(t5)
    li t0, 100
    bge t1, t0, .L4
    j .L2
.L2:
    lw t1, 0(t5)
    li t0, 30
    addw t0, t1, t0
    sw t0, 0(t5)
    j .L5
.L3:
    lw t1, 0(t5)
    li t0, 100
    bge t1, t0, .L4
    j .L2
.L4:
    lw a0, 0(t2)
    j .exit_doubleWhile
.L5:
    lw t1, 0(t2)
    li t0, 100
    bge t1, t0, .L8
    j .L6
.L6:
    lw t1, 0(t2)
    li t0, 6
    addw t0, t1, t0
    sw t0, 0(t2)
    j .L7
.L7:
    lw t1, 0(t2)
    li t0, 100
    bge t1, t0, .L8
    j .L6
.L8:
    lw t1, 0(t2)
    li t0, 100
    subw t0, t1, t0
    sw t0, 0(t2)
    j .L3
.exit_doubleWhile:
    addi sp, sp, 24
    ld fp, -8(sp)
    ld ra, -16(sp)
    ret
    .align 1
main:
.entry_main:
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -16
    addi fp, sp, 16
    j .L9
.L9:
    call doubleWhile
    call putintl
    li a0, 0
    j .exit_main
.exit_main:
    addi sp, sp, 16
    ld fp, -8(sp)
    ld ra, -16(sp)
    ret
