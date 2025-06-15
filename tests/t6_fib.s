    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text
    .align 1
fib:
.entry_fib:
    sd s2, -8(sp)
    sd s1, -16(sp)
    sd fp, -24(sp)
    sd ra, -32(sp)
    addi sp, sp, -40
    addi fp, sp, 40
    j .L0
.L0:
    addi s2, sp, 0
    sw a0, 0(s2)
    lw t1, 0(s2)
    li t0, 2
    bgt t1, t0, .L2
    j .L1
.L1:
    li a0, 1
    j .exit_fib
.L2:
    lw t1, 0(s2)
    li t0, 1
    subw a0, t1, t0
    call fib
    mv s1, a0
    lw t1, 0(s2)
    li t0, 2
    subw a0, t1, t0
    call fib
    addw a0, s1, a0
    j .exit_fib
.exit_fib:
    addi sp, sp, 40
    ld s2, -8(sp)
    ld s1, -16(sp)
    ld fp, -24(sp)
    ld ra, -32(sp)
    ret
    .align 1
main:
.entry_main:
    sd s1, -8(sp)
    sd fp, -16(sp)
    sd ra, -24(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j .L3
.L3:
    addi s1, sp, 0
    call getint
    sw a0, 0(s1)
    lw a0, 0(s1)
    call fib
    call putint
    call putline
    li a0, 0
    j .exit_main
.exit_main:
    addi sp, sp, 32
    ld s1, -8(sp)
    ld fp, -16(sp)
    ld ra, -24(sp)
    ret
