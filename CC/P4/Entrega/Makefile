CXX = g++

EXES = reduction
OBJS = ${EXES:=.o}

all: ${EXES}

reduction:
	${CXX} ${LDFLAGS} -std=c++11 -Wall -g -o $@ reduction.cpp

clean:
	${RM} ${EXES} ${OBJS} core *~
