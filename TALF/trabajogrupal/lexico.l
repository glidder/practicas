%{
#include <string>
//#include "cabecera.h"

using namespace std;
#include "parser.tab.h"
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
"/*"	BEGIN(COMENTARIO);
"//".*	;

"int"	return *yytext;
"float" return *yytext;
"char"	return *yytext;
"if"	return *yytext;
"else"	return *yytext;
"while"	return *yytext;
"return"	return *yytext;
"const"	return *yytext;/*
"<="	return MENORIGUAL;
">="	return MAYORIGUAL;
"=="	return IGUAL;
"!="	return DISTINTO;
"&&"	return OPAND;
"||"	return OPOR;*/

[-|&'=;\"+*/><(){},\[\]]	return *yytext;

{CONSTNUM}	return ENTERO;
{CONSTFLOT}	return REAL;
["].*["]	return CADENA;
[a-zA-Z_][0-9a-zA-Z_]* {return ID;}
.	;

}
<COMENTARIO>{
"*/" 	BEGIN(INITIAL);
[^*\n]+	; // eat comment in chunks
"*" 	; // eat the lone star
}

%%
