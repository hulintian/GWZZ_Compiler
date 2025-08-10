    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .data
    .align 3
    .globl $N
$N:
    .word 10000
    .align 3
    .globl main
    .text

    .align 1
long_array: 
BB37: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    li t0, -120064
    add sp, sp, t0
    li t0, 120064
    add fp, sp, t0
    sw a0, -20(fp)
    j BB0
BB0: 
    li t0, 0
    li t1, -120024
    add t1, fp, t1
    sw t0, 0(t1)
    j BB1
BB1: 
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    la t0, $N
    lw t0, 0(t0)
    slt t0, t1, t0
    bnez t0, BB2
    j BB3
BB2: 
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    slli t1, t1, 2
    li t2, -40020
    add t2, t1, t2
    add t2, fp, t2
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    li t3, -120024
    add t3, fp, t3
    lw t3, 0(t3)
    mul t3, t1, t3
    li t1, 10
    rem t1, t3, t1
    sw t1, 0(t2)
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    addi t1, t1, 1
    li t2, -120024
    add t2, fp, t2
    sw t1, 0(t2)
    j BB1
BB3: 
    li t0, 0
    li t1, -120024
    add t1, fp, t1
    sw t0, 0(t1)
    j BB4
BB4: 
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    la t0, $N
    lw t0, 0(t0)
    slt t0, t1, t0
    bnez t0, BB5
    j BB6
BB5: 
    li t0, -120024
    add t0, fp, t0
    lw t0, 0(t0)
    slli t0, t0, 2
    li t1, -80020
    add t1, t0, t1
    add t1, fp, t1
    li t0, -120024
    add t0, fp, t0
    lw t0, 0(t0)
    slli t0, t0, 2
    li t2, -40020
    add t2, t0, t2
    add t2, fp, t2
    lw t2, 0(t2)
    li t0, -120024
    add t0, fp, t0
    lw t0, 0(t0)
    slli t0, t0, 2
    li t3, -40020
    add t3, t0, t3
    add t3, fp, t3
    lw t3, 0(t3)
    mul t3, t2, t3
    li t2, 10
    rem t2, t3, t2
    sw t2, 0(t1)
    li t2, -120024
    add t2, fp, t2
    lw t2, 0(t2)
    addi t2, t2, 1
    li t1, -120024
    add t1, fp, t1
    sw t2, 0(t1)
    j BB4
BB6: 
    li t0, 0
    li t1, -120024
    add t1, fp, t1
    sw t0, 0(t1)
    j BB7
BB7: 
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    la t0, $N
    lw t0, 0(t0)
    slt t0, t1, t0
    bnez t0, BB8
    j BB9
BB8: 
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    slli t1, t1, 2
    li t0, -120020
    add t0, t1, t0
    add t0, fp, t0
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    slli t1, t1, 2
    li t2, -80020
    add t2, t1, t2
    add t2, fp, t2
    lw t2, 0(t2)
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    slli t1, t1, 2
    li t3, -80020
    add t3, t1, t3
    add t3, fp, t3
    lw t3, 0(t3)
    mul t3, t2, t3
    li t2, 100
    rem t2, t3, t2
    li t3, -120024
    add t3, fp, t3
    lw t3, 0(t3)
    slli t3, t3, 2
    li t1, -40020
    add t1, t3, t1
    add t1, fp, t1
    lw t1, 0(t1)
    add t1, t2, t1
    sw t1, 0(t0)
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    addi t1, t1, 1
    li t0, -120024
    add t0, fp, t0
    sw t1, 0(t0)
    j BB7
BB9: 
    li t0, 0
    li t1, -120028
    add t1, fp, t1
    sw t0, 0(t1)
    li t1, 0
    li t0, -120024
    add t0, fp, t0
    sw t1, 0(t0)
    j BB10
BB10: 
    li t0, -120024
    add t0, fp, t0
    lw t0, 0(t0)
    la t1, $N
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB11
    j BB12
BB11: 
    j BB13
BB12: 
    li t1, -120028
    add t1, fp, t1
    lw t1, 0(t1)
    mv a0, t1
    j BB38
BB13: 
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    slti t1, t1, 10
    bnez t1, BB14
    j BB16
BB14: 
    li t0, -120028
    add t0, fp, t0
    lw t0, 0(t0)
    li t2, -120024
    add t2, fp, t2
    lw t2, 0(t2)
    slli t2, t2, 2
    li t1, -120020
    add t1, t2, t1
    add t1, fp, t1
    lw t1, 0(t1)
    add t1, t0, t1
    li t0, 1333
    rem t0, t1, t0
    li t1, -120028
    add t1, fp, t1
    sw t0, 0(t1)
    li t1, -120028
    add t1, fp, t1
    lw t1, 0(t1)
    mv a0, t1
    call putint
    j BB15
BB15: 
    li t0, -120024
    add t0, fp, t0
    lw t0, 0(t0)
    addi t0, t0, 1
    li t1, -120024
    add t1, fp, t1
    sw t0, 0(t1)
    j BB10
BB16: 
    j BB17
BB17: 
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    slti t1, t1, 20
    bnez t1, BB18
    j BB20
BB18: 
    li t1, 5000
    li t0, -120032
    add t0, fp, t0
    sw t1, 0(t0)
    j BB21
BB19: 
    j BB15
BB20: 
    j BB24
BB21: 
    li t0, -120032
    add t0, fp, t0
    lw t0, 0(t0)
    la t1, $N
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB22
    j BB23
BB22: 
    li t1, -120028
    add t1, fp, t1
    lw t1, 0(t1)
    li t0, -120024
    add t0, fp, t0
    lw t0, 0(t0)
    slli t0, t0, 2
    li t2, -120020
    add t2, t0, t2
    add t2, fp, t2
    lw t2, 0(t2)
    add t2, t1, t2
    li t1, -120032
    add t1, fp, t1
    lw t1, 0(t1)
    slli t1, t1, 2
    li t0, -40020
    add t0, t1, t0
    add t0, fp, t0
    lw t0, 0(t0)
    sub t0, t2, t0
    li t2, -120028
    add t2, fp, t2
    sw t0, 0(t2)
    li t2, -120032
    add t2, fp, t2
    lw t2, 0(t2)
    addi t2, t2, 1
    li t0, -120032
    add t0, fp, t0
    sw t2, 0(t0)
    j BB21
BB23: 
    li t1, -120028
    add t1, fp, t1
    lw t1, 0(t1)
    mv a0, t1
    call putint
    j BB19
BB24: 
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    slti t1, t1, 30
    bnez t1, BB25
    j BB27
BB25: 
    li t1, 5000
    li t0, -120036
    add t0, fp, t0
    sw t1, 0(t0)
    j BB28
BB26: 
    j BB19
BB27: 
    li t1, -120028
    add t1, fp, t1
    lw t1, 0(t1)
    li t0, -120024
    add t0, fp, t0
    lw t0, 0(t0)
    slli t0, t0, 2
    li t2, -120020
    add t2, t0, t2
    add t2, fp, t2
    lw t2, 0(t2)
    lw t0, -20(fp)
    mul t0, t2, t0
    add t0, t1, t0
    li t1, 99988
    rem t1, t0, t1
    li t0, -120028
    add t0, fp, t0
    sw t1, 0(t0)
    j BB26
BB28: 
    li t0, -120036
    add t0, fp, t0
    lw t0, 0(t0)
    la t1, $N
    lw t1, 0(t1)
    slt t1, t0, t1
    bnez t1, BB29
    j BB30
BB29: 
    j BB31
BB30: 
    li t1, -120028
    add t1, fp, t1
    lw t1, 0(t1)
    mv a0, t1
    call putint
    j BB26
BB31: 
    li t1, -120036
    add t1, fp, t1
    lw t1, 0(t1)
    li t0, 2233
    slt t0, t0, t1
    bnez t0, BB32
    j BB34
BB32: 
    li t2, -120028
    add t2, fp, t2
    lw t2, 0(t2)
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    slli t1, t1, 2
    li t0, -80020
    add t0, t1, t0
    add t0, fp, t0
    lw t0, 0(t0)
    add t0, t2, t0
    li t2, -120036
    add t2, fp, t2
    lw t2, 0(t2)
    slli t2, t2, 2
    li t1, -40020
    add t1, t2, t1
    add t1, fp, t1
    lw t1, 0(t1)
    sub t1, t0, t1
    li t0, -120028
    add t0, fp, t0
    sw t1, 0(t0)
    li t0, -120036
    add t0, fp, t0
    lw t0, 0(t0)
    addi t0, t0, 1
    li t1, -120036
    add t1, fp, t1
    sw t0, 0(t1)
    j BB33
BB33: 
    j BB28
BB34: 
    li t0, -120028
    add t0, fp, t0
    lw t0, 0(t0)
    li t1, -120024
    add t1, fp, t1
    lw t1, 0(t1)
    slli t1, t1, 2
    li t2, -40020
    add t2, t1, t2
    add t2, fp, t2
    lw t2, 0(t2)
    add t2, t0, t2
    li t0, -120036
    add t0, fp, t0
    lw t0, 0(t0)
    slli t0, t0, 2
    li t1, -120020
    add t1, t0, t1
    add t1, fp, t1
    lw t1, 0(t1)
    add t1, t2, t1
    li t2, 13333
    rem t2, t1, t2
    li t1, -120028
    add t1, fp, t1
    sw t2, 0(t1)
    li t1, -120036
    add t1, fp, t1
    lw t1, 0(t1)
    addi t1, t1, 2
    li t2, -120036
    add t2, fp, t2
    sw t1, 0(t2)
    j BB33
BB38: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    li t0, 120064
    add sp, sp, t0
    ret
    .align 1
main: 
BB39: 
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -32
    addi fp, sp, 32
    j BB35
BB35: 
    li t0, 9
    mv a0, t0
    call long_array
    mv t0, a0
    mv a0, t0
    j BB40
BB40: 
    ld ra, -16(fp)
    ld fp, -8(fp)
    addi sp, sp, 32
    ret
