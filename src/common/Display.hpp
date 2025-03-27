#pragma once 

#include <ostream>
#include <sstream>

class Display {
public:
    virtual ~Display() = default;

    [[nodiscard]] std::string to_string() const {
        std::ostringstream buffer;
        this->print(buffer, 0);
        return buffer.str();
    }
    
    /// 需要重写的函数
    virtual void print(std::ostream &out, unsigned level) const = 0;

    friend std::ostream &operator<<(std::ostream &out, Display const &self) {
        self.print(out, 0);
        return out;
    }
};
