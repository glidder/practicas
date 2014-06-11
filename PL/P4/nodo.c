#include "nodo.h"
void TablaSimbolos::apunta_en_tabla(string * nombre, class Nodo* pn) {
	if (tabla.find(*nombre) == tabla.end()){
		tabla[*nombre] = pn;
	}else{
		cerr << "ERROR: ID (" << nombre << ") ya definido como ";
		tabla[*nombre]->escribir();
		cout << endl;
    }
}

void TablaSimbolos::escribir(void) {
	cout << "Tabla de simbolos {\n";
	for (auto it = tabla.begin(); it != tabla.end(); ++it) {
		cout << "  " << it->first << " es del tipo ";
		it->second->escribir();
		cout << endl;
    }
	cout << "}\n";
}

