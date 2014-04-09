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

[ \n\t\r]+	;

[0-9]+		{yylval.valor=new std::string(yytext); return NUM;}

[-+*;]		{return *yytext;}

.			{std::cout << "Error lexico, caracter (" << yytext << ") desconocido\n";}

}

%%

