    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text
    .align 1
partition:
.entry_partition:
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    mv t1, a0
    mv t0, a1
    j .L0
.L0:
    addi t4, sp, 0
    sw t0, 0(t4)
    addi t5, sp, 4
    sw a2, 0(t5)
    addi t6, sp, 8
    lw t0, 0(t5)
    slli t0, t0, 2
    add t0, t0, t1
    lw t0, 0(t0)
    sw t0, 0(t6)
    addi t3, sp, 12
    lw t2, 0(t4)
    li t0, 1
    subw t0, t2, t0
    sw t0, 0(t3)
    addi a0, sp, 16
    lw t0, 0(t4)
    sw t0, 0(a0)
.L1:
    lw t4, 0(a0)
    lw t2, 0(t5)
    li t0, 1
    subw t0, t2, t0
    bgt t4, t0, .L4
.L2:
    lw t0, 0(a0)
    slli t0, t0, 2
    add t0, t0, t1
    lw t2, 0(t0)
    lw t0, 0(t6)
    bge t2, t0, .L6
.L3:
    lw t4, 0(a0)
    lw t2, 0(t5)
    li t0, 1
    subw t0, t2, t0
    bgt t4, t0, .L4
.L4:
    addi t4, sp, 20
    lw t2, 0(t3)
    li t0, 1
    addw t0, t2, t0
    slli t0, t0, 2
    add t0, t0, t1
    lw t0, 0(t0)
    sw t0, 0(t4)
    lw t2, 0(t3)
    li t0, 1
    addw t0, t2, t0
    slli t0, t0, 2
    add t2, t0, t1
    lw t0, 0(t5)
    slli t0, t0, 2
    add t0, t0, t1
    lw t0, 0(t0)
    sw t0, 0(t2)
    lw t0, 0(t5)
    slli t0, t0, 2
    add t1, t0, t1
    lw t0, 0(t4)
    sw t0, 0(t1)
    lw t1, 0(t3)
    li t0, 1
    addw a0, t1, t0
.L5:
    lw t2, 0(t3)
    li t0, 1
    addw t0, t2, t0
    sw t0, 0(t3)
    addi t4, sp, 24
    lw t0, 0(t3)
    slli t0, t0, 2
    add t0, t0, t1
    lw t0, 0(t0)
    sw t0, 0(t4)
    lw t0, 0(t3)
    slli t0, t0, 2
    add t2, t0, t1
    lw t0, 0(a0)
    slli t0, t0, 2
    add t0, t0, t1
    lw t0, 0(t0)
    sw t0, 0(t2)
    lw t0, 0(a0)
    slli t0, t0, 2
    add t2, t0, t1
    lw t0, 0(t4)
    sw t0, 0(t2)
.L6:
    lw t2, 0(a0)
    li t0, 1
    addw t0, t2, t0
    sw t0, 0(a0)
.exit_partition:
    addi sp, sp, 48
    ld fp, -8(sp)
    ld ra, -16(sp)
    ret
    .align 1
quick_sort:
.entry_quick_sort:
    sd s4, -8(sp)
    sd s3, -16(sp)
    sd s2, -24(sp)
    sd s1, -32(sp)
    sd fp, -40(sp)
    sd ra, -48(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    mv s1, a0
    j .L7
.L7:
    addi s4, sp, 0
    sw a1, 0(s4)
    addi s2, sp, 4
    sw a2, 0(s2)
    lw t1, 0(s4)
    lw t0, 0(s2)
    bge t1, t0, .L9
.L8:
    addi s3, sp, 8
    lw a1, 0(s4)
    lw a2, 0(s2)
    mv a0, s1
    call partition
    sw a0, 0(s3)
    lw a1, 0(s4)
    lw t1, 0(s3)
    li t0, 1
    subw a2, t1, t0
    mv a0, s1
    call quick_sort
    lw t1, 0(s3)
    li t0, 1
    addw a1, t1, t0
    lw a2, 0(s2)
    mv a0, s1
    call quick_sort
.L9:
.exit_quick_sort:
    addi sp, sp, 64
    ld s4, -8(sp)
    ld s3, -16(sp)
    ld s2, -24(sp)
    ld s1, -32(sp)
    ld fp, -40(sp)
    ld ra, -48(sp)
    ret
    .align 1
main:
.entry_main:
    sd s1, -8(sp)
    sd fp, -16(sp)
    sd ra, -24(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    j .L10
.L10:
    addi s1, sp, 0
    mv a0, s1
    call getarray
    li a0, 10
    mv a1, s1
    call putarray
    li a2, 9
    mv a0, s1
    mv a1, zero
    call quick_sort
    li a0, 10
    mv a1, s1
    call putarray
    li a0, 0
.exit_main:
    addi sp, sp, 64
    ld s1, -8(sp)
    ld fp, -16(sp)
    ld ra, -24(sp)
    ret
