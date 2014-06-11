CC = g++ -std=c++11

OBJS = lex.yy.o parser.tab.o nodo.o
CABS = parser.tab.h nodo.h

tabla: $(OBJS) $(CABS)
	$(CC) -o tabla $(OBJS) -lfl

nodo.o:	nodo.c $(CABS)
	$(CC) -c nodo.c

lex.yy.o: lex.yy.c $(CABS)
	$(CC) -c lex.yy.c

parser.tab.o: parser.tab.c $(CABS)
	$(CC) -c parser.tab.c

lex.yy.c: lexico.l
	flex lexico.l

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

clean:
	rm -f *.o *~ lex.yy.c parser.tab.c parser.tab.h tabla

