CC=g++
OBJETOS=parser.tab.o lex.yy.o

microc: $(OBJETOS)
	g++ -o $@ $^ -lfl

lex.yy.c:	lexico.l
	flex lexico.l

parser.tab.c parser.tab.h:	parser.y
	bison -d parser.y

lex.yy.o parser.tab.o: parser.tab.h

clean:
	rm -f microc lex.yy.c parser.tab.c *.o *~