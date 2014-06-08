int factr(int n) {
	if (n <= 1)
		return 1;
	else
		return n * factr(n-1);
}

int fact(int n) {
	int acum;
	acum = 1;
	while (n > 1) {
		acum = acum * n;
		n = n - 1;
	}
	return acum;
}
int fun (int n, int m, int l){
	printf("Este es n: %d\n", n);
	printf("Este es m: %d\n", m);
	printf("Este es l: %d\n", l);
	printf("%d %d %d\n", n, m, l);
	return 0;
}
int numero;

int main() {
	printf("Dame un entero : ");
	scanf("%d", &numero);
	printf("\n------------------Factorial recursivo-----------------\n");
	printf("El factorial = %d\n", factr(numero));
	printf("\n------------------Factorial iterativo-----------------\n");
	printf("El factorial = %d\n", fact(numero));
	int no;
	no= fun(5, 10, 15);
	printf("Dame otro entero : ");
	int lnumero;
	scanf("%d", &lnumero);
	printf("\n----Aritmeticos, asignacion, relacionales y logicos----\n");
	int aux, aux2;
	aux= numero + lnumero;
	aux2= 2;
	printf("(%d + %d )* 2 = %d\n", numero, lnumero, (aux*aux2));
	if (numero <= aux){
		printf("%d es menor o igual que %d\n", numero, aux);
		printf("Otro printf porque si.\n");
	}
	if (aux != 1 || aux == 0)
		printf("Comparacion con or correcta.\n");
	if (aux2 != 1 && aux2 != 2){
		printf("Comparacion con and incorrecta.\n");
	}else{
		printf("Comparacion con and correcta.\n");
	}
	return 0;
}
