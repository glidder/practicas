#ifndef NODO_H
#define NODO_H

#include <string>
#include <iostream>
#include <sstream>

using namespace std;

/************* clase abstracta *************************/

class Nodo {
 public:
  virtual string toStr(void) = 0;
} ; // fin de la clase abstracta Nodo

/************ clases derivadas *************************/

class Nodoinicio : public Nodo{
	Nodo *n1, *n2;
	public:
		Nodoinicio(Nodo *nod1, Nodo *nod2) :  n1(nod1), n2(nod2){}
		string toStr(void) {return "inicio("+n1->toStr()+", ';', "+n2->toStr()+")";}
};

class Nodoasignacion : public Nodo{
	Nodo *n1, *n2;
	public:
		Nodoasignacion(Nodo *nod1, Nodo *nod2) : n1(nod1), n2(nod2){}
		string toStr(void) {return "asignacion("+n1->toStr()+", ':=', "+n2->toStr()+")";}
};

class Nodoopor : public Nodo{
	Nodo *n1, *n2;
	public:
		Nodoopor(Nodo *nod1, Nodo *nod2) : n1(nod1), n2(nod2){}
		string toStr(void) {return "opor("+n1->toStr()+", '|', "+n2->toStr()+")";}
};

class Nodoconcatenacion : public Nodo{
	Nodo *n1, *n2;
	public:
		Nodoconcatenacion(Nodo *nod1, Nodo *nod2) : n1(nod1), n2(nod2){}
		string toStr(void) {return "concatenacion("+n1->toStr()+", "+n2->toStr()+")";}
};

class Nodoiteracion : public Nodo{
	Nodo *n;
	string * s;
	public:
		Nodoiteracion(Nodo *nod, string *st): n(nod), s(st){}
		string toStr(void) {return "iteracion("+n->toStr()+", '"+*s+"')";}
};

class Nodoitera2 : public Nodo{
	Nodo *n;
	public:
		Nodoitera2(Nodo *nod): n(nod){}
		string toStr(void) {return "iteracion("+n->toStr()+", '*')";}
};

class Nodoparentesis: public Nodo{
	Nodo *n;
	public:
		Nodoparentesis(Nodo *nod): n(nod){}
		string toStr(void) {return "parentesis('(', "+n->toStr()+", ')')";}
};

class Nodomacro: public Nodo{
	Nodo *n;
	public:
		Nodomacro(Nodo *nod): n(nod){}
		string toStr(void) {return "macro('{', "+n->toStr()+", '}')";}
};

class Nodovacio : public Nodo{
	public:
		string toStr(void) {return "epsilon";}
};

class Nodocadena: public Nodo{
	string * n;
	public:
		Nodocadena(string * nod) :  n(nod){}
		string toStr(void) {return "CAD("+*n+")";}
};

class Nodocaracter: public Nodo{
	string * n;
	public:
		Nodocaracter(string * nod) :  n(nod){}
		string toStr(void) {return "CHAR("+*n+")";}
};


#endif


