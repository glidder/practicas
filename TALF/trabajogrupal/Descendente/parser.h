#ifndef _CABECERA_H_
#define _CABECERA_H_

#include <string>

#define     ID = 300
#define     ENTERO = 301
#define     REAL = 302
#define     CADENA = 303
#define     INT = 304
#define     CHAR = 305
#define     FLOAT = 306
#define     RETURN = 307
#define     CONST = 308
#define     IF = 309
#define     WHILE = 310
#define     VOID = 311
#define     ELSE = 312
#define     MENORIGUAL = 313
#define     MAYORIGUAL = 314
#define     IGUAL = 315
#define     DISTINTO = 316
#define     OPAND = 317
#define     OPOR = 318

typedef union {
  std::string *nombre;
}  YYSTYPE;

extern YYSTYPE yylval;

#endif //_CABECERA_H_
