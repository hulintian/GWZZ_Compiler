// 这个代码 借鉴自 return_0 
#pragma once

#include <functional>
#include <limits>
#include <ostream>
#include <utility>

#include <sstream>
#include <cstdint>

using std::ostream;

// color of out put
inline ostream &error(ostream &os) {
  os << "\033[0;31m[error]\033[0m ";
  return os;
}

inline ostream &warn(ostream &os) {
  os << "\033[0;33m[warn]\033[0m ";
  return os;
}

inline ostream &info(ostream &os) {
  os << "\033[0;32m[info]\033[0m ";
  return os;
}

inline ostream &debug(ostream &os) {
#ifdef DEBUG
  os << "\033[0;34m[debug]\033[0m ";
#endif
  return os;
}

constexpr int INDENT_LEN = 2;

inline void print_indent(std::ostream &os, int indent) {
  for (int i = 0; i < indent; ++i)
    os << ' ';
}

// boost.container_hash.hash
inline std::size_t hash_combine(std::size_t seed, std::size_t const value) {
  seed ^= value + 0x9e3779b9 + (seed << 6) + (seed >> 2);
  return seed;
}

inline int countl_zero(unsigned const x) { return __builtin_clz(x); }

inline int bit_width(unsigned const x) {
  return std::numeric_limits<decltype(x)>::digits - countl_zero(x);
}

namespace std {
template <typename First, typename Second> struct hash<pair<First, Second>> {
  size_t operator()(pair<First, Second> const &p) const {
    return hash_combine(hash<First>{}(p.first), hash<Second>{}(p.second));
  }
};


// 转义 DOT label 中的特殊字符
inline std::string dot_escape(const std::string& s) {
    std::string out;
    for (char c : s) {
        switch (c) {
            case '"': out += "\\\""; break;
            case '\\': out += "\\\\"; break;
            case '\n': out += "\\n"; break;
            default: out += c; break;
        }
    }
    return out;
}
// HTML-like label 需要 HTML 转义
inline std::string html_escape(const std::string& s) {
    std::string o; o.reserve(s.size() * 1.1);
    for (char c : s) {
        switch (c) {
            case '&':  o += "&amp;";  break;
            case '<':  o += "&lt;";   break;
            case '>':  o += "&gt;";   break;
            case '"':  o += "&quot;"; break;
            default:   o += c;        break;
        }
    }
    return o;
}

// 将指针地址转为十六进制，作为 DOT 节点唯一 ID 的一部分
template <typename T>
std::string ptr_hex_id(const T* p) {
    std::ostringstream os;
    os << std::hex << std::uppercase << reinterpret_cast<uintptr_t>(p);
    return os.str();
}
// 颜色方案
static constexpr const char* COL_TRUE  = "#2ECC71"; // 绿
static constexpr const char* COL_FALSE = "#E74C3C"; // 红
static constexpr const char* COL_OTHER = "#5DADE2"; // 蓝
static constexpr const char* NODE_FILL = "#F8F9FB";
static constexpr const char* NODE_LINE = "#9AA0A6";
} // namespace std
