#ifndef NODO_H
#define NODO_H

#include <string>
#include <sstream>
#include <map>
#include <iostream>
#include <list>

using namespace std;

/*class Ambitos
{
public:
	Ambitos() : numero_variables(0), num_funciones(-1), numero_parametros(0) {}
	void addAmbito();
	void removeAmbito();
	void addVariable(string id, bool parametro);
	void addVariable(string id);
	int sizeAmbito();
	void addVariableGlobal(string id);
	int sizeAmbitoGlobal();
	string encontrarVariable(string id, int i);
	void imprimir();
	int sizeFunciones();
	void addFuncion(string nombre, int n);
	int getNumParamFuncion(string nombre);
	int numParamFunc(string nombre);
	void addCadena(string cadena, int numero);
	string getCadenas();
private:
	map<string, string> ambito_global;
	list<map<string, string> > ambitos_encadenados;
	map<string, int> funciones;
	int numero_variables;
	int numero_parametros;
	int num_funciones;
	multimap<string, int> cadenas;

};*/
class Ambitos {
public:
	Ambitos(){map<string,string> mapa; ambitos.push_back(mapa);}
	void abrirAmbito(){map<string,string> mapa; ambitos.push_back(mapa);}
	void cerrarAmbito(){ambitos.pop_back();npar=nvar=0;}
	void declaracion(string id, string tipo);
	string llamada(string id);
	void nuevaCadena(string cadena);
	string devolverCadenas();
	int npar=0,nvar=0,nfun=0;
private:
	list<map<string, string> > ambitos;
	map<string, string> cadenas;
} ;

/************* clase abstracta *************************/

class Nodo {
public:
	virtual string traducir() = 0;
} ; // fin de la clase abstracta Nodo

/************ clases derivadas *************************/

class NodoNulo : public Nodo {
	string s;
public:
	NodoNulo(){}
	NodoNulo(string s):s(s){}
	string traducir()
	{
		return "\n";
	}
} ;

class NodoGlobal : public Nodo {
	Nodo *a, *b;
public:
	NodoGlobal(Nodo *a, Nodo *b):a(a),b(b){}
	string traducir()
	{
		return a->traducir()+b->traducir();
	}
};

class NodoFuncion : public Nodo {
	Nodo *c;
	string id,num;
	int tam;
public:
	NodoFuncion(Nodo *cuerpo, string id, string num, int tam):c(cuerpo),id(id),num(num),tam(tam){}
	string traducir()
	{
		//stringstream out;
		//out<<"\n\t.globl\t"<<id<<"\n\t.type "<<id<<", @function\n\t"<<id<<":\n.LFB"<<num<<":\n\tpushl\t%ebp\n\tmovl\t%esp, %ebp\n\tsubl\t$"<<4*atoi(tam.c_str())<<", %esp"<<c->traducir()<<"\n\tmovl\t%ebp, %esp\n\tpopl\t%ebp\n\tret\n";
		//return out.str();
		if(id=="main"){
			cout<<"PENE"<<endl;
			return "\n\t.text\n\t.global\tmain\n\t.type\tmain, @function\nmain:\n.LFB"+num+":\n\tpushl\t%ebp\n\tmovl\t%esp, %ebp\n\tandl\t$-16, %esp\n\tsubl\t$"+to_string(16+4*tam)+", %esp"+c->traducir();
		}
		else{
			cout<<"TETAS"<<endl;
			return "\n\t.globl\t"+id+"\n\t.type "+id+", @function\n\t"+id+":\n.LFB"+num+":\n\tpushl\t%ebp\n\tmovl\t%esp, %ebp\n\tsubl\t$"+to_string(4*tam)+", %esp"+c->traducir()+"\n\tmovl\t%ebp, %esp\n\tpopl\t%ebp\n\tret\n";
		}
	}
};


/*class NodoPrintf : public Nodo {
	int num;
	Nodo *n;
public:
	NodoPrintf(int num, Nodo *n): num(num), n(n) {}
	string traducir()
	{
		string resultado;
		resultado = n->traducir();
		resultado += "\tpushl\t$.LC";
		resultado += to_string(num);
		resultado += "\n\tcall printf\n";
		return resultado;
	}

} ;

class NodoFuncion : public Nodo
{
	Nodo *n, *m;
	string nombre;
	int num, num_func;
public:
	NodoFuncion(Nodo *m, Nodo *n, string nombre, int num, int num_func): m(m), n(n), nombre(nombre), num(num), num_func(num_func) {}
	string traducir()
	{
		string resultado;

		stringstream s, s2;
   		s << num_func;
   		resultado = m->traducir();
		resultado += "\n\t.globl	";
		resultado += nombre;
		resultado += "\n\t.type ";
		resultado += nombre;
		resultado += ", @function\n\t";
		resultado += nombre;
		resultado += ":\n.LFB";
		resultado += s.str();
		s2 << 4*num;
		resultado += ":\n\tpushl\t%ebp\n\tmovl\t%esp, %ebp\n\tsubl\t$";
		resultado += s2.str();
		resultado += ", %esp";
		resultado += n->traducir();
		resultado += "\n\tmovl\t%ebp, %esp\n";
		resultado += "\tpopl\t%ebp\n";
		//resultado += "\tleave\n";
		resultado += "\tret\n";

		return resultado;
	}
};

class NodoDeclaracionGlobal: public Nodo
{
	string nombre;
	Nodo *n;
public:
	NodoDeclaracionGlobal(Nodo *n, string nombre): nombre(nombre), n(n) {}
	string traducir()
	{
		string resultado;
		resultado = n->traducir();
		resultado += "\n\t.comm ";
		resultado += nombre;
		resultado += ",4,4";
		return resultado;
	}
};*/

/**********************************************************/
/***************************AMBITOS************************/
/**********************************************************/

void Ambitos::declaracion(string id, string tipo){
	if(ambitos.back().find(id) != ambitos.back().end()){
		cerr<<"El nombre de variable ("<<id<<") está siendo usado en este ambito."<<endl;
		exit(0);
	}else{
		if (tipo == "parametro"){
			ambitos.back()[id] = to_string(8+npar++*4)+"(%ebp)";
		}else if (tipo == "global"){
			ambitos.front()[id] = id;
		}else if (tipo == "local"){
			ambitos.back()[id] = to_string(-(4+nvar++*4))+"(%ebp)";
		}else if (tipo == "funcion"){
			ambitos.back()[id] = to_string(nfun++);
		/*}else {
			err<< "Ambito no especificado<<"<<endl;
			exit(0);*/
		}
	}
}
void Ambitos::nuevaCadena(string cadena){
	cadenas["LC"+cadenas.size()]=cadena;
}
string Ambitos::llamada(string id){
	for(auto it=ambitos.rbegin();it!=ambitos.rend();--it){
		auto var=it->find(id);
		if(var!=it->end())
			return var->second;
	}
	cerr<<"El identificador ("<<id<<") no ha sido previamente declarado."<<endl;
	exit(0);
}
string Ambitos::devolverCadenas(){
	string out("\n");
	for(auto it:cadenas)
		out+=it.second+":\n\t.string "+it.first+"\n";
	return out;
}
// void Ambitos::addAmbito()
// {
// 	map<string, string> mapa;
// 	ambitos_encadenados.push_back(mapa);
// }

// void Ambitos::removeAmbito()
// {
// 	ambitos_encadenados.pop_back();
// 	if(ambitos_encadenados.size() == 0)
// 	{
// 		numero_variables = 0;
// 		numero_parametros = 0;
// 	}
// }


// /** Parámetros locales **/
// void Ambitos::addVariable(string id)
// {
// 	int n = numero_variables;
// 	if(ambitos_encadenados.back().find(id) != ambitos_encadenados.back().end())
// 	{
// 		cout << "Variable "	<< id << " previamente declarada." << endl;
// 		exit(0);
// 	}
// 	else
// 	{
// 		int localizacion = -(4 + n*4);
// 		ambitos_encadenados.back()[id] = to_string(localizacion) + "(%ebp)";
// 		++numero_variables;
// 	}
// }

// /** Parámetros de entrada **/
// void Ambitos::addVariable(string id, bool parametro)
// {
// 	if(parametro)
// 	{
// 		int n = numero_parametros;
// 		if(ambitos_encadenados.back().find(id) != ambitos_encadenados.back().end())
// 		{
// 			cout << "Variable "	<< id << " previamente declarada." << endl;
// 			exit(0);
// 		}
// 		else
// 		{
// 			int localizacion = 8 + n*4;
// 			ambitos_encadenados.back()[id] = to_string(localizacion) + "(%ebp)";
// 			++numero_parametros;
// 		}
// 	}
// }

// int Ambitos::sizeAmbito()
// {
// 	return numero_variables;
// }

// void Ambitos::addVariableGlobal(string id)
// {
// 	if(ambito_global.find(id) != ambito_global.end())
// 	{
// 		cout << "Variable "	<< id << " previamente declarada." << endl;
// 		exit(0);
// 	}else
// 	{
// 		ambito_global[id] = id;
// 	}
// }

// int Ambitos::sizeAmbitoGlobal()
// {
// 	return ambito_global.size();
// }

// //	Devuelve cadena vacía si no se ha encontrado.
// string Ambitos::encontrarVariable(string id, int i)
// {

// 	auto it = ambitos_encadenados.rbegin();
// 	auto fin = ambitos_encadenados.rend();
// 	bool encontrado = false;
// 	string valor;

// 	while(!encontrado && it != fin)
// 	{
// 		auto buscar = it->find(id);
// 		auto vacio = it->end();

// 		if(buscar == vacio)
// 		{
// 			++it;
// 		}
// 		else
// 		{
// 			encontrado = true;
// 			valor = buscar->second;
// 		}
// 	}

// 	if(!encontrado)
// 	{

// 		auto buscar = ambito_global.find(id);
// 		auto vacio = ambito_global.end();
// 		if(buscar == vacio)
// 		{
// 			valor = "";
// 		}
// 		else
// 		{
// 			if(i == 1)
// 			{
// 				valor += "$";
// 			}
// 			valor += buscar->second;
// 		}
// 	}
// 	return valor;
// }

// int Ambitos::sizeFunciones()
// {
// 	return num_funciones;
// }

// void Ambitos::addFuncion(string nombre, int id)
// {
// 	if(funciones.find(nombre) == funciones.end())
// 	{
// 		funciones[nombre] = id;
// 		++num_funciones;
// 	}
// 	else
// 	{
// 		cout << "Función " << nombre << " previamente declarada." << endl;
// 		exit(0);
// 	}
// }

// int Ambitos::numParamFunc(string nombre)
// {
// 	return funciones[nombre];
// }

// void Ambitos::addCadena(string cadena, int numero)
// {
// 	//cadenas[cadena] = numero;
// 	cadenas.insert(std::pair<string,int>(cadena,numero));
// }

// string Ambitos::getCadenas()
// {
// 	string resultado;
// 	resultado = "\n";
// 	for(auto it : cadenas)
// 	{
// 		resultado += ".LC";
// 		resultado += to_string(it.second);
// 		resultado += ":\n\t.string ";
// 		resultado += it.first;
// 		resultado += "\n";
// 	}

// 	//cadenas.clear();
// 	return resultado;
// }

// int Ambitos::getNumParamFuncion(string nombre)
// {
// 	return funciones[nombre];
// }
#endif

