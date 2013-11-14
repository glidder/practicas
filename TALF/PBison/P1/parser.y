/* Reverse polish notation calculator.*/
%{
	#include <iostream>
	#include <cmath>
	using namespace std;
	int yylex (void);
	void yyerror (char const *);
%}

%union{
	double valor;
}
%token NUM
%type<valor> NUM exp

%% /* Grammar rules and actions follow. */
input:
|	input line
;
line:
	'\n'
|	exp '\n' {cout <<"resultado = " << $1 << endl;}
;
exp:
	NUM { $$ = $1;}
| exp exp '+' { $$ = $1 + $2;}
| exp exp '-' { $$ = $1 - $2;}
| exp exp '*' { $$ = $1 * $2;}
| exp exp '/' { $$ = $1 / $2;}
| exp exp '^' { $$ = pow ($1, $2);}
| exp 'n' { $$ = -$1;}
;
%%
int main (void) {
	return yyparse();
}

void yyerror (char const *s){
	cerr << s << endl;
}
