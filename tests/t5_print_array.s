    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text
__create_threads:
    li a5, 3
.Label1:
    li a0, 273
    mv a1, sp
    li a2, 0
    li a3, 0
    li a4, 0
    li a7, 220
    ecall
    li a1, -1
    beq a0, a1, .Label1
    beqz a0, .Label2
    addi a5, a5, -1
    bnez a5, .Label1
.Label2:
    mv a0, a5
    ret

__join_threads:
    li a1, 3
    mv a5, a0
    beq a0, a1, .Label3
.Label4:
    li a0, 0
    li a1, 0
    li a2, 0
    li a3, 4
    li a7, 95
    ecall
    li a3, -1
    beq a3, a0, .Label4
    bnez a5, .Label3
.sleep:
    li a0, 0
    sd a0, -16(sp)
    li a0, 1
    slli a0, a0, 29
    sd a0, -8(sp)
    addi sp, sp, -16
    mv a0, sp
    li a7, 101
    addi sp, sp, 16
    ecall
    bnez a0, .sleep
    ret
.Label3:
    li a0, 0
    li a7, 93
    ecall

    .align 1
main:
.entry_main:
    sd s1, -8(sp)
    sd fp, -16(sp)
    sd ra, -24(sp)
    addi sp, sp, -72
    addi fp, sp, 72
    j .L0
.L0:
    addi s1, sp, 0
    li a3, 1
    li a2, 2
    li a1, 3
    li t6, 4
    li t5, 5
    li t4, 6
    li t3, 7
    li t2, 8
    li t1, 9
    li t0, 10
    li a0, 10
    sw a3, 0(s1)
    sw a2, 4(s1)
    sw a1, 8(s1)
    sw t6, 12(s1)
    sw t5, 16(s1)
    sw t4, 20(s1)
    sw t3, 24(s1)
    sw t2, 28(s1)
    sw t1, 32(s1)
    sw t0, 36(s1)
    mv a1, s1
    call putarray
    addi t1, sp, 40
    li t0, 9
    li a0, 10
    sw t0, 0(t1)
    mv a1, s1
    call putarray
    li a0, 0
    j .exit_main
.exit_main:
    addi sp, sp, 72
    ld s1, -8(sp)
    ld fp, -16(sp)
    ld ra, -24(sp)
    ret
