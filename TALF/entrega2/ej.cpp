#include <iostream>
#include <map>
#include <string>

#include <cstdio>

using namespace std;

int line=1;
map <string, string> tres;
map <string, string> tint;
map <string, string> tid;
int lol = 15.3;
float pedo = 1e15l;
extern FILE* yyin;

int main() {
	yylex();
	cout << "-----------------\nPalabras reservadas & lineas de aparicion\n"
	     << "----------\n";
	for (map<string,string>::iterator i = tres.begin();i != tres.end();i++){
			cout << i->first << "=" << i->second << endl;}
	cout << "-----------------\n"
	     << "Fin \n"
	     << "----------\n";
} // fin de main() 
/*string toString(const int& port) {
    stringstream ss;
    ss << port;
    return ss.str();
}
{preser}	tres[string(yytext)]+=" "+line ;
{centera}	tint[string(yytext)]+=" "+line ;
{ident}		tid[string(yytext)]+=" "+line ;*/
for int int for while else for
