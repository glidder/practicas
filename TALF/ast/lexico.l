%{
#include <iostream>
#include <string>
#include <cstring>

#include "tipo.h"
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

"int"						return INTEGER;
"float"						return FLOAT;

[a-zA-Z]+                  	{yylval.nombre = new std::string(yytext); return ID;}

[,;]					return *yytext;

.                           std::cout << "Error lexico, caracter (" << yytext << ") desconocido\n";

