    .option pic
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0"
    .align 3
    .globl main
    .text
__create_threads:
    li a5, 3
.Label1:
    li a0, 273
    mv a1, sp
    li a2, 0
    li a3, 0
    li a4, 0
    li a7, 220
    ecall
    li a1, -1
    beq a0, a1, .Label1
    beqz a0, .Label2
    addi a5, a5, -1
    bnez a5, .Label1
.Label2:
    mv a0, a5
    ret

__join_threads:
    li a1, 3
    mv a5, a0
    beq a0, a1, .Label3
.Label4:
    li a0, 0
    li a1, 0
    li a2, 0
    li a3, 4
    li a7, 95
    ecall
    li a3, -1
    beq a3, a0, .Label4
    bnez a5, .Label3
.sleep:
    li a0, 0
    sd a0, -16(sp)
    li a0, 1
    slli a0, a0, 29
    sd a0, -8(sp)
    addi sp, sp, -16
    mv a0, sp
    li a7, 101
    addi sp, sp, 16
    ecall
    bnez a0, .sleep
    ret
.Label3:
    li a0, 0
    li a7, 93
    ecall

    .align 1
func:
.entry_func:
    sd s11, -1104(sp)
    sd s10, -1112(sp)
    sd s9, -1120(sp)
    sd s8, -1128(sp)
    sd s7, -1136(sp)
    sd s6, -1144(sp)
    sd s5, -1152(sp)
    sd s4, -1160(sp)
    sd s3, -1168(sp)
    sd s2, -1176(sp)
    sd s1, -1184(sp)
    sd fp, -1192(sp)
    sd ra, -1200(sp)
    addi sp, sp, -1360
    addi fp, sp, 1360
    mv s11, a0
    j .L0
.L0:
    addi s10, sp, 12
    addi s9, sp, 16
    addi s8, sp, 20
    addi s7, sp, 24
    addi s6, sp, 28
    addi s5, sp, 32
    addi s4, sp, 36
    addi s3, sp, 40
    addi s2, sp, 44
    addi s1, sp, 48
    addi a7, sp, 52
    addi a6, sp, 56
    addi a5, sp, 60
    addi a4, sp, 64
    addi a3, sp, 68
    addi a2, sp, 72
    addi a0, sp, 76
    addi t6, sp, 80
    addi t5, sp, 84
    addi t4, sp, 88
    addi t3, sp, 92
    addi t2, sp, 96
    addi t1, sp, 100
    addi t0, sp, 0
    sw s11, 0(t0)
    addi t0, sp, 4
    sw a1, 0(t0)
    addi a1, sp, 8
    li t0, 1804289383
    sw t0, 0(a1)
    addi t0, sp, 0
    lw a1, 0(t0)
    addi t0, sp, 4
    lw t0, 0(t0)
    addw a1, a1, t0
    addi t0, sp, 8
    sw a1, 0(t0)
    li t0, 846930886
    sw t0, 0(s10)
    li t0, 1681692777
    sw t0, 0(s9)
    li t0, 1714636915
    sw t0, 0(s8)
    li t0, 1957747793
    sw t0, 0(s7)
    li t0, 424238335
    sw t0, 0(s6)
    li t0, 719885386
    sw t0, 0(s5)
    li t0, 1649760492
    sw t0, 0(s4)
    li t0, 596516649
    sw t0, 0(s3)
    li t0, 1189641421
    sw t0, 0(s2)
    li t0, 1025202362
    sw t0, 0(s1)
    li t0, 1350490027
    sw t0, 0(a7)
    li t0, 783368690
    sw t0, 0(a6)
    li t0, 1102520059
    sw t0, 0(a5)
    li t0, 2044897763
    sw t0, 0(a4)
    li t0, 1967513926
    sw t0, 0(a3)
    li t0, 1365180540
    sw t0, 0(a2)
    li t0, 1540383426
    sw t0, 0(a0)
    li t0, 304089172
    sw t0, 0(t6)
    li t0, 1303455736
    sw t0, 0(t5)
    li t0, 35005211
    sw t0, 0(t4)
    li t0, 521595368
    sw t0, 0(t3)
    li t0, 294702567
    sw t0, 0(t2)
    li t0, 1726956429
    sw t0, 0(t1)
    li a1, 336465782
    addi t0, sp, 104
    sw a1, 0(t0)
    li a1, 861021530
    addi t0, sp, 108
    sw a1, 0(t0)
    addi a1, sp, 112
    li t0, 278722862
    sw t0, 0(a1)
    addi a1, sp, 116
    li t0, 233665123
    sw t0, 0(a1)
    addi a1, sp, 120
    li t0, 2145174067
    sw t0, 0(a1)
    addi a1, sp, 124
    li t0, 468703135
    sw t0, 0(a1)
    addi a1, sp, 128
    li t0, 1101513929
    sw t0, 0(a1)
    addi a1, sp, 132
    li t0, 1801979802
    sw t0, 0(a1)
    addi a1, sp, 136
    li t0, 1315634022
    sw t0, 0(a1)
    addi a1, sp, 140
    li t0, 635723058
    sw t0, 0(a1)
    addi a1, sp, 144
    li t0, 1369133069
    sw t0, 0(a1)
    addi a1, sp, 148
    li t0, 1125898167
    sw t0, 0(a1)
    addi a1, sp, 152
    li t0, 1059961393
    sw t0, 0(a1)
    li t0, 1
    sw t0, 0(s10)
    li t0, 2
    sw t0, 0(s9)
    li t0, 3
    sw t0, 0(s8)
    li t0, 4
    sw t0, 0(s7)
    lw a1, 0(s10)
    li t0, 1
    addw t0, t0, a1
    sw t0, 0(s6)
    lw a1, 0(s9)
    li t0, 2
    addw t0, t0, a1
    sw t0, 0(s5)
    lw a1, 0(s8)
    li t0, 3
    addw t0, t0, a1
    sw t0, 0(s4)
    lw a1, 0(s7)
    li t0, 4
    addw t0, t0, a1
    sw t0, 0(s3)
    lw a1, 0(s6)
    li t0, 1
    addw t0, t0, a1
    sw t0, 0(s2)
    lw a1, 0(s5)
    li t0, 2
    addw t0, t0, a1
    sw t0, 0(s1)
    lw a1, 0(s4)
    li t0, 3
    addw t0, t0, a1
    sw t0, 0(a7)
    lw a1, 0(s3)
    li t0, 4
    addw t0, t0, a1
    sw t0, 0(a6)
    lw a1, 0(s2)
    li t0, 1
    addw t0, t0, a1
    sw t0, 0(a5)
    lw a1, 0(s1)
    li t0, 2
    addw t0, t0, a1
    sw t0, 0(a4)
    lw a1, 0(a7)
    li t0, 3
    addw t0, t0, a1
    sw t0, 0(a3)
    lw a1, 0(a6)
    li t0, 4
    addw t0, t0, a1
    sw t0, 0(a2)
    lw a1, 0(a5)
    li t0, 1
    addw t0, t0, a1
    sw t0, 0(a0)
    lw a1, 0(a4)
    li t0, 2
    addw t0, t0, a1
    sw t0, 0(t6)
    lw a1, 0(a3)
    li t0, 3
    addw t0, t0, a1
    sw t0, 0(t5)
    lw a1, 0(a2)
    li t0, 4
    addw t0, t0, a1
    sw t0, 0(t4)
    lw a1, 0(a0)
    li t0, 1
    addw t0, t0, a1
    sw t0, 0(t3)
    lw a1, 0(t6)
    li t0, 2
    addw t0, t0, a1
    sw t0, 0(t2)
    lw a1, 0(t5)
    li t0, 3
    addw t0, t0, a1
    sw t0, 0(t1)
    lw a1, 0(t4)
    li t0, 4
    addw a1, t0, a1
    addi t0, sp, 104
    sw a1, 0(t0)
    lw a1, 0(t3)
    li t0, 1
    addw a1, t0, a1
    addi t0, sp, 108
    sw a1, 0(t0)
    lw a1, 0(t2)
    li t0, 2
    addw a1, t0, a1
    addi t0, sp, 112
    sw a1, 0(t0)
    lw a1, 0(t1)
    li t0, 3
    addw a1, t0, a1
    addi t0, sp, 116
    sw a1, 0(t0)
    addi t0, sp, 104
    lw a1, 0(t0)
    li t0, 4
    addw a1, t0, a1
    addi t0, sp, 120
    sw a1, 0(t0)
    addi t0, sp, 108
    lw a1, 0(t0)
    li t0, 1
    addw a1, t0, a1
    addi t0, sp, 124
    sw a1, 0(t0)
    addi t0, sp, 112
    lw a1, 0(t0)
    li t0, 2
    addw a1, t0, a1
    addi t0, sp, 128
    sw a1, 0(t0)
    addi t0, sp, 116
    lw a1, 0(t0)
    li t0, 3
    addw a1, t0, a1
    addi t0, sp, 132
    sw a1, 0(t0)
    addi t0, sp, 120
    lw a1, 0(t0)
    li t0, 4
    addw a1, t0, a1
    addi t0, sp, 136
    sw a1, 0(t0)
    addi t0, sp, 124
    lw a1, 0(t0)
    li t0, 1
    addw a1, t0, a1
    addi t0, sp, 140
    sw a1, 0(t0)
    addi t0, sp, 128
    lw a1, 0(t0)
    li t0, 2
    addw a1, t0, a1
    addi t0, sp, 144
    sw a1, 0(t0)
    addi t0, sp, 132
    lw a1, 0(t0)
    li t0, 3
    addw a1, t0, a1
    addi t0, sp, 148
    sw a1, 0(t0)
    addi t0, sp, 136
    lw a1, 0(t0)
    li t0, 4
    addw a1, t0, a1
    addi t0, sp, 152
    sw a1, 0(t0)
    addi t0, sp, 0
    lw a1, 0(t0)
    addi t0, sp, 4
    lw t0, 0(t0)
    subw a1, a1, t0
    li t0, 10
    addw a1, a1, t0
    addi t0, sp, 8
    sw a1, 0(t0)
    addi t0, sp, 124
    lw a1, 0(t0)
    li t0, 1
    addw a1, t0, a1
    addi t0, sp, 140
    sw a1, 0(t0)
    addi t0, sp, 128
    lw a1, 0(t0)
    li t0, 2
    addw a1, t0, a1
    addi t0, sp, 144
    sw a1, 0(t0)
    addi t0, sp, 132
    lw a1, 0(t0)
    li t0, 3
    addw a1, t0, a1
    addi t0, sp, 148
    sw a1, 0(t0)
    addi t0, sp, 136
    lw a1, 0(t0)
    li t0, 4
    addw a1, t0, a1
    addi t0, sp, 152
    sw a1, 0(t0)
    addi t0, sp, 108
    lw a1, 0(t0)
    li t0, 1
    addw a1, t0, a1
    addi t0, sp, 124
    sw a1, 0(t0)
    addi t0, sp, 112
    lw a1, 0(t0)
    li t0, 2
    addw a1, t0, a1
    addi t0, sp, 128
    sw a1, 0(t0)
    addi t0, sp, 116
    lw a1, 0(t0)
    li t0, 3
    addw a1, t0, a1
    addi t0, sp, 132
    sw a1, 0(t0)
    addi t0, sp, 120
    lw a1, 0(t0)
    li t0, 4
    addw a1, t0, a1
    addi t0, sp, 136
    sw a1, 0(t0)
    lw a1, 0(t3)
    li t0, 1
    addw a1, t0, a1
    addi t0, sp, 108
    sw a1, 0(t0)
    lw a1, 0(t2)
    li t0, 2
    addw a1, t0, a1
    addi t0, sp, 112
    sw a1, 0(t0)
    lw a1, 0(t1)
    li t0, 3
    addw a1, t0, a1
    addi t0, sp, 116
    sw a1, 0(t0)
    addi t0, sp, 104
    lw a1, 0(t0)
    li t0, 4
    addw a1, t0, a1
    addi t0, sp, 120
    sw a1, 0(t0)
    lw a1, 0(a0)
    li t0, 1
    addw t0, t0, a1
    sw t0, 0(t3)
    lw a1, 0(t6)
    li t0, 2
    addw t0, t0, a1
    sw t0, 0(t2)
    lw a1, 0(t5)
    li t0, 3
    addw t0, t0, a1
    sw t0, 0(t1)
    lw a1, 0(t4)
    li t0, 4
    addw a1, t0, a1
    addi t0, sp, 104
    sw a1, 0(t0)
    lw a1, 0(a5)
    li t0, 1
    addw t0, t0, a1
    sw t0, 0(a0)
    lw a1, 0(a4)
    li t0, 2
    addw t0, t0, a1
    sw t0, 0(t6)
    lw a1, 0(a3)
    li t0, 3
    addw t0, t0, a1
    sw t0, 0(t5)
    lw a1, 0(a2)
    li t0, 4
    addw t0, t0, a1
    sw t0, 0(t4)
    lw a1, 0(s2)
    li t0, 1
    addw t0, t0, a1
    sw t0, 0(a5)
    lw a1, 0(s1)
    li t0, 2
    addw t0, t0, a1
    sw t0, 0(a4)
    lw a1, 0(a7)
    li t0, 3
    addw t0, t0, a1
    sw t0, 0(a3)
    lw a1, 0(a6)
    li t0, 4
    addw t0, t0, a1
    sw t0, 0(a2)
    lw a1, 0(s6)
    li t0, 1
    addw t0, t0, a1
    sw t0, 0(s2)
    lw a1, 0(s5)
    li t0, 2
    addw t0, t0, a1
    sw t0, 0(s1)
    lw a1, 0(s4)
    li t0, 3
    addw t0, t0, a1
    sw t0, 0(a7)
    lw a1, 0(s3)
    li t0, 4
    addw t0, t0, a1
    sw t0, 0(a6)
    lw a1, 0(s10)
    li t0, 1
    addw t0, t0, a1
    sw t0, 0(s6)
    lw a1, 0(s9)
    li t0, 2
    addw t0, t0, a1
    sw t0, 0(s5)
    lw a1, 0(s8)
    li t0, 3
    addw t0, t0, a1
    sw t0, 0(s4)
    lw a1, 0(s7)
    li t0, 4
    addw t0, t0, a1
    sw t0, 0(s3)
    addi t0, sp, 140
    lw a1, 0(t0)
    li t0, 1
    addw t0, t0, a1
    sw t0, 0(s10)
    addi t0, sp, 144
    lw a1, 0(t0)
    li t0, 2
    addw t0, t0, a1
    sw t0, 0(s9)
    addi t0, sp, 148
    lw a1, 0(t0)
    li t0, 3
    addw t0, t0, a1
    sw t0, 0(s8)
    addi t0, sp, 152
    lw a1, 0(t0)
    li t0, 4
    addw t0, t0, a1
    sw t0, 0(s7)
    addi t0, sp, 8
    lw t0, 0(t0)
    sd t0, -1000(fp)
    lw t0, 0(s10)
    lw a1, 0(s9)
    sd a1, -1008(fp)
    lw a1, 0(s8)
    sd a1, -1016(fp)
    lw a1, 0(s7)
    sd a1, -1024(fp)
    lw a1, 0(s6)
    sd a1, -1032(fp)
    lw a1, 0(s5)
    sd a1, -1040(fp)
    lw a1, 0(s4)
    sd a1, -1048(fp)
    lw a1, 0(s3)
    sd a1, -1056(fp)
    lw a1, 0(s2)
    sd a1, -1064(fp)
    lw a1, 0(s1)
    sd a1, -1072(fp)
    lw a1, 0(a7)
    sd a1, -1096(fp)
    lw ra, 0(a6)
    lw s9, 0(a5)
    lw s8, 0(a4)
    lw s7, 0(a3)
    lw s6, 0(a2)
    lw s5, 0(a0)
    lw s4, 0(t6)
    lw s3, 0(t5)
    lw s2, 0(t4)
    lw s1, 0(t3)
    lw a7, 0(t2)
    lw a6, 0(t1)
    addi t1, sp, 104
    lw a5, 0(t1)
    addi t1, sp, 108
    lw a4, 0(t1)
    addi t1, sp, 112
    lw a3, 0(t1)
    addi t1, sp, 116
    lw a2, 0(t1)
    addi t1, sp, 120
    lw a1, 0(t1)
    addi t1, sp, 124
    lw a0, 0(t1)
    addi t1, sp, 128
    lw t6, 0(t1)
    addi t1, sp, 132
    lw t5, 0(t1)
    addi t1, sp, 136
    lw t4, 0(t1)
    addi t1, sp, 140
    lw t3, 0(t1)
    addi t1, sp, 144
    lw t2, 0(t1)
    addi t1, sp, 148
    lw t1, 0(t1)
    addi s10, sp, 152
    lw s10, 0(s10)
    ld s11, -1000(fp)
    addw s11, s11, t0
    ld t0, -1008(fp)
    addw s11, s11, t0
    ld t0, -1016(fp)
    addw s11, s11, t0
    ld t0, -1024(fp)
    addw s11, s11, t0
    ld t0, -1032(fp)
    subw s11, s11, t0
    ld t0, -1040(fp)
    subw s11, s11, t0
    ld t0, -1048(fp)
    subw s11, s11, t0
    ld t0, -1056(fp)
    subw s11, s11, t0
    ld t0, -1064(fp)
    addw s11, s11, t0
    ld t0, -1072(fp)
    addw t0, s11, t0
    ld s11, -1096(fp)
    addw t0, t0, s11
    addw t0, t0, ra
    subw t0, t0, s9
    subw t0, t0, s8
    subw t0, t0, s7
    subw t0, t0, s6
    addw t0, t0, s5
    addw t0, t0, s4
    addw t0, t0, s3
    addw t0, t0, s2
    subw t0, t0, s1
    subw t0, t0, a7
    subw t0, t0, a6
    subw t0, t0, a5
    addw t0, t0, a4
    addw t0, t0, a3
    addw t0, t0, a2
    addw t0, t0, a1
    subw t0, t0, a0
    subw t0, t0, t6
    subw t0, t0, t5
    subw t0, t0, t4
    addw t0, t0, t3
    addw t0, t0, t2
    addw t0, t0, t1
    addw a0, t0, s10
    j .exit_func
.exit_func:
    addi sp, sp, 1360
    ld s11, -1104(sp)
    ld s10, -1112(sp)
    ld s9, -1120(sp)
    ld s8, -1128(sp)
    ld s7, -1136(sp)
    ld s6, -1144(sp)
    ld s5, -1152(sp)
    ld s4, -1160(sp)
    ld s3, -1168(sp)
    ld s2, -1176(sp)
    ld s1, -1184(sp)
    ld fp, -1192(sp)
    ld ra, -1200(sp)
    ret
    .align 1
main:
.entry_main:
    sd fp, -8(sp)
    sd ra, -16(sp)
    addi sp, sp, -24
    addi fp, sp, 24
    j .L1
.L1:
    addi t6, sp, 0
    li t5, 2089018456
    addi t4, sp, 4
    li t3, 628175011
    li t2, 1
    li t1, 2
    li t0, 9
    sw t5, 0(t6)
    sw t3, 0(t4)
    sw t2, 0(t6)
    lw t2, 0(t6)
    mulw t0, t1, t0
    addw t0, t2, t0
    sw t0, 0(t4)
    lw a0, 0(t6)
    lw a1, 0(t4)
    call func
    call putint
    call putline
    j .exit_main
.exit_main:
    addi sp, sp, 24
    ld fp, -8(sp)
    ld ra, -16(sp)
    ret
