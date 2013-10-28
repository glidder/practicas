filtra: lex.yy.o
	g++ -o tokeniza lex.yy.o -lfl

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

lex.yy.c: ejercicio2.l
	flex ejercicio2.l

clean:
	rm -f -r *.c *~ *.o
