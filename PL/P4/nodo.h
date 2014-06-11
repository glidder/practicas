#ifndef NODOH
#define NODOH

#include <string>
#include <iostream>
#include <map>
#include <list>
#include <stack>

using namespace std;


/************** clases TablaSimbolos ***************************/

class TablaSimbolos {
 private:
  map<string, class Nodo*> tabla;
 public:
  void apunta_en_tabla(string * nombre, class Nodo* pn) ;
  void escribir(void) ;
} ; // fin de la clase TablaSimbolos


extern stack<TablaSimbolos*> pila;

/************* clases Nodo y derivados **************************/ 

class Nodo {
 public:
  void virtual escribir(void) = 0;
} ;  // fin de la clase Nodo

class NodoInt : public Nodo {
 public:
  void escribir(void) {cout << "Entero";}
} ; // fin de la clase NodoInt

class NodoChar : public Nodo {
 public:
  void escribir(void) {cout << "Caracter";}
} ; // fin de la clase NodoChar

class NodoPunt : public Nodo {
 private:
  Nodo* componente;
 public:
  NodoPunt(Nodo * c) : componente(c) {}
  void escribir(void) {cout << "Puntero a ("; componente->escribir() ; cout << ")";}
} ; // fin de la clase NodoPunt

class NodoArray : public Nodo {
 private:
  Nodo* componente;
  int dimension;
 public:
  NodoArray(int d, Nodo * c) : dimension(d), componente(c) {}
  void escribir(void) {cout << "Array [" << dimension << "] de  ("; componente->escribir() ; cout << ")";}
} ; // fin de la clase NodoArray

class NodoStruct : public Nodo {
 private:
  string * nombre;
  class TablaSimbolos * tabla;
 public:
  NodoStruct(string * n, class TablaSimbolos * ts) : nombre(n), tabla(ts) {}
  void escribir(void) {
    cout << "Estructura " << *nombre << " con ";
    tabla->escribir();
  } // fin del metodo escribir()
} ; // fin de la clase NodoStruct

#endif

