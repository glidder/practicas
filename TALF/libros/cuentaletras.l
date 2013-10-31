%{
#include <iostream>
#include <string>
#include <map>
using namespace std;
map<string,int> tabla;
%}

letra [a-zA-Z]|"á"|"é"|"í"|"ó"|"ú"|"ü"|"Á"|"É"|"Í"|"Ó"|"Ú"|"ñ"|"Ñ"|"Ü"

%option noyywrap

%%

[ \n\t\r] ;
{letra}{letra} {tabla[string(yytext)]++; unput(yytext[1]);}
. ;

%%

int main() {
cout << "Comienza el programa\n";
yylex();
cout << "Esta es la estadística\n";

for (map<string,int>::iterator i = tabla.begin(); i != tabla.end(); i++)
cout << i->first << " = " << i->second << endl;

cout << "Fin de la estadística\n";
return 0;
} // fin de main()
