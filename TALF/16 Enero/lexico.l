%{
#include <iostream>
#include <string>

#include "nodo.h"
#include "lexico.h"

#ifdef YY_INPUT
#undef YY_INPUT
#endif
#define YY_INPUT(buf,result,max_size) \
   if (fgets(buf,max_size,yyin) != NULL) { \
      result = strlen(buf); \
      printf("## %s",buf);} \
   else if (! ferror(yyin)) \
      result = YY_NULL; \
   else \
      YY_FATAL_ERROR("fgets() in flex scanner failed");



%}

%option noyywrap

%%

[ \n\t\r]+                  ;

"int"|"Int"|"INT"        return ENTERO;
"float"|"Float"|"FLOAT"     return FLOTANTE;
"char"|"Char"|"CHAR"	return CHAR;

[a-zA-Z]+                  {yylval.nombre = new std::string(yytext);
                            return ID;}

[*;,]                       return *yytext;

.                           std::cout << "Error lexico, caracter (" << yytext << ") desconocido\n";

