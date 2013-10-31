DEPURAR=-D DEBUG

estadistica:	lex.yy.o
	g++ -o estadistica lex.yy.o -lfl
letras:	let.yy.o
	g++ -o letras let.yy.o -lfl

.c.o:
	g++ -c $<  $(DEPURAR)

lex.yy.c:	ejercicio3.l
	flex ejercicio3.l

let.yy.c: cuentaletras.l
	flex -o let.yy.c cuentaletras.l


clean:
	rm -f -r *.c *~ *.o
