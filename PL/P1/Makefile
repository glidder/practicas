CC = g++
OBJS = lex.yy.o parser.tab.o
CABS = cabecera.h parser.tab.h
DOBJS = parser.o lex.yy.o
DCABS = cabecera.h

ascendente: $(OBJS)
	g++ -o ascendente $(OBJS) -lfl

descendente: $(DOBJS)
	g++ -o descendente $(DOBJS)

lex.yy.c: lexico.l
	flex lexico.l

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

lex.yy.o: $(CABS)

parser.tab.o: $(CABS)

parser.o: $(DCABS)

clean:
	rm -f lex.yy.c parser.tab.c *~ *.o
