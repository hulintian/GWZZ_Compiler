#pragma once
#include "Pass.hpp"
#include "Analysis.hpp"
#include "BasicBlock.hpp"
#include "Function.hpp"
#include "Module.hpp"
#include <map>
#include <vector>

namespace pass{

class DominatorTreePass;

class DominatorTreeResult : public AnalysisResult {
public:
    friend class DominatorTreePass;
    IR::BasicBlock* get_idom(IR::BasicBlock* bb) const {
        auto it = idom_map.find(bb);
        if (it != idom_map.end()) {
            return it->second;
        }
        return nullptr;
    }
    int get_depth(IR::BasicBlock* bb) const{
        auto it = _depth_map.find(bb);
        if  (it != _depth_map.end()){
            return it->second;
        }
        return -1;
    }
    //查询 BB_A 是否支配 BB_B 
    bool dominates(IR::BasicBlock* blockA, IR::BasicBlock* blockB) const{
        IR::BasicBlock *temp_BB = blockB;
        while(temp_BB != nullptr){
            if(temp_BB == blockA){
                return true;
            }
            temp_BB = get_idom(temp_BB);
        }
        return false;
    }
private:
    //key: BB ; val: idom(BB) 
    std::map<IR::BasicBlock*,IR::BasicBlock*> idom_map;
    std::map<IR::BasicBlock*,int> _depth_map;
};

class DominatorTreePass :public FunctionAnalysisPass {
public:
    using Result = DominatorTreeResult;
    const char* get_name()const override {return "DominatorTree";}
    std::unique_ptr<AnalysisResult> run(const IR::Function &func, PassManager& pm) override;

private:
    IR::BasicBlock* intersect(IR::BasicBlock* BB_A,IR::BasicBlock* BB_B,
                              const std::map<IR::BasicBlock*,IR::BasicBlock*> idoms,
                              const std::map<IR::BasicBlock*, int>& post_order);
    void compute_idoms(const IR::Function& F, DominatorTreeResult& result);
};


}


