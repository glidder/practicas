
#include "ALGraph.h"
#include "io.h"
#include <vector>
#include <iostream>
#include <string>
#include <list>

using namespace std;

int main(){
	string file1, file2;
	cout<<"input file: "<<endl;
	cin>>file1;
	ALGraph g(gRead(file1));
	
	//string sat("c generado a pertir de "+file+"\np cnf "+g.size().to_string()+" "+(g.numEdges()/2).to_string()+"\n");
	//for(int i=0;i<g.size();i){
	//	sat+=(1+i*3)+" "+(2+i*3)+" "+(3+j*3)+"0\n-"+(1+j*3)+" -"+(2+j*3)+"0\n-"+(1+j*3)+" -"+(3+j*3)+"0\n-"+(2+j*3)+" -"+(3+j*3)+"0\n";
	//	for(auto it:g[i])
	//		if(it>i)
	//			sat+="-"+(1+i*3)+" -"+(1+it*3)+"0\n-"+(2+i*3)+" -"+(2+it*3)+"0\n-"+(3+i*3)+" -"+(3+it*3)+"0\n";			
	//}
	cout<<"output file: "<<endl;
	cin>>file2;
	ofstream f;
	f.open(file2.c_str());
	if(f.is_open()){
		f<<"c generado a pertir de "<<file1<<"\np cnf "<<g.size()*3<<" "<<g.size()*4+(g.numEdges()/2)*3<<"\n";
		for(int i=0;i<g.size();++i){
			f<<(1+i*3)<<" "<<(2+i*3)<<" "<<(3+i*3)<<" 0\n-"<<(1+i*3)<<" -"<<(2+i*3)<<" 0\n-"<<(1+i*3)<<" -"<<(3+i*3)<<" 0\n-"<<(2+i*3)<<" -"<<(3+i*3)<<" 0\n";
			for(auto it:g[i])
				if(it>i)
					f<<"-"<<(1+i*3)<<" -"<<(1+it*3)<<" 0\n-"<<(2+i*3)<<" -"<<(2+it*3)<<" 0\n-"<<(3+i*3)<<" -"<<(3+it*3)<<" 0\n";
		}		
		f.close();
	}
}

