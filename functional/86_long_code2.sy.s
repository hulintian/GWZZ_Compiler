    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$a:
    .skip 400000
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
    li t0, 4
    li t1, 20000
    mul t1, t0, t1
    li t0, 19999
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    li t1, 1
    sw t1, 0(t0)
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t0, t0, t2
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t0, t0, t1
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t2, t2, t1
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t0, t0, t1
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t0, t0, t2
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t0, t0, t1
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t1, t1, t0
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 2
    li t2, 2
    mul t2, t0, t2
    li t0, 20000
    mul t0, t2, t0
    li t2, 20000
    addi t2, t2, -1
    add t2, t0, t2
    lla t0, $a
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, 2
    li t0, 2
    mul t0, t1, t0
    li t1, 20000
    mul t1, t0, t1
    li t0, 20000
    addi t0, t0, -1
    add t0, t1, t0
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, 2
    li t1, 2
    mul t1, t2, t1
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t0, t0, t1
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t1, t1, t2
    li t2, 20000
    mul t2, t1, t2
    li t1, 20000
    addi t1, t1, -1
    add t1, t2, t1
    lla t2, $a
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    add t0, t0, t1
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    li t1, 2
    li t2, 2
    mul t2, t1, t2
    li t1, 20000
    mul t1, t2, t1
    li t2, 20000
    addi t2, t2, -1
    add t2, t1, t2
    lla t1, $a
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, 2
    li t1, 2
    mul t1, t0, t1
    li t0, 20000
    mul t0, t1, t0
    li t1, 20000
    addi t1, t1, -1
    add t1, t0, t1
    lla t0, $a
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 2
    li t0, 2
    mul t0, t2, t0
    li t2, 20000
    mul t2, t0, t2
    li t0, 20000
    addi t0, t0, -1
    add t0, t2, t0
    lla t2, $a
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, -20(fp)
    lw t0, -20(fp)
    mv a0, t0
    j BB3
BB3: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
