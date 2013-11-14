%{

#include <iostream>
#include <string>

using namespace std;

#include "parser.tab.h"
%}

%%

[ \n\t]+            ;

[a-zA-Z]+           {yylval.nombre = new string (yytext); return ID;}

[0-9]+              {yylval.valor = atoi(yytext); return NUM;}

[+*-/();]              return *yytext;

.                   {cerr << "Error léxico, caracter (" << yytext
                           << ") desconocido\n";}
