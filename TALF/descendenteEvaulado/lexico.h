#ifndef LEXICOH
#define LEXICOH

enum yytokentype {
     VERDADERO = 300,
     FALSO,
     PRINT,
     CONJUNCION,
     DISYUNCION,
     NO,
     ID,
     ASIGN
};


typedef union YYSTYPE {
  std::string *nombre;
} YYSTYPE;

extern YYSTYPE yylval;

#endif
