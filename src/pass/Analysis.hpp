#pragma once

#include <string>
#include <typeindex>
namespace pass{
//分析结果的基类，所有分析pass的分析结果继承此类
class AnalysisResult{
private:
    /* data */
public:
    virtual ~AnalysisResult() = default;
};

using AnalysisID= std::type_index;
//这里用了函数模板，获取pass的ID
template <typename T>
AnalysisID get_pass_id(){
    return std::type_index(typeid(T));
}


}