#ifndef TIPO_H
#define TIPO_H

#include <iostream>
#include <string>
#include <sstream>

using namespace std;

class Tipo {
public:
	virtual std::string toStr() = 0;
};

class TipoEntero : public Tipo {
public:
	 std::string toStr() { return "Entero"; }
};

class TipoFlotante : public Tipo {
public:
	std::string toStr() { return "Flotante"; }
};

class TipoChar : public Tipo {
public:
	std::string toStr() { return "Char"; }
};

class TipoPuntero : public Tipo {
	Tipo * tipo;
public:
	TipoPuntero(Tipo* t) : tipo(t) {}
	std::string toStr() { return "Puntero(" + tipo->toStr() +")"; }
};

class TipoArray : public Tipo {
	int dim;
	Tipo * tipo;
public:
	TipoArray(int d, Tipo * t) : dim(d), tipo(t) {}
	std::string toStr() {
		std::stringstream ss;
		ss << "Array[" << dim << "](" << tipo->toStr() << ")";
		return ss.str();
	}
};

#endif
