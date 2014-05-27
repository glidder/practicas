//
//Description: A simple program to reduce a vertex coloring problem for an
//			   input graph contained in a formated plain text file 
//			   to a SAT problem in DIMACS' format.
//Author: Luis Jose Quintana Bolaño
//Date: 27-5-2014
//
#include "ALGraph.h"
#include "io.h"
#include <vector>
#include <iostream>
#include <string>
#include <list>

using namespace std;

//Factorial function
int fac(int n){return(n==1||n==0)?1:fac(n-1)*n;}

int main(){
	string file1, file2;
	//Reading the input graph file
	int col;
	cout<<"input file: "<<endl;
	cin>>file1;
	ALGraph g(gRead(file1));
	
	//Asking the user for the necessary information
	cout<<"number of colours: "<<endl;
	cin>>col;
	cout<<"output file: "<<endl;
	cin>>file2;
	ofstream f;
	f.open(file2.c_str());
	
	//If the output file is successfully accessed, the reduction begins
	if(f.is_open()){
		//Producing a simple comment header
		f<<"c generated from the graph "<<file1<<"\nc for the "<<col<<"COL problem\np cnf ";
		//Introducing the number of variables
		f<<g.size()*col<<" ";
		//Introducing the number of clauses, calculating the k-combinations
		f<<g.size()*(1+(fac(col)/(fac(2)*fac(col-2))))+(g.numEdges()/2)*col<<"\n";
		//For every vertex we make sure there's only one colour
		for(int i=0;i<g.size();++i){
			for(int k=1;k<=col;++k)
				f<<(k+i*col)<<" ";
			f<<"0\n";
			for(int k=1;k<=col;++k)
				for(int l=k+1;l<=col;++l)
					f<<"-"<<(k+i*col)<<" -"<<(l+i*col)<<" 0\n";
			//For every edge we make sure both vertex have different colours
			for(auto it:g[i])
				if(it>i)
					for(int k=1;k<=col;++k)
						f<<"-"<<(k+i*col)<<" -"<<(k+it*col)<<" 0\n";
		}		
		f.close();
	}
}

