# SysY 编译器项目文档

> 项目名称： sysy22  
> 作者： 格llvm致知/黑龙江科技大学  
> 版本： (初赛)v1.0

[--简要说明--]

---

## 目录

*   [1. 简介](#1-简介)
*   [2. 环境搭建](#2-环境搭建)
    *   [2.1. 依赖](#21-依赖)
    *   [2.2. 编译](#22-编译)
*   [3. 项目架构](#3-项目架构)
    *   [3.1. 整体流程](#31-整体流程)
    *   [3.2. 词法分析 (Lexer)](#32-词法分析-lexer)
    *   [3.3. 语法分析 (Parser)](#33-语法分析-parser)
    *   [3.4. 语义分析与AST](#34-语义分析与ast)
    *   [3.5. 中间表示 (IR)](#35-中间表示-ir)
    *   [3.6. 优化遍 (Optimization Passes)](#36-优化遍-optimization-passes)
    *   [3.7. 目标代码生成 (Code Generation)](#37-目标代码生成-code-generation)
*   [4. 如何使用](#4-如何使用)
*   [5. 测试](#5-测试)
*   [6. 未来工作](#6-未来工作)
*   [7. 参考文献](#7-参考文献)

---

## 1. 简介

<!-- 详细描述你的项目目标。是为了课程设计？参加编译大赛？还是纯粹的技术学习？ -->
<!-- 描述你的编译器实现了SysY语言的哪些特性（例如：整数、浮点数、数组、控制流等）。-->
<!-- 描述你的编译器目标平台是什么（例如：ARMv7-A, RISC-V等）。-->

本项目是一个从零开始构建的SysY语言编译器。它将`.sy`源文件作为输入，经过完整的前端、中端优化和后端处理，最终生成指定平台（如RISC-V）的汇编代码。

## 2. 环境搭建

### 2.1. 依赖

*   **CMake**: 版本 `3.16` 或更高
*   **GCC/Clang**: 支持C++17标准
*   **Flex**: 用于词法分析
*   **Bison**: 用于语法分析
*   **[其他依赖，例如Google Test]**

### 2.2. 编译

```sh
# 1. 克隆仓库
git clone [你的仓库地址]
cd [你的项目目录]

# 3. 编译
make all

# 4. 编译产物
# 可执行文件 `compiler` 将生成在 `~/bin` 目录下。
```

## 3. 项目架构

### 3.1. 整体流程

本项目采用经典的三段式编译器架构：

`SysY源文件` -> **前端 (Frontend)** -> `中间表示 (IR)` -> **优化器 (Optimizer)** -> `优化后的IR` -> **后端 (Backend)** -> `目标汇编代码`

### 3.2. 词法分析 (Lexer)

<!-- 描述你如何实现词法分析。 -->
*   **工具**：`Flex`
*   **源文件**：`src/frontend/Lexer.l`
*   **功能**：读取`.sy`文件，输出Token流，识别关键字、标识符、常量、运算符和分隔符。

### 3.3. 语法分析 (Parser)

<!-- 描述你如何实现语法分析。 -->
*   **工具**：`Bison`
*   **源文件**：`src/frontend/Parser.y`
*   **功能**：接收Lexer的Token流，根据SysY的上下文无关文法构建抽象语法树（AST）。

### 3.4. 语义分析与AST

<!-- 描述你的AST节点设计和语义检查。 -->
*   **主要类**：`ASTNode`, `ExprAST`, `StmtAST` 等。
*   **功能**：遍历AST，进行语义检查，主要包括：
    *   **符号表管理**：构建和维护作用域，记录变量、函数等信息。
    *   **类型检查**：检查运算符两边的操作数类型是否匹配，函数调用参数是否正确等。
    *   **控制流检查**：确保`break`, `continue`在循环内，`return`类型与函数签名匹配。

### 3.5. 中间表示 (IR)

<!-- 描述你的IR设计。这是你工作的核心部分。 -->
我们设计了一套类似LLVM IR的、基于SSA（静态单赋值）的三地址码。

*   **核心类**：
    *   `Value`: 所有值（指令、常量、参数等）的基类。
    *   `Instruction`: 指令的基类，继承自`User`和`Value`。
    *   `BasicBlock`: 基本块，包含一个指令列表。
    *   `Function`: 函数，包含一个基本块列表。
    *   `Module`: 编译单元，包含一个函数和全局变量列表。
*   **特点**：
    *   采用强类型系统。
    *   基于SSA形式，使用`PhiInst`处理来自不同前驱的值。
    *   所有指令和操作数通过`_operands`列表统一管理，便于编写通用的优化Pass。

### 3.6. 优化遍 (Optimization Passes)

我们实现了一个基于PassManager的模块化优化框架。所有优化都作为`Pass`的子类实现。

| Pass 名称 | 类型 | 描述 | 依赖 |
| :--- | :--- | :--- | :--- |
| **`UseDefAnalysis`** | Analysis | 构建并提供Use-Def和Def-Use信息。 | 无 |
| **`DominatorTree`** | Analysis | 构建函数的支配树和直接支配节点信息。 | CFG |
| **`DominanceFrontier`** | Analysis | 计算每个基本块的支配边界。 | `DominatorTree` |
| **`Mem2Reg`** | Transform | **核心**：将基于`alloca`/`load`/`store`的内存变量提升为SSA虚拟寄存器。 | `DominatorTree`, `DominanceFrontier` |
| **`CFGSimplify`** | Transform | 简化控制流图，如删除空块、合并基本块等。 | 无 |
| **`DCE`** | Transform | **核心**：死代码消除。从有副作用的根指令反向遍历，删除无用指令。 | 无 |
| **`ADCE`** | Transform | (可选)激进死代码消除，可消除无用的控制流。 | `LivenessAnalysis` |
| **`LICM`** | Transform | (可选)循环不变代码外提，将循环中不变的计算提到循环外。 | `LoopAnalysis`, `DominatorTree` |
| **`[其他你实现的Pass]`** | ... | ... | ... |

### 3.7. 目标代码生成 (Code Generation)

<!-- 描述你的后端实现。 -->
*   **目标平台**：[例如：RISC-V 32-bit]
*   **指令选择**：通过一个选择模式匹配（Pattern Matching）或简单遍历IR的方式，将IR指令翻译为目标机器指令。
*   **寄存器分配**：[例如：线性扫描算法 或 简单的图着色算法]
*   **栈帧管理**：在函数序言（prologue）和尾声（epilogue）中正确处理栈指针（`sp`）和帧指针（`fp`），为局部变量和保存的寄存器分配栈空间。

## 4. 如何使用

```sh
# 编译一个SysY文件到汇编
# 用法: ./compiler [选项] <输入文件> -o <输出文件>
./bin/compiler -o output.s tests/source/some_test.sy

# 开启所有优化
./bin/compiler -O2 -o output_opt.s tests/source/some_test.sy
```
<!-- 列出你的编译器支持的命令行选项。-->
*   `-o <file>`: 指定输出文件名。
*   `-O0`, `-O1`, `-O2`: 指定优化等级。
*   `--emit-ir`: 输出LLVM风格的IR，用于调试。

## 5. 测试

本项目使用一套自动化测试脚本来验证编译器的正确性。

```sh
# 运行所有功能测试
cd build
ctest

# 或者手动运行测试脚本
cd ..
python3 tests/run_tests.py
```
测试用例位于`/tests`目录下，分为功能测试（`functional`）和性能测试（`performance`）。每个测试用例包含一个`.sy`源文件和一个`.out`文件（预期输出）。

## 6. 未来工作

- [ ] 实现完整的SysY-2022库函数支持。
- [ ] 添加更多高级优化，如函数内联、循环展开等。
- [ ] 支持更多后端平台。
- [ ] 完善错误处理和诊断信息。

## 7. 参考文献

*   [SysY-2022 语言标准]([链接到语言标准文档])
*   *Compilers: Principles, Techniques, and Tools* (The Dragon Book)
*   [LLVM官方文档](https://llvm.org/docs/)