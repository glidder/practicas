DEPURAR=-D DEBUG

estadistica:	lex.yy.o
	g++ -o estadistica lex.yy.o -lfl

.c.o:
	g++ -c $<  $(DEPURAR)

lex.yy.c:	ejercicio3.l
	flex ejercicio3.l


clean:
	rm -f -r *.c *~ *.o
