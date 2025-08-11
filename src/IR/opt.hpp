#pragma once

namespace IR
{
class Module;
class IRBuilder;
} // namespace IR

namespace opt
{
    void run_passes(IR::Module* m,IR::IRBuilder* builder);
} // namespace opt
