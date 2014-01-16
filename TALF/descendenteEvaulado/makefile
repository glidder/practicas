CC = g++
OBJS = lex.yy.o parser.o
CABS = lexico.h nodo.h

calc: $(OBJS)
	g++ -o calc $(OBJS) -lfl

lex.yy.c: lexico.l
	flex lexico.l

lex.yy.o: $(CABS)

parser.o: $(CABS)

clean:
	rm -f lex.yy.c *~ *.o
