    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $a
$a:
    .word 10
    .align 3
    .globl main
    .text

    .align 1
main: 
BB2: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB0
BB0: 
    la t0, $a
    lw t0, 0(t0)
    addi t0, t0, 5
    mv a0, t0
    j BB3
BB3: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
