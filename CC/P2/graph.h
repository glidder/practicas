#ifndef _GRAPH_H_
#define _GRAPH_H_
#include <vector>
#include <limits>
#include <istream>

using namespace std;

typedef size_t vertice;// un valor entre 0 y Grafo::numVert()-1

template <typename tCoste>
class GrafoP {
public:
	static const tCoste INFINITO;
	GrafoP(size_t n): costes(n, vector<tCoste>(n, INFINITO)) {}
	GrafoP(const GrafoP& g);
	size_t numVert() const {return costes.size();}
	const vector<tCoste>& operator [](vertice v) const {return costes[v];}
	vector<tCoste>& operator [](vertice v) {return costes[v];}
private:
	vector<vector<tCoste> > costes;
};

template <typename tCoste>
const tCoste GrafoP<tCoste>::INFINITO = std::numeric_limits<tCoste>::max();

template <typename tCoste>
inline GrafoP<tCoste>::GrafoP(const GrafoP& g){
	costes = g.costes;
}

#endif
