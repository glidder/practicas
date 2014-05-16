CXX = g++

EXES = steiner
OBJS = ${EXES:=.o}

all: ${EXES}

steiner:
	${CXX} ${LDFLAGS} -std=c++11 -Wall -g -o $@ steinerTree.cpp GrafoP.h io.h prim.h

clean:
	${RM} ${EXES} ${OBJS} core *~
