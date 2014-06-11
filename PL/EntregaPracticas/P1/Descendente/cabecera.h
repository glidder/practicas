#ifndef _CABECERA_H_
#define _CABECERA_H
#include <string>

#define INT 300
#define CHAR 301
#define FLOAT 302
#define NUM 303
#define CAD 304
typedef union {
  std::string *cadena;
}  YYSTYPE;

extern YYSTYPE yylval;
#endif
