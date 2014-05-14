#ifndef _GRAPH_H_
#define _GRAPH_H_
#include <vector>
#include <limits>
#include <istream>

using namespace std;

typedef size_t vertex;// un valor entre 0 y Grafo::numVert()-1

template <typename tCost>
class Pgraph {
public:
	static const tCoste INFINITE;
	PGraph(size_t n): costs(n, vector<tCost>(n, INFINITE)) {}
	PGraph(const PGraph& g);
	size_t vertices() const {return costes.size();}
	const vector<tCoste>& operator [](vertex v) const {return costs[v];}
	vector<tCost>& operator [](vertex v) {return costs[v];}
private:
	vector<vector<tCost> > costs;
};

template <typename tCost>
const tCost PGraph<tCoste>::INFINITE = std::numeric_limits<tCost>::max();

template <typename tCost>
inline PGraph<tCost>::PGraph(const PGraph& g){
	costs = g.costs;
}

#endif
