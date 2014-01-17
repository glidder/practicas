#ifndef NODO_H
#define NODO_H

#include <string>
#include <map>
#include <iostream>

using namespace std;

class Nodo;

extern map<string, Nodo *> tabla;

/************* clase abstracta *************************/

class Nodo {
 public:
  virtual string toStr(void) = 0;
} ; // fin de la clase abstracta Nodo

/************ clases derivadas *************************/

class NodoInt : public Nodo {
 public:
  string toStr(void) {return "Int";}
} ; // fin de la clase NodoInt

class NodoFloat : public Nodo {
 public:
  string toStr(void) {return "Float";}
} ; // fin de la clase NodoFloat

class NodoChar : public Nodo {
 public:
  string toStr(void) {return "Char";}
} ; // fin de la clase NodoChar

class NodoPuntero : public Nodo {
  Nodo *contenido;
public:
  NodoPuntero(Nodo *c): contenido(c) {}
  string toStr(void) {return "Puntero a " + contenido->toStr();}
};


#endif