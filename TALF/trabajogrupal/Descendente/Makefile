CC=g++
OBJS=lex.yy.o parser.o
CABS=parser.h

def: $(OBJS)
	g++ -o def $(OBJS) -lfl

lex.yy.c: lexico.l
	flex lexico.l

lex.yy.o: $(CABS)

parser.o: $(CABS)

.c.o:
	$(CC) -c $<

clean:
	rm -f *.o *~ lex.yy.c

