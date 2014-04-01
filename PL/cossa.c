#include <stdio.h>
int n;
int suma(int x, int y){
	int a;
	a=x*2+y;
	return a;
}

int main(){
	int j, k;
	printf("Dame don esteros:");
	scanf("%d%d",&j, &k);
	n=suma(j,k);
	printf("La suma de %d *2 con %d vale %d\n", j, k, n);
	return 0;
}
