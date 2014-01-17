#ifndef LEXICOH
#define LEXICOH

#define ID 300
#define ENTERO 301
#define FLOTANTE 302
#define CHAR 303


typedef union YYSTYPE {
  std::string *nombre;
} YYSTYPE;

extern YYSTYPE yylval;

#endif