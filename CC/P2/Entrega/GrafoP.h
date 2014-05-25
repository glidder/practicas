#ifndef _GRAPH_H_
#define _GRAPH_H_
#include <vector>
#include <limits>
#include <istream>
#include <set>
#include <iostream>

using namespace std;

typedef size_t vertice;// un valor entre 0 y Grafo::numVert()-1
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
}

#endif
