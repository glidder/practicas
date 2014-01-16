#ifndef LEXICOH
#define LEXICOH

enum yytokentype {
     INTEGER = 300,
     FLOAT,
     ID
};


typedef union YYSTYPE {
  std::string *nombre;
} YYSTYPE;

extern YYSTYPE yylval;

#endif
