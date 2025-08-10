    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$a:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
func: 
BB3: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    j BB0
BB0: 
    lw t0, -20(fp)
    addi t0, t0, -1
    sw t0, -20(fp)
    lw t0, -20(fp)
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
    addi sp, sp, -48
    addi fp, sp, 48
    j BB1
BB1: 
    li t0, 10
    la t1, $a
    sw t0, 0(t1)
    la t1, $a
    lw t1, 0(t1)
    mv a0, t1
    call func
    mv t1, a0
    sw t1, -20(fp)
    lw t1, -20(fp)
    mv a0, t1
    j BB6
BB6: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
