    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $a
$a:
    .word 7
    .align 3
    .globl main
    .text

    .align 1
func: 
BB17: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB0
BB0: 
    la t0, $a
    lw t0, 0(t0)
    sw t0, -20(fp)
    li t0, 1
    sw t0, -24(fp)
    j BB1
BB1: 
    lw t0, -24(fp)
    lw t1, -20(fp)
    xor t1, t0, t1
    seqz t1, t1
    bnez t1, BB2
    j BB4
BB2: 
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    li t1, 1
    mv a0, t1
    j BB18
BB3: 
BB4: 
    li t1, 0
    mv a0, t1
    j BB18
BB18: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
main: 
BB19: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB5
BB5: 
    li t0, 0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    j BB6
BB6: 
    lw t0, -24(fp)
    slti t0, t0, 100
    bnez t0, BB7
    j BB8
BB7: 
    j BB9
BB8: 
    j BB12
BB9: 
    call func
    mv t0, a0
    xori t0, t0, 1
    seqz t0, t0
    bnez t0, BB10
    j BB11
BB10: 
    lw t0, -20(fp)
    addi t0, t0, 1
    sw t0, -20(fp)
    j BB11
BB11: 
    lw t0, -24(fp)
    addi t0, t0, 1
    sw t0, -24(fp)
    j BB6
BB12: 
    lw t0, -20(fp)
    slti t0, t0, 100
    bnez t0, BB13
    j BB15
BB13: 
    li t0, 1
    mv a0, t0
    call putint
    j BB14
BB14: 
    li t0, 0
    mv a0, t0
    j BB20
BB15: 
    li t0, 0
    mv a0, t0
    call putint
    j BB14
BB20: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
