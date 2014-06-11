%{
#include <iostream>
#include <string>
#include "nodo.h"

using namespace std;

int yylex(void);
int yyerror(const char*);

#define YYERROR_VERBOSE

stack<TablaSimbolos*> pila = stack<TablaSimbolos*>();

%}
%union {
	std::string *nombre;
	int valor;
	Nodo * nodo;
}

%token INT CHAR STRUCT NUM ID
%type <nombre> ID
%type <valor> NUM
%type <nodo> Ini Def Tipo LVar Var Lpnt VFin Tablas

%%

Ini : { pila.push(new TablaSimbolos()); } Ld { pila.top()->escribir(); pila.pop(); }
;
Ld : Ld Def {}
   | {}
;
Def : Tipo { $<nodo>$ = $1; } LVar ';'
;
Tipo : INT  { $$ = new NodoInt(); }
     | CHAR { $$ = new NodoChar(); }
     | STRUCT ID '{' { pila.push(new TablaSimbolos()); }  Ld '}' { $$ = new NodoStruct($2, pila.top()); pila.pop(); }
;
LVar : LVar ',' { $<nodo>$ = $<nodo>0; } Var
     | Var
;
Var : Lpnt { $<nodo>$ = $1; } VFin
;
Lpnt : '*' { $<nodo>$ = new NodoPunt($<nodo>0); } Lpnt { $$ = $3; }
     |     { $$ = $<nodo>0; }
;
VFin : ID { $<nodo>$ = $<nodo>0; } Tablas { pila.top()->apunta_en_tabla($1, $3); }
;
Tablas : '[' NUM ']' { $<nodo>$ = $<nodo>0; } Tablas { $$ = new NodoArray($2, $5);}
       | { $$ = $<nodo>0; }
;

%%

int main() {
	cout << "Comienza el programa" << endl;
	yyparse();
	cout << "Fin del programa" << endl;

}

int yyerror(const char* msg) {
  cerr << msg << endl;
  return 1;
}
