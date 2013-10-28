%{
#include <iostream>
#include <map>
#include <string>

#include <cstdio>

using namespace std;

map <string, int> tabla;

%}

%option noyywrap

letra [a-zA-Z]

%%

[ \n\t\r]+	;
{letra}+	{tabla[string(yytext)]++ ;
		 #ifdef DEBUG
			cout << "anotada palabra (" << yytext << ")\n";
		 #endif
		}
		{
		 #ifdef DEBUG
			cout<<"filtrado caracter (" << yytext << ")\n";
		 #endif
		}

%%

extern FILE* yyin;

int main() {
	yylex();
	cout << "-----------------\nEstadísticas del archivo de entrada\n"
	     << "----------\n";
	for (map<string,int>::interator i = tabla.begin();
		i != tabla.end();i++){
			cout << i->first << "=" << i->second << endl;}
	cout << "-----------------\n"
	     << "Fin de las estadísticas del archivo de entrada\n"
	     << "----------\n";
} // fin de main() 
