#pragma once 
#include <ostream>
#include <string>
#include <set>
#include <map>

namespace backend {

class MachineBasicBlock;
class MachineFunction {
public:
    std::string _name;

    std::set<MachineBasicBlock*> bbs;
    std::map<int, MachineBasicBlock*> idx_bb_mp;
    std::map<int, std::set<int>> prev_bb;
    std::map<int, std::set<int>> next_bb;
    
    friend std::ostream& operator<<(std::ostream& os, const MachineFunction& mf) {
        os << mf._name;
        return os;
    }

    void dump_asm(std::ostream& out) {
        out << this->_name << ":\n";
        for(auto bb : bbs) {
        }
    }
};

}
