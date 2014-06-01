CC=g++
OBJETOS=parser.tab.o lex.yy.o

calc: $(OBJETOS)
	g++ -o analizador $(OBJETOS)  -lfl

lex.yy.c:	lexico.l
	flex lexico.l

parser.tab.c parser.tab.h:	parser.y
	bison -d -v parser.y

lex.yy.o parser.tab.o: parser.tab.h

clean:
	rm -f lex.yy.c parser.tab.c *.o *~

