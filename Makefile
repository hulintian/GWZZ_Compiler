Parser=Sysy22.g4
ANTLR=antlr4
ANTLR_FLAG = -Werror -Dlanguage=Cpp -visitor -listener
ANTLR_OUT_PATH = frontend

BUILD_DIR = build



.DEFAULT_GOAL := all

all: parse
	echo $^
	echo $<


parse: ${Parser}
	${ANTLR} ${ANTLR_FLAG} ${Parser} -o ${ANTLR_OUT_PATH}


.PHONY: clean
clean:
	rm -rf ${ANTLR_OUT_PATH}