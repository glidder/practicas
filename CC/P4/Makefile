CXX = g++

EXES = NAME
OBJS = ${EXES:=.o}

all: ${EXES}

steiner:
	${CXX} ${LDFLAGS} -std=c++11 -Wall -g -o $@ CODE.cpp

clean:
	${RM} ${EXES} ${OBJS} core *~
