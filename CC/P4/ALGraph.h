#ifndef _ALGRAPH_H_
#define _ALGRAPH_H_
#include <vector>
#include <limits>
#include <istream>
#include <iostream>
#include <list>

using namespace std;

typedef unsigned vertex;
typedef list<vertex> adList;
typedef vector<adList> vertices;
class ALGraph{
public:
	ALGraph(int n): g(n, adList()), nEdges(0){}
	ALGraph operator =(const ALGraph& g);
 	const adList& operator [](int n) const{return g[n];}
  	adList& operator [](int n){return g[n];} 
  	int size(){return g.size();} 
  	int numEdges(){return nEdges;} 
  	void setEdge(vertex a, vertex b){g[a].push_back(b);++nEdges;} 
private: 
	vertices g; 
	int nEdges; 
};

/*typedef size_t vertice;// un valor entre 0 y Grafo::numVert()-1
typedef set<vertice> vertices;

template <typename tCoste>
class GrafoP {
public:
static const tCoste INFINITO;
GrafoP(size_t n): costes(n, vector<tCoste>(n, INFINITO)),mandatory() {for(vertice i=0; i<n; ++i) optional.insert(i);}
GrafoP(const GrafoP& g);
size_t numVert() const {return costes.size();}
const vector<tCoste>& operator [](vertice v) const {return costes[v];}
vector<tCoste>& operator [](vertice v) {return costes[v];}
vertices getMandatory(){return mandatory;}
const vertices getMandatory()const{return mandatory;}
void setMandatory(vertice v){mandatory.insert(v);optional.erase(v);}
vertices getOptional(){return optional;}
void setOptional(vertice v){optional.insert(v);mandatory.erase(v);}
void delOptional(vertice v){optional.erase(v);}
private:
vector<vector<tCoste> > costes;
vertices mandatory;
vertices optional;
};

template <typename tCoste>
const tCoste GrafoP<tCoste>::INFINITO = std::numeric_limits<tCoste>::max();

template <typename tCoste>
inline GrafoP<tCoste>::GrafoP(const GrafoP& g){
costes = g.costes;
mandatory = g.mandatory;
optional = g.optional;
}*/

#endif
