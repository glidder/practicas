void def(void);
void tipo(void);
void elm(void);

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
	
		{tipo();elm();cuadra(';');}
	else
		error();
}

void tipo(void) {
	if(ta=INT) cuadra(INT);
	else if(ta==CHAR) cuadra(CHAR);
	else if(ta=FLOAT) cuadra(FLOAT);
	else error();
}

void elm(void) {
	if (ta=='*') {
		cuadra('*');
		elm();
	} else if (ta==ID)
		cuadra(ID);
	else
		error();
}
