%{
#include <iostream>
#include <string>
#include <stdio.h>
#include <fstream>
#include "nodo.h"
/*			| IF '(' {ambitos.abrirAmbito();} asignacion ')' sentencia 	{ambitos.cerrarAmbito();} %prec "then" {ambitos.ntag+=1;$$ = new NodoIf($4,$6,ambitos.ntag);}
			| IF '(' {ambitos.abrirAmbito();} asignacion ')' sentencia {ambitos.cerrarAmbito();ambitos.abrirAmbito();} ELSE sentencia {ambitos.cerrarAmbito();ambitos.ntag+=2;$$ = new NodoIf($4,$6,$9,ambitos.ntag);}
			*/
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

%token ID ENTERO CADENA INT RETURN IF WHILE ELSE MENORIGUAL MAYORIGUAL IGUAL DISTINTO OPAND OPOR SCANF PRINTF// CHAR REAL FLOAT CONST VOID SI SINO WHILE RETURN CONST 
%type <nombre> ID CADENA ENTERO
%type <nodo> global declaracion lista bloque sentencias sentencia ifnot glista asignacion or and igualdad relacional suma producto basico entradas entrada entradaScan

%right "then" ELSE

%start inicio 

%%
inicio		: global {ensamblador +=ambitos.devolverCadenas()+$1->traducir();}
;
global		: global declaracion {$$ = new NodoGlobal($1,$2);}
			|	{$$ = new NodoNulo();}
;
declaracion	: INT ID '(' {ambitos.abrirAmbito();} atributos ')' {ambitos.declaracion(*$2, "funcion");} bloque {$$ = new NodoFuncion($8,*$2,to_string(ambitos.nfun-1),ambitos.npar); ambitos.cerrarAmbito();}
			| INT ID {ambitos.declaracion(*$2, "global");} glista ';' {$$ = new NodoDeclaracion($4, *$2);}
;
glista		: glista ',' ID {ambitos.declaracion(*$3, "global"); $$ = new NodoDeclaracion($1, *$3);}
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
			| WHILE '(' {ambitos.abrirAmbito();} asignacion ')' sentencia {ambitos.cerrarAmbito();ambitos.ntag+=2;$$ = new NodoWhile($4,$6,ambitos.ntag);}
			| IF '(' {ambitos.abrirAmbito();} asignacion ')' sentencia ifnot {ambitos.cerrarAmbito();ambitos.ntag+=2;$$ = new NodoIf($4,$6,$7,ambitos.ntag);}
			| RETURN asignacion ';' {$$ = new NodoReturn($2);}
			| PRINTF '(' CADENA entradas ')' ';' {ambitos.nuevaCadena(*$3);$$ = new NodoPrint($4,ambitos.llamada(*$3,"cadena"));}
			| SCANF '(' CADENA entradaScan ')' ';' {ambitos.nuevaCadena(*$3);$$ = new NodoScan($4,ambitos.llamada(*$3,"cadena"));}
			| asignacion ';' {$$ = $1;}
			| ';' {$$ = new NodoNulo();}
;
ifnot		: ELSE sentencia {$$ = $2;}
			| %prec "then" {$$ = new NodoNulo();}
;
entrada 	: asignacion entradas {$$= new NodoParametro($1,$2);}
			| 	{$$ = new NodoNulo();}
;
entradas	: entradas ',' asignacion {$$= new NodoParametro($1,$3);}
			|	{$$ = new NodoNulo();}
;
entradaScan	: entradaScan ',' '&' ID {$$= new NodoScanPar($1,ambitos.llamada(*$4));}
			| 	{$$ = new NodoNulo();}
;
asignacion	: or {$$=$1;}
			| ID '=' asignacion {$$ = new NodoAsignacion($3,ambitos.llamada(*$1));}
;
or 			: and {$$=$1;}
			| or OPOR and {ambitos.ntag+=3;$$ = new NodoOr($1,$3,ambitos.ntag);}
;
and			: igualdad {$$=$1;}
			| and OPAND igualdad {ambitos.ntag+=4;$$ = new NodoAnd($1,$3,ambitos.ntag);}
;
igualdad	: relacional {$$=$1;}
			| igualdad IGUAL relacional {ambitos.ntag+=3;$$ = new NodoRelacional($1,$3,"e",ambitos.ntag);}
			| igualdad DISTINTO relacional {ambitos.ntag+=3;$$ = new NodoRelacional($1,$3,"ne",ambitos.ntag);}
;
relacional	: suma {$$=$1;}
			| relacional MENORIGUAL suma {ambitos.ntag+=3;$$ = new NodoRelacional($1,$3,"le",ambitos.ntag);}
			| relacional MAYORIGUAL suma {ambitos.ntag+=3;$$ = new NodoRelacional($1,$3,"ge",ambitos.ntag);}
			| relacional '<' suma {ambitos.ntag+=3;$$ = new NodoRelacional($1,$3,"l",ambitos.ntag);}
			| relacional '>' suma {ambitos.ntag+=3;$$ = new NodoRelacional($1,$3,"g",ambitos.ntag);}
;
suma		: producto {$$=$1;}
			| suma '+' producto {$$ = new NodoAritmetica($1,$3,0);}
			| suma '-' producto {$$ = new NodoAritmetica($1,$3,1);}
;
producto	: basico {$$=$1;}
			| producto '*' basico {$$ = new NodoAritmetica($1,$3,2);}
			| producto '/' basico {$$ = new NodoAritmetica($1,$3,3);}
;
basico		: ID {$$ = new NodoBasico(ambitos.llamada(*$1));}
			| ID '(' entrada ')' {$$ = new NodoLlamada($3, *$1, ambitos.llamada(*$1));}
			| ENTERO {$$ = new NodoBasico("$"+*$1);}
			| '(' asignacion ')' {$$ = $2;}
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

