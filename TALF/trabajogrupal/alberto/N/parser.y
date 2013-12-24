%{
	#include <iostream>
	#include <string>
	
	using namespace std;
	
	int yyerror(const char* msj);
	int yylex(void);
%}

%error-verbose

%union {
	string * nombre;
}

%token ID INT FLOAT VOID CHAR SI SINO WHILE RETURN CONST MENORIGUAL MAYORIGUAL IGUAL DISTINTO OPAND OPOR ENTERO REAL CADENA
%type <nombre> ID

%start entrada

%%

entrada	: entrada sentencia		{ cout << "entrada --> entrada sentencia" << endl; }
		|						{ cout << "entrada --> épsilon" << endl; }
;

sentencia	: exp ';'											{ cout << "sentencia --> exp ;" << endl; }
			| WHILE '(' exp ')' sentencia						{ cout << "sentencia --> WHILE ( exp ) sentencia" << endl; }
			| SI '(' exp ')' sentencia							{ cout << "sentencia --> SI ( exp ) sentencia" << endl; }
			| SINO sentencia									{ cout << "sentencia --> SINO sentencia" << endl; }
			| tipo ID '(' parametrosFuncion ')' '{' entrada '}'	{ cout << "sentencia --> tipo ID () { entrada }" << endl; }
			| '{' entrada '}'									{ cout << "sentencia --> { entrada }" << endl; }
			| ';'												{ cout << "sentencia --> ;" << endl; }
;

exp	: puntero ID '=' exp										{ cout << "exp --> ID = exp" << endl; }
	| rel												{ cout << "exp --> rel" << endl;}
;

parametrosFuncion	: parametrosFuncion ',' tipo puntero ID 	{ cout << "listaVariables --> tipo ID ," << endl; }
					| parametrosFuncion tipo puntero ID			{ cout << "listaVariables --> tipo ID" << endl; }
					|											{}
;

/*parametrosLlamada	: parametrosLlamada ',' punteroAmper ID		{}
					| parametrosLlamada punteroAmper ID			{}
					|											{}
;*/

puntero	: '*' puntero	{};
		|				{};
;

punteroAmper	: '&' punteroAmper		{}
				| '*' punteroAmper		{}
				|				{}
;

rel	: sum	{ cout << "rel --> sum" << endl; }
	| rel '>' sum	{ cout << "rel < sum" << endl; }
	| rel '<' sum	{ cout << "rel > sum" << endl; }
	| rel MENORIGUAL sum	{ cout << "rel <= sum" << endl; }
	| rel MAYORIGUAL sum	{ cout << "rel >= sum" << endl; }
	| rel IGUAL sum	{ cout << "rel  == sum" << endl; }
	| rel DISTINTO sum	{ cout << "rel != sum" << endl; }
	| rel OPAND sum	{ cout << "rel && sum" << endl; }
	| rel OPOR sum	{ cout << "rel || sum" << endl; }
;

sum	: fact	{ cout << "sum --> fact" << endl;}
	| sum '+' fact	{ cout << "sum + fact" << endl;}
	| sum '-' fact	{ cout << "sum - fact" << endl;}
;

fact	: fact '*' basico	{ cout << "fact --> fact * basico" << endl;}
		| fact '/' basico	{ cout << "fact --> fact / basico" << endl;}
;

basico	: tipo	{ cout << "basico --> constante tipo corchetes" << endl;}
		| '(' exp ')'	{ cout << "basico --> ( definicionVar )" << endl;}
		| ID	{ cout << "basico --> ID (" << *$1 << ")" << endl; delete $1; }
		//| ID '[' ENTERO ']'		{}
;

tipo	: INT		{ cout << "tipo --> INT" << endl; }
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

 
