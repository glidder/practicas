%{
#include <iostream>
#include <cstdio>

using namespace std;

#define NUM 300
#define ID 301
%}

%option noyywrap

entero		[0-9]+

%%

[ \n\t]+	;
\r		;
"//".*		;

{entero}	return NUM;
[a-zA-Z]+	return ID;

.		return *yytext;

%%

int main() {
	int t;
	while ((t=yylex()) != 0)
		cout << "Encontrado token " << t << " ("
		     << yytext << ")\n";
} // fin de main()

