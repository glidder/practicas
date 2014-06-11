%{
#include <iostream>
#include <string>

using namespace std;
#include "parser.tab.h"

%}

%option noyywrap

%x	COMENTARIO

%%
<INITIAL>{

"/*"	BEGIN(COMENTARIO);
"//".*	;

[ \n\t\r]+	;

"int"		{return INT;}
"float"		{return FLOAT;}
"char"		{return CHAR;}

[a-z]+		{yylval.cadena = new std::string(yytext); return CAD;}

[0-9]+		{yylval.cadena = new std::string(yytext); return NUM;}

[;\[\]]		{return *yytext;}

.			{std::cout << "Error lexico, caracter (" << yytext << ") desconocido\n";}

}
<COMENTARIO>{
"*/" 	BEGIN(INITIAL);
[^*\n]+	; 
"*" 	; 
}

%%

