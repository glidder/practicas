%{
#include <iostream>
#include <string>
using namespace std;
int yyerror(const char* msj);
int yylex(void);
%}
%error-verbose

%union {
  int valor;
  string * nombre;
}

%token ID
%token NUM
%type <nombre> exp oper basic ID <valor> NUM

%start ent

%%

ent: sent ent	{cout << "ent -->sent ent \n";}
|				{cout << "ent --> épsilon\n";}
;

sent: asig ';'		{cout << "sent --> asig\n";}
    | "while" '(' exp ')' sent	{cout << "sent --> while ( exp ) sent\n";}
    | '{'ent'}'		{cout << "sent --> { ent }\n";}
    | ';'			{cout << "sent --> ;\n";}
;
exp: ID '=' exp {cout << "exp --> ID = exp\n";}
   | rel	  	{cout << "exp --> rel\n";}
;
rel: sum	{cout << "rel --> sum\n";}
   | rel '<' sum {cout << "rel --> rel < sum\n";}
   | rel '>' sum {cout << "rel --> rel < sum\n";}
   | rel '<''=' sum {cout << "rel --> rel <= sum\n";}
   | rel '>''=' sum {cout << "rel --> rel >= sum\n";}
   | rel '=''=' sum {cout << "rel --> rel == sum\n";}
   | rel '!''=' sum {cout << "rel --> rel != sum\n";}
;
basic : ID {cout << "basic --> ID("<<*$1<<")\n";}
      | NUM {cout << "basic --> NUM("<<*$1<<")\n";}
;

%%

int main() {
  cout << "Teclee muchas expresiones terminadas en puntoycoma\n";
  yyparse();
  cout << "Final del programa\n";
  return EXIT_SUCCESS;
} // fin de main()

int yyerror(const char* msj) {
  cerr << msj << endl;
  return 1;
} // fin de yyerror()
