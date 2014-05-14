#include "apo.h"
// Arista de un grafo ponderado
template <typename tCoste> struct aristaP {
	vertice orig, dest;
	tCoste coste;
	aristaP(vertice v=vertice(), vertice w=vertice(), tCo
	ste c=tCoste()):
	orig(v), dest(w), coste(c) {}
};
// Orden de aristas de un grafo ponderado
template <typename tCoste>
bool operator <(const aristaP<tCoste>& a1, const arista P<tCoste>& a2){
	return a1.coste < a2.coste;
}
template <typename tCoste>
GrafoP<tCoste> Prim(const GrafoP<tCoste>& G)
// Devuelve un árbol generador de coste mínimo de un grafo no
// dirigido ponderado y conexo G.
{
	const size_t n = G.numVert();
	GrafoP<tCoste> g(n);
// Árbol generador de coste mínimo.
	vector<bool> U(n, false);
// Conjunto de vértices incluidos en g.
	Apo<aristaP<tCoste> > A(n*(n-1)/2-n+2);
// Aristas adyacentes a g
// ordenadas por costes.
	U[0] = true;
// Introducir en el APO las aristas adyacentes al p
	rimer vértice.
	for (vertice v = 1; v < n; v++)
		if (G[0][v] < GrafoP<tCoste>::INFINITO)
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
			if (!U[v] && G[u][v] < GrafoP<tCoste>::INFINITO)
				A.insertar(aristaP<tCoste>(u, v, G[u][v]));
	}
	return g;
}