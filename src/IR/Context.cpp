#include "Context.hpp"

unsigned Context::get_tmp_baisc_block_index() {
    return bb_idx++;
}

unsigned Context::get_tmp_var() {
    return v_idx++;
}
