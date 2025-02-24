Parser=Sysy22.g4
ANTLR=antlr4
ANTLR_FLAG = -Werror -Dlanguage=Cpp -visitor
ANTLR_OUT_PATH = grammar

INCLUDE_FLAGS = -Isrc -Igrammar -I/usr/include/antlr4-runtim

BUILD_DIR = build

CC = clang++


.DEFAULT_GOAL := all

all: parse


parse: ${Parser}
	${ANTLR} ${ANTLR_FLAG} ${Parser} -o ${ANTLR_OUT_PATH}


.PHONY: clean
clean:
	rm -rf ${ANTLR_OUT_PATH}
	rm -rf ${BUILD_DIR}
