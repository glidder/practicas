%{
#include <iostream>
#include <string>
#include <cstdio>

using namespace std;

#include "nodo.h"
#include "parser.tab.h"

%}

%%

"//".*            ;
[ \n\t]+          ;

[;,()*\[\]{}]                   return *yytext;

"int"                         return INT;
"char"                        return CHAR;
"struct"                      return STRUCT;

[0-9]+                        {yylval.valor = atoi(yytext); return NUM;}
[a-zA-Z][a-zA-Z0-9]*          {yylval.nombre = new string(yytext); return ID;}

.                             cerr << "Error lexico, caracter (" << yytext << ") deconocido\n";
