#ifndef _IO_H_
#define _IO_H_
#include <vector>
#include <limits>
#include <iostream>
#include <fstream>
#include <string>
#include "GrafoP.h"

template <typename tCoste>
GrafoP<tCoste> gRead(std::string& file){
	ifstream f;
	f.open(file.c_str());
	if (f.is_open()){
		size_t nVert;
		unsigned nAristas, nMan, peso;
		vertice vert1, vert2;
		f>>nVert;
		f>>nAristas;
		GrafoP<int> g(nVert);
		for(unsigned cont=0; cont<nAristas;++cont){
			f>>vert1;
			f>>vert2;
			f>>peso;
			g[vert1-1][vert2-1]=peso;
			g[vert2-1][vert1-1]=peso;
		}
		f>>nMan;
		for(unsigned cont=0; cont<nMan;++cont){
			f>>vert1;
			g.setMandatory(vert1-1);
			vertices mandatory=g.getMandatory();
		}
		f.close();
		return g;
	}
}
#endif
