# RISCV 64

## rv32i
- 整数计算
- Add
- Addi
- sub
- and
- or 
- xor
- andi
- ori 
- xori
- sll (shift left logical)
- sra (shift right arithmetic)
- srl (shift right logical)
- slli (i : immediate)
- srai
- srli

- set less then (immediate) (unsigned)
    - slt 
    - slti 
    - sltu
    - sltiu



- 存取
    - Load/Store
        - byte (lb/sb)
        - halfword (lh/sh)
        - word (lw/sw)
    - Load unsigned
        - byte (lbu)
        - halfword (lhu)

- 控制跳转
- branch 
    - beq 
    - bne

- branch 
    - ge 
    - lt 
    - geu 
    - ltu 

- jump and link
    - jal
    - jalr

## rv32m


- mul 
- multiply high 
    - _
    - unsigned
    - signed unsigned

- 有符号乘法可以用sll代替

- div 
- divu (unsigned)
- rem 
- remu

## rv32f和rv32d

### 浮点寄存器

### 浮点加载，存储和算术指令

- 浮点加载
    - flw
    - fld 
- 浮点存储
    - fsw
    - fsd 

> [!NOTE]  
> 浮点数无法像整数那样用`li`浮点加载立即数？ 
>
> 1. 常量，用汇编器指令提前放在内存中
> 2. 变量，通过整数寄存器中转

- 浮点算术
    - f(.s -- float; .d -- double) 加减乘除、开方、最大、最小
        - add.s/.d
        - sub.s/.d
        - mul.s/.d
        - div.s/.d
        - sqrt.s/.d
        - min.s/.d
        - max.s/.d
    - 乘后加/减上第三个数(有4个操作数，rd, rs1, rs2, rs3, rd = rs1 * rs2 (+/-) rs3)
        - fmadd.s(.d)
        - fmsub.s(.d)
    - 乘加后取反
        - fnmadd.s(.d)
        - fnmsub.s(.d)

- 符号操作(从rs1复制除了符号位的所有位，从rs2复制符号位)
    - 浮点符号注入
    - 浮点符号取反注入
    - 浮点符号异或注入
- 复制浮点寄存器
    - fmv.s(.d) rd rs 

