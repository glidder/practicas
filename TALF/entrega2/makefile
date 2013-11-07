filtra: lex.yy.o
	g++ -o contarpalabras lex.yy.o -lfl

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

lex.yy.c: ejercicio5.l
	flex ejercicio5.l

clean:
	rm -f -r *.c *~ *.o
