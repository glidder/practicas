%{
#include <iostream>
#include <string>
#include <stdio.h>
#include "nodo.h"
using namespace std;
int yyerror(const char* msj);
int yylex(void);
extern FILE *yyin;
%}
%error-verbose

%union {
  class Nodo* nodo;
  string * nombre;
}

%token ID ENTERO REAL CADENA INT CHAR FLOAT RETURN CONST IF WHILE VOID ELSE MENORIGUAL MAYORIGUAL IGUAL DISTINTO OPAND OPOR//SI SINO WHILE RETURN CONST 
%type <nombre> ID
%start inicio 

%%
inicio		: inicio tipo corcho ID declaracion	{ cout<<"inicio --> inicio tipo corcho ID (" << *$4 << ") declaracion"<<endl;delete $4;}
			|     								{ cout<<"inicio --> EPSILON"<<endl;}
;
declaracion	: '(' atributos ')' bloque    		{cout<<"declaracion --> '(' atributos ')' bloque"<<endl;}
			| lista ';'    						{cout<<"declaracion--> lista ';'"<<endl;}
;
corcho		:'[' asignacion ']' corcho			{ cout<<"corcho --> '[' asignacion ']' corcho"<<endl;}
			|    								{ cout<<"corcho --> EPSILON"<<endl;}
;
lista 		: lista ',' ID 						{ cout<<"lista --> lista ',' ID (" << *$3 << ")"<<endl; delete $3;}
			|    								{ cout<<"lista --> EPSILON"<<endl;}
;
bloque		: '{' sentencia '}' 				{ cout<<"bloque --> '{' sentencia '}'"<<endl;}
;
atributos	: tipo corcho ID moar 				{ cout<<"atributos --> tipo corcho ID (" << *$3 << ") moar"<<endl;delete $3;}
			|    								{ cout<<"atributos --> EPSILON"<<endl;}
;
moar		: moar ',' tipo corcho ID 			{ cout<<"moar --> moar',' tipo corcho ID (" << *$5 << ")"<<endl;delete $5;}
			|    								{ cout<<"moar --> EPSILON"<<endl;}
;
sentencia	: sentencia bloque 					{ cout<<"sentencia --> sentencia bloque"<<endl;}
			| sentencia tipo corcho ID declaracion 	{ cout<<"sentencia --> sentencia tipo corcho ID (" << *$4 << ") declaracion"<<endl;delete $4;}
 			| sentencia WHILE '(' asignacion ')' senti { cout<<"sentencia --> sentencia while '(' asignacion ')' bloque"<<endl;}
			| sentencia IF '(' asignacion ')' senti else  { cout<<"sentencia -->  sentencia if '(' asignacion ')' bloque else"<<endl;}
			| sentencia RETURN asignacion ';'	{ cout<<" sentencia --> sentencia return asignacion "<<endl;}
			| sentencia ';'            			{ cout << "sentencia --> sentencia ';'" << endl; }
			| sentencia asignacion ';' 			{ cout << "sentencia --> sentencia asignacion ';'" << endl;}
			|                					{ cout << "sentencia --> épsilon" << endl; }
;
senti 		: bloque 					{ cout<<"sentencia --> sentencia bloque"<<endl;}
 			| WHILE '(' asignacion ')' senti { cout<<"sentencia --> sentencia while '(' asignacion ')' bloque"<<endl;}
			| IF '(' asignacion ')' senti { cout<<"sentencia -->  sentencia if '(' asignacion ')' bloque else"<<endl;}
			| RETURN  asignacion ';'			{ cout<<" sentencia --> sentencia return asignacion "<<endl;}
			| ';'            			{ cout << "sentencia --> sentencia ';'" << endl; }
			| asignacion ';' 			{ cout << "sentencia --> sentencia asignacion ';'" << endl;}
;
else		: ELSE senti            			{ cout << "else --> else bloque" << endl; }
			|                					{ cout << "else --> épsilon" << endl; }
;
asignacion	: or                				{ cout << "asignacion --> or" << endl; }
			| or '=' asignacion        			{ cout << "asignacion --> or '=' asignacion" << endl; }
;
or			: and                				{ cout << "or --> and" << endl; }
			| or OPOR and            			{ cout << "or --> or '|''|' and" << endl; }
;
and			: igualdad            				{ cout << "and --> igualdad" << endl; }
			| and OPAND igualdad         		{ cout << "and --> and '&''&' igualdad" << endl; }
;
igualdad	: relacional            			{ cout << "igualdad --> relacional" << endl; }
			| igualdad IGUAL relacional    		{ cout << "igualdad --> igualdad '=''=' relacional" << endl; }
			| igualdad DISTINTO relacional    	{ cout << "igualdad --> igualdad '!''=' relacional" << endl; }
;
relacional	: suma               				{ cout << "relacional --> suma" << endl; }
			| relacional MENORIGUAL suma    	{ cout << "relacional --> relacional '<''=' suma" << endl; }
			| relacional MAYORIGUAL suma    	{ cout << "relacional --> relacional '>''=' suma" << endl; }
			| relacional '<' suma         		{ cout << "relacional --> relacional '<' suma" << endl; }
			| relacional '>' suma         		{ cout << "relacional --> relacional '>' suma" << endl; }
;
suma		: producto            				{ cout << "suma --> producto" << endl; }
			| suma '+' producto        			{ cout << "suma --> suma '+' producto" << endl; }
			| suma '-' producto        			{ cout << "suma --> suma '-' producto" << endl; }
;
producto	: basico            				{ cout << "producto --> basico" << endl; }
			| producto '*' basico        		{ cout << "producto --> producto '*' basico" << endl; }
			| producto '/' basico        		{ cout << "producto --> producto '/' basico" << endl; }
;
basico		: corcho ID ident                			{ cout << "basico --> ID (" << *$2 << ") ident" << endl; delete $2;}
        	| ENTERO            				{ cout << "basico -- ENTERO" << endl; }
        	| REAL               				{ cout << "basico --> REAL" << endl; }
       		| CADENA            				{ cout << "basico --> CADENA" << endl; }
       		| '(' asignacion ')'       			{ cout << "basico --> '(' asignacion ')'" << endl; }
;
ident 		: corcho							{ cout << "ident --> corcho" << endl; }
			| '(' valores ')'					{ cout << "ident --> '('valores ')'" << endl; }
;
valores		: asignacion moval					{ cout << "valores --> asignacion moval'" << endl; }
			|									{ cout << "valores --> EPSILON" << endl; }
;
moval		: moval ',' asignacion				{ cout << "moval --> moval ',' asignacion" << endl; }
			|									{ cout << "moval --> EPSILON" << endl; }
;
tipo		: INT        						{ cout<<"tipo --> int"<<endl;}
			| CHAR        						{ cout<<"tipo --> char"<<endl;}
			| FLOAT        						{ cout<<"tipo --> float"<<endl;}
			| VOID        						{ cout << "tipo --> void" << endl; }
			| CONST tipo						{ cout<<"tipo --> const tipo"<< endl;}
;

%%

int main() {
  /*cout << "Introduzca el nombre del archivo:\n";
  char* nombre;
  cin>>nombre;
  cout<<nombre<<endl;
  yyin = fopen(nombre, "r");
  yyparse();
  cout << "Final del programa\n";
  fclose(yyin);*/
  cout << "Teclee el programa:\n"; yyparse(); cout << "Final del programa\n";
  return EXIT_SUCCESS;
} // fin de main()

int yyerror(const char* msj) {
  cerr << msj << endl;
  return 1;
} // fin de yyerror()

