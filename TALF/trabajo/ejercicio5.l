%{
#include <iostream>
#include <map>
#include <set>
#include <string>
#include <sstream>
#include <cstdio>

using namespace std;

int line=1;
map <string, multiset<int> > tres;
map <string, multiset<int> > tint;
map <string, multiset<int> > tflo;
map <string, multiset<int> > tid;
string aux;
string toString(const int& port) {
    stringstream ss;
    ss << port;
    return ss.str();
}
%}

%option noyywrap

preser int|float|for|char|while|if|else|return
EXP [eE][+-]?[0-9]+
caso1 [0-9]*"."[0-9]+{EXP}?
caso2 [0-9]+"."[0-9]*{EXP}?
flotante ([0-9]+{EXP}|{caso1}|{caso2})[fFlL]?
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
			tres[aux].insert(line);}
{flotante}	{aux=string(yytext);
			tflo[aux].insert(line);}
{centera}	{aux=string(yytext);
			tint[aux].insert(line);}
{ident}		{aux=string(yytext);
			tid[aux].insert(line);}
.	;
%%

extern FILE* yyin;

int main() {
	yylex();
	cout << "-----------------\nPalabra reservada = lineas de aparicion\n"
	     << "----------\n";
	for (map<string,multiset<int> >::iterator i = tres.begin();i != tres.end();i++){
		cout << i->first << "=";
		for(multiset<int>::iterator j = i->second.begin(); j!=i->second.end();j++)
			cout << *j <<" ";
		cout << endl;
	}
	cout << "-----------------\n"
	     << "Constante entera = lineas de aparicion\n"
	     << "----------\n";
	for (map<string,multiset<int> >::iterator i = tint.begin();i != tint.end();i++){
		cout << i->first << "=";
		for(multiset<int>::iterator j = i->second.begin(); j!=i->second.end();j++)
			cout << *j <<" ";
		cout << endl;
	}
	cout << "-----------------\nIdentificador = lineas de aparicion\n"
	     << "----------\n";
	for (map<string,multiset<int> >::iterator i = tid.begin();i != tid.end();i++){
			cout << i->first << "=";
		for(multiset<int>::iterator j = i->second.begin(); j!=i->second.end();j++)
			cout << *j <<" ";
		cout << endl;
	}
	cout << "-----------------\nConstante flotante = lineas de aparicion\n"
	     << "----------\n";
	for (map<string,multiset<int> >::iterator i = tflo.begin();i != tflo.end();i++){
			cout << i->first << "=";
		for(multiset<int>::iterator j = i->second.begin(); j!=i->second.end();j++)
			cout << *j <<" ";
		cout << endl;
	}
	cout << "-----------------\n";
} // fin de main() 
