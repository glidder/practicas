//
//Description: Implementation of a graph with adjacency list.
//Author: Luis Jose Quintana Bolaño
//Date: 27-5-2014
//
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

#endif
