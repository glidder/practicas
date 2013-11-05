
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
	char estado;
    estado = 'i';
    char c;
    int i;
    if(argc>1){
	for(i=0;i<strlen(argv[1]);i++) {
		c=argv[1][i];
		switch(estado) {
			case 'i':
				if(c=='0') estado = '0';
				if(c=='1') estado = '1';
				break;
			case '0':
				if(c=='1') estado = '1';
				break;
			case '1':
				if(c=='0') estado = '2';
				if(c=='1') estado = '0';
				break;
			case '2':
				if(c=='0') estado = '1';
				break;
		}
	}
	}
	printf("Estado final: %c \n",estado);
	printf((estado=='0')?"Cadena aceptada.\n":"Cadena no aceptada.\n");
	return 0;
}