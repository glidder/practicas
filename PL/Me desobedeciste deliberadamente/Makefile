CC = g++
OBJS = lex.yy.o parser.tab.o
CABS = parser.tab.h

all: $(OBJS)
	g++ -o analizador $(OBJS) -lfl

lex.yy.c: lexico.l
	flex lexico.l

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

lex.yy.o: $(CABS)

parser.tab.o: $(CABS)

ejecuta:
	make; ./analizador > samba.s; gcc samba.s; ./samba
clean:
	rm -f lex.yy.c parser.tab.c *~ *.o
