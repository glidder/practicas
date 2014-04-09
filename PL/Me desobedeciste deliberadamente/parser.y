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
	string*	valor;
}

%token NUM
%type <valor> NUM

%start entrada

%%

entrada: {cout << "\t.section\t.rodata\n.cad:\n\t.string:\t\"El resultado es = %d\\n\"\n\t.text\n\t.global main\nmain:\n\tpushl %ebp\n\tmovl %esp, %ebp"<<endl;} s		
;
s: sum ';' {cout << "\tpushl %eax\n\tpushl $.cadena\n\tcall printf\n\taddl $8, %esp"<<endl;} s
|
;

sum: sum {cout<< "\tpushl %eax"<<endl;}'+' mul{cout<<"\tmovl %eax, %ebx\n\tpopl %eax\naddl %ebx, %eax"<<endl;}
|	 sum {cout<< "\tpushl %eax"<<endl;}'-' mul{cout<<"\tmovl %eax, %ebx\n\tpopl %eax\nsubl %ebx, %eax"<<endl;}
|	 mul
;

mul: mul '*' NUM
|	NUM
;


%%

int main() {
  yyparse();   //Analizador sintactico
  return EXIT_SUCCESS;
} // fin de main()

int yyerror(string msj) {
  cerr << msj << endl;
  return 1;
}

