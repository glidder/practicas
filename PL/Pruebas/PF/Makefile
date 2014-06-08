CC=g++ -std=c++11
OBJETOS=parser.tab.o lex.yy.o

compilador: $(OBJETOS)
	$(CC) -o compilador $(OBJETOS)  -lfl

lex.yy.c:	lexico.l
	flex lexico.l

parser.tab.c parser.tab.h:	parser.y
	bison -d -v parser.y

lex.yy.o parser.tab.o: parser.tab.h

clean:
	rm -f compilador lex.yy.c parser.tab.c parser.tab.h *.o *~

