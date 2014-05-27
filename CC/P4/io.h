#ifndef _IO_H_
#define _IO_H_
#include <vector>
#include <limits>
#include <iostream>
#include <fstream>
#include <string>
#include "ALGraph.h"

ALGraph gRead(std::string& file){
	ifstream f;
	f.open(file.c_str());
	if (f.is_open()){
		unsigned nVert, nEdges;
		vertex vert;
		f>>nVert;
		ALGraph g(nVert);
		for(unsigned count=0; count<nVert; ++count){
			f>>nEdges;
			for(unsigned acount=0; acount<nEdges; ++acount){
				f>>vert;
				g.setEdge(count, vert);
			}	
		}
		f.close();
		return g;
	}
}

void SATWrite(std::string& file, std::string& cad){
	ofstream f;
	f.open(file.c_str());
	if(f.is_open()){
		f<<cad;
		f.close();
	}
}
#endif
