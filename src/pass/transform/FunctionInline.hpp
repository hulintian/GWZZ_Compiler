#include "Pass.hpp"
#include "PassManager.hpp"
#include "IRBuilder.hpp"
#include <map>
#include <set>
#include <strstream>


namespace pass {

class FunctionInlinePass : public ModuleTransformPass {
public:
    // TODO
    // 1. 收集信息 
    //      调用图
    //      是否可内联，有无IO操作
    //      函数的size
    //      内联次数
    //      

    const char* get_name() const override { return "FunctionInline"; };
    bool run(IR::Module& module, PassManager& pm) override;

    struct call_info {
        IR::Function* caller;
        std::set<const IR::Function*> callees;
        std::set<IR::CallInst*> callinstrs;

        call_info(IR::Function* caller_name) : caller(caller_name) {}
    };

    std::map<IR::Function*, call_info*> call_graph;
    std::map<IR::CallInst*,std::pair<IR::BasicBlock*,IR::BasicBlock*>> split_bb_at_call;

    void init();

    void re_gen_call_graph();

    void dump_call_graph(std::ostream& out);

    void perform_inlining(IR::CallInst* call_inst, IR::Function* callee);
    void split_BB(IR::BasicBlock* cur_BB,IR::CallInst* call);
    void callee_to_caller(IR::CallInst* call);

private:
    IR::Module* _module = nullptr;
    pass::PassManager* _pm = nullptr;
    IR::IRBuilder* _builder = nullptr;
};

}
