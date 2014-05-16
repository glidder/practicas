
#include "GrafoP.h"
#include "io.h"
#include "prim.h"
#include <vector>
#include <iostream>
#include <string>

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
vector<vertice> steiner_r(GrafoP<tCoste>& g, vertice v){
	g.setMandatory(v);
	vector<vertice> best = Prim(g);
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
template <typename tCoste>
vector<vertice> steiner(GrafoP<tCoste>& g){
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
	/*vertices optional=g.getOptional();
	for (auto it:optional)
		cout<<it<<" ";*/
	//GrafoP<int> h(Prim<int>(g));
	/*vertices mandatory=g.getMandatory();
	for(auto jt:mandatory)
		cout<<jt<<" ";
		cout<<"mana"<<endl;*/
	//vector<vertice> o=Prim<int>(g);
	vector<vertice> dd=steiner(g);
	//cout<<"Coste: "<<coste(dd,g)<<endl;
	//vertices mandatory=g.getMandatory();
	cout<<"Vertice Coste"<<endl<<"------- -----"<<endl;
	for(int i=0;i<dd.size();++i){
		cout<<i<<"-> ";
		if(dd[i]<g.INFINITO)
			cout<<" "<<dd[i]<<": "<<g[i][dd[i]]<<endl;
		else cout<<"NaN --"<<endl;
	}
	cout<<"Coste Total: "<<coste(dd,g)<<endl;
	/*cout<<endl;
	for(int i=0;i<dd.size();++i)
		cout<<c[
	for(int i=0;i<dd.size();++i)
		if(c[i]<g.INFINITO){
			t+=g[i][c[i]];
		}*/
	/*for(int i=0; i<g.numVert();++i){
		cout<<i<<":: ";
		for(int j=0; j<g.numVert();++j)
			if(mandatory.find(i)!=mandatory.end()&&mandatory.find(j)!=mandatory.end())
				cout<<g[i][j]<<" ";
			else
				cout<<g.INFINITO<<" ";
		cout<<endl;
	}*/
	/*for (int i=0;i<o.size();++i){
		cout<<o[i]<<" ";
	}
	cout<<endl;
	cout<<coste<int>(o,g);*/
	
	
}

