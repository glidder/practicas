%{
#include <iostream>
#include <string>

using namespace std;

#include "parser.tab.h"
%}

CDEC		[1-9][0-9]*
COCT		0[0-7]*
CHEX		0[xX][a-fA-F0-9]+

DIG			[0-9]
EXP			[eE][+-]?{DIG}+
SUF			[fFlL]
	
CASO1		{DIG}+"."{DIG}*{EXP}?{SUF}?
CASO2		{DIG}*"."{DIG}+{EXP}?{SUF}?
CASO3		{DIG}+{EXP}+{SUF}?

CONSTNUM	{CDEC}|{COCT}|{CHEX}
CONSTFLOT	{CASO1}|{CASO2}|{CASO3}

%x	COMENTARIO

%%

<INITIAL>{
[ \n\t]	;
"/*"	BEGIN(COMENTARIO);
"//".*	;

"int"					return INT;
"float" 				return FLOAT;
"char"					return CHAR;
"void"					return VOID;
"if"					return SI;
"else"					return SINO;
"while"					return WHILE;
"return"				return RETURN;
"const"					return CONST;
"<="					return MENORIGUAL;
">="					return MAYORIGUAL;
"=="					return IGUAL;
"!="					return DISTINTO;
"&&"					return OPAND;
"||"					return OPOR;

[-'=;\"+*/><(){},\[\]]	return *yytext;

{CONSTNUM}				return ENTERO;
{CONSTFLOT}				return REAL;
\".*\"					return CADENA;
[a-zA-Z_][0-9a-zA-Z_]* 	{ yylval.nombre = new string(yytext); return ID; }
.						cout << "Error léxico." << endl;

}
<COMENTARIO>{
"*/" 					BEGIN(INITIAL);
[^*\n]+					;
"*" 					;
}
