%{
#include <iostream>
#include <string>

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

[ \n\t]+                  ;

"true"|"True"|"TRUE"        return VERDADERO;
"false"|"False"|"FALSE"     return FALSO;
"not"|"Not"|"NOT"           return NO;
"and"|"And"|"AND"           return CONJUNCION;
"or"|"Or"|"OR"              return DISYUNCION;
"print"|"Print"|"PRINT"     return PRINT;

[a-zA-Z]+                  {yylval.nombre = new std::string(yytext);
                            return ID;}

":="                        return ASIGN;

[;()]                       return *yytext;

.                           std::cout << "Error lexico, caracter (" << yytext << ") desconocido\n";
