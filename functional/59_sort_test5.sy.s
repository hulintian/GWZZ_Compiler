    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$n:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
swap: 
BB25: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    sw a1, -28(fp)
    sw a2, -32(fp)
    j BB0
BB0: 
    lw t0, -28(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    sw t0, -36(fp)
    lw t0, -28(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t1, -32(fp)
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    sw t1, 0(t0)
    lw t1, -32(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -36(fp)
    sw t0, 0(t1)
    li t0, 0
    mv a0, t0
    j BB26
BB26: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
heap_ajust: 
BB27: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    sd a0, -24(fp)
    sw a1, -28(fp)
    sw a2, -32(fp)
    j BB1
BB1: 
    lw t0, -28(fp)
    sw t0, -36(fp)
    lw t0, -36(fp)
    li t1, 2
    mul t1, t0, t1
    addi t1, t1, 1
    sw t1, -40(fp)
    j BB2
BB2: 
    lw t1, -40(fp)
    lw t0, -32(fp)
    addi t0, t0, 1
    slt t0, t1, t0
    bnez t0, BB3
    j BB4
BB3: 
    j BB5
BB4: 
    li t0, 0
    mv a0, t0
    j BB28
BB5: 
    lw t0, -40(fp)
    lw t1, -32(fp)
    slt t1, t0, t1
    bnez t1, BB8
    j BB7
BB6: 
    lw t1, -40(fp)
    addi t1, t1, 1
    sw t1, -40(fp)
    j BB7
BB7: 
    j BB9
BB8: 
    lw t1, -40(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    lw t0, -40(fp)
    addi t0, t0, 1
    ld t2, -24(fp)
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    slt t0, t1, t0
    bnez t0, BB6
    j BB7
BB9: 
    lw t0, -36(fp)
    ld t1, -24(fp)
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    lw t1, -40(fp)
    ld t2, -24(fp)
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    slt t1, t1, t0
    bnez t1, BB10
    j BB12
BB10: 
    li t1, 0
    mv a0, t1
    j BB28
BB11: 
    j BB2
BB12: 
    lw t1, -36(fp)
    lw t0, -40(fp)
    addi t2, fp, -24
    mv a0, t2
    mv a1, t1
    mv a2, t0
    call swap
    mv t0, a0
    sw t0, -36(fp)
    lw t0, -40(fp)
    sw t0, -36(fp)
    lw t0, -36(fp)
    li t1, 2
    mul t1, t0, t1
    addi t1, t1, 1
    sw t1, -40(fp)
    j BB11
BB28: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
    .align 1
heap_sort: 
BB29: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    sd a0, -24(fp)
    sw a1, -28(fp)
    j BB13
BB13: 
    lw t0, -28(fp)
    li t1, 2
    div t1, t0, t1
    addi t1, t1, -1
    sw t1, -32(fp)
    j BB14
BB14: 
    lw t1, -32(fp)
    li t0, 0
    addi t0, t0, -1
    slt t0, t0, t1
    bnez t0, BB15
    j BB16
BB15: 
    lw t0, -28(fp)
    addi t0, t0, -1
    sw t0, -36(fp)
    lw t0, -32(fp)
    lw t1, -36(fp)
    addi t2, fp, -24
    mv a0, t2
    mv a1, t0
    mv a2, t1
    call heap_ajust
    mv t1, a0
    sw t1, -36(fp)
    lw t1, -32(fp)
    addi t1, t1, -1
    sw t1, -32(fp)
    j BB14
BB16: 
    lw t0, -28(fp)
    addi t0, t0, -1
    sw t0, -32(fp)
    j BB17
BB17: 
    lw t0, -32(fp)
    sgtz t0, t0
    bnez t0, BB18
    j BB19
BB18: 
    li t0, 0
    sw t0, -40(fp)
    lw t0, -40(fp)
    lw t1, -32(fp)
    addi t2, fp, -24
    mv a0, t2
    mv a1, t0
    mv a2, t1
    call swap
    mv t1, a0
    sw t1, -36(fp)
    lw t1, -32(fp)
    addi t1, t1, -1
    sw t1, -36(fp)
    lw t1, -40(fp)
    lw t0, -36(fp)
    addi t2, fp, -24
    mv a0, t2
    mv a1, t1
    mv a2, t0
    call heap_ajust
    mv t0, a0
    sw t0, -36(fp)
    lw t0, -32(fp)
    addi t0, t0, -1
    sw t0, -32(fp)
    j BB17
BB19: 
    li t0, 0
    mv a0, t0
    j BB30
BB30: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
    .align 1
main: 
BB31: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -80
    addi fp, sp, 80
    j BB20
BB20: 
    li t0, 10
    la t1, $n
    sw t0, 0(t1)
    addi t1, fp, -56
    li t0, 4
    sw t0, 0(t1)
    addi t0, fp, -52
    li t1, 3
    sw t1, 0(t0)
    addi t0, fp, -48
    li t1, 9
    sw t1, 0(t0)
    addi t1, fp, -44
    li t0, 2
    sw t0, 0(t1)
    addi t0, fp, -40
    li t1, 0
    sw t1, 0(t0)
    addi t1, fp, -36
    li t0, 1
    sw t0, 0(t1)
    addi t0, fp, -32
    li t1, 6
    sw t1, 0(t0)
    addi t1, fp, -28
    li t0, 5
    sw t0, 0(t1)
    addi t0, fp, -24
    li t1, 7
    sw t1, 0(t0)
    addi t1, fp, -20
    li t0, 8
    sw t0, 0(t1)
    li t0, 0
    sw t0, -60(fp)
    la t0, $n
    lw t0, 0(t0)
    addi t1, fp, -56
    mv a0, t1
    mv a1, t0
    call heap_sort
    mv t0, a0
    sw t0, -60(fp)
    j BB21
BB21: 
    lw t0, -60(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB22
    j BB23
BB22: 
    lw t1, -60(fp)
    slli t1, t1, 2
    addi t0, fp, -56
    add t0, t0, t1
    lw t0, 0(t0)
    sw t0, -64(fp)
    lw t0, -64(fp)
    mv a0, t0
    call putint
    li t0, 10
    sw t0, -64(fp)
    lw t0, -64(fp)
    mv a0, t0
    call putch
    lw t0, -60(fp)
    addi t0, t0, 1
    sw t0, -60(fp)
    j BB21
BB23: 
    li t1, 0
    mv a0, t1
    j BB32
BB32: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 80
    ret
