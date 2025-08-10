    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .bss
    .align 3
$buf:
    .skip 800
    .align 3
    .globl main
    .text

    .align 1
merge_sort: 
BB23: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB0
BB0: 
    j BB1
BB1: 
    lw t0, -20(fp)
    addi t0, t0, 1
    lw t1, -24(fp)
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB2
    j BB3
BB2: 
    j BB24
BB3: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    add t0, t1, t0
    li t1, 2
    div t1, t0, t1
    sw t1, -28(fp)
    lw t1, -20(fp)
    lw t0, -28(fp)
    mv a0, t1
    mv a1, t0
    call merge_sort
    lw t0, -28(fp)
    lw t1, -24(fp)
    mv a0, t0
    mv a1, t1
    call merge_sort
    lw t1, -20(fp)
    sw t1, -32(fp)
    lw t1, -28(fp)
    sw t1, -36(fp)
    lw t1, -20(fp)
    sw t1, -40(fp)
    j BB4
BB4: 
    lw t1, -32(fp)
    lw t0, -28(fp)
    slt t0, t1, t0
    bnez t0, BB7
    j BB6
BB5: 
    j BB8
BB6: 
    j BB12
BB7: 
    lw t0, -36(fp)
    lw t1, -24(fp)
    slt t1, t0, t1
    bnez t1, BB5
    j BB6
BB8: 
    li t1, 0
    li t0, 100
    mul t0, t1, t0
    lw t1, -32(fp)
    add t1, t0, t1
    lla t0, $buf
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    li t0, 0
    li t2, 100
    mul t2, t0, t2
    lw t0, -36(fp)
    add t0, t2, t0
    lla t2, $buf
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    slt t0, t1, t0
    bnez t0, BB9
    j BB11
BB9: 
    li t1, 1
    li t0, 100
    mul t0, t1, t0
    lw t1, -40(fp)
    add t1, t0, t1
    lla t0, $buf
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 0
    li t2, 100
    mul t2, t0, t2
    lw t0, -32(fp)
    add t0, t2, t0
    lla t2, $buf
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    sw t0, 0(t1)
    lw t0, -32(fp)
    addi t0, t0, 1
    sw t0, -32(fp)
    j BB10
BB10: 
    lw t1, -40(fp)
    addi t1, t1, 1
    sw t1, -40(fp)
    j BB4
BB11: 
    li t0, 1
    li t1, 100
    mul t1, t0, t1
    lw t0, -40(fp)
    add t0, t1, t0
    lla t1, $buf
    slli t0, t0, 2
    add t0, t1, t0
    li t1, 0
    li t2, 100
    mul t2, t1, t2
    lw t1, -36(fp)
    add t1, t2, t1
    lla t2, $buf
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    sw t1, 0(t0)
    lw t1, -36(fp)
    addi t1, t1, 1
    sw t1, -36(fp)
    j BB10
BB12: 
    lw t1, -32(fp)
    lw t0, -28(fp)
    slt t0, t1, t0
    bnez t0, BB13
    j BB14
BB13: 
    li t0, 1
    li t1, 100
    mul t1, t0, t1
    lw t0, -40(fp)
    add t0, t1, t0
    lla t1, $buf
    slli t0, t0, 2
    add t0, t1, t0
    li t1, 0
    li t2, 100
    mul t2, t1, t2
    lw t1, -32(fp)
    add t1, t2, t1
    lla t2, $buf
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    sw t1, 0(t0)
    lw t1, -32(fp)
    addi t1, t1, 1
    sw t1, -32(fp)
    lw t1, -40(fp)
    addi t1, t1, 1
    sw t1, -40(fp)
    j BB12
BB14: 
    j BB15
BB15: 
    lw t0, -36(fp)
    lw t1, -24(fp)
    slt t1, t0, t1
    bnez t1, BB16
    j BB17
BB16: 
    li t1, 1
    li t0, 100
    mul t0, t1, t0
    lw t1, -40(fp)
    add t1, t0, t1
    lla t0, $buf
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 0
    li t2, 100
    mul t2, t0, t2
    lw t0, -36(fp)
    add t0, t2, t0
    lla t2, $buf
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    sw t0, 0(t1)
    lw t0, -36(fp)
    addi t0, t0, 1
    sw t0, -36(fp)
    lw t0, -40(fp)
    addi t0, t0, 1
    sw t0, -40(fp)
    j BB15
BB17: 
    j BB18
BB18: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    slt t0, t1, t0
    bnez t0, BB19
    j BB20
BB19: 
    li t0, 0
    li t1, 100
    mul t1, t0, t1
    lw t0, -20(fp)
    add t0, t1, t0
    lla t1, $buf
    slli t0, t0, 2
    add t0, t1, t0
    li t1, 1
    li t2, 100
    mul t2, t1, t2
    lw t1, -20(fp)
    add t1, t2, t1
    lla t2, $buf
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    sw t1, 0(t0)
    lw t1, -20(fp)
    addi t1, t1, 1
    sw t1, -20(fp)
    j BB18
BB20: 
    j BB24
BB24: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
    .align 1
main: 
BB25: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB21
BB21: 
    li t0, 0
    li t1, 100
    mul t1, t0, t1
    lla t0, $buf
    slli t1, t1, 2
    add t0, t0, t1
    mv a0, t0
    call getarray
    mv t0, a0
    sw t0, -20(fp)
    lw t0, -20(fp)
    li t1, 0
    mv a0, t1
    mv a1, t0
    call merge_sort
    lw t0, -20(fp)
    li t1, 0
    li t2, 100
    mul t1, t1, t2
    lla t2, $buf
    slli t1, t1, 2
    add t1, t2, t1
    mv a0, t0
    mv a1, t1
    call putarray
    li t1, 0
    mv a0, t1
    j BB26
BB26: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
