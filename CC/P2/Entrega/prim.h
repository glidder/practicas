
#include "GrafoP.h"
template <typename tCoste>
vertice select(vertices& C, vector<tCoste>& d);
template <typename tCoste>
void update( vector<vertice>& c, vector<tCoste>& d, vertices C, vertice k, const GrafoP<tCoste>& g) ;

template <typename tCoste>
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
	vector<vertice> S(g.numVert(), g.INFINITO);
	vertice k;
	while (!C.empty()){
		k=select(C,d);
		C.erase(k);
		S[k]=c[k];
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
