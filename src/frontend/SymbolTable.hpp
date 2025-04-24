#pragma once 

#include "frontend/AST.hpp"
#include "common/type.hpp"
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>

namespace frontend {

typedef std::map<std::string, std::shared_ptr<Var>> VarTab;

inline const std::shared_ptr<Var> &nullVar() {
    static auto null = std::shared_ptr<Var>(nullptr);
    return null;
}

struct Scope {
    bool is_loop;   // 是否是循环的作用域
    VarTab variables;

    Scope(bool is_loop) : is_loop(is_loop) {};

    Var* lookup(const std::string &name) const {
        auto var = variables.find(name);
        if(var != variables.end()) return var->second.get();
        else return nullptr;
    }

    const std::shared_ptr<Var> &getVar(const std::string& name) const {
        auto var = variables.find(name);
        if(var != variables.end()) return var->second;
        else return nullVar();
    }

};

// 保存scope嵌套关系
class ScopeStack {
public:

    void enter_scope(bool is_loop=false){path.emplace_back(is_loop);}
    void exit_scope(){path.pop_back();}

    Scope& cur_scope() {return path.back();}

    Var* lookup(const std::string &name) const {
        // 从当前的scope到上层 scope 一直往上，直到到全局scope也就是栈底
        for(auto scope = path.rbegin(); scope != path.rend(); ++scope) {
            auto v = scope->lookup(name);
            if(v) return v;
        }
        return nullptr;
    }

    const std::shared_ptr<Var> &getVar(const std::string& name) {
        for(auto scope = path.rbegin(); scope != path.rend(); ++scope) {
            auto &v = scope->getVar(name);
            if(v) return v;
        }
        return nullVar();
    }

    void insert(const std::string &name, std::shared_ptr<Var> &&var) {
        cur_scope().variables[name] = var;
    }

    void insert(const std::string &name, const std::shared_ptr<Var> &var) {
        cur_scope().variables[name] = var;
    }

    // 最近的loop作用域，嵌套循环，Break或Continue跳转
    const Scope* nearset_loop() const {
        for(auto scp = path.rbegin(); scp != path.rend(); scp++) {
            if(scp->is_loop) return &(*scp);
        }
        return nullptr;
    }

private:
    std::vector<Scope> path;
};


struct SymbolTable {
    // 定义的函数
    struct Function {
        // 0 -- int, 1 -- float, 根据type.hpp中的ScalarType枚举的值， nullopt表示 void
        std::optional<int> return_type;
        std::vector<Type> params_type;
        std::vector<std::string> params_name;
        ScopeStack scopes;
    };
    // 库函数
    struct LibFunc {
        std::vector<Type> params_type;
        std::vector<std::string> params_name;
        bool variadic; // 是否是变参函数
    };

    std::unordered_map<std::string, Function> func_table;
    std::unordered_map<std::string, LibFunc> lib_func_table;
    // 全局符号
    VarTab global_variables;
    // 当前函数
    Function* cur_func;

    SymbolTable() : cur_func(nullptr) {}

    bool is_in_global_scope() const {return cur_func == nullptr;}


    void insert(const std::string& name, std::shared_ptr<Var> &&value){
        if(is_in_global_scope()) global_variables[name] = value;
        else cur_func->scopes.cur_scope().variables[name] = value;
    }

    Var* lookup(const std::string& name) const {
        // 不在全局作用域时，从作用域栈找
        if(!is_in_global_scope()) {
            auto v = cur_func->scopes.lookup(name);
            if(v) return v;
        }
        
        auto gv = global_variables.find(name);
        if(gv != global_variables.end()) return gv->second.get();
        else return nullptr;
    }

    const std::shared_ptr<Var> &getVar(const std::string &name) const {
        if(!is_in_global_scope()) {
            auto &v = cur_func->scopes.getVar(name);
            if(v) return v;
        }

        auto gv = global_variables.find(name);
        if(gv != global_variables.end()) return gv->second;
        else return nullVar();
    }

    VarTab curr_vars(){
        if(cur_func) {
            return cur_func->scopes.cur_scope().variables;
        } else 
            return global_variables;
    }
};
    
}


