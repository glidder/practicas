%{

#include <iostream>
#include <string>

using namespace std;

#include "cabecera.h"
%}

%%

[ \n\t]+            ;

"int"		return INT;
"char"		return CHAR;
"float"		return FLOAT;

[a-zA-Z_][0-9a-zA-Z_]*	{ return ID;}

[*;]              return *yytext;

.                   {cerr << "Error léxico, caracter (" << yytext
                           << ") desconocido\n";}
