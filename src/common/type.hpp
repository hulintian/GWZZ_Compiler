#pragma once 

// Define the ir type

#include <string>
#include <vector>
#include <assert.h>

/// 标量类型
enum ScalarType {
    Int,
    Float,
    String,
    Void
};

/// define of type 
struct Type {
    int base_type;
    bool is_const;
    std::vector<int> dims;

    int nr_dims() const { return dims.size(); }
    bool is_array() const { return dims.size() > 0; }

    /// compute the total number of elements in array.
    int nr_elems() const {
        int count = 1;
        for(int n : dims) {
            count *= n;
        }
        return count;
    }

    /// return the size of bytes.
    int size() const { return nr_elems() * 4; }

    /// compare two type equality
    bool operator==(const Type &b) const {
        if(base_type != b.base_type) return false;
        if(nr_dims() != b.nr_dims()) return false;

        // compare array's each dim 
        for (int i=0; i<nr_dims(); i++) {
            if(dims[i] != b.dims[i]) return false;
        }
        return true;
    }

    /// compare two types are not equality
    bool operator!=(const Type &b) { return !this->operator==(b); }

    /// returns the pointer version of type 
    Type get_pointer_type() const {
        Type new_type = *this;
        new_type.dims.insert(dims.begin(), 0);
        return new_type;
    }

    Type array2ptr() const {
        Type new_type = *this;
        new_type.dims[0] = 0;
        return new_type;
    }

    Type get_lower_dim() const {
        Type new_type = *this;
        /// lowering dim 
        if(new_type.dims.size() > 1)  
            new_type.dims.erase(new_type.dims.begin()+1);
        return new_type;
    }

    bool is_ptr() const { return dims.size() > 0 && dims[0]==0; }
    bool is_ptr2scalar() const { return dims.size() == 1 && dims[0] == 0; }
    /// 判断是否是全局指针
    bool is_gp() const { return base_type == Int || is_array(); }

    Type() {}
    Type(int btype) : base_type(btype), is_const(false) {}
    Type(int btype, bool is_const) : base_type(btype), is_const(is_const) {}
    Type(int btype, std::vector<int> dimensions) 
        : base_type(btype), is_const(false), dims{std::move(dimensions)} {}
    Type(Type type, std::vector<int> dimensions) 
        : base_type(type.base_type), is_const(false), dims{std::move(dimensions)}{}
};

inline std::string type_string(Type t) {
    std::string s;
    switch (t.base_type) {
        case Void : s = "void" ; break;
        case Int : s = "int" ; break;
        case Float : s = "float" ; break;
        case String : s = "string" ; break;
    }

    if(!t.is_array()) return s;

    bool ptr = false;
    int i = 0;

    // 第一个维度是0
    if(t.dims[0] == 0) {
        ptr = true;
        i = 1;
    }

    if(t.dims.size() != 1 || !ptr) {
        for(; i<t.nr_dims(); i++) 
            s += "[" + std::to_string(t.dims[i]) + "]";
    }

    if(ptr) 
        s+="*";
    return s;
}
