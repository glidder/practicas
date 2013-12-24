%{
#include <iostream>
#include <string>
#include <stdio.h>
using namespace std;
int yyerror(const char* msj);
int yylex(void);
extern FILE *yyin;
%}
%error-verbose

%union {
  int valor;
  string * nombre;
}

%token <nombre> ID <valor> ENTERO REAL CADENA//INT CHAR FLOAT SI SINO WHILE RETURN CONST MENORIGUAL MAYORIGUAL IGUAL DISTINTO OPAND OPOR 

%start inicio 

%%
inicio		: declaracionf inicio	{cout<<"inicio -> declaracionf inicio"<<endl;}
			| definicionv inicio	{cout<<"inicio -> declaracion inicio"<<endl;}
			| definicionf inicio	{cout<<"inicio -> definicionf inicio"<<endl;}
			|						{cout<<"inicio -> EPSILON"<<endl;}
;
definicionf	: tipo lc ID '(' atributos ')' llaves	{cout<<"definicion -> tipo lc ID ( atributos ) llaves"<<endl;}
;
llaves		: '{' bloque '}'	{cout<<"llaves -> { bloque }"<<endl;}
;
bloque		: sentencia bloque	{cout<<"bloque -> sentencia bloque"<<endl;}
			|					{cout<<"bloque -> EPSILON"<<endl;}
;
sentencia	: declaracionf	{cout<<"sentencia -> declaracionf"<<endl;}
			| definicionv	{cout<<"sentencia -> definicion"<<endl;}
			| asignacion ';'	{cout<<"sentencia -> asignacion ;"<<endl;}
			| "while" '(' asignacion ')' sentencia	{cout<<"sentencia -> while ( asignacion ) sentencia"<<endl;}
			| "if" '(' asignacion ')' sentencia	else {cout<<"sentencia -> if ( asignacion ) sentencia else"<<endl;}
			| llamada ';'	{cout<<"sentencia -> llamada ;"<<endl;}
			| llaves	{cout<<"sentencia -> llaves"<<endl;}
			| "return" asignacion ';' {cout<<"sentencia -> return asignacion ;"<<endl;}
			| ';'	{cout<<"sentencia -> ;"<<endl;}
;
else		: 	{cout<<"else -> EPSILON"<<endl;}
			| "else" sentencia	{cout<<"else -> else sentencia"<<endl;}
;
declaracionf: tipo lc ID '(' atributos ')' ';' {cout<<"declaracion -> tipo lc ID"<<endl;}
;
definicionv : tipo lista ';'	{cout<<"definicionv -> tipo lista ;"<<endl;}
;
atributos	: tipo ID lc atributos {cout<<"atributos -> tipo ID lc atributos "<<endl;}
			| ',' tipo ID lc atributos	{cout<<"atributos -> , tipo ID lc atributos"<<endl;}
			|						{cout<<"atributos -> EPSILON "<<endl;}
;
tipo		: "int"		{cout<<"tipo -> int"<<endl;}
			| "const" "int" {cout<<"tipo -> const int"<<endl;}
			| "char"		{cout<<"tipo -> char"<<endl;}
			| "const" "char"{cout<<"tipo -> const char"<<endl;}
			| "float"		{cout<<"tipo -> float"<<endl;}
			| "const" "float"{cout<<"tipo -> const float"<<endl;}
;
lc   		: lc '[' ']'	{cout<<"lc -> lc [ ]"<<endl;}
			|				{cout<<"lc -> EPSILON"<<endl;}
;
lista   	: ID lcn ldefine lcontinua {cout<<"lista -> ID lcn ldefine lcontinua"<<endl;}
;
ldefine		: '=' asignacion {cout<<"ldefine -> = asignacion"<<endl;}
			| 				 {cout<<"ldefine -> EPSILON"<<endl;}
;
lcontinua	: ',' lista	{cout<<"lcontinua -> , lista"<<endl;}
			| 			{cout<<"lcontinua -> EPSILON"<<endl;}
;
asignacion	: ID lcn '=' asignacion	{cout<<"asignacion -> ID lcn = asignacion"<<endl;}
			| or	{cout<<"asignacion -> or"<<endl;}
;
or			: and	{cout<<"or -> and"<<endl;}
			| or '|''|' and {cout<<"or -> or || and"<<endl;}
;
and			: igualdad {cout<<"and -> igualdad"<<endl;}
			| and '&''&' igualdad {cout<<"and -> and && igualdad"<<endl;}
;
igualdad	: relacional {cout<<"igualdad -> relacional"<<endl;}
			| igualdad '=''=' relacional	{cout<<"igualdad -> igualdad == relacional"<<endl;}
			| igualdad '!''=' relacional	{cout<<"igualdad -> igualdad != relacional"<<endl;}
;
relacional	: suma	{cout<<"relacional -> suma"<<endl;}
			| relacional '<''=' suma	{cout<<"relacional -> relacional <= suma"<<endl;}
			| relacional '>''=' suma	{cout<<"relacional -> relacional >= suma"<<endl;}
			| relacional '=''=' suma	{cout<<"relacional -> relacional == suma"<<endl;}
			| relacional '!''=' suma	{cout<<"relacional -> relacional != suma"<<endl;}
			| relacional '<' suma	{cout<<"relacional -> relacional < suma"<<endl;}
			| relacional '>' suma	{cout<<"relacional -> relacional > suma"<<endl;}
;
suma   		: producto	{cout<<"suma -> producto"<<endl;}
			| suma '+' producto	{cout<<"suma -> suma + producto"<<endl;}
			| suma '-' producto {cout<<"suma -> suma - producto"<<endl;}
;
producto	: basico	{cout<<"producto -> basico"<<endl;}
			| producto '*' basico	{cout<<"producto -> producto * basico"<<endl;}
			| producto '/' basico	{cout<<"producto -> producto / basico"<<endl;}
;
basico   	: ID lcn	{cout<<"basico -> ID lcn"<<endl;}
			| ENTERO	{cout<<"basico -> ENTERO"<<endl;}
			| REAL		{cout<<"basico -> REAL"<<endl;}
			| CADENA	{cout<<"basico -> CADENA"<<endl;}
			| llamada	{cout<<"basico -> llamada"<<endl;}
			| '(' asignacion ')' {cout<<"basico -> ( asignacion )"<<endl;}
;
llamada		: ID '(' valores ')'  {cout<<"llamada -> ID ( valores )"<<endl;}
;
lcn   		: lcn '[' asignacion ']' {cout<<"lcn -> lcn [ asignacion ]"<<endl;}
			|						{cout<<"lcn -> EPSILON"<<endl;}
;
valores		: asignacion valores {cout<<"valores -> asignacion valores"<<endl;}
			| ',' asignacion valores	{cout<<"valores -> , asignacion valores"<<endl;}
			| 			{cout<<"valores -> EPSILON"<<endl;}
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

