%{
#include <iostream>
#include <string>
#include "parser.tab.h"

using namespace std;

%}

%option noyywrap

CDEC	[1-9][0-9]*
COCT	0[0-7]*
CHEX	0[xX][a-fA-F0-9]+

DIG	[0-9]
EXP	[eE][+-]?{DIG}+
SUF	[fFlL]
	
CASO1	{DIG}+"."{DIG}*{EXP}?{SUF}?
CASO2	{DIG}*"."{DIG}+{EXP}?{SUF}?
CASO3	{DIG}+{EXP}+{SUF}?

CONSTNUM	{CDEC}|{COCT}|{CHEX}
CONSTFLOT	{CASO1}|{CASO2}|{CASO3}

%x	COMENTARIO

%%

<INITIAL>{
[ \n\t\r]	;
"/*"	BEGIN(COMENTARIO);
"//".*	;

"int"	return INT;
"if"	return IF;
"else"	return ELSE;
"while"	return WHILE;
"return"return RETURN;
"<="	return MENORIGUAL;
">="	return MAYORIGUAL;
"=="	return IGUAL;
"!="	return DISTINTO;
"&&"	return OPAND;
"||"	return OPOR;
"scanf"	return SCANF;
"printf"return PRINTF;

[-|&'=;\"+*/><(){},[\]]	return *yytext;

{CONSTNUM}				{yylval.nombre = new string(yytext);return ENTERO;}
["].*["]				{yylval.nombre = new string(yytext);return CADENA;}
[a-zA-Z_][0-9a-zA-Z_]*	{yylval.nombre = new string(yytext);return ID;}

.	cerr << "Error léxico: El caracter (" << yytext << ") no fue reconocido.\n";

}
<COMENTARIO>{
"*/" 	BEGIN(INITIAL);
[^*\n]+	; // eat comment in chunks
"*" 	; // eat the lone star
}

%%