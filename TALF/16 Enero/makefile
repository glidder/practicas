CC = g++
OBJS = lex.yy.o parser.tab.o
CABS = nodo.h parser.tab.h

calc: $(OBJS)
	g++ -o calc $(OBJS) -lfl

lex.yy.c: lexico.l
	flex lexico.l

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

lex.yy.o: $(CABS)

parser.tab.o: $(CABS)

clean:
	rm -f lex.yy.c parser.tab.c *~ *.o
