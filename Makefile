Parser=Sysy22.g4
ANTLR=antlr4
CXX = clang++
CC = clang

INCLUDE_FLAGS = -I./antlr4 -I./antlr4/antlr4-runtime -I./src 
CXXFLAGS = -std=c++17 -Wall -g -MMD -MP -fPIE 
# CXXFLAGS += -DSHOW_INST_TIME
# CXXFLAGS += -DSHOW_ASM
# CXXFLAGS += -DSHOW_AST
# CXXFLAGS += -DDEBUG
CXXFLAGS += -DSHOW_IR

ANTLR_FLAG = -Werror -Dlanguage=Cpp -visitor

LDFLAGS = -L./antlr4/lib -lantlr4-runtime

INCLUDE_FLAGS += -I./src/frontend
INCLUDE_FLAGS += -I./src/backend
INCLUDE_FLAGS += -I./src/IR
INCLUDE_FLAGS += -I./src/common
INCLUDE_FLAGS += -I./src/grammar
INCLUDE_FLAGS += -I./src/utils

ANTLR_OUT_PATH = src/grammar
BUILD_DIR = build
SRC_DIR = src

SOURCES = $(shell find src -name '*.cpp')
OBJECTS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SOURCES))

TARGET=bin/compiler

DEPS = $(OBJECTS:.o=.d)


.DEFAULT_GOAL := all

all: $(TARGET)


$(TARGET) : $(OBJECTS)
	mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(TARGET) $(OBJECTS)

$(BUILD_DIR)/%.o : $(SRC_DIR)/%.cpp 
	mkdir -p $(dir $@)
	$(CC) $(CXXFLAGS) $(INCLUDE_FLAGS) -c $< -o $@

$(BUILD_DIR)/%.d : $(SRC_DIR)/%.cpp  
	mkdir -p $(dir $@)
	$(CC) $(CXXFLAGS) $(INCLUDE_FLAGS) -MM $< > $@

.PHONY: grammar
grammar: ${Parser} 
	${ANTLR} ${ANTLR_FLAG} ${Parser} -o ${ANTLR_OUT_PATH}

.PHONY: clean
clean:
	rm -rf ${BUILD_DIR}

.PHONY: test 
test:	
	echo "run tests"
	echo $(OBJECTS)
	# echo $(SOURCES)
	# echo $(DEPS)


TARGET_MACHINE = user@10.220.142.94:~/compiler_test

.PHONY: p2board
push2board:
	rsync tests/*.s $(TARGET_MACHINE) --progress
