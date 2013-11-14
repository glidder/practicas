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

%token <nombre> ID <valor> NUM
%type <valor> exp term fact

%start ent

%%

ent: ent exp ';' {cout << "ent -->ent exp; \n";
				  cout << "Resultado = " << $2 << endl;}
|				 {cout << "ent --> épsilon\n";}
;

exp : exp '+' term {cout << "exp --> exp + term\n"; $$ = $1 + $3;}
    | term          {cout << "exp --> term\n"; $$ = $1;}
;

exp : exp '-' term {cout << "exp --> exp - term\n"; $$ = $1 - $3;}
    | term          {cout << "exp --> term\n"; $$ = $1;}
;

term : term '*' fact {cout << "term --> term * fact\n"; $$ = $1 * $3;}
     | fact          {cout << "term --> fact\n"; $$ = $1;}
;

term : term '/' fact {cout << "term --> term / fact\n"; $$ = $1 / $3;}
     | fact          {cout << "term --> fact\n"; $$ = $1;}
;

fact : ID          {cout << "fact --> ID (" << *$1 << ")\n"; $$ = 0; delete $1;}
     | NUM         {cout << "fact --> NUM (" << $1 << ")\n"; $$ = $1;}
     | '(' exp ')' {cout << "fact --> ( exp )\n"; $$ = $2;}
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
