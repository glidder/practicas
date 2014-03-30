CXX = g++
CXXFLAGS = -std=c++98 -Wall -O3

EXES = palindrome equality
OBJS = ${EXES:=.o}

%: %.o
	${CXX} ${LDFLAGS} -o $@ $^

all: ${EXES}

${OBJS}: ram.h

clean:
	${RM} ${EXES} ${OBJS} core *~
