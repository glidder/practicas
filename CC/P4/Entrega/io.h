//
//Description: Function that reads and returns a graph from a plain text file
//			   using an adjacency list format.
//Author: Luis Jose Quintana Bolaño
//Date: 27-5-2014
//
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
#endif
