    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $INF
$INF:
    .word 65535
    .bss
    .align 3
$e:
    .skip 1024
$book:
    .skip 64
$dis:
    .skip 64
$n:
    .skip 4
$m:
    .skip 4
$v1:
    .skip 4
$v2:
    .skip 4
$w:
    .skip 4
    .align 3
    .globl main
    .text

    .align 1
Dijkstra: 
BB41: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB0
BB0: 
    li t0, 1
    sw t0, -20(fp)
    j BB1
BB1: 
    lw t0, -20(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB2
    j BB3
BB2: 
    lw t2, -20(fp)
    lla t0, $dis
    slli t2, t2, 2
    add t2, t0, t2
    li t0, 1
    li t1, 16
    mul t1, t0, t1
    lw t0, -20(fp)
    add t0, t1, t0
    lla t1, $e
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    sw t0, 0(t2)
    lw t0, -20(fp)
    lla t2, $book
    slli t0, t0, 2
    add t0, t2, t0
    li t2, 0
    sw t2, 0(t0)
    lw t2, -20(fp)
    addi t2, t2, 1
    sw t2, -20(fp)
    j BB1
BB3: 
    lla t1, $book
    addi t1, fp, 4
    li t0, 1
    sw t0, 0(t1)
    li t0, 1
    sw t0, -20(fp)
    j BB4
BB4: 
    lw t0, -20(fp)
    la t1, $n
    lw t1, 0(t1)
    addi t1, t1, -1
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB5
    j BB6
BB5: 
    li t1, 65535
    sw t1, -28(fp)
    li t1, 0
    sw t1, -32(fp)
    li t1, 1
    sw t1, -36(fp)
    j BB7
BB6: 
    j BB42
BB7: 
    lw t1, -36(fp)
    la t0, $n
    lw t0, 0(t0)
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB8
    j BB9
BB8: 
    j BB10
BB9: 
    lw t0, -32(fp)
    lla t1, $book
    slli t0, t0, 2
    add t0, t1, t0
    li t1, 1
    sw t1, 0(t0)
    li t1, 1
    sw t1, -40(fp)
    j BB14
BB10: 
    lw t0, -28(fp)
    lw t2, -36(fp)
    lla t1, $dis
    slli t2, t2, 2
    add t2, t1, t2
    lw t2, 0(t2)
    slt t2, t2, t0
    bnez t2, BB13
    j BB12
BB11: 
    lw t2, -36(fp)
    lla t0, $dis
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    sw t2, -28(fp)
    lw t2, -36(fp)
    sw t2, -32(fp)
    j BB12
BB12: 
    lw t2, -36(fp)
    addi t2, t2, 1
    sw t2, -36(fp)
    j BB7
BB13: 
    lw t2, -36(fp)
    lla t0, $book
    slli t2, t2, 2
    add t2, t0, t2
    lw t2, 0(t2)
    seqz t2, t2
    bnez t2, BB11
    j BB12
BB14: 
    lw t1, -40(fp)
    la t0, $n
    lw t0, 0(t0)
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB15
    j BB16
BB15: 
    j BB17
BB16: 
    lw t0, -20(fp)
    addi t0, t0, 1
    sw t0, -20(fp)
    j BB4
BB17: 
    lw t0, -32(fp)
    li t1, 16
    mul t1, t0, t1
    lw t0, -40(fp)
    add t0, t1, t0
    lla t1, $e
    slli t0, t0, 2
    add t0, t1, t0
    lw t0, 0(t0)
    la t1, $INF
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB18
    j BB19
BB18: 
    j BB20
BB19: 
    lw t1, -40(fp)
    addi t1, t1, 1
    sw t1, -40(fp)
    j BB14
BB20: 
    lw t1, -40(fp)
    lla t0, $dis
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    lw t0, -32(fp)
    lla t2, $dis
    slli t0, t0, 2
    add t0, t2, t0
    lw t0, 0(t0)
    lw t2, -32(fp)
    li t3, 16
    mul t3, t2, t3
    lw t2, -40(fp)
    add t2, t3, t2
    lla t3, $e
    slli t2, t2, 2
    add t2, t3, t2
    lw t2, 0(t2)
    add t2, t0, t2
    slt t2, t2, t1
    bnez t2, BB21
    j BB22
BB21: 
    lw t2, -40(fp)
    lla t1, $dis
    slli t2, t2, 2
    add t2, t1, t2
    lw t1, -32(fp)
    lla t0, $dis
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    lw t0, -32(fp)
    li t3, 16
    mul t3, t0, t3
    lw t0, -40(fp)
    add t0, t3, t0
    lla t3, $e
    slli t0, t0, 2
    add t0, t3, t0
    lw t0, 0(t0)
    add t0, t1, t0
    sw t0, 0(t2)
    j BB22
BB22: 
    j BB19
BB42: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
    .align 1
main: 
BB43: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -48
    addi fp, sp, 48
    j BB23
BB23: 
    call getint
    mv t0, a0
    la t1, $n
    sw t0, 0(t1)
    call getint
    mv t1, a0
    la t0, $m
    sw t1, 0(t0)
    li t0, 1
    sw t0, -20(fp)
    j BB24
BB24: 
    lw t0, -20(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB25
    j BB26
BB25: 
    li t0, 1
    sw t0, -24(fp)
    j BB27
BB26: 
    li t1, 1
    sw t1, -20(fp)
    j BB34
BB27: 
    lw t0, -24(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB28
    j BB29
BB28: 
    j BB30
BB29: 
    lw t1, -20(fp)
    addi t1, t1, 1
    sw t1, -20(fp)
    j BB24
BB30: 
    lw t1, -20(fp)
    lw t0, -24(fp)
    xor t0, t1, t0
    seqz t0, t0
    bnez t0, BB31
    j BB33
BB31: 
    lw t1, -20(fp)
    li t0, 16
    mul t0, t1, t0
    lw t1, -24(fp)
    add t1, t0, t1
    lla t0, $e
    slli t1, t1, 2
    add t1, t0, t1
    li t0, 0
    sw t0, 0(t1)
    j BB32
BB32: 
    lw t1, -24(fp)
    addi t1, t1, 1
    sw t1, -24(fp)
    j BB27
BB33: 
    lw t0, -20(fp)
    li t1, 16
    mul t1, t0, t1
    lw t0, -24(fp)
    add t0, t1, t0
    lla t1, $e
    slli t0, t0, 2
    add t0, t1, t0
    la t1, $INF
    lw t1, 0(t1)
    sw t1, 0(t0)
    j BB32
BB34: 
    lw t1, -20(fp)
    la t0, $m
    lw t0, 0(t0)
    slt t0, t0, t1
    xori t0, t0, 1
    bnez t0, BB35
    j BB36
BB35: 
    call getint
    mv t1, a0
    sw t1, -28(fp)
    call getint
    mv t1, a0
    sw t1, -32(fp)
    lw t1, -28(fp)
    li t0, 16
    mul t0, t1, t0
    lw t1, -32(fp)
    add t1, t0, t1
    lla t0, $e
    slli t1, t1, 2
    add t1, t0, t1
    call getint
    mv t0, a0
    sw t0, 0(t1)
    lw t0, -20(fp)
    addi t0, t0, 1
    sw t0, -20(fp)
    j BB34
BB36: 
    call Dijkstra
    li t0, 1
    sw t0, -20(fp)
    j BB37
BB37: 
    lw t0, -20(fp)
    la t1, $n
    lw t1, 0(t1)
    slt t1, t1, t0
    xori t1, t1, 1
    bnez t1, BB38
    j BB39
BB38: 
    lw t1, -20(fp)
    lla t0, $dis
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    mv a0, t1
    call putint
    li t1, 32
    mv a0, t1
    call putch
    lw t1, -20(fp)
    addi t1, t1, 1
    sw t1, -20(fp)
    j BB37
BB39: 
    li t1, 10
    mv a0, t1
    call putch
    li t1, 0
    mv a0, t1
    j BB44
BB44: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 48
    ret
