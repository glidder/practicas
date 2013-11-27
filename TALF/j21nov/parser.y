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
%token FLECHA
%type <nombre> exp oper basic ID

%start ent

%%

ent: exp ';' ent {cout << "ent -->ent exp; \n";}
|				 {cout << "ent --> épsilon\n";}
;

exp : '*' exp {cout << "exp = * exp\n";}
    | '&' exp {cout << "exp = & exp\n";}
    | oper	  {cout << "exp = oper\n";}
;

oper : oper '.' basic {cout << "oper --> oper . basic\n"; }
     | oper FLECHA basic {cout << "oper --> oper -> basic\n"; }
     | basic {cout << "oper --> basic\n"; }
;

basic : ID {cout << "basic --> ID("<<*$1<<")\n";}
      | '(' exp ')' {cout << "basic --> ( exp )\n";}
      | basic '[' exp ']' {cout << "basic --> basic [ exp ]\n"; }
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
