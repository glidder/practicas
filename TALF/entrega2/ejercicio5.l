%{
#include <iostream>
#include <map>
#include <string>
#include <sstream>
#include <cstdio>

using namespace std;

int line=1;
map <string, string> tres;
map <string, string> tint;
map <string, string> tid;
string aux;
string toString(const int& port) {
    stringstream ss;
    ss << port;
    return ss.str();
}
%}

%option noyywrap

preser int|float|for|char|while|if|else|return
centera 0[Xx][A-Fa-f0-9]+|0[0-7]*|[1-9][0-9]*
ident [a-zA-Z_][0-9a-zA-Z_]*
%x comment
%%
[ \t\r]+	;
"/*"                        BEGIN(comment);
%<comment>[^*\n]*        
%<comment>"*"+[^*/\n]*   
<comment>\n             ++line;
<comment>"*/"        BEGIN(INITIAL);
<comment>.		{}
"\\".
"\n"	++line;
{preser}	{aux=string(yytext);
			tres[aux]= ((tres.find(aux)!=tres.end())?tres[aux]+" ":"")+toString(line) ;}
{centera}	{aux=string(yytext);
			tint[aux]= ((tint.find(aux)!=tint.end())?tint[aux]+" ":"")+toString(line) ;}
{ident}		{aux=string(yytext);
			tid[aux]= ((tid.find(aux)!=tid.end())?tid[aux]+" ":"")+toString(line) ;}
.	;
%%

extern FILE* yyin;

int main() {
	yylex();
	cout << "-----------------\nPalabra reservada = lineas de aparicion\n"
	     << "----------\n";
	for (map<string,string>::iterator i = tres.begin();i != tres.end();i++){
			cout << i->first << "=" << i->second << endl;}
	cout << "-----------------\n"
	     << "Constante entera = lineas de aparicion\n"
	     << "----------\n";
	for (map<string,string>::iterator i = tint.begin();i != tint.end();i++){
			cout << i->first << "=" << i->second << endl;}
	cout << "-----------------\nIdentificador = lineas de aparicion\n"
	     << "----------\n";
	for (map<string,string>::iterator i = tid.begin();i != tid.end();i++){
			cout << i->first << "=" << i->second << endl;}
} // fin de main() 
