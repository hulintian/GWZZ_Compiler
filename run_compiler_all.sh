#!/bin/bash

set -e

# 遍历所有 .sy 文件
for sy in tmp/functional/*.sy; do
    # 取出无扩展名的basename（例如 01_var_defn2.sy → 01_var_defn2）
    base=$(basename "$sy" .sy)
    # 生成汇编输出名
    sfile="tmp/func/${base}.s"
    # 日志文件名
    logfile="tmp/func/t_${base}.log"
    # 编译并 tee 日志
    ./bin/compiler -S "$sfile" "$sy" | tee "$logfile"
done
