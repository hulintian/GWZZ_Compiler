    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $INF
$INF:
    .word 1879048192
    .bss
    .align 3
$size:
    .skip 40
$to:
    .skip 400
$cap:
    .skip 400
$rev:
    .skip 400
$used:
    .skip 40
    .align 3
    .globl main
    .text

    .align 1
my_memset: 
BB39: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sd a0, -24(fp)
    sw a1, -28(fp)
    sw a2, -32(fp)
    j BB0
BB0: 
    li t0, 0
    sw t0, -36(fp)
    j BB1
BB1: 
    lw t0, -36(fp)
    lw t1, -32(fp)
    slt t1, t0, t1
    bnez t1, BB2
    j BB3
BB2: 
    lw t1, -36(fp)
    ld t0, -24(fp)
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -28(fp)
    sw t0, 0(t1)
    lw t0, -36(fp)
    addi t0, t0, 1
    sw t0, -36(fp)
    j BB1
BB3: 
    j BB40
BB40: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
add_node: 
BB41: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    sw a1, -24(fp)
    sw a2, -28(fp)
    j BB4
BB4: 
    lw t0, -20(fp)
    li t1, 10
    mul t0, t0, t1
    lw t1, -20(fp)
    lla t2, $size
    slli t1, t1, 2
    add t2, t2, t1
    lw t2, 0(t2)
    add t2, t0, t2
    lla t0, $to
    slli t2, t2, 2
    add t2, t0, t2
    lw t0, -24(fp)
    sw t0, 0(t2)
    lw t0, -20(fp)
    li t2, 10
    mul t2, t0, t2
    lw t0, -20(fp)
    lla t1, $size
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    lla t2, $cap
    slli t0, t0, 2
    add t0, t2, t0
    lw t2, -28(fp)
    sw t2, 0(t0)
    lw t2, -20(fp)
    li t0, 10
    mul t0, t2, t0
    lw t2, -20(fp)
    lla t1, $size
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    lla t0, $rev
    slli t2, t2, 2
    add t2, t0, t2
    lw t0, -24(fp)
    lla t1, $size
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    sw t0, 0(t2)
    lw t0, -24(fp)
    li t2, 10
    mul t2, t0, t2
    lw t0, -24(fp)
    lla t1, $size
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    lla t2, $to
    slli t0, t0, 2
    add t0, t2, t0
    lw t2, -20(fp)
    sw t2, 0(t0)
    lw t2, -24(fp)
    li t0, 10
    mul t0, t2, t0
    lw t2, -24(fp)
    lla t1, $size
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    add t2, t0, t2
    lla t0, $cap
    slli t2, t2, 2
    add t2, t0, t2
    li t0, 0
    sw t0, 0(t2)
    lw t0, -24(fp)
    li t2, 10
    mul t2, t0, t2
    lw t0, -24(fp)
    lla t1, $size
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    lla t2, $rev
    slli t0, t0, 2
    add t0, t2, t0
    lw t2, -20(fp)
    lla t1, $size
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    sw t2, 0(t0)
    lw t2, -20(fp)
    lla t0, $size
    slli t2, t2, 2
    add t2, t0, t2
    lw t0, -20(fp)
    lla t1, $size
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    addi t0, t0, 1
    sw t0, 0(t2)
    lw t0, -24(fp)
    lla t2, $size
    slli t0, t0, 2
    add t0, t2, t0
    lw t2, -24(fp)
    lla t1, $size
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    addi t2, t2, 1
    sw t2, 0(t0)
    j BB42
BB42: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
dfs: 
BB43: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    sw a0, -20(fp)
    sw a1, -24(fp)
    sw a2, -28(fp)
    j BB5
BB5: 
    j BB6
BB6: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    xor t1, t0, t1
    seqz t1, t1
    bnez t1, BB7
    j BB8
BB7: 
    lw t1, -28(fp)
    mv a0, t1
    j BB44
BB8: 
    lw t1, -20(fp)
    lla t0, $used
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 1
    sw t0, 0(t1)
    li t0, 0
    sw t0, -32(fp)
    j BB9
BB9: 
    lw t0, -32(fp)
    lw t1, -20(fp)
    lla t2, $size
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB10
    j BB11
BB10: 
    j BB12
BB11: 
    li t1, 0
    mv a0, t1
    j BB44
BB12: 
    lw t1, -20(fp)
    li t0, 10
    mul t0, t1, t0
    lw t1, -32(fp)
    add t1, t0, t1
    lla t0, $to
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    lla t0, $used
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    seqz t1, t1
    bnez t1, BB13
    j BB14
BB13: 
    lw t1, -32(fp)
    addi t1, t1, 1
    sw t1, -32(fp)
    j BB9
BB14: 
    j BB16
BB15: 
BB16: 
    lw t1, -20(fp)
    li t0, 10
    mul t0, t1, t0
    lw t1, -32(fp)
    add t1, t0, t1
    lla t0, $cap
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    sgtz t1, t1
    xori t1, t1, 1
    bnez t1, BB17
    j BB18
BB17: 
    lw t1, -32(fp)
    addi t1, t1, 1
    sw t1, -32(fp)
    j BB9
BB18: 
    j BB20
BB19: 
BB20: 
    lw t1, -28(fp)
    lw t0, -20(fp)
    li t2, 10
    mul t2, t0, t2
    lw t0, -32(fp)
    add t0, t2, t0
    lla t2, $cap
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    slt t0, t1, t0
    bnez t0, BB21
    j BB23
BB21: 
    lw t1, -28(fp)
    sw t1, -36(fp)
    j BB22
BB22: 
    lw t0, -20(fp)
    li t1, 10
    mul t1, t0, t1
    lw t0, -32(fp)
    add t0, t1, t0
    lla t1, $to
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    lw t1, -24(fp)
    lw t2, -36(fp)
    mv a0, t0
    mv a1, t1
    mv a2, t2
    call dfs
    mv t2, a0
    sw t2, -40(fp)
    j BB24
BB23: 
    lw t0, -20(fp)
    li t1, 10
    mul t1, t0, t1
    lw t0, -32(fp)
    add t0, t1, t0
    lla t1, $cap
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    sw t0, -36(fp)
    j BB22
BB24: 
    lw t2, -40(fp)
    sgtz t2, t2
    bnez t2, BB25
    j BB26
BB25: 
    lw t2, -20(fp)
    li t1, 10
    mul t1, t2, t1
    lw t2, -32(fp)
    add t2, t1, t2
    lla t1, $cap
    slli t2, t2, 2
    add t2, t1, t2
    lw t1, -20(fp)
    li t0, 10
    mul t0, t1, t0
    lw t1, -32(fp)
    add t1, t0, t1
    lla t0, $cap
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    lw t0, -40(fp)
    sub t0, t1, t0
    sw t0, 0(t2)
    lw t0, -20(fp)
    li t2, 10
    mul t2, t0, t2
    lw t0, -32(fp)
    add t0, t2, t0
    lla t2, $to
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    li t2, 10
    mul t2, t0, t2
    lw t0, -20(fp)
    li t1, 10
    mul t1, t0, t1
    lw t0, -32(fp)
    add t0, t1, t0
    lla t1, $rev
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    add t0, t2, t0
    lla t2, $cap
    slli t0, t0, 2
    add t0, t2, t0
    lw t2, -20(fp)
    li t1, 10
    mul t1, t2, t1
    lw t2, -32(fp)
    add t2, t1, t2
    lla t1, $to
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    li t1, 10
    mul t1, t2, t1
    lw t2, -20(fp)
    li t3, 10
    mul t3, t2, t3
    lw t2, -32(fp)
    add t2, t3, t2
    lla t3, $rev
    slli t2, t2, 2
    add t2, t3, t2
    lw t2, 0(t2)
    add t2, t1, t2
    lla t1, $cap
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    lw t1, -40(fp)
    add t1, t2, t1
    sw t1, 0(t0)
    lw t1, -40(fp)
    mv a0, t1
    j BB44
BB26: 
    lw t2, -32(fp)
    addi t2, t2, 1
    sw t2, -32(fp)
    j BB9
BB44: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
    .align 1
max_flow: 
BB45: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB27
BB27: 
    li t0, 0
    sw t0, -28(fp)
    j BB28
BB28: 
    li t0, 1
    seqz t0, t0
    bnez t0, BB29
    j BB30
BB29: 
    la t0, $used
    mv a0, t0
    li t0, 0
    mv a1, t0
    li t0, 10
    mv a2, t0
    call my_memset
    lw t0, -20(fp)
    lw t1, -24(fp)
    la t2, $INF
    lw t2, 0(t2)
    mv a0, t0
    mv a1, t1
    mv a2, t2
    call dfs
    mv t2, a0
    sw t2, -32(fp)
    j BB31
BB30: 
    mv a0, zero
    j BB46
BB31: 
    lw t2, -32(fp)
    seqz t2, t2
    bnez t2, BB32
    j BB33
BB32: 
    lw t1, -28(fp)
    mv a0, t1
    j BB46
BB33: 
    lw t2, -28(fp)
    lw t1, -32(fp)
    add t1, t2, t1
    sw t1, -28(fp)
    j BB28
BB46: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB47: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    j BB34
BB34: 
    call getint
    mv t0, a0
    sw t0, -20(fp)
    call getint
    mv t0, a0
    sw t0, -24(fp)
    la t0, $size
    mv a0, t0
    li t0, 0
    mv a1, t0
    li t0, 10
    mv a2, t0
    call my_memset
    j BB35
BB35: 
    lw t0, -24(fp)
    sgtz t0, t0
    bnez t0, BB36
    j BB37
BB36: 
    call getint
    mv t0, a0
    sw t0, -28(fp)
    call getint
    mv t0, a0
    sw t0, -32(fp)
    call getint
    mv t0, a0
    sw t0, -36(fp)
    lw t0, -28(fp)
    lw t1, -32(fp)
    lw t2, -36(fp)
    mv a0, t0
    mv a1, t1
    mv a2, t2
    call add_node
    lw t2, -24(fp)
    addi t2, t2, -1
    sw t2, -24(fp)
    j BB35
BB37: 
    lw t0, -20(fp)
    li t1, 1
    mv a0, t1
    mv a1, t0
    call max_flow
    mv t0, a0
    mv a0, t0
    call putint
    li t0, 10
    mv a0, t0
    call putch
    li t0, 0
    mv a0, t0
    j BB48
BB48: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
