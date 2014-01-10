#include <iostream>
#include "cabecera.h"
using namespace std;

int yylex();
int ta;

void Entrada (void);
void Declaracion (void);
void Expresion (void);
void Expresionp(void);
void Coma (void);
void comap(void);
void Paren (void);
void Basico (void);
void error(void){}

int main() {
	ta=yylex();
	Entrada();
}

void cuadra(int obj){
	if(ta==obj)
		ta=yylex();
	else error();
}

void Entrada (void) {
	if(ta==ID){
		Declaracion();Entrada();}
	else if(ta==0)
			return;
		else	error();
}

void Declaracion (void) {
	if(ta==ID){
		Cuadra(ID);Cuadra(CP);Expresion();Cuadra(';');}
	else error();
}

void Expresion (void) {
	if(ta==INT||ta==CHAR||ta==FLOAT||ta==BOOL||ta=='['||ta=='('){
		Coma();Expresionp();}
	else error();
}

void Expresionp(void) {
	if(ta==FLECHA){
		Cuadra(FLECHA);Expresion();}
	else if(ta==';'||ta==')'||ta==']')
			return;
		else error();
}

void Coma(void) {
	if(ta==INT||ta==CHAR||ta==BOOL||ta==FLOAT||ta=='['||ta=='('){
		Paren();Comap();}
	else erro();
}

void Comap(void) {
	if(ta==FLECHA||ta==';'||ta==')'||ta==']'){
		return;}
	else if(ta==','){
			Cuadra(',');Paren();Comap();}
		else error();
}

void Paren(void) {
	if(ta==INT||ta==CHAR||ta==BOOL||ta==FLOAT){
		Basico();}
	else if(ta=='['){
			Cuadra('[');Expresion();Cuadra(']');}
		else if(ta=='('){
				Cuadra('(');Expresion();Cuadra(')');}
			else error();
}

void Basico(void) {
	if(ta==INT)
		Cuadra(INT);
	else if(ta==CHAR)
		Cuadra(CHAR);
	else if(ta==BOOL)
		Cuadra(BOOL);
	else if(ta==FLOAT)
		Cuadra(FLOAT);
	else error();
}

