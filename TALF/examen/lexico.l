%{
#include <iostream>
#include <string>

using namespace std;
#include "nodo.h"
#include "parser.tab.h"


%}

%option noyywrap

%x	COMENTARIO

%%
<INITIAL>{

"/*"	BEGIN(COMENTARIO);
"//".*	;

[ \n\t\r]+	;

[a-z][a-z]+		{yylval.cadena = new std::string(yytext); return CAD;}

[a-z]			{yylval.cadena = new std::string(yytext); return CHAR;}

":="		{return ASIG;}

[*|+;{}()]	return *yytext;

.			std::cout << "Error lexico, caracter (" << yytext << ") desconocido\n";

}
<COMENTARIO>{
"*/" 	BEGIN(INITIAL);
[^*\n]+	; 
"*" 	; 
}

%%

