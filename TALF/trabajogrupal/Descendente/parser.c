#include "parser.h"
#include <iostream>
using namespace std;

int yylex();
int ta;
 
void inicio();
void declaracion();
void corcho();
void lista();
void bloque();
void atributos();
void moar();
void sentencia();
void reglaelse();
void asignacion();
void asignacionPrima();
void reglaor();
void orPrima();
void reglaand();
void andPrima();
void igualdad();
void igualdadPrima();
void relacional();
void relacionalPrima();
void suma();
void sumaPrima();
void producto();
void productoPrima();
void basico();
void ident();
void valores();
void moval();
void tipo();
 
void cuadra(int);
void error();
 
int main() {
    cout << "Comienzo" << endl;
    ta == yylex();
    inicio();
}
 
void inicio() {
	if(ta==INT||ta==CHAR||ta==FLOAT||ta==VOID||ta==CONST){
		cout<<"inicio -> tipo corcho ID declaracion inicio"<<endl;
			tipo();corcho();cuadra(ID);declaracion();inicio();
	}else if(ta==0){
		return;
	}else
		error();
}
 
void declaracion() {
 	if(ta==','||ta==';'){
 		cout<<"declaracion -> lista ';'"<<endl;
 			lista();cuadra(';');
 	}else if(ta=='('){
 		cout<<"declaracion -> '(' atributos ')' bloque"<<endl;
 			cuadra('(');atributos();cuadra(')');bloque();
 	}else 
 		error();
}
 
void corcho() {
	if(ta=='['){
		cout<<"corcho -> '[' asignacion ']' corcho"<<endl;
			cuadra('[');asignacion();cuadra(']');corcho();
 	}else if(ta==ID||ta=='*'||ta=='/'){
 		return;
 	}else
 		error();
}
 
void lista() {
 	if(ta==','){
 		cout<<"lista -> ',' ID lista"<<endl;
 			cuadra(',');cuadra(ID);lista();
 	}else if(ta==';'){
 		return;
 	}else
 		error();
}
 
void bloque() {
 	if(ta=='{'){
 		cout<<"bloque -> '{' sentencia '}'"<<endl;
 			cuadra('{');sentencia();cuadra('}');
 	}else
 		error();
}
 
void atributos() {
 	if(ta==INT||ta==CHAR||ta==FLOAT||ta==VOID||ta==CONST){
 		cout<<"atributos -> tipo corcho ID moar"<<endl;
 			tipo();corcho();cuadra(ID);moar();
 	}else if(ta==')'){
 		return;
 	}else
 		error();
}
 
void moar() {
 	if(ta==','){
 		cout<<"moar -> ',' tipo corcho ID moar"<<endl;
 			cuadra(',');tipo();corcho();cuadra(ID);moar();
 	}else if(ta==')')
 		return;
 	}else
 		error();
}
 
void sentencia() {
 	if(ta==INT||ta==CHAR||ta==FLOAT||ta==VOID||ta==CONST){
 		cout<<"sentencia -> tipo corcho ID declaracion sentencia"<<endl;
 			tipo();corcho();cuadra(ID);declaracion();sentencia();
 	}else if(ta==ID||ta==ENTERO||ta==REAL||ta==CADENA||ta=='('){
 		cout<<"sentencia -> asignacion ';' sentencia">>endl;
 			asignacion();cuadra(';');sentencia();
 	}else if(ta=='{'){
 		cout<<"sentencia -> bloque sentencia"<<endl;
 			bloque();sentencia();
 	}else if(ta==';'){
 		cout<<"sentencia -> ';' sentencia"<<endl;
 			cuadra(';');sentencia();
 	}else if(ta==WHILE){
 		cout<<"sentencia -> WHILE '(' asignacion ')' bloque sentencia"<<endl;
 			cuadra(WHILE);cuadra('(');asignacion();cuadra(')');bloque();sentencia();
 	}else if(ta==IF){
 		cout<<"sentencia -> IF '(' asignacion ')' bloque else sentencia"<<endl;
 			cuadra(IF);cuadra('(');asignacion();cuadra(')');bloque();reglaelse();sentencia();
 	}else if(ta==RETURN){
 		cout<<"sentencia -> RETURN sentencia"<<endl;
 			cuadra(RETURN);sentencia();
 	}else if(ta=='}'){
 		return;
 	}else
 		error();
}
 
void reglaelse() {
 	if(ta==ELSE){
 		cout<<"else -> ELSE bloque"<<endl;
 			cuadra(ELSE);bloque();
 	}else if(ta==INT||ta==CHAR||ta==FLOAT||ta==VOID||ta==CONST||ta==ID||ta==ENTERO||ta==REAL||ta==CADENA||ta=='('||ta=='{'||ta=='}'||ta==';'||ta==WHILE||ta==IF||ta==RETURN){
 		return;
 	}else
 		error();
}
 
void asignacion() {
 	if(ta==ID||ta==ENTERO||ta==REAL||ta==CADENA||ta=='('){
 		cout<<"asignacion -> or asignacionPrima"<<endl;
 		reglaor();asignacionPrima();
 	}else
 		error();
}
 
void asignacionPrima() {
 	if(ta=='='){
 		cout<<"asignacionPrima -> '=' asignacion"<<endl;
 			cuadra('=');asignacion();
 	}else if(ta==','||ta==')'||ta==']'||ta==';'){
 		return;
 	}else
 		error();
}
 
void reglaor() {
 	if(ta==ID||ta==ENTERO||ta==REAL||ta==CADENA||ta=='('){
 		cout<<"or -> and orPrima"<<endl;
 			reglaand();orPrima();
 	}else
 		error();
}
 
void orPrima() {
 	if(ta==OPOR){
 		cout<<"orPrima -> OPOR or"<<endl;
 			cuadra(OPOR);reglaor();
 	}else if(ta==','||ta==')'||ta==']'||ta=='='||ta==';'){
 		return;
 	}else
 		error();
}
 
void reglaand() {
 	if(ta==ID||ta==ENTERO||ta==REAL||ta==CADENA||ta=='(')
 		cout<<"and -> igualdad andPrima"<<endl;
 			igualdad();andPrima();
 	}else
 		error();
}
 
void reglaandPrima() {
 	if(ta==OPAND){
 		cout<<"andPrima -> OPAND and"<<endl;
 			cuadra(OPAND);reglaand();
 	}else if(ta==','||ta==')'||ta==']'||ta=='='||ta==';'||ta==OPOR){
 		return;
 	}else
 		error();
}
 
void igualdad() {
 	if(ta==ID||ta==ENTERO||ta==REAL||ta==CADENA||ta=='('){
 		cout<<"igualdad -> relacional igualdadPrima"<<endl;
 			relacional();igualdadPrima();
 	}else
 		error();
}
 
void igualdadPrima() {
 	if(ta==IGUAL){
 		cout<<"igualdadPrima -> IGUAL igualdad"<<endl;
 			cuadra(IGUAL);igualdad();
 	}else if(ta==DISTINTO){
 		cout<<"igualdadPrima -> DISTINTO igualdad"<<endl;
 			cuadra(DISTINTO);igualdad();
 	}else if(ta==','||ta==')'||ta==']'||ta=='='||ta==';'||ta==OPOR||ta==OPAND){
 		return;
 	}else
 		error();
}
 
void relacional() {
 	if(ta==ID||ta==ENTERO||ta==REAL||ta==CADENA||ta=='('){
 		cout<<"relacional -> suma relacionalPrima"<<endl;
 			suma();relacionalPrima();
 	}else
 		error();
}
 
void relacionalPrima() {
 	if(ta==MENORIGUAL){
 		cout<<"relacionalPrima -> MENORIGUAL relacional"<<endl;
 			cuadra(MENORIGUAL);relacional();
 	}else if(ta==MAYORIGUAL){
 		cout<<"relacionalPrima -> MAYORIGUAL relacional"<<endl;
 			cuadra(MAYORIGUAL);relacional();
 	}else if(ta=='<'){
 		cout<<"relacionalPrima -> '<' relacional"<<endl;
 			cuadra('<');relacional();
 	}else if(ta=='>'){
 		cout<<"relacionalPrima -> '>' relacional"<<endl;
 			cuadra('>');relacional();
 	}else if(ta==','||ta==')'||ta==']'||ta=='='||ta==';'||ta==OPOR||ta==OPAND||ta==IGUAL||ta==DISTINTO){
 		return;
 	}else
 		error();
}
 
void suma() {
 	if(ta==ID||ta==ENTERO||ta==REAL||ta==CADENA||ta=='('){
 		cout<<"suma -> producto sumaPrima"<<endl;
 			producto();sumaPrima();
 	}else
 		error();
}
 
void sumaPrima() {
 	if(ta=='+'){
 		cout<<"sumaPrima -> '+' suma"<<endl;
 			cuadra('+');suma();
 	}else if(ta=='-'){
 		cout<<"sumaPrima -> '-' suma"<<endl;
 			cuadra('-');suma();
 	}else if(ta==','||ta==')'||ta==']'||ta=='='||ta==';'||ta==OPOR||ta==OPAND||ta==IGUAL||ta==DISTINTO||ta==MENORIGUAL||ta==MAYORIGUAL||ta=='<'||ta=='>'){
 		return;
 	}else
 		error();
}
 
void producto() {
 	if(ta==ID||ta==ENTERO||ta==REAL||ta==CADENA||ta=='('){
 		cout<<"producto -> basico productoPrima"<<endl;
 			basico();productoPrima();
 	}else
 		error();
}
 
void productoPrima() {
 	if(ta=='*'){
 		cout<<"productoPrima -> '*' producto"<<endl;
 			cuadra('*');producto();
 	}else if(ta=='/'){
 		cout<<"productoPrima -> '/' producto"<<endl;
 			cuadra('/');producto();
 	}else if(ta==','||ta==')'||ta==']'||ta=='='||ta==';'||ta==OPOR||ta==OPAND||ta==IGUAL||ta==DISTINTO||ta==MENORIGUAL||ta==MAYORIGUAL||ta=='<'||ta=='>'||ta=='+'||ta=='-'){
 		return;
 	}else
 		error();
}
 
void basico() {
 	if(ta==ID){
 		cout<<"basico -> ID ident"<<endl;
 			cuadra(ID);ident();
 	}else if(ta==ENTERO){
 		cout<<"basico -> ENTERO"<<endl;
 			cuadra(ENTERO);
 	}else if(ta==REAL){
 		cout<<"basico -> REAL"<<endl;
 			cuadra(REAL);
 	}else if(ta==CADENA){
 		cout<<"basico -> CADENA"<<endl;
 			cuadra(CADENA);
 	}else if(ta=='('){
 		cout<<"basico -> '(' asignacion ')'"<<endl;
 			cuadra('(');asignacion();cuadra(')');
 	}else
 		error();
}
 
void ident() {
 	if(ta==','||ta=='['||||ta==')'||ta==']'||ta=='='||ta==';'||ta==OPOR||ta==OPAND||ta==IGUAL||ta==DISTINTO||ta==MENORIGUAL||ta==MAYORIGUAL||ta=='<'||ta=='>'||ta=='+'||ta=='-'||ta=='*'||ta=='/'){
 		cout<<"ident -> corcho"<<endl;
 			corcho();
 	}else if(ta=='('){
 		cout<<"ident -> '(' valores ')'"<<endl;
 			cuadra('(');valores();cuadra(')');
 	}else if(
}
 
void valores() {
 	if(ta==ID||ta==ENTERO||ta==REAL||ta==CADENA||ta=='('){
 		cout<<"valores -> asignacion moval"<<endl;
 			asignacion();moval();
 	}else if(ta==')'){
 		return;
 	}else
 		error();
}
 
void moval() {
 	if(ta==','){
 		cout<<"moval -> ',' asignacion moval"<<endl;
 			cuadra(',');asignacion();moval();
 	}else if(ta==')'){
 		return;
 	}else
 		error();
}
 
void tipo() {
 	if(ta==INT){
 		cout<<"tipo -> INT"<<endl;
 			cuadra(INT);
 	}else if(ta==CHAR){
 		cout<<"tipo -> CHAR"<<endl;
 			cuadra(CHAR);
 	}else if(ta==FLOAT){
 		cout<<"tipo -> FLOAT"<<endl;
 			cuadra(FLOAT);
 	}else if(ta==VOID){
 		cout<<"tipo -> VOID"<<endl;
 			cuadra(VOID);
 	}else if(ta==CONST){
 		cout<<"tipo -> CONST tipo"<<endl;
 			cuadra(CONST);tipo();
 	}else
 		error();
}
 
void cuadra(int objetivo) {
    if(ta == objetivo)
        ta = yylex();
    else
        error();
}
 
void error(char* s="") {
    cout << "Error..."<<s<< endl;
}
