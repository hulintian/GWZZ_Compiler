#pragma once 
#include "Pass.hpp"
#include <set>
#include <map>
#include <vector>
namespace IR{
class IRBuilder;
class Function;
class AllocaInst; 
class PhiInst;
class LoadInst;
class BasicBlock;
}

namespace pass{
class UseDefResult;

class Reg2MemPass : public FunctionTransformPass{
public:
    const char* get_name()const override{return "Reg2Mem";}
    bool run(IR::Function& func,PassManager& pm) override;
private:
    IR::Function* _F = nullptr;
    PassManager* _pm = nullptr;
    IR::IRBuilder* _builder = nullptr;
    UseDefResult* _use_def = nullptr;
    std::set<IR::PhiInst*> _phi_to_process;
    std::map<IR::PhiInst*, IR::AllocaInst*> _phi_to_alloca_map;
    //缓存：延迟插入
    std::map<IR::PhiInst*, std::vector<std::pair<IR::LoadInst*, IR::BasicBlock*>>> load_temp;
    
    void refresh_analyses();
    void init_phi_set();
    void reset_alloca_in_entry();
    void replace_phi_uses();
    void insert_stores_at_src();
    void insert_loads();
    void erase_phi_nodes();
};
} // namespace pass
