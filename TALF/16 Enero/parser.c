#include <iostream>
#include <string>
#include <map>
#include <cstdlib>

using namespace std;

#include "lexico.h"
#include "nodo.h"

// ************* variables globales **************
YYSTYPE yylval;
int ta;

typedef std::map<std::string, Nodo *> tt;
 tt tabla;

// ************** prototipos *******************

int yylex(void);
extern char* yytext;

int error(const char*);
void cuadra(int t);

void entrada(void);
void definicion(void);
Nodo* tipo(void);
void lista(Nodo*);
void listaPrima(Nodo*);

// *********** funciones traductor descendente recursivo **************

void entrada(void){
	if(ta == ENTERO || ta == FLOTANTE){
		definicion();
		entrada();
	}
	else if (ta == 0)    // ojo: sig(entrada) = {$}
    	return; // epsilon
  	else
    	error("error entrada");
}

void definicion(void){
	if(ta == ENTERO || ta == FLOTANTE){
		Nodo *l = tipo();
		lista(l);
		cuadra(';');
	}else{
		error("error definicion");
	}
}

Nodo* tipo(void){
	if(ta == ENTERO){
		cuadra(ENTERO);
		return new NodoInt();
	}else{
		if(ta == FLOTANTE){
			cuadra(FLOTANTE);
			return new NodoFloat();
		}else{
			error("error tipo");
		}
	}
}

void lista(Nodo *n){
	if(ta == ID){
		string idlexval = *yylval.nombre;
		cuadra(ID);
		tabla[idlexval] = n;
		listaPrima(n);
	}else{
		error("error lista");
	}
}

void listaPrima(Nodo *n){
	if(ta == ','){
		string idlexval = *yylval.nombre;
		cuadra(',');
		cuadra(ID);
		tabla[idlexval] = n;
		listaPrima(n);
	}else{
		if( ta == ';'){
			return;
		}
		error("error listaPrima");
	}
}

// *************************************

int main() {
  ta = yylex();     // inicializar token adelantado
  cout << "### Comienza el programa\n";
  entrada();
  cout << "### Fin del programa\n";
  for(tt::iterator i = tabla.begin(); i != tabla.end(); ++i){
      cout << "Nombre: " << i->first << " Tipo " << i->second->toStr() << endl;
  }
} // fin de main()

int error(const char* msg) {
  cerr << msg << endl;
  cerr << "token actual = " << ta << " (" << yytext << ")\n";
  exit(EXIT_FAILURE);
} // fin de yyerror()

void cuadra(int t) {
  if (ta == t) {
      #ifdef DEBUG
        cout << "### cuadro token ta = " << ta << " (" << yytext << ") ";
      #endif
    ta = yylex();
      #ifdef DEBUG
        cout << " => nuevo token ta = " << ta << " (" << yytext << ")\n";
      #endif
  }
  else {
    cerr << "Error al cuadrar: esperaba ta = " << ta
	 << " pero hay t = " << t << " (" << yytext << ")\n";
    error("en cuadra");
  }
} // fin de cuadra()