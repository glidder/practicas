CC = g++
OBJS = parser.o lex.yy.o

descendente: $(OBJS)
	$(CC) -o descendente $(OBJS) -lfl

lex.yy.c: lexico.l
	flex lexico.l

parser.o lex.yy.o: cabecera.h

clean:
	rm -f lex.yy.c *~ *.o descendente
