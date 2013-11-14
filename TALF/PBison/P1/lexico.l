%{
#include <ctype.h>
#include <stdio.h>
#include <iostream>
#include "parser.tab.h"
using namespace std;
%}

%%

[ \t]+		;
\n			return '\n';

[0-9]+"."?[0-9]*	{sscanf(yytext, "%lf", &yylval.valor); return NUM; }
[-+*/^n]	return *yytext;
.			{cerr << "Error léxico, carácter "
				  << *yytext << " no admitido\n";}
