%{

#include <iostream>
#include <string>

using namespace std;

#include "parser.tab.h"
%}

%%

[ \n\t]+				;

[a-zA-Z_][0-9a-zA-Z_]*	{yylval.nombre = new string (yytext); return ID;}


"while"					return *yytext;

[();\[\]{}]				return *yytext;
[<>=!+-*/]				return *yytext;

.						{cerr << "Error léxico, caracter (" << yytext
                           << ") desconocido\n";}
