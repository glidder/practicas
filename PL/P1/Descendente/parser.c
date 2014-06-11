#include "cabecera.h"
#include <iostream>
#include <string>

using namespace::std;
YYSTYPE yylval;

void inic(void);
string tipo(void);
string elem(void);
string dims(void);
int yylex(void);

void error(string em){cout<<"!!!!!!!"<<em<<"!!!!!!!"<<endl;}

int ta;
int main() {
	cout << "Teclee las expresiones terminadas en punto y coma\n";
  	ta=yylex();
	inic();
  	cout << "Final del programa\n";
 	 return 0;
}

void cuadra(int obj){
	if(ta==obj)
		ta=yylex();
	else error("cuadra");
}

void inic(void){
	if(ta==FLOAT||ta==CHAR||ta==INT){
		string tipon=tipo();
		string elemn=elem();
		cout<<elemn<<" sizeof("<<tipon<<") bytes"<<endl;
		cuadra(';');
		inic();
	}else if (ta != 0)
		error("inic");
}
string elem(void){
	string elemn="";
	if(ta==CAD){
		string cadn=*yylval.cadena+" ocupa ";
		cuadra(CAD);
		elemn=cadn+dims();
	}else
		error("elem");
	return elemn;
}
string dims(void){
	string dimsn="";
	if(ta=='['){
		cuadra('[');
		string numn=*yylval.cadena+"*";
		cuadra(NUM);
		cuadra(']');
		dimsn=numn+dims();
	}else{
		if(ta!=';')
			error("dims");
	}
	return dimsn;
}
string tipo(void){
	string tipon="";
	if(ta==INT){
		tipon="int";
		cuadra(INT);
	}else if(ta==FLOAT){
		tipon="float";
		cuadra(FLOAT);
	}else if(ta==CHAR){
		tipon="char";
		cuadra(CHAR);
	}else
		error("tipo");
	return tipon;
}


