CXX = g++
CXXFLAGS = -ansi -pedantic -Wall -std=c++11 -g

P1_OBJS = genalg.o
P1_HEAD = 


.PHONY: all clean

all: genalg

debug: $(P1_OBJS)
	$(CXX) -g -o genalg $(LDFLAGS) $^

genalg: $(P1_OBJS)
	$(CXX) -o $@ $(LDFLAGS) $^

$(P1_OBJS) : $(P1_HEAD)

clean:
	$(RM) genalg *.o 
