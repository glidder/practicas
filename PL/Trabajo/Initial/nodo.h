#ifndef NODO_H
#define NODO_H

#include <string>
#include <map>
#include <iostream>

using namespace std;

extern map<string, bool> tabla;

/************* clase abstracta *************************/

class Nodo {
 public:
  virtual bool evaluar(void) = 0;
  virtual string toStr(void) = 0;
} ; // fin de la clase abstracta Nodo

/************ clases derivadas *************************/

class NodoTrue : public Nodo {
 public:
  bool evaluar(void) {return true;}
  string toStr(void) {return "True";}
} ; // fin de la clase NodoTrue

class NodoFalse : public Nodo {
 public:
  bool evaluar(void) {return false;}
  string toStr(void) {return "False";}
} ; // fin de la clase NodoFalse

class NodoId : public Nodo {
 private:
  string * nombre;
 public:
 NodoId(string * n) : nombre(n) {}
  bool evaluar(void) {return  tabla[*nombre];}
  string toStr(void) {return "ID(" + *nombre + ")";}
} ; // fin de la clase NodoId

class NodoNo : public Nodo {
 private:
  Nodo* comp;
 public:
 NodoNo(Nodo* c) : comp(c) {}
  bool evaluar(void) {return  ! comp->evaluar();}
  string toStr(void) {return "NO(" + comp->toStr() + ")";}
} ; // fin de la clase NodoNo

class NodoConj : public Nodo {
 private:
  Nodo *izq, *der;
 public:
 NodoConj(Nodo * i, Nodo* d) : izq(i), der(d) {}
  bool evaluar(void) {
    if (izq->evaluar())
      return der->evaluar();
    else
      return false;
  }
  string toStr(void) {return "and(" + izq->toStr() + "," + der->toStr() + ")";}
} ; // fin de la clase NodoConj

class NodoDisy : public Nodo {
 private:
  Nodo *izq, *der;
 public:
 NodoDisy(Nodo * i, Nodo* d) : izq(i), der(d) {}
  bool evaluar(void) {
    if (izq->evaluar())
      return true;
    else
      return der->evaluar();
  }
  string toStr(void) {return "or(" + izq->toStr() + "," + der->toStr() + ")";}
} ; // fin de la clase NodoDisy

class NodoAsign : public Nodo {
 private:
  string * nombre;
  Nodo   * expr;
 public:
 NodoAsign(string * n, Nodo * e) : nombre(n), expr(e) {}
  bool evaluar(void) {
    tabla[*nombre] = expr->evaluar();
    cout << "Almaceno " << tabla[*nombre] << " en tabla[" << *nombre << "]\n";
    return tabla[*nombre];
  }
  string toStr(void) {return "tabla[" + *nombre + "]=" + expr->toStr();}
} ; // fin de la clase NodoAsign

class NodoPrint : public Nodo {
 private:
  Nodo   * expr;
 public:
 NodoPrint(Nodo * e) : expr(e) {}
  bool evaluar(void) {
    bool temporal = expr->evaluar();
    cout << "PRINT = " << temporal << endl;
    return temporal;
  } // fin del método evaluar()
  string toStr(void) {return "print(" + expr->toStr() + ")";}
} ; // fin de la clase NodoAsign

#endif

