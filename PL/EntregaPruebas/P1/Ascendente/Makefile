CC = g++
OBJS = lex.yy.o parser.tab.o

ascendente: $(OBJS)
	$(CC) -o ascendente $(OBJS) -lfl

lex.yy.c: lexico.l
	flex lexico.l

parser.tab.c parser.tab.h: parser.y
	bison -d -v parser.y

lex.yy.o parser.tab.o: parser.tab.h

clean:
	rm -f lex.yy.c parser.tab.c parser.tab.h *~ *.o ascendente
