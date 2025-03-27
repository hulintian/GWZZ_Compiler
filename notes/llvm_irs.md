# LLVM IR Instructions


| **类别**         | **指令**                                                         | **描述** |
|----------------|----------------------------------------------------------------|-------|
| **算术与逻辑指令** | `add`, `sub`, `mul`, `udiv`, `sdiv`, `urem`, `srem`           | 整数算术运算 |
|                | `fadd`, `fsub`, `fmul`, `fdiv`, `frem`                          | 浮点数算术运算 |
|                | `and`, `or`, `xor`                                             | 位运算 |
|                | `shl`, `lshr`, `ashr`                                          | 位移运算 |
| **比较指令**    | `icmp`                                                         | 整数比较 |
|                | `fcmp`                                                         | 浮点数比较 |
| **类型转换指令** | `trunc`, `zext`, `sext`                                       | 整数扩展或截断 |
|                | `fptrunc`, `fpext`                                             | 浮点数精度调整 |
|                | `fptoui`, `fptosi`, `uitofp`, `sitofp`                          | 整数与浮点数转换 |
|                | `ptrtoint`, `inttoptr`                                         | 指针与整数互转 |
|                | `bitcast`                                                       | 无损类型转换 |
| **内存指令**    | `alloca`                                                       | 分配栈内存 |
|                | `load`, `store`                                                | 读写内存 |
|                | `getelementptr`                                                | 计算地址偏移 |
| **控制流指令**  | `br`                                                           | 条件/无条件跳转 |
|                | `switch`                                                       | 多分支跳转 |
|                | `indirectbr`                                                   | 间接跳转 |
|                | `invoke`, `resume`, `unwind`, `landingpad`                     | 异常处理 |
| **函数调用指令** | `call`                                                         | 函数调用 |
|                | `ret`                                                          | 返回 |
| **汇编指令**    | `asm`                                                          | 内联汇编 |
| **向量指令**    | `extractelement`, `insertelement`                              | 访问向量元素 |
|                | `shufflevector`                                                | 重新排列向量 |
| **聚合类型指令** | `extractvalue`, `insertvalue`                                 | 访问/修改聚合类型（结构体等） |
| **原子指令**    | `cmpxchg`, `atomicrmw`, `fence`                               | 并发原子操作 |
| **Phi 指令**    | `phi`                                                          | SSA 形式的变量合并 |
| **内存屏障指令** | `fence`                                                        | 线程同步屏障 |


---

# Why need Phi instruction

- answer by chatgpt

### **`phi` 指令 vs. 直接操作内存**
LLVM IR 采用 **SSA（静态单赋值，Static Single Assignment）** 形式，这要求 **每个变量只能被赋值一次**。`phi` 指令是 SSA 形式下**合并不同控制流路径上的值**的机制，而内存操作（`load`/`store`）是最终的物理指令，用于实际的数据存取。

| **对比点**        | **`phi` 指令**                                                | **内存读写 (`load`/`store`)**                        |
|-----------------|------------------------------------------------|-------------------------------------------|
| **作用**       | 合并不同控制流路径的值，保证 SSA 形式                  | 直接读写变量，存储或获取数据             |
| **发生阶段**   | **LLVM IR（SSA 形式）** 代码中使用                     | **最终生成目标代码**（非 SSA 形式）后使用 |
| **是否涉及内存** | **不涉及真实内存**，只是在 IR 级别选择合适的 SSA 变量 | **涉及真实内存**，会发生内存读写操作      |
| **使用场景**   | 主要用于**寄存器分配前的中间表示**                     | 目标代码生成时替换 `phi` 指令             |

---

### **为什么需要 `phi` 指令？**
#### **1. 解决 SSA 形式下的值选择问题**
在 SSA 形式下，每个变量只能赋值一次，但在控制流分叉后，变量可能有不同的来源。例如：

```cpp
if (x > 0)
    y = 1;
else
    y = 2;
```

在 LLVM IR（SSA 形式）中不能直接写 `y = 1` 或 `y = 2`，必须使用 `phi` 指令：

```llvm
entry:
    br i1 %cond, label %then, label %else
then:
    %y1 = add i32 0, 1
    br label %merge
else:
    %y2 = add i32 0, 2
    br label %merge
merge:
    %y = phi i32 [%y1, %then], [%y2, %else]
```

在 `merge` 基本块中，`phi` 选择 `y1` 或 `y2` 的值，取决于程序是从 `then` 还是 `else` 跳转过来的。

---

### **为什么最终是用内存读写？**
LLVM 在**后端优化**和**寄存器分配**过程中，可能会消除 `phi` 指令，并转换为内存读写或寄存器操作：

1. **寄存器分配时用 `move` 指令替换 `phi`**
   - 如果 `y` 仅用于寄存器，可以用 `move` 指令替代：
     ```asm
     then_block:
         mov r1, #1
         b merge
     else_block:
         mov r1, #2
         b merge
     merge_block:
         ; r1 现在存储 y 的正确值
     ```

2. **若变量跨基本块且寄存器不足，则存入内存**
   - 在寄存器不足或变量需长期存储时，LLVM 会将 `phi` 转换为 `load`/`store`：
     ```asm
     then_block:
         mov r1, #1
         str r1, [sp, #4]   ; 存入栈
         b merge
     else_block:
         mov r1, #2
         str r1, [sp, #4]   ; 存入栈
         b merge
     merge_block:
         ldr r1, [sp, #4]   ; 取出 y 的正确值
     ```

---

### **总结**
- `phi` 仅用于 **LLVM IR 级别**，确保 SSA 形式，使优化（如常量传播、死代码消除）更容易进行。
- **后端会消除 `phi` 指令**，转换为寄存器 `move` 或内存 `load`/`store`。
- **最终代码必须使用内存读写**，因为底层 CPU 体系结构不支持 SSA，需要物理存储。

这样，`phi` 指令保证了 **优化效果**，但最终仍然需要转化为实际的**寄存器赋值或内存访问**。


