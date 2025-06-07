    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $gv
    $gv:
        .word 63
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
foo:
.entry_foo:
    sd s7, -8(sp)
    sd s6, -16(sp)
    sd s5, -24(sp)
    sd s4, -32(sp)
    sd s3, -40(sp)
    sd s2, -48(sp)
    sd s1, -56(sp)
    sd fp, -64(sp)
    sd ra, -72(sp)
    addi sp, sp, -120
    addi fp, sp, 120
    mv t6, a1
    mv t5, a2
    mv t4, a3
    mv t3, a4
    mv t2, a5
    mv t1, a6
    mv t0, a7
    ld a6, 0(fp)
    ld a4, 8(fp)
    ld a2, 16(fp)
    j .L0
.L0:
    addi s7, sp, 0
    addi s6, sp, 4
    addi s5, sp, 8
    addi s4, sp, 12
    addi s3, sp, 16
    addi s2, sp, 20
    addi s1, sp, 24
    addi a7, sp, 28
    addi a5, sp, 32
    addi a3, sp, 36
    addi a1, sp, 40
    sw a0, 0(s7)
    sw t6, 0(s6)
    sw t5, 0(s5)
    sw t4, 0(s4)
    sw t3, 0(s3)
    sw t2, 0(s2)
    sw t1, 0(s1)
    sw t0, 0(a7)
    sw a6, 0(a5)
    sw a4, 0(a3)
    sw a2, 0(a1)
    lw a2, 0(s7)
    lw a1, 0(s6)
    lw a0, 0(s5)
    lw t6, 0(s4)
    lw t5, 0(s3)
    lw t4, 0(s2)
    lw t3, 0(s1)
    lw t2, 0(a7)
    lw t1, 0(a5)
    lw t0, 0(a3)
    addw a1, a2, a1
    addw a0, a1, a0
    addw t6, a0, t6
    addw t5, t6, t5
    addw t4, t5, t4
    addw t3, t4, t3
    addw t2, t3, t2
    addw t1, t2, t1
    addw a0, t1, t0
    j .exit_foo
.exit_foo:
    addi sp, sp, 120
    ld s7, -8(sp)
    ld s6, -16(sp)
    ld s5, -24(sp)
    ld s4, -32(sp)
    ld s3, -40(sp)
    ld s2, -48(sp)
    ld s1, -56(sp)
    ld fp, -64(sp)
    ld ra, -72(sp)
    ret
    .align 1
foo2:
.entry_foo2:
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j .L1
.L1:
    addi t3, sp, 24
    li a1, 2
    li a2, 3
    li a3, 4
    li a4, 5
    li a5, 6
    li a6, 7
    li t2, 9
    li t1, 10
    li t0, 11
    sw a0, 0(t3)
    lw a0, 0(t3)
    lw a7, 0(t3)
    sd t2, 0(sp)
    sd t1, 8(sp)
    sd t0, 16(sp)
    call foo
    j .exit_foo2
.exit_foo2:
    addi sp, sp, 48
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
    j .L2
.L2:
    li a0, 1122
    call foo2
    li a0, 0
    j .exit_main
.exit_main:
    addi sp, sp, 16
    ld fp, -8(sp)
    ld ra, -16(sp)
    ret
