/**
* @author Luis José Quintana Bolaño
* @version 0.01
**/

import java.util.*;

public class configuracion
{
	public configuracion(int tam){
		cinta=new int[tam];
		cinta[0]=1;
	}

	public void actualizar(int R, int m){
		cinta[R]=m;
	}

	public int extraer(int i){
		return cinta[i];
	}

	public String toString(){
		String cadena;
		cadena = "<"+cinta[0]+", (R1="+cinta[1];
		for(int i=2;i<cinta.length;++i){
			cadena+= ", R"+i+"="+cinta[i];
		}
		return cadena+")>";
	}
	
	private int[] cinta;

}
