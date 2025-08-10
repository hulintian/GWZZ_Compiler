    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$a:
    .skip 16384
    .align 3
    .globl main
    .text

    .align 1
f1: 
BB3: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sd a0, -24(fp)
    j BB0
BB0: 
    lla t0, $a
    addi t0, fp, 20
    li t1, 4000
    sw t1, 0(t0)
    lla t1, $a
    li t1, 16000
    add t1, fp, t1
    li t0, 3
    sw t0, 0(t1)
    lla t0, $a
    li t0, 16380
    add t0, fp, t0
    li t1, 7
    sw t1, 0(t0)
    lla t1, $a
    li t1, 16380
    add t1, fp, t1
    lw t1, 0(t1)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lla t0, $a
    li t0, 8864
    add t0, fp, t0
    lw t0, 0(t0)
    addi t0, t0, 9
    sw t0, 0(t1)
    lla t0, $a
    addi t0, fp, 20
    lw t0, 0(t0)
    lla t1, $a
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    mv a0, t0
    j BB4
BB4: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
main: 
BB5: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    li t0, -32800
    add sp, sp, t0
    li t0, 32800
    add fp, sp, t0
    j BB1
BB1: 
    li t0, -12304
    add t0, fp, t0
    li t1, 1
    sw t1, 0(t0)
    li t1, -8208
    add t1, fp, t1
    li t0, 2
    sw t0, 0(t1)
    li t1, -8204
    add t1, fp, t1
    li t0, 3
    sw t0, 0(t1)
    li t0, -4112
    add t0, fp, t0
    li t1, 4
    sw t1, 0(t0)
    li t1, -4108
    add t1, fp, t1
    li t0, 5
    sw t0, 0(t1)
    li t0, -4104
    add t0, fp, t0
    li t1, 6
    sw t1, 0(t0)
    li t1, -32784
    add t1, fp, t1
    li t0, 1
    sw t0, 0(t1)
    li t0, -32780
    add t0, fp, t0
    li t1, 2
    sw t1, 0(t0)
    li t1, -32768
    add t1, fp, t1
    li t0, 3
    sw t0, 0(t1)
    li t0, -32764
    add t0, fp, t0
    li t1, 4
    sw t1, 0(t0)
    li t1, 0
    li t0, 4
    mul t0, t1, t0
    slli t0, t0, 2
    li t1, -32784
    add t1, t0, t1
    add t1, fp, t1
    mv a0, t1
    call f1
    mv t1, a0
    mv a0, t1
    call putint
    li t1, 10
    mv a0, t1
    call putch
    li t1, 2
    li t0, 4
    mul t0, t1, t0
    slli t0, t0, 2
    li t1, -32784
    add t1, t0, t1
    add t1, fp, t1
    lw t1, 0(t1)
    mv a0, t1
    j BB6
BB6: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    li t0, 32800
    add sp, sp, t0
    ret
