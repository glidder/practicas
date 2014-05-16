//#include "APo.h"
#include "GrafoP.h"
template <typename tCoste>
vertice select(vertices& C, vector<tCoste>& d);
template <typename tCoste>
void update( vector<vertice>& c, vector<tCoste>& d, vertices C, vertice k, const GrafoP<tCoste>& g) ;

template <typename tCoste>
//GrafoP<tCoste> Prim(const GrafoP<tCoste>& G)
vector<vertice> Prim(const GrafoP<tCoste>& g)
{
	vertices C;
	const vertices mandatory = g.getMandatory();
	vector<vertice> c(g.numVert(), g.INFINITO);
	vector<tCoste> d(g.numVert(), g.INFINITO);
	for (auto it=++mandatory.begin();it!=mandatory.end();it++){
		C.insert(*it);
		c[*it]=*mandatory.begin();
		d[*it]=g[*mandatory.begin()][*it];
	}
	/*for(auto jt:C)
		cout<<jt<<" ";
	cout<<"pen"<<endl;
	for(auto jt:c)
		cout<<jt<<" ";
	cout<<"pan"<<endl;
	for(auto jt:d)
		cout<<jt<<" ";
	cout<<"pun"<<endl;*/
	//CAMBIAR POR UN GRAFO?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!
	vector<vertice> S(g.numVert(), g.INFINITO);
	vertice k;
	while (!C.empty()){
		k=select(C,d);
			//cout<<k<<" ";
			//cout<<"pen"<<endl;
		C.erase(k);
		//S[c[k]]=k;
		S[k]=c[k];
		/*for(auto jt:S)
			cout<<jt<<" ";
		cout<<endl;*/
		update(c,d,C,k,g);
	}
	return S;
}

template <typename tCoste>
vertice select(vertices& C, vector<tCoste>& d)
{
	tCoste v=GrafoP<tCoste>::INFINITO;
	vertice k;
	for(auto it:C){
		if (d[it]<=v){
			v=d[it];
			k=it;
		}
	}
	return k;
}

template <typename tCoste>
void update( vector<vertice>& c, vector<tCoste>& d, vertices C, vertice k, const GrafoP<tCoste>& g) {
	for(auto it:C){
		if(g[k][it]<d[it]){
			c[it]=k;
			d[it]=g[k][it];
		}
	}
}
/*// Arista de un grafo ponderado
template <typename tCoste> struct aristaP {
	vertice orig, dest;
	tCoste coste;
	aristaP(vertice v=vertice(), vertice w=vertice(), tCoste c=tCoste()):
	orig(v), dest(w), coste(c) {}
};
// Orden de aristas de un grafo ponderado
template <typename tCoste>
bool operator <(const aristaP<tCoste>& a1, const aristaP<tCoste>& a2){
	return a1.coste < a2.coste;
}
template <typename tCoste>
GrafoP<tCoste> Prim(const GrafoP<tCoste>& G)
// Devuelve un árbol generador de coste mínimo de un grafo no
// dirigido ponderado y conexo G.
{
	const size_t n = G.numVert();
	GrafoP<tCoste> g(n);
	const vertices mandatory=G.getMandatory();
// Árbol generador de coste mínimo.
	vector<bool> U(n, false);
// Conjunto de vértices incluidos en g.
	Apo<aristaP<tCoste> > A(n*(n-1)/2-n+2);
// Aristas adyacentes a g
// ordenadas por costes.
	U[0] = true;
// Introducir en el APO las aristas adyacentes al primer vértice.
	for (vertice v = 1; v < n; v++)
		if (G[0][v] < GrafoP<tCoste>::INFINITO && mandatory.find(v)!=mandatory.end())
			A.insertar(aristaP<tCoste>(0, v, G[0][v]));
	for (int i = 0; i < n-1; i++) {
// Seleccionar n-1 aristas.
// Buscar una arista a de coste mínimo que no forme un ciclo.
		aristaP<tCoste> a;
		do {
			a = A.cima();
			A.suprimir();
		} while (U[a.orig] && U[a.dest]);
// Incluir la arista a en el árbol g y el nuevo vértice en U.
		g[a.orig][a.dest] = g[a.dest][a.orig] = a.coste;
		vertice u = U[a.orig] ? a.dest : a.orig;
		U[u] = true;
// Introducir en el APO las aristas adyacentes al vértice u
// que no formen ciclos.
		for (vertice v = 0; v < n; v++)
			if (!U[v] && G[u][v] < GrafoP<tCoste>::INFINITO && mandatory.find(v)!=mandatory.end())
				A.insertar(aristaP<tCoste>(u, v, G[u][v]));
	}
	return g;
}*/
