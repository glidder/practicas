#include "cabecera.h"
#include <iostream>
using namespace::std;
void def(void);
void tipo(void);
void elm(void);
int yylex(void);
void error(void){}

int ta;
int main() {
	ta=yylex();
	def();
}

void cuadra(int obj){
	if(ta==obj)
		ta=yylex();
	else error();
}

void def(void) {
	if(ta==INT||ta==CHAR||ta==FLOAT)
		{cout<<"def -> tipo elm ;"<<endl;tipo();elm();cuadra(';');}
	else
		error();
}

void tipo(void) {
	if(ta=INT){ cuadra(INT);cout<<"tipo -> INT"<<endl;}
	else if(ta==CHAR) {cuadra(CHAR);cout<<"tipo -> CHAR"<<endl;}
	else if(ta=FLOAT) {cuadra(FLOAT);cout<<"tipo -> FLOAT"<<endl;}
	else error();
}

void elm(void) {
	if (ta=='*') {
		cuadra('*');cout<<"elm -> *elm"<<endl;
		elm();
	} else if (ta==ID)
		{cuadra(ID);cout<<"elm -> ID"<<endl;}
	else
		error();
}
