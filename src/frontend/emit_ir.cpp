#include "frontend/emit_ir.hpp"
#include "IR/IR.hpp"
#include "frontend/AST.hpp"

namespace frontend {
    using namespace std;

    Type GenIr::getType(const ast::Func *func){
        if(func->type()){
            if(func->type()->type() == 0)return Type(Int);
            else return Type(Float);
        }
        else return Type(Void);
    }

    Module *GenIr::transform(const ast::CompUnits &ast){
        module = new Module(std::vector<Function*>(), std::vector<DataMeta*>());
        auto &lib = module->lib_funcs;
        lib["getint"] = new LibFunction(module, Type(Int), {}, "getint");
        lib["getch"] =new LibFunction(module, Type(Int), {}, "getch");
        lib["getfloat"] = new LibFunction(module, Type(Float), {}, "getfloat");
        lib["getarray"] = new LibFunction(module, Type(Int), std::vector<DataMeta*>{new DataMeta(Type(Int, std::vector<int>{0}), false, "")}, "getarray");
        lib["getfarray"] = new LibFunction(module, Type(Int), std::vector<DataMeta*>{new DataMeta(Type(Float, std::vector<int>{0}), false, "")}, "getfarray");
        lib["putint"] = new LibFunction(module, Type(Void), std::vector<DataMeta*>{new DataMeta(Type(Int), false, "")}, "putint");
        lib["putch"] = new LibFunction(module, Type(Void), std::vector<DataMeta*>{new DataMeta(Type(Int), false, "")}, "putch");
        lib["putfloat"] = new LibFunction(module, Type(Void), std::vector<DataMeta*>{new DataMeta(Type(Float), false, "")}, "putfloat");
        lib["putarray"] = new LibFunction(module, Type(Void), std::vector<DataMeta*>{new DataMeta(Type(Int), false, ""), new DataMeta(Type(Int, std::vector<int>{0}), false, "")}, "putarray");
        lib["putfarray"] = new LibFunction(module, Type(Void), std::vector<DataMeta*>{new DataMeta(Type(Int), false, ""), new DataMeta(Type(Float, std::vector<int>{0}), false, "")}, "putfarray");
        lib["putf"] = new LibFunction(module, Type(Void), std::vector<DataMeta*>{new DataMeta(Type(String), false, "")}, "putf");
        lib["starttime"] = new LibFunction(module, Type(Void), std::vector<DataMeta*>{new DataMeta(Type(Int), false, "")}, "starttime");
        lib["stoptime"] = new LibFunction(module, Type(Void), std::vector<DataMeta*>{new DataMeta(Type(Int), false, "")}, "stoptime");
        lib["__memset_zero__"] = new LibFunction(module, Type(Void), std::vector<DataMeta*>{new DataMeta(Type(Int, std::vector<int>{0}), false, ""), new DataMeta(Type(Int), false, "")}, "__memset_zero__");

        lib["putline"] = new LibFunction(module, Type(Void), {}, "putline");
        for(auto& child : ast.children()){
            if(child.index() == 1){ // function
                auto & func = std::get<1>(child);
                Type ret_type = getType(func.get());
                auto emitter = new FuncEmitter(module, ret_type, instruction::Label(func->ident().identifier()), func->params().size());
                module->func_map[func->ident().identifier()] = emitter->func;
                // 访问参数
                for(auto& param : func->params()){
                    visitParameter(*param, emitter);
                }
                // 访问函数体
                visitStatement(*func->body(), emitter);
                // 加入函数
                module->add_function(emitter->visitEnd());
            }
            else{ // global variable
                auto & decl = std::get<0>(child);
                auto & var = decl->var;
                // 加入全局变量
                // 数组或标量对应的DataMeta
                ast2ir_var[var.get()] = new DataMeta(var->type, true, decl->ident()->identifier());
                // 初始化
                auto &initializer = decl->init();
                if(initializer){
                    if(var->type.is_array()){
                        if (std::get<1>(initializer.get()->value()).size() == 0) {
                            ast2ir_var[var.get()]->set_bss_initialize(true);
                        }
                        else {
                            if (std::get<1>(initializer.get()->value()).size() == 1) {
                                auto init_value = visitConstExpr(std::get<0>(std::get<1>(initializer.get()->value())[0]->value()).get());
                                if (init_value.fv == 0.0f || init_value.iv == 0) {
                                    ast2ir_var[var.get()]->set_bss_initialize(true);
                                }
                                else {
                                    std::vector<ConstValue> init_values(var->type.nr_elems(), 0);
                                    init_values[0] = init_value;
                                    ast2ir_var[var.get()]->set_init_value(init_values);
                                }
                            }
                            else {
                                auto init_value = visitConstInitializer(initializer.get(), var->type, var->type.nr_elems());
                                ast2ir_var[var.get()]->set_init_value(init_value);
                            }
                        }
                    }
                    else{
                        ast2ir_var[var.get()]->set_init_value(visitConstExpr(std::get<0>(initializer->value()).get()));
                    }
                }
                else {
                    ast2ir_var[var.get()]->set_bss_initialize(true);
                    ast2ir_var[var.get()]->set_not_init(true);
                }
                module->add_global_variable(ast2ir_var[var.get()]);
            }
        }
        return module;
    }

    Temp *GenIr::visitCast(Temp *temp, Type to_type, FuncEmitter *funcEmitter){
        if(temp->get_type().base_type != to_type.base_type){
            Temp *cast_temp = funcEmitter->freshTemp(to_type);
            funcEmitter->visitCast(cast_temp, temp, to_type);
            return cast_temp;
        }
        return temp;
    }

    void GenIr::visitParameter(const ast::Param &param, FuncEmitter *funcEmitter){
        auto & var = param.var;
        auto var_type = var->type;
        ast2ir_var[var.get()] = new DataMeta(var_type, false, param.ident().identifier());
        // 数组的第一维无效
        if(var->type.is_array()){
            auto arg_temp = funcEmitter->freshTemp(var_type.array2ptr());
            ast2ir_var[var.get()]->set_temp(arg_temp);
            funcEmitter->func->add_arg_temp(arg_temp);
        }
        else{ // 标量参数要在栈上开空间
            auto arg_temp = funcEmitter->freshTemp(var_type);
            auto addr_temp = funcEmitter->freshTemp(var_type.get_pointer_type());
            ast2ir_var[var.get()]->set_temp(addr_temp);
            funcEmitter->func->add_arg_temp(arg_temp);
            funcEmitter->visitAlloca(addr_temp, var_type);
            funcEmitter->visitStore(addr_temp, arg_temp, false);
        }
        funcEmitter->func->add_args(ast2ir_var[var.get()]);
    }

    void GenIr::visitStatement(const ast::Stmt &node, FuncEmitter *funcEmitter){
        auto stmt = &node;
        TypeCase(expr_stmt, const ast::ExprStmt *, stmt) {
            auto &expr = expr_stmt->expr();
            if (expr) visitArithExpr(expr.get(), funcEmitter);
            return;
        }
        TypeCase(assign, const ast::Assignment *, stmt) {
            auto &lhs = assign->lhs();
            auto &rhs = assign->rhs();
            auto data = ast2ir_var[lhs->var.get()];
            
            if (data->is_global()) { // 如果是全局变量
                if (data->get_type().is_array()) { // 如果是数组
                    funcEmitter->visitLoadAddr(data->get_type().array2ptr(), data->get_name());
                }
                else { // 如果是标量
                    funcEmitter->visitLoadAddr(data->get_type().get_pointer_type(), data->get_name());
                }
            }
            // 无论是数组还是标量，全都是写入它的地址
            auto lvalue = visitLValue(lhs.get(), funcEmitter, true);
            auto rvalue = visitCast(visitArithExpr(rhs.get(), funcEmitter), data->get_type().base_type, funcEmitter);
            funcEmitter->visitStore(lvalue, rvalue, data->get_type().is_array() || data->is_global());
            return;
        }
        TypeCase(block, const ast::Block *, stmt){
            for (auto &child : block->children()) {
                if (child.index() == 1) {
                    auto &decl = std::get<1>(child);
                    visitDeclaration(*decl, funcEmitter);
                }
                else {
                    auto &sub_stmt = std::get<0>(child);
                    visitStatement(*sub_stmt, funcEmitter);
                }
            }
            return;
        }
        TypeCase(if_, const ast::IfStmt *, stmt) {
            visitIf(*if_, funcEmitter);
            return;
        }
        TypeCase(while_, const ast::WhileStmt *, stmt) {
            visitWhile(*while_, funcEmitter);
            return;
        }
        TypeCase(break_, const ast::Break *, stmt) {
            funcEmitter->new_instruction(new instruction::Branch(funcEmitter->getLoopBreakBB()));
            funcEmitter->cur_bb = funcEmitter->new_bb();
            return;
        }
        TypeCase(continue_, const ast::Continue *, stmt) {
            funcEmitter->new_instruction(new instruction::Branch(funcEmitter->getLoopContinueBB()));
            funcEmitter->cur_bb = funcEmitter->new_bb();
            return;
        }
        TypeCase(return_, const ast::Return *, stmt) {
            Temp * ret = nullptr;
            if (return_->rets()) { // 如果有返回值
                ret = visitCast(visitArithExpr(return_->rets().get(), funcEmitter), funcEmitter->func->get_ret_type().base_type, funcEmitter);
            }
            funcEmitter->visitReturn(ret);
            return;
        }
    }

    // 局部变量的声明/定义
    void GenIr::visitDeclaration(const ast::Decl &decl, FuncEmitter *funcEmitter){
        auto &var = decl.var;
        auto var_type = var->type;
        // ast中的变量对应的ir表示
        ast2ir_var[var.get()] = new DataMeta(var_type, false, decl.ident()->identifier());
        auto data = ast2ir_var[var.get()];
        // 局部变量会分配temp，并添加 Alloca 指令

        Temp *addr;
        if(var_type.is_array())
            // 局部数组的Type
            addr = funcEmitter->freshTemp(var_type.array2ptr());
        else
            // 局部标量的Type
            addr = funcEmitter->freshTemp(var_type.get_pointer_type());
        funcEmitter->visitAlloca(addr, var_type);
        data->set_temp(addr);

        auto &initializer = decl.init();
        if (initializer){ // 如果有初始化
            auto &value = initializer->value();
            if(var_type.is_array()){ // 如果是数组，value一定是init_list
                // TODO: 对较大的局部数组直接调用内置清零函数
                int nr_elems = var_type.nr_elems();
                bool memset_zero = false;
                if (nr_elems > 16) {
                    funcEmitter->visitCall(module->lib_funcs["__memset_zero__"], std::vector<Temp*>{addr, funcEmitter->visitLiteral(nr_elems, Type(Int))});
                    memset_zero = true;
                    funcEmitter->func->get_parent()->set_use_memset_zero(true);
                }
                visitInitializer(var_type, data, initializer.get(), 0, funcEmitter, nr_elems, memset_zero);
            }
            else{ // 如果是标量，value一定是表达式
                ast::Expr *expr;
                if (value.index() == 0) {
                    expr = std::get<0>(value).get();
                }
                funcEmitter->visitStore(addr, visitCast(visitArithExpr(expr, funcEmitter, var_type.base_type), var_type, funcEmitter), false);
            }
        }
        else { // 随机初始化
            if(!var_type.is_array()){ // 如果不是数组
                Temp *temp_imm;
                if (var_type.base_type == Float) {
                    temp_imm = funcEmitter->visitLiteral(rand() / (float)RAND_MAX, Type(Float));
                    funcEmitter->visitStore(addr, temp_imm, false);
                }
                else {
                    temp_imm = funcEmitter->visitLiteral(rand(), Type(Int));
                }
                funcEmitter->visitStore(addr, temp_imm, false);
            }
        }
    }

    void GenIr::visitIf(const ast::IfStmt &if_stmt, FuncEmitter *funcEmitter){
        auto &otherwise = if_stmt.else_stmt();
        auto true_bb = funcEmitter->new_bb();
        auto false_bb = otherwise ? funcEmitter->new_bb(): nullptr;
        auto next_bb = funcEmitter->new_bb();
        if(false_bb == nullptr)false_bb = next_bb;

        auto cond = visitLogicExpr(if_stmt.cond().get(), true_bb, false_bb, funcEmitter);
        if(cond != nullptr)
            funcEmitter->visitCondBranch(cond, true_bb, false_bb);

        funcEmitter->cur_bb = true_bb;
        visitStatement(*if_stmt.then().get(), funcEmitter);
        funcEmitter->new_instruction(new instruction::Branch(next_bb));
        if(otherwise){
            funcEmitter->cur_bb = false_bb;
            visitStatement(*otherwise.get(), funcEmitter);
            funcEmitter->new_instruction(new instruction::Branch(next_bb));
        }
        funcEmitter->cur_bb = next_bb;
    }

    void GenIr::visitWhile(const ast::WhileStmt &while_stmt, FuncEmitter *funcEmitter){
        auto cond_bb = funcEmitter->new_bb();
        auto body_bb = funcEmitter->new_bb();
        auto body_cond_bb = funcEmitter->new_bb();
        auto next_bb = funcEmitter->new_bb();

        funcEmitter->new_instruction(new instruction::Branch(cond_bb));

        funcEmitter->cur_bb = cond_bb;
        auto cond = visitLogicExpr(while_stmt.cond().get(), body_bb, next_bb, funcEmitter);
        if(cond != nullptr)
            funcEmitter->visitCondBranch(cond, body_bb, next_bb);

        funcEmitter->openLoop(next_bb, body_cond_bb);

        funcEmitter->cur_bb = body_bb;
        visitStatement(*while_stmt.body().get(), funcEmitter);
        funcEmitter->new_instruction(new instruction::Branch(body_cond_bb));

        funcEmitter->cur_bb = body_cond_bb;
        auto body_cond = visitLogicExpr(while_stmt.cond().get(), body_bb, next_bb, funcEmitter);
        if(body_cond != nullptr)
            funcEmitter->visitCondBranch(body_cond, body_bb, next_bb);

        funcEmitter->closeLoop();
        funcEmitter->cur_bb = next_bb;
    }

    Temp *GenIr::visitArithExpr(const ast::Expr *expr, FuncEmitter *funcEmitter, int literal_type) {
        TypeCase(int_literal, const ast::IntLiteral *, expr) {
            if (literal_type == Float)
                return funcEmitter->visitLiteral((float)int_literal->value(), Type(Float));
            return funcEmitter->visitLiteral(int_literal->value(), Type(Int));
        }
        TypeCase(float_literal, const ast::FloatLiteral *, expr) {
            if (literal_type == Int)
                return funcEmitter->visitLiteral((int)float_literal->value(), Type(Int));
            return funcEmitter->visitLiteral(float_literal->value(), Type(Float));
        }
        TypeCase(lvalue, const ast::LValue *, expr) {
            return visitLValue(lvalue, funcEmitter, false);
        }
        TypeCase(call, const ast::Call *, expr) {
            int args_num = call->args().size();
            std::vector<Temp *> args_temp;
            for(int i = 0; i < args_num; i++){
                auto & arg = call->args()[i];
                if (arg.index() == 0) { // expression
                    if(module->lib_funcs.count(call->func().identifier())){
                        args_temp.push_back(visitCast(visitArithExpr(std::get<0>(arg).get(), funcEmitter), module->lib_funcs[call->func().identifier()]->get_arguments()->at(i)->get_type().base_type, funcEmitter));
                    }
                    else{
                        args_temp.push_back(visitCast(visitArithExpr(std::get<0>(arg).get(), funcEmitter), module->get_func_map()[call->func().identifier()]->get_arguments()->at(i)->get_type().base_type, funcEmitter));
                    }
                }
            }
            if(module->lib_funcs.count(call->func().identifier()))
                return funcEmitter->visitCall(module->lib_funcs[call->func().identifier()], args_temp);
            return funcEmitter->visitCall(module->get_func_map()[call->func().identifier()], args_temp);
        }
        TypeCase(unary, const ast::UnaryExpr *, expr) {
            auto op = unary->op();
            auto src = visitArithExpr(unary->operand().get(), funcEmitter);
            switch (op) {
                case UnaryOp::Add:
                    return src;
                case UnaryOp::Sub:
                    return funcEmitter->visitUnary(op, src, src->get_type());
                case UnaryOp::Not: {
                    // TODO
                    // int情况下为了保留语义信息，选择直接生成unary not
                    // 该IR指令可以后续被翻译为icmp eq 0或反转跳转目标
                    // float的比较可能更复杂，也直接生成unary not
                    // 这里不进行隐式类型转换
                    return funcEmitter->visitUnary(op, src, Type(Int));
                }
            }
        }
        TypeCase(binary, const ast::BinaryExpr *, expr) {
            auto op = binary->op();
            assert(op != BinaryOp::And && op != BinaryOp::Or);

            auto src1 = visitArithExpr(binary->lhs().get(), funcEmitter);
            auto src2 = visitArithExpr(binary->rhs().get(), funcEmitter);
            auto src_type = (src1->get_type().base_type == Float || src2->get_type().base_type == Float) ? Type(Float) : Type(Int);
            auto dst_type = binary->type.value();

            // 类型转换
            src1 = visitCast(src1, src_type, funcEmitter);
            src2 = visitCast(src2, src_type, funcEmitter);
            return funcEmitter->visitBinary(op, src1, src2, dst_type);
        }
        return nullptr;
    }

    Temp *GenIr::visitLogicExpr(const ast::Expr *expr, BasicBlock *true_bb, BasicBlock *false_bb, FuncEmitter *funcEmitter){
        TypeCase(binary, const ast::BinaryExpr *, expr) {
            auto op = binary->op();
            if (op == BinaryOp::Or) {
                auto cond2_bb = funcEmitter->new_bb();
                auto cond1_temp = visitLogicExpr(binary->lhs().get(), true_bb, cond2_bb, funcEmitter);
                if(cond1_temp != nullptr)
                    funcEmitter->visitCondBranch(cond1_temp, true_bb, cond2_bb);

                funcEmitter->cur_bb = cond2_bb;
                auto cond2_temp = visitLogicExpr(binary->rhs().get(), true_bb, false_bb, funcEmitter);
                if(cond2_temp != nullptr)
                    funcEmitter->visitCondBranch(cond2_temp, true_bb, false_bb);

                return nullptr;
            }
            if (op == BinaryOp::And) {
                auto cond2_bb = funcEmitter->new_bb();
                auto cond1_temp = visitLogicExpr(binary->lhs().get(), cond2_bb, false_bb, funcEmitter);
                if(cond1_temp != nullptr)
                    funcEmitter->visitCondBranch(cond1_temp, cond2_bb, false_bb);

                funcEmitter->cur_bb = cond2_bb;
                auto cond2_temp = visitLogicExpr(binary->rhs().get(), true_bb, false_bb, funcEmitter);
                if(cond2_temp != nullptr)
                    funcEmitter->visitCondBranch(cond2_temp, true_bb, false_bb);

                return nullptr;
            }
        }
        return visitArithExpr(expr, funcEmitter);
    }

    Temp *GenIr::visitLValue(const ast::LValue *lvalue, FuncEmitter *funcEmitter, bool return_addr){
        auto data = ast2ir_var[lvalue->var.get()];
        auto data_type = data->get_type();
        Temp *addr;
        if(data->is_global()){
            // 全局变量标识符地址的temp(数组存首地址，标量存地址)
            // addr = funcEmitter->global_map[lvalue->ident().name()];
            if (data_type.is_array()) { // 如果是数组
                addr = funcEmitter->visitLoadAddr(data_type.array2ptr(), data->get_name());
            }
            else { // 如果是标量
                addr = funcEmitter->visitLoadAddr(data_type.get_pointer_type(), data->get_name());
            }
        }
        else{
            // 局部变量标识符的temp(数组存首地址，标量存地址)
            addr = dynamic_cast<Temp *>(data->get_temp());
        }
        auto &indices = lvalue->indices();
        std::vector<Temp *> index_temps;
        // 获取每个下标的temp
        for(auto &index : indices){
            index_temps.push_back(visitCast(visitArithExpr(index.get(), funcEmitter), Type(Int), funcEmitter));
        }

        int remain_dim = data_type.nr_dims() - index_temps.size();
        // 如果是一个数组且有下标
        if (!index_temps.empty()) {
            // *addr存相应的地址
            if (remain_dim > 0) {
                Type new_type = Type(data_type.base_type, vector<int>(data_type.dims.begin() + index_temps.size(), data_type.dims.end()));
                addr = funcEmitter->visitElementPtr(new_type.array2ptr(), addr, index_temps);
            }
            else 
                addr = funcEmitter->visitElementPtr(Type(data_type.base_type, std::vector<int>({0})), addr, index_temps);
        }
        if(remain_dim == 0 && !return_addr){ // 如果需要返回值，*addr存这个量的值
            addr = funcEmitter->visitLoad(Type(data_type.base_type), addr, data_type.is_array() || data->is_global());
        }

        return addr;
    }

    int GenIr::visitInitializer(Type var_type, DataMeta *data, ast::Initializer *initializer, int idx, FuncEmitter *funcEmitter, int max_size, bool is_zero_init){
        int start_idx = idx;
        auto &value = initializer->value();
        // 只有init_list才会到达这里
        auto &init_list = std::get<1>(value);
        int last_type = -1;
        for(auto &init : init_list){
            auto &init_value = init->value();
            if(init_value.index() == 0){ // expression
                ast::Expr *expr = std::get<0>(init_value).get();
                // 把expr赋值到相应的地址
                funcEmitter->visitStore(dynamic_cast<Temp *>(data->get_temp()), visitCast(visitArithExpr(expr, funcEmitter), var_type.base_type, funcEmitter), true, 4 * (idx++));
                last_type = 0;
            }
            else{
                // 交给这一维度自己去处理
                if (last_type == 0) {
                    int next_max_size = 1;
                    int mul_cnt = 0;
                    for (auto it = var_type.dims.rbegin(); it != var_type.dims.rend(); it++) {
                        if (idx % (*it * next_max_size) != 0) break;
                        next_max_size *= *it;
                        mul_cnt++;
                    }
                    Type next_type;
                    next_type = Type(var_type.base_type, vector<int>(var_type.dims.end() - mul_cnt, var_type.dims.end()));
                    idx = visitInitializer(next_type, data, init.get(), idx, funcEmitter, next_max_size, is_zero_init);
                    last_type = 0;
                }
                else {
                    Type next_type;
                    next_type = Type(var_type.base_type, vector<int>(var_type.dims.begin() + 1, var_type.dims.end()));
                    idx = visitInitializer(next_type, data, init.get(), idx, funcEmitter, next_type.nr_elems(), is_zero_init);
                    last_type = 1;
                }
            }
        }
        if (is_zero_init) return start_idx + max_size;
        if (var_type.base_type == Int){
            while(idx - start_idx < max_size){
                funcEmitter->visitStore(dynamic_cast<Temp *>(data->get_temp()), funcEmitter->visitLiteral(ConstValue(0), Type(Int)), true, 4 * (idx++));
            }
        }
        else if (var_type.base_type == Float){
            while(idx - start_idx < max_size){
                funcEmitter->visitStore(dynamic_cast<Temp *>(data->get_temp()), funcEmitter->visitLiteral(ConstValue(0.0f), Type(Float)), true, 4 * (idx++));
            }
        }
        return idx;
    }

    ConstValue GenIr::visitConstExpr(ast::Expr *expr){
        TypeCase(int_literal, ast::IntLiteral *, expr){
            return int_literal->value();
        }
        TypeCase(float_literal, ast::FloatLiteral *, expr){
            return float_literal->value();
        }
        TypeCase(lvalue, ast::LValue *, expr) {
            return visitConstLValue(lvalue);
        }
        TypeCase(unary, const ast::UnaryExpr *, expr) {
            auto op = unary->op();
            ConstValue src = visitConstExpr(unary->operand().get());
            switch (op) {
                case UnaryOp::Add:
                    return src;
                case UnaryOp::Sub:
                    return src.getNeg();
                case UnaryOp::Not: {
                    return src.getNot();
                }
            }
        }
        TypeCase(binary, ast::BinaryExpr *, expr) {
            auto op = binary->op();
            assert(op != BinaryOp::And && op != BinaryOp::Or);

            auto src1 = visitConstExpr(binary->lhs().get());
            auto src2 = visitConstExpr(binary->rhs().get());
            return binary->to_const(src1, src2, op);
            // switch (op) {
            //     case BinaryOp::Add:
            //         return src1 + src2;
            //     case BinaryOp::Sub:
            //         return src1 - src2;
            //     case BinaryOp::Mul:
            //         return src1 * src2;
            //     case BinaryOp::Div:
            //         return src1 / src2;
            //     case BinaryOp::Mod:
            //         return src1 % src2;
            //     case BinaryOp::Lt:
            //         return src1 < src2;
            //     case BinaryOp::Leq:
            //         return src1 <= src2;
            //     case BinaryOp::Gt:
            //         return src1 > src2;
            //     case BinaryOp::Geq:
            //         return src1 >= src2;
            //     case BinaryOp::Eq:
            //         return src1 == src2;
            //     case BinaryOp::Neq:
            //         return src1 != src2;
            //     case BinaryOp::Shr:
            //         return src1 >> src2;
            //     case BinaryOp::Shl:
            //         return src1 << src2;
            // }
        }
    }

    ConstValue GenIr::visitConstLValue(ast::LValue *lvalue){
        auto data = ast2ir_var[lvalue->var.get()];
        if(data->get_type().is_array()){
            auto &indices = lvalue->indices();
            int idx = 0;
            int size = 1;
            for(int i = indices.size() - 1; i >= 0; i--){
                int index = visitConstExpr(indices[i].get()).iv;
                idx += index * size;
                size *= data->get_type().dims[i];
            }
            return std::get<1>(data->get_init_value())[idx];
        }
        else{
            return std::get<0>(data->get_init_value());
        }
    }

    std::vector<ConstValue> GenIr::visitConstInitializer(ast::Initializer *initializer, Type var_type, int max_size){
        std::vector<ConstValue> ret;
        auto &value = initializer->value();
        // 只有init_list才会到达这里
        auto &init_list = std::get<1>(value);
        int last_type = -1;
        for(auto &init : init_list){
            auto &init_value = init->value();
            if(init_value.index() == 0){ // expression
                ast::Expr *expr = std::get<0>(init_value).get();
                auto const_expr = visitConstExpr(expr);
                if (var_type.base_type == Int){
                    if (const_expr.type == Int){
                        ret.push_back(const_expr.iv);
                    }
                    else if (const_expr.type == Float){
                        ret.push_back((int)const_expr.fv);
                    }
                }
                else if (var_type.base_type == Float){
                    if (const_expr.type == Float){
                        ret.push_back(const_expr.fv);
                    }
                    else if (const_expr.type == Int){
                        ret.push_back((float)const_expr.iv);
                    }
                }
                last_type = 0;
            }
            else{
                // 交给这一维度自己去处理
                if (last_type == 0) {
                    int next_max_size = 1;
                    int mul_cnt = 0;
                    for (auto it = var_type.dims.rbegin(); it != var_type.dims.rend(); it++) {
                        if (ret.size() % (*it * next_max_size) != 0) break;
                        next_max_size *= *it;
                        mul_cnt++;
                    }
                    Type next_type;
                    next_type = Type(var_type.base_type, vector<int>(var_type.dims.end() - mul_cnt, var_type.dims.end()));
                    auto sub_ret = visitConstInitializer(init.get(), next_type, next_max_size);
                    ret.insert(ret.end(), sub_ret.begin(), sub_ret.end());
                    last_type = 0;
                }
                else {
                    Type next_type;
                    next_type = Type(var_type.base_type, vector<int>(var_type.dims.begin() + 1, var_type.dims.end()));
                    auto sub_ret = visitConstInitializer(init.get(), next_type, next_type.nr_elems());
                    ret.insert(ret.end(), sub_ret.begin(), sub_ret.end());
                    last_type = 1;
                }
            }
        }
        if (var_type.base_type == Int){
            while(ret.size() < max_size){
                ret.push_back(0);
            }
        }
        else if (var_type.base_type == Float){
            while(ret.size() < max_size){
                ret.push_back(0.0f);
            }
        }
        return ret;
    }
}
//
// #include "frontend/emit_ir.hpp"
// #include "IR/Module.hpp"
// #include "IR/Type.hpp"
// #include "common/type.hpp"
// #include "frontend/AST.hpp"
// #include <memory>
// 
// namespace frontend {
// using iType = ir::Type;
// 
// IRGen::IRGen() {
//     _module = new ir::Module();
//     ctx = new Context();
// }
// 
// ir::Module* IRGen::transform(const ast::CompUnits& ast) {
//     for(auto &child : ast.children()) {
//         if(child.index() == 0) {
//             auto &decl = std::get<std::unique_ptr<ast::Decl>>(child);
//             visitGlobalVariable(*decl);
//         } else {
//             auto &func = std::get<std::unique_ptr<ast::Func>>(child);
//             visitFunction(*func);
//         }
//     }
// }
// 
// 
// // iType* type2IRType(Type* ty) {
// // // for base type or scalar type
// // 
// //     ir::Type *res = nullptr;
// //     if(!ty->is_array() && !ty->is_ptr() ) {     // not array type not pointer , must be base type
// //         switch (ty->base_type) {
// //             case Void       : res = new ir::VoidType() ; break;
// //             case Int        : res = new ir::IntegerType(32) ; break;
// //             case Float      : res = new ir::FloatType() ; break;
// //             default: return new ir::VoidType();
// //         }
// //     } else if(ty->is_array()) {
// // 
// //     }
// // 
// //     return new ir::VoidType();
// // }
// 
// void IRGen::visitGlobalVariable(const ast::Decl& decl) {
//     // TODO convert type defined at frontend to IR type
//     auto h_type = decl.type().get();
//     if(auto sty = dynamic_cast<ast::ScalarType*>(h_type)) { // is scalar
//         auto t  = new ir::IntegerType(1);
//     
//         
//     }
// }
// 
// }
