int fact(int n) {
	if (n <= 1)
		return 1;
	else
		return n *fact(n-1);
}
int numero;
int main() {
	printf("Dame un entero : ");
	scanf("%d", &numero);
	printf("El factorial = %d\n", fact (numero));
	if (numero == 5)
		printf("Te la hinco");
	else{
		printf("No era cinco!!!");
		int i;
		i=numero;
		printf("\n era %d", i );
	}
	return 0;
}
