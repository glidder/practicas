#include <stdio.h>

int dividir(int a, int b){
	int n = a/b;
	return n;
}

int main(){
	printf("dame dos enteros: ");
	int a, b;
	scanf("%d%d", &b, &a);
	printf("%d/%d = %d\n",a, b, dividir(a, b););
}
