    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $maxn
$maxn:
    .word 18
    .globl $mod
$mod:
    .word 1000000007
    .bss
    .align 3
$dp:
    .skip 52907904
$list:
    .skip 800
$cns:
    .skip 80
    .align 3
    .globl main
    .text

    .align 1
equal: 
BB49: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    sw a0, -20(fp)
    sw a1, -24(fp)
    j BB0
BB0: 
    j BB1
BB1: 
    lw t0, -20(fp)
    lw t1, -24(fp)
    xor t1, t0, t1
    seqz t1, t1
    bnez t1, BB2
    j BB3
BB2: 
    li t1, 1
    mv a0, t1
    j BB50
BB3: 
    li t1, 0
    mv a0, t1
    j BB50
BB50: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
    .align 1
dfs: 
BB51: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    sw a0, -20(fp)
    sw a1, -24(fp)
    sw a2, -28(fp)
    sw a3, -32(fp)
    sw a4, -36(fp)
    sw a5, -40(fp)
    j BB4
BB4: 
    j BB5
BB5: 
    lw t0, -20(fp)
    li t1, 734832
    mul t1, t0, t1
    lw t0, -24(fp)
    li t2, 40824
    mul t2, t0, t2
    add t2, t1, t2
    lw t1, -28(fp)
    li t0, 2268
    mul t0, t1, t0
    add t0, t2, t0
    lw t2, -32(fp)
    li t1, 126
    mul t1, t2, t1
    add t1, t0, t1
    lw t0, -36(fp)
    li t2, 7
    mul t2, t0, t2
    add t2, t1, t2
    lw t1, -40(fp)
    add t1, t2, t1
    lla t2, $dp
    slli t1, t1, 2
    add t1, t2, t1
    lw t1, 0(t1)
    li t2, 0
    addi t2, t2, -1
    xor t2, t1, t2
    snez t2, t2
    bnez t2, BB6
    j BB7
BB6: 
    lw t1, -20(fp)
    li t6, 734832
    mul t6, t1, t6
    lw t1, -24(fp)
    li t0, 40824
    mul t0, t1, t0
    add t0, t6, t0
    lw t6, -28(fp)
    li t1, 2268
    mul t1, t6, t1
    add t1, t0, t1
    lw t0, -32(fp)
    li t6, 126
    mul t6, t0, t6
    add t6, t1, t6
    lw t1, -36(fp)
    li t0, 7
    mul t0, t1, t0
    add t0, t6, t0
    lw t6, -40(fp)
    add t6, t0, t6
    lla t0, $dp
    slli t6, t6, 2
    add t6, t0, t6
    lw t6, 0(t6)
    mv a0, t6
    j BB52
BB7: 
    j BB8
BB8: 
    lw t2, -20(fp)
    lw t1, -24(fp)
    add t1, t2, t1
    lw t2, -28(fp)
    add t2, t1, t2
    lw t1, -32(fp)
    add t1, t2, t1
    lw t2, -36(fp)
    add t2, t1, t2
    seqz t2, t2
    bnez t2, BB9
    j BB10
BB9: 
    li t1, 1
    mv a0, t1
    j BB52
BB10: 
    li t2, 0
    sw t2, -44(fp)
    j BB11
BB11: 
    lw t2, -20(fp)
    seqz t2, t2
    bnez t2, BB12
    j BB13
BB12: 
    lw t1, -44(fp)
    lw t2, -20(fp)
    lw t0, -40(fp)
    mv a0, t0
    li t0, 2
    mv a1, t0
    call equal
    mv t0, a0
    sub t0, t2, t0
    lw t2, -20(fp)
    addi t2, t2, -1
    lw t3, -24(fp)
    lw t4, -28(fp)
    lw t5, -32(fp)
    lw t6, -36(fp)
    mv a0, t2
    mv a1, t3
    mv a2, t4
    mv a3, t5
    mv a4, t6
    li t6, 1
    mv a5, t6
    call dfs
    mv t6, a0
    mul t6, t0, t6
    add t6, t1, t6
    la t1, $mod
    lw t1, 0(t1)
    rem t1, t6, t1
    sw t1, -44(fp)
    j BB13
BB13: 
    j BB14
BB14: 
    lw t2, -24(fp)
    seqz t2, t2
    bnez t2, BB15
    j BB16
BB15: 
    lw t1, -44(fp)
    lw t6, -24(fp)
    lw t0, -40(fp)
    mv a0, t0
    li t0, 3
    mv a1, t0
    call equal
    mv t0, a0
    sub t0, t6, t0
    lw t6, -20(fp)
    addi t6, t6, 1
    lw t5, -24(fp)
    addi t5, t5, -1
    lw t4, -28(fp)
    lw t3, -32(fp)
    lw t2, -36(fp)
    mv a0, t6
    mv a1, t5
    mv a2, t4
    mv a3, t3
    mv a4, t2
    li t2, 2
    mv a5, t2
    call dfs
    mv t2, a0
    mul t2, t0, t2
    add t2, t1, t2
    la t1, $mod
    lw t1, 0(t1)
    rem t1, t2, t1
    sw t1, -44(fp)
    j BB16
BB16: 
    j BB17
BB17: 
    lw t2, -28(fp)
    seqz t2, t2
    bnez t2, BB18
    j BB19
BB18: 
    lw t1, -44(fp)
    lw t2, -28(fp)
    lw t0, -40(fp)
    mv a0, t0
    li t0, 4
    mv a1, t0
    call equal
    mv t0, a0
    sub t0, t2, t0
    lw t2, -20(fp)
    lw t3, -24(fp)
    addi t3, t3, 1
    lw t4, -28(fp)
    addi t4, t4, -1
    lw t5, -32(fp)
    lw t6, -36(fp)
    mv a0, t2
    mv a1, t3
    mv a2, t4
    mv a3, t5
    mv a4, t6
    li t6, 3
    mv a5, t6
    call dfs
    mv t6, a0
    mul t6, t0, t6
    add t6, t1, t6
    la t1, $mod
    lw t1, 0(t1)
    rem t1, t6, t1
    sw t1, -44(fp)
    j BB19
BB19: 
    j BB20
BB20: 
    lw t2, -32(fp)
    seqz t2, t2
    bnez t2, BB21
    j BB22
BB21: 
    lw t1, -44(fp)
    lw t6, -32(fp)
    lw t0, -40(fp)
    mv a0, t0
    li t0, 5
    mv a1, t0
    call equal
    mv t0, a0
    sub t0, t6, t0
    lw t6, -20(fp)
    lw t5, -24(fp)
    lw t4, -28(fp)
    addi t4, t4, 1
    lw t3, -32(fp)
    addi t3, t3, -1
    lw t2, -36(fp)
    mv a0, t6
    mv a1, t5
    mv a2, t4
    mv a3, t3
    mv a4, t2
    li t2, 4
    mv a5, t2
    call dfs
    mv t2, a0
    mul t2, t0, t2
    add t2, t1, t2
    la t1, $mod
    lw t1, 0(t1)
    rem t1, t2, t1
    sw t1, -44(fp)
    j BB22
BB22: 
    j BB23
BB23: 
    lw t2, -36(fp)
    seqz t2, t2
    bnez t2, BB24
    j BB25
BB24: 
    lw t1, -44(fp)
    lw t0, -36(fp)
    lw t2, -20(fp)
    lw t3, -24(fp)
    lw t4, -28(fp)
    lw t5, -32(fp)
    addi t5, t5, 1
    lw t6, -36(fp)
    addi t6, t6, -1
    mv a0, t2
    mv a1, t3
    mv a2, t4
    mv a3, t5
    mv a4, t6
    li t6, 5
    mv a5, t6
    call dfs
    mv t6, a0
    mul t6, t0, t6
    add t6, t1, t6
    la t1, $mod
    lw t1, 0(t1)
    rem t1, t6, t1
    sw t1, -44(fp)
    j BB25
BB25: 
    lw t2, -20(fp)
    li t1, 734832
    mul t1, t2, t1
    lw t2, -24(fp)
    li t0, 40824
    mul t0, t2, t0
    add t0, t1, t0
    lw t1, -28(fp)
    li t2, 2268
    mul t2, t1, t2
    add t2, t0, t2
    lw t0, -32(fp)
    li t1, 126
    mul t1, t0, t1
    add t1, t2, t1
    lw t2, -36(fp)
    li t0, 7
    mul t0, t2, t0
    add t0, t1, t0
    lw t1, -40(fp)
    add t1, t0, t1
    lla t0, $dp
    slli t1, t1, 2
    add t1, t0, t1
    lw t0, -44(fp)
    la t2, $mod
    lw t2, 0(t2)
    rem t2, t0, t2
    sw t2, 0(t1)
    lw t2, -20(fp)
    li t1, 734832
    mul t1, t2, t1
    lw t2, -24(fp)
    li t0, 40824
    mul t0, t2, t0
    add t0, t1, t0
    lw t1, -28(fp)
    li t2, 2268
    mul t2, t1, t2
    add t2, t0, t2
    lw t0, -32(fp)
    li t1, 126
    mul t1, t0, t1
    add t1, t2, t1
    lw t2, -36(fp)
    li t0, 7
    mul t0, t2, t0
    add t0, t1, t0
    lw t1, -40(fp)
    add t1, t0, t1
    lla t0, $dp
    slli t1, t1, 2
    add t1, t0, t1
    lw t1, 0(t1)
    mv a0, t1
    j BB52
BB52: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
    .align 1
main: 
BB53: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -64
    addi fp, sp, 64
    j BB26
BB26: 
    call getint
    mv t0, a0
    sw t0, -20(fp)
    li t0, 0
    sw t0, -24(fp)
    j BB27
BB27: 
    lw t0, -24(fp)
    la t1, $maxn
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB28
    j BB29
BB28: 
    li t4, 0
    sw t4, -28(fp)
    j BB30
BB29: 
    li t1, 0
    sw t1, -24(fp)
    j BB45
BB30: 
    lw t4, -28(fp)
    la t3, $maxn
    lw t3, 0(t3)
    slt t3, t4, t3
    bnez t3, BB31
    j BB32
BB31: 
    li t3, 0
    sw t3, -32(fp)
    j BB33
BB32: 
    lw t3, -24(fp)
    addi t3, t3, 1
    sw t3, -24(fp)
    j BB27
BB33: 
    lw t3, -32(fp)
    la t4, $maxn
    lw t4, 0(t4)
    slt t4, t3, t4
    bnez t4, BB34
    j BB35
BB34: 
    li t4, 0
    sw t4, -36(fp)
    j BB36
BB35: 
    lw t4, -28(fp)
    addi t4, t4, 1
    sw t4, -28(fp)
    j BB30
BB36: 
    lw t4, -36(fp)
    la t3, $maxn
    lw t3, 0(t3)
    slt t3, t4, t3
    bnez t3, BB37
    j BB38
BB37: 
    li t3, 0
    sw t3, -40(fp)
    j BB39
BB38: 
    lw t3, -32(fp)
    addi t3, t3, 1
    sw t3, -32(fp)
    j BB33
BB39: 
    lw t3, -40(fp)
    la t4, $maxn
    lw t4, 0(t4)
    slt t4, t3, t4
    bnez t4, BB40
    j BB41
BB40: 
    li t4, 0
    sw t4, -44(fp)
    j BB42
BB41: 
    lw t4, -36(fp)
    addi t4, t4, 1
    sw t4, -36(fp)
    j BB36
BB42: 
    lw t4, -44(fp)
    slti t4, t4, 7
    bnez t4, BB43
    j BB44
BB43: 
    lw t4, -24(fp)
    li t3, 734832
    mul t3, t4, t3
    lw t4, -28(fp)
    li t2, 40824
    mul t2, t4, t2
    add t2, t3, t2
    lw t3, -32(fp)
    li t4, 2268
    mul t4, t3, t4
    add t4, t2, t4
    lw t2, -36(fp)
    li t3, 126
    mul t3, t2, t3
    add t3, t4, t3
    lw t4, -40(fp)
    li t2, 7
    mul t2, t4, t2
    add t2, t3, t2
    lw t3, -44(fp)
    add t3, t2, t3
    lla t2, $dp
    slli t3, t3, 2
    add t3, t2, t3
    li t2, 0
    addi t2, t2, -1
    sw t2, 0(t3)
    lw t2, -44(fp)
    addi t2, t2, 1
    sw t2, -44(fp)
    j BB42
BB44: 
    lw t4, -40(fp)
    addi t4, t4, 1
    sw t4, -40(fp)
    j BB39
BB45: 
    lw t1, -24(fp)
    lw t0, -20(fp)
    slt t0, t1, t0
    bnez t0, BB46
    j BB47
BB46: 
    lw t4, -24(fp)
    lla t3, $list
    slli t4, t4, 2
    add t4, t3, t4
    call getint
    mv t3, a0
    sw t3, 0(t4)
    lw t3, -24(fp)
    lla t4, $list
    slli t3, t3, 2
    add t3, t4, t3
    lw t3, 0(t3)
    lla t4, $cns
    slli t3, t3, 2
    add t3, t4, t3
    lw t4, -24(fp)
    lla t2, $list
    slli t4, t4, 2
    add t4, t2, t4
    lw t4, 0(t4)
    lla t2, $cns
    slli t4, t4, 2
    add t4, t2, t4
    lw t4, 0(t4)
    addi t4, t4, 1
    sw t4, 0(t3)
    lw t4, -24(fp)
    addi t4, t4, 1
    sw t4, -24(fp)
    j BB45
BB47: 
    lla t0, $cns
    addi t0, fp, 4
    lw t0, 0(t0)
    lla t1, $cns
    addi t1, fp, 8
    lw t1, 0(t1)
    lla t2, $cns
    addi t2, fp, 12
    lw t2, 0(t2)
    lla t3, $cns
    addi t3, fp, 16
    lw t3, 0(t3)
    lla t4, $cns
    addi t4, fp, 20
    lw t4, 0(t4)
    mv a0, t0
    mv a1, t1
    mv a2, t2
    mv a3, t3
    mv a4, t4
    li t4, 0
    mv a5, t4
    call dfs
    mv t4, a0
    sw t4, -48(fp)
    lw t4, -48(fp)
    mv a0, t4
    call putint
    lw t4, -48(fp)
    mv a0, t4
    j BB54
BB54: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 64
    ret
