%{#include <iostream>
  using namespace std;
  #include "cabecera.h"
%}

%%
[ \n\t]+ ;
"//".*	 ;
"Int" return INT;
"Char" return CHAR;
"Bool" return BOOL;
"Float" return FLOAT;
[a-zA-Z]+ return ID;
"->" return FLECHA;
"::" return CP;
[,;)(\[\]] return *yytext;
. cerr<<"Error lexico."<<endl;
