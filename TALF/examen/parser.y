%{
#include <iostream>
#include <string>
//#include <sstream>
#include "nodo.h"

using namespace std;
int yyerror(string);
int yylex(void);
extern FILE *yyin;

%}
%error-verbose

%union{
	string * cadena;
	Nodo * nodo;
}

%token CAD CHAR ASIG
%type <cadena> CHAR CAD iteracionp
%type <nodo> inicio asignacion opor concatenacion iteracion  basico 

%start arranque

%%

arranque: inicio	{cout<<"AST ->" <<$1->toStr()<<endl;}
inicio	: asignacion ';' inicio {$$= new Nodoinicio($1, $3);}
		|						{$$= new Nodovacio();}	
;

asignacion: CAD ASIG opor		{$$= new Nodoasignacion(new Nodocadena($1), $3);}
;

opor	: opor '|' concatenacion{$$= new Nodoopor($1, $3);}
		| concatenacion			{$$= $1;}	
;

concatenacion: iteracion concatenacion{$$= new Nodoconcatenacion($1, $2);}
			|				{$$= new Nodovacio;}
;

iteracion: basico iteracionp{$$= new Nodoiteracion($1,$2);}
;

iteracionp: '*'				{$$= new string("*");}
		|	'+'				{$$= new string("+");}
		|					{$$= new string("epsilon");}

basico: '(' opor ')'		{$$= new Nodoparentesis($2);}
		|'{' CAD '}'		{$$= new Nodomacro(new Nodocadena($2));}
		| CHAR				{$$= new Nodocaracter($1);}
;

%%

int main() {
  cout << "Teclee las expresiones terminadas en punto y coma\n";
  yyparse();   //Analizador sintactico
  cout << "Final del programa\n";
  return EXIT_SUCCESS;
} // fin de main()

int yyerror(string msj) {
  cerr << msj << endl;
  return 1;
}

