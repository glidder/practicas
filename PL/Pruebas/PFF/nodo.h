#ifndef NODO_H
#define NODO_H

#include <string>
#include <sstream>
#include <map>
#include <iostream>
#include <list>

using namespace std;

class Ambitos {
public:
	Ambitos(){map<string,string> mapa; ambitos.push_back(mapa);}
	void abrirAmbito(){map<string,string> mapa; ambitos.push_back(mapa);}
	void cerrarAmbito(){ambitos.pop_back();npar=nvar=0;}
	void declaracion(string id, string tipo);
	string llamada(string id);
	string llamada(string id, string tipo);
	void nuevaCadena(string cadena);
	string devolverCadenas();
	int npar=0,nvar=0,nfun=0, ntag=0;
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
		if(id=="main")
			return "\n\t.text\n\t.globl\tmain\n\t.type\tmain, @function\nmain:\n.LFB"+num+":\n\tpushl\t%ebp\n\tmovl\t%esp, %ebp\n\tandl\t$-16, %esp\n\tsubl\t$"+to_string(16+4*tam)+", %esp"+c->traducir();
		else
			return "\n\t.globl\t"+id+"\n\t.type\t"+id+", @function\n"+id+":\n.LFB"+num+":\n\tpushl\t%ebp\n\tmovl\t%esp, %ebp\n\tsubl\t$"+to_string(4*tam)+", %esp"+c->traducir()+"\n\tmovl\t%ebp, %esp\n\tpopl\t%ebp\n\tret\n";
	}
};

class NodoDeclaracion : public Nodo {
	Nodo *n;
	string id;
public:
	NodoDeclaracion(Nodo *n, string id):n(n), id(id){}
	string traducir()
	{
		return n->traducir()+"\n\t.comm "+id+",4,4";
	}
};

class NodoWhile : public Nodo{
	Nodo *c, *s;
	int ntag;
public:
	NodoWhile(Nodo * condicion, Nodo * sentencia, int ntag): c(condicion), s(sentencia), ntag(ntag){}
	string traducir()
	{
		string loop=".L"+to_string(ntag-2), end=".L"+to_string(ntag-1);
		return loop+":\n"+c->traducir()+"\n\tcmpl\t$0, %eax\n\tje\t"+end+"\n"+s->traducir()+"jmp\t"+loop+"\n"+end+":\n";
	}
};

class NodoIf : public Nodo{
	Nodo *c, *s, *n;
	int ntag;
public:
	NodoIf(Nodo *condicion, Nodo *sentencia, int ntag): c(condicion),s(sentencia), ntag(ntag){}
	NodoIf(Nodo *condicion, Nodo *sentencia, Nodo *alt, int ntag): c(condicion), s(sentencia), n(alt), ntag(ntag){}
	string traducir()
	{
		string acepta=".L"+to_string(ntag-2), end=".L"+to_string(ntag-1);
		if (n->traducir() != "\n")
			return c->traducir()+"\n\tcmpl\t$0, %eax\n\tjne\t"+acepta+"\n"+n->traducir()+"\n\tjmp\t"+end+"\n"+acepta+":\n"+s->traducir()+end+":\n";
		else
			return c->traducir()+"\n\tcmpl\t$0, %eax\n\tje\t"+end+"\n"+s->traducir()+end+":\n";
	}
};

class NodoReturn : public Nodo{
	Nodo *n;
public:
	NodoReturn(Nodo *n): n(n) {}
	string traducir()
	{
		return n->traducir()+"\n\tmovl\t%ebp, %esp\n\tpopl\t%ebp\n\tret\n";
	}
};

class NodoPrint : public Nodo{
	Nodo *n;
	string tag;
public:
	NodoPrint(Nodo* n, string tag): n(n),tag(tag){}
	string traducir()
	{
		return n->traducir()+"\tpushl\t$"+tag+"\n\tcall\tprintf\n";
	}
};

class NodoScan : public Nodo{
	Nodo *n;
	string tag;
public:
	NodoScan(Nodo* n, string tag): n(n),tag(tag){}
	string traducir()
	{
		return n->traducir()+"\tpushl\t$"+tag+"\n\tcall\t__isoc99_scanf\n";
	}
};

class NodoParametro : public Nodo{
	Nodo *a, *b;
public:
	NodoParametro(Nodo* a, Nodo * b): a(a), b(b){}
	string traducir()
	{
		return a->traducir()+"\tpushl\t%eax\n"+b->traducir();
	}
};

class NodoParametror : public Nodo{
	Nodo *a, *b;
public:
	NodoParametror(Nodo* a, Nodo * b): a(a), b(b){}
	string traducir()
	{
		return a->traducir()+b->traducir()+"\tpushl\t%eax\n";
	}
};

class NodoScanPar : public Nodo{
	Nodo *n;
	string s;
public:
	NodoScanPar(Nodo* n, string s): n(n), s(s) {}
	string traducir()
	{
		string aux="(%ebp)";
		return n->traducir()+"\t"+((s.find(aux)!=string::npos)?"leal":"movl")+"\t"+((s.find(aux)!=string::npos)?"":"$")+s+", %eax\n\tpushl\t%eax\n";
	}
};

class NodoAsignacion : public Nodo{
	Nodo *n;
	string s;
public:
	NodoAsignacion(Nodo *n, string s): n(n), s(s) {}
	string traducir()
	{
		return n->traducir()+"\n\tmovl\t%eax, "+s+"\n";
	}
};

class NodoOr : public Nodo{
	Nodo *a, *b;
	int ntag;
public:
	NodoOr(Nodo *a, Nodo *b, int ntag): a(a), b(b), ntag(ntag){}
	string traducir()
	{
		string acepta=".L"+to_string(ntag-3), no=".L"+to_string(ntag-2), end=".L"+to_string(ntag-1);
		return a->traducir()+"\n\tmovl\t%eax, %ebx\n"+b->traducir()+"\tcmpl\t$0, %eax\njne\t"+acepta+"\n\tcmpl\t$0, %ebx\njne\t"+acepta+"\njmp\t"+no+"\n"+acepta+":\n\tmovl\t$1, %eax\n\tjmp\t"+end+"\n"+no+":\n\tmovl\t$0, %eax\n"+end+":\n";
	}
};

class NodoAnd : public Nodo{
	Nodo *a, *b;
	int ntag;
public:
	NodoAnd(Nodo *a, Nodo *b, int ntag): a(a), b(b), ntag(ntag){}
	string traducir()
	{
		string acepta=".L"+to_string(ntag-4), no=".L"+to_string(ntag-3), may=".L"+to_string(ntag-2), end=".L"+to_string(ntag-1);
		return a->traducir()+"\n\tmovl\t%eax, %ebx\n"+b->traducir()+"\tcmpl\t$0, %eax\njne\t"+may+"\njmp\t"+no+"\n"+may+":\n\tcmpl\t$0, %ebx\njne\t"+acepta+"\njmp\t"+no+"\n"+acepta+":\n\tmovl\t$1, %eax\n\tjmp\t"+end+"\n"+no+":\n\tmovl\t$0, %eax\n"+end+":\n";
	}
};

class NodoRelacional : public Nodo{
	Nodo *a, *b;
	string op;
	int ntag;
public:
	NodoRelacional(Nodo *a, Nodo *b, string op, int ntag): a(a), b(b), op(op), ntag(ntag) {}
	string traducir()
	{
		string yes=".L"+to_string(ntag-3), no=".L"+to_string(ntag-2), end=".L"+to_string(ntag-1);
		return a->traducir()+"\n\tmovl\t%eax, %ebx\n"+b->traducir()+"\tcmpl\t%eax, %ebx\n\tj"+op+"\t"+yes+"\n\tjmp\t"+no+"\n"+yes+":\n\tmovl\t$1, %eax\n\tjmp\t"+end+"\n"+no+":\n\tmovl\t$0, %eax\n"+end+":\n";
	}
};

class NodoAritmetica : public Nodo{
	Nodo *a, *b;
	int op;
public:
	NodoAritmetica(Nodo *a, Nodo *b, int op): a(a), b(b), op(op){}
	string traducir()
	{
		string out;
		out = a->traducir()+"\tpushl\t%eax\n"+b->traducir()+"\tmovl\t%eax, %ebx\n\tpopl\t%eax\n";
		switch (op){
			case 0: //'+'
				out+="\taddl\t%ebx, %eax\n";break;
			case 1: //'-'
				out+="\tsubl\t%ebx, %eax\n";break;
			case 2: //'*'
				out+="\timull\t%ebx, %eax\n";break;
			case 3: //'/'
				out+="\tcdq\n\tidivl\t%ebx, %eax\n";break;
		}
		return out;
	}
};

class NodoBasico : public Nodo{
	string id;
public:
	NodoBasico(string id): id(id){}
	string traducir()
	{
		return "\tmovl\t"+id+", %eax\n";
	}
};

class NodoLlamada : public Nodo{
	Nodo *n;
	string id, npar;
public:
	NodoLlamada(Nodo *n, string id, string npar): n(n), id(id), npar(npar){}
	string traducir()
	{
		return n->traducir()+"\n\tcall "+id+"\n\taddl\t$"+to_string(4*atoi(npar.c_str()))+", %esp\n";
	}
};

/**********************************************************/
/***************************AMBITOS************************/
/**********************************************************/

void Ambitos::declaracion(string id, string tipo){
	if(ambitos.back().find(id) != ambitos.back().end()){
		cerr<<"El nombre de variable ("<<id<<") está siendo usado en este ambito."<<endl;
		exit(0);
	}else{
		if (tipo == "parametro"){
			ambitos.back()[id] = to_string(8+npar*4)+"(%ebp)";++npar;
		}else if (tipo == "local"){
			ambitos.back()[id] = to_string(-(4+nvar*4))+"(%ebp)";++nvar;
		}else if (tipo == "funcion"){
			ambitos.front()[id] = to_string(npar);++nfun;
		}else if (tipo == "global"){
			ambitos.front()[id] = id;
		/*}else {
			err<< "Ambito no especificado<<"<<endl;
			exit(0);*/
		}
	}
}
void Ambitos::nuevaCadena(string cadena){
	if(cadenas.find(cadena)==cadenas.end())
		cadenas[cadena]=".LC"+to_string(cadenas.size());
}
string Ambitos::llamada(string id){
	for(auto it=ambitos.rbegin();it!=ambitos.rend();++it){
		auto var=it->find(id);
		if(var!=it->end())
			return var->second;
	}
	cerr<<"El identificador ("<<id<<") no ha sido previamente declarado."<<endl;
	exit(0);
}
string Ambitos::llamada(string cad, string tipo){
		auto var=cadenas.find(cad);
		if(var!=cadenas.end())
			return var->second;
		else{
			cerr<<"Cadena ("<<cad<<") no encontrada."<<endl;
			exit(0);
		}
}
string Ambitos::devolverCadenas(){
	string out("\n");
	for(auto it:cadenas)
		out+=it.second+":\n\t.string "+it.first+"\n";
	return out;
}
#endif

