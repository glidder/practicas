
#include "GrafoP.h"
#include "io.h"
#include "prim.h"
#include <vector>
#include <iostream>
#include <string>
#include "cronometro.h"

using namespace std;

template <typename tCoste>
tCoste coste(vector<vertice> c, const GrafoP<tCoste>& g){
	tCoste t=0;
	for(int i=0;i<c.size();++i)
		if(c[i]<g.INFINITO){
			t+=g[i][c[i]];
		}
	return t;
}

template <typename tCoste>
vector<vertice> steiner_r(GrafoP<tCoste> g, vertice v){
	g.setMandatory(v);
	vertices mandatory=g.getMandatory();
	vector<vertice> best = Prim(g);
	vector<vertice> nv;
	tCoste c=coste(best,g);
	tCoste nc;
	vertices opcionales=g.getOptional();
	for (auto it:opcionales){
		if(it>v){
			nv=steiner_r(g, it);
			nc=coste(nv,g);
			if(nc<c){
				c=nc;
				best=nv;
			}
		}
	}
	return best;
}
template <typename tCoste>
vector<vertice> steiner(GrafoP<tCoste> g){
	vector<vertice> best=Prim(g);
	vector<vertice> nv;
	tCoste c=coste(best,g);
	tCoste nc;
	vertices opcionales=g.getOptional();
	for (auto it:opcionales){
		nv=steiner_r(g, it);
		nc=coste(nv,g);
		if(nc<c){
			c=nc;
			best=nv;
		}
	}
	return best;
}
int main(){
	string file;
	cout<<"file: "<<endl;
	cin>>file;
	GrafoP<int> g(gRead<int>(file));

	cronometro timer;
	timer.activate();
	vector<vertice> dd=steiner(g);
	timer.stop();

	cout<<"Vertex  Cost"<<endl<<"------- -----"<<endl;
	for(int i=0;i<dd.size();++i){
		cout<<i<<"-> ";
		if(dd[i]<g.INFINITO)
			cout<<" "<<dd[i]<<": "<<g[i][dd[i]]<<endl;
		else cout<<"NaN --"<<endl;
	}
	cout<<"Total cost: "<<coste(dd,g)<<", computed in: "<<timer.get_time()<<" secs."<<endl;
	
}

