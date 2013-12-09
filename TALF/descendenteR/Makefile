CC=g++
OBJETOS=cabecera.o lex.yy.o

calc: $(OBJETOS)
	g++ -o analizador $(OBJETOS)  -lfl

lex.yy.c:	lexico.l
	flex lexico.l

parser.tab.c parser.tab.h:	parser.y
	bison -d parser.y

lex.yy.o cabecera.o: cabecera.h

clean:
	rm -f lex.yy.c parser.tab.c *.o *~

