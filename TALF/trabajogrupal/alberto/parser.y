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

%token ID INT FLOAT VOID CHAR SI SINO WHILE RETURN CONST MENORIGUAL MAYORIGUAL IGUAL DISTINTO OPAND OPOR ENTERO REAL CADENA
%type <nombre> ID sentencia exp rel sum fact basico tipo

%start entrada

%%

entrada : entrada sentencia		{cout<<"entrada --> entrada sentencia"<<endl;}
		|						{cout<<"entrada --> EPSILON"<<endl;}
;

sentencia : exp ';'								{ cout << "entrada --> funcion entrada" << endl; }
		  | WHILE '(' exp ')' sentencia			{ cout << "entrada --> bloquecondicion entrada" << endl; }
		  | '{' entrada '}'						{ cout << "entrada --> EPSILON" << endl; }
		  | ';'									{}
;

exp : ID '=' exp	{ cout << "blabla" << endl; }
	| rel			{ cout << "blabla" << endl; }
;

rel :  sum	{ cout << "rel --> sum" << endl; }
	|  rel '>' sum	{ cout << "rel < sum" << endl; }
	|  rel '<' sum	{ cout << "rel > sum" << endl; }
	|  rel MENORIGUAL sum	{ cout << "rel <= sum" << endl; }
	|  rel MAYORIGUAL sum	{ cout << "rel >= sum" << endl; }
	|  rel IGUAL sum	{ cout << "rel  == sum" << endl; }
	|  rel DISTINTO sum	{ cout << "rel != sum" << endl; }
	|  rel OPAND sum	{ cout << "rel && sum" << endl; }
	|  rel OPOR sum	{ cout << "rel || sum" << endl; }
;

sum : fact	{ cout << "sum --> fact" << endl;}
	| sum '+' fact	{ cout << "sum + fact" << endl;}
	| sum '-' fact	{ cout << "sum - fact" << endl;}
;

fact : fact '*' basico	{ cout << "fact --> fact * basico" << endl;}
	 | fact '/' basico	{ cout << "fact --> fact / basico" << endl;}
;

basico : tipo	{ cout << "basico --> constante tipo corchetes" << endl;}
	   | '(' exp ')'	{ cout << "basico --> ( definicionVar )" << endl;}
	   | ID	{ cout << "basico --> ID (" << *$1 << ")" << endl; delete $1; }
;

tipo : INT		{ cout << "tipo --> INT" << endl; }
       | FLOAT		{ cout << "tipo --> FLOAT" << endl; }
       | CHAR		{ cout << "tipo --> CHAR" << endl; }
       | VOID		{ cout << "tipo --> VOID" << endl; }
;


%%

int main() {
	cout << "Teclee el programa:\n";
	yyparse();
	cout << "Final del programa\n";
	return EXIT_SUCCESS;
}

int yyerror(const char* msj) {
	cerr << msj << endl;
	return 1;
}

 
