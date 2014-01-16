#include <iostream>
#include <string>
#include <map>
#include <cstdlib>

using namespace std;

#include "lexico.h"
#include "nodo.h"

// ************* variables globales **************

YYSTYPE yylval;
int ta;

map<string, bool> tabla;

// ************** prototipos *******************

int yylex(void);
extern char* yytext;

int error(const char*);
void cuadra(int t);

void entrada(void);
Nodo * sent(void);
Nodo * expr(void);
Nodo * expr_prima(Nodo * expr_prima_h);
Nodo * term(void);
Nodo * term_prima(Nodo * term_prima_h);
Nodo * fact(void);

// *********** funciones traductor descendente recursivo **************

// entrada -> sent {sent.s->generar();} entrada
//         | épsilon

void entrada(void) {
  if (ta == PRINT || ta == ID) {
    Nodo * sent_s = sent();
    cout << "Evaluacion = " << sent_s->evaluar() << endl;
    entrada();
  }
  else if (ta == 0)    // ojo: sig(entrada) = {$}
    return; // epsilon
  else
    error("En entrada");
} // fin de entrada()


// sent -> PRINT expr ';'         {sent.s := new NodoPrint(expr.s);}
//      | ID ":=" expr ';'       {sent.s := new NodoAsign(ID.lexval, expr.s);}

Nodo * sent(void) {
  if (ta == PRINT) {
    cuadra(PRINT);
    Nodo * expr_s = expr();
    cuadra(';');
    return new NodoPrint(expr_s);
  }
  else if (ta == ID) {
    string * id_lexval = yylval.nombre;    // ojo: salvar valor lexico antes de cuadrar
    cuadra(ID);
    cuadra(ASIGN);
    Nodo * expr_s = expr();
    cuadra(';');
    return new NodoAsign(id_lexval, expr_s);
  }
  else
    error("en sent");
} // fin de sent()

// expr -> term {expr'.h := term.s;} expr' {expr.s := expr'.s;}

Nodo * expr(void) {
  if (ta == NO || ta == ID || ta == VERDADERO || ta == FALSO || ta == '(') {
    Nodo * term_s = term();
    Nodo * expr_prima_h = term_s;
    Nodo * expr_prima_s = expr_prima(expr_prima_h);
    return expr_prima_s;
  }
  else
    error("en expr");
} // fin de expr()

// expr' -> OR term {expr'1.h := new NodoDisy(expr'.h, term.s);} expr'1 {expr'.s := expr'1.s;}
//       |  épsilon    {expr'.s := expr'.h;}

Nodo * expr_prima(Nodo * expr_prima_h) {
  if (ta == DISYUNCION) {
    cuadra(DISYUNCION);
    Nodo * term_s = term();
    Nodo * expr_prima_1_h = new NodoDisy(expr_prima_h, term_s);
    return expr_prima(expr_prima_1_h);
  }
  else if (ta == ';' || ta == ')')     // ojo: sig(expr') =  {';', ')'}
    return expr_prima_h;
  else
    error("en expr_prima");
} // fin de expr_prima()

// term -> fact {term'.h := fact.s;} term' {term.s := term'.s;}

Nodo * term(void) {
  if (ta == NO || ta == ID || ta == VERDADERO || ta == FALSO || ta == ')') {
    Nodo * fact_s = fact();
    Nodo * term_prima_h = fact_s;
    Nodo * term_prima_s = term_prima(term_prima_h);
    return term_prima_s;
  }
  else
    error("en term");
} // fin de term()

// term' -> AND fact {term'1.h := new NodoConj(term'.h, fact.s);} term'1 {term'.s := term'1.s;}
//       |  épsilon    {term'.s := term'.h;}

Nodo * term_prima(Nodo * term_prima_h) {
  if (ta == CONJUNCION) {
    cuadra(CONJUNCION);
    Nodo * fact_s = fact();
    Nodo * term_prima_1_h = new NodoConj(term_prima_h, fact_s);
    return term_prima(term_prima_1_h);
  }
  else if (ta == ';' || ta == ')' || ta == DISYUNCION)     // ojo: sig(term') = {';', ')', OR}
    return term_prima_h;
  else
    error("en term_prima");
} // fin de term_prima()

// fact -> NOT fact1             {fact.s = new NodoNo(fact1.s);}
//      | ID                     {fact.s = new NodoId(ID.lexval);}
//      | TRUE                   {fact.s = new NodoTrue();}
//      | FALSE                  {fact.s = new NodoFalse();}
//      | '(' expr ')'           {fact.s = expr.s;}

Nodo * fact(void) {
  if (ta == NO) {
    cuadra(NO);
    Nodo * fact_1_s = fact();
    Nodo * fact_s = new NodoNo(fact_1_s);
    return fact_s;
  }
  else if (ta == ID) {
    string * id_lexval = yylval.nombre;    // ojo: salvar valor lexico antes de cuadrar
    cuadra(ID);
    return new NodoId(id_lexval);
  }
  else if (ta == VERDADERO) {
    cuadra(VERDADERO);
    return new NodoTrue;
  }
  else if (ta == FALSO) {
    cuadra(FALSO);
    return new NodoFalse;
  }
  else if (ta == '(') {
    cuadra('(');
    Nodo * expr_s = expr();
    cuadra(')');
    return expr_s;
  }
  else
    error("en fact");
} // fin de fact()


// *************************************

int main() {
  ta = yylex();     // inicializar token adelantado
  cout << "### Comienza el programa, calculadora booleana\n";
  entrada();
  cout << "### Fin del programa\n";
} // fin de main()

int error(const char* msg) {
  cerr << msg << endl;
  cerr << "token actual = " << ta << " (" << yytext << ")\n";
  exit(EXIT_FAILURE);
} // fin de yyerror()

void cuadra(int t) {
  if (ta == t) {
      #ifdef DEBUG
        cout << "### cuadro token ta = " << ta << " (" << yytext << ") ";
      #endif
    ta = yylex();
      #ifdef DEBUG
        cout << " => nuevo token ta = " << ta << " (" << yytext << ")\n";
      #endif
  }
  else {
    cerr << "Error al cuadrar: esperaba ta = " << ta
	 << " pero hay t = " << t << " (" << yytext << ")\n";
    error("en cuadra");
  }
} // fin de cuadra()
