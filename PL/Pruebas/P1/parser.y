%{
#include <iostream>
#include <string>
#include <stdio.h>
#include <fstream>
#include "nodo.h"
//%type <nodo> asignacion or and igualdad relacional suma producto basico entradas entrada

using namespace std;

int yyerror(const char* msj);
int yylex(void);
extern FILE *yyin;

string ensamblador="";
Ambitos ambitos;
%}

%error-verbose

%union {
  class Nodo* nodo;
  std::string * nombre;
}

%token ID ENTERO CADENA INT CHAR RETURN IF WHILE ELSE MENORIGUAL MAYORIGUAL IGUAL DISTINTO OPAND OPOR SCANF PRINTF// REAL FLOAT CONST VOID SI SINO WHILE RETURN CONST 
%type <nombre> ID CADENA ENTERO
%type <nodo> global declaracion lista bloque sentencias sentencia glista 

%right "then" ELSE

%start inicio 

%%
inicio		: global {ensamblador +=ambitos.devolverCadenas()+$1->traducir();}
;
global		: global declaracion {$$ = new NodoGlobal($1,$2);}
			|	{$$ = new NodoNulo();}
;
declaracion	: INT ID '(' {ambitos.abrirAmbito();} atributos ')' {ambitos.declaracion(*$2, "funcion");} bloque {$$ = new NodoFuncion($8,*$2,ambitos.llamada(*$2),ambitos.npar); ambitos.cerrarAmbito();}
			| INT ID {ambitos.declaracion(*$2, "global");} glista ';' {$$=$4;}
;
glista		: glista ',' ID {ambitos.declaracion(*$3, "global");}
			|	{$$ = new NodoNulo();}
;
atributos	: INT ID {ambitos.declaracion(*$2, "parametro");} siguiente
			|
;
siguiente	: siguiente ',' INT ID {ambitos.declaracion(*$4, "parametro");}
			|
;
bloque		: '{' sentencias '}' {$$=$2;}
;
sentencias	: sentencias sentencia {$$=new NodoGlobal($1,$2);}
			|	{$$=new NodoNulo();}
;
lista		: lista ',' ID {ambitos.declaracion(*$3, "local");}
			|	{$$ = new NodoNulo();}
;
sentencia 	: {ambitos.abrirAmbito();} bloque {ambitos.cerrarAmbito(); $$ = $2;}
			| INT ID {ambitos.declaracion(*$2, "local");} lista ';' {$$ = new NodoNulo();}
			| WHILE '(' asignacion ')' sentencia {$$ = new NodoNulo();}
			| IF '(' asignacion ')' sentencia 	%prec "then" {$$ = new NodoNulo();}
			| IF '(' asignacion ')' sentencia ELSE sentencia {$$ = new NodoNulo();}
			| RETURN asignacion ';' {$$ = new NodoNulo();}
			| PRINTF '(' CADENA entradas ')' ';' {$$ = new NodoNulo();}
			| SCANF '(' CADENA entradas ')' ';' {$$ = new NodoNulo();}
			| asignacion ';' {$$ = new NodoNulo();}
			| ';' {$$ = new NodoNulo();}
;
asignacion	: or
			| ID '=' asignacion
;
or 			: and
			| or OPOR and
;
and			: igualdad
			| and OPAND igualdad
;
igualdad	: relacional
			| igualdad IGUAL relacional
			| igualdad DISTINTO relacional
;
relacional	: suma
			| relacional MENORIGUAL suma
			| relacional MAYORIGUAL suma
			| relacional '<' suma
			| relacional '>' suma
;
suma		: producto
			| suma '+' producto
			| suma '-' producto
;
producto	: basico
			| producto '*' basico
			| producto '/' basico
;
basico		: ID 
			| ID '(' entrada ')'
			| ENTERO
			| '(' asignacion ')'
;
entrada 	: asignacion entradas
			| 
;
entradas	: entradas ',' asignacion
			|
;

%%

int main() {
	cout << "Introduzca el programa:\n"; 
	yyparse(); 
	ofstream f("output.s");
	if(f.is_open()){
		f<<ensamblador;
		f.close();
	}
 	cout << "Final del programa\n";

	return EXIT_SUCCESS;
} // fin de main()

int yyerror(const char* msj) {
	cerr << msj << endl;
	return 1;
} // fin de yyerror()

