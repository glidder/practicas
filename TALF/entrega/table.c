
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
    int estado = 3;
    int c;
    int i;
    int afd[4][2]={{0,1},{2,0},{1,2},{0,1}};
    if(argc>1){
	for(i=0;i<strlen(argv[1]);i++) {
		c=(argv[1][i])-'0';
		estado=afd[estado][c];
	}
	}
	printf("Estado final: %c \n",(estado==3)?'i':(estado+'0'));
	printf((estado==0)?"Cadena aceptada.\n":"Cadena no aceptada.\n");
	return 0;
}
