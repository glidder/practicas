%{
#include <iostream>
#include <string>
//#include <sstream>
//#include "nodo.h"

using namespace std;
int yyerror(string);
int yylex(void);
extern FILE *yyin;

%}
%error-verbose

%union{
	string* cadena;
}

%token CAD NUM CHAR FLOAT INT
%type <cadena> CAD NUM elem dims tipo

%start inic

%%

//arranque: inicio	{cout<<"AST ->" <<$1->toStr()<<endl;}
inic: tipo elem ';'	{cout<<*$2<<" sizeof("<<*$1<<") bytes"<<endl;}
;

elem: CAD dims		{$$ = new string(*$1+" ocupa "+*$2);}
;

dims: '['NUM']' dims	{$$ = new string(*$2+"*"+*$4);}
	|					{$$ = new string("");}	
;

tipo: CHAR	{$$ = new string("char");}
	| FLOAT	{$$ = new string("float");}
	| INT	{$$ = new string("int");}
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

