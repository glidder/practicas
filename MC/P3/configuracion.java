/**
* @author Luis José Quintana Bolaño
* @version 0.01
**/

import java.util.*

public class configuracion
{
	public configuracion(){
		indice=1;
		variables.put(Y,0);
	}

	public void añadir(String V, int m){
		variables.put(V,m);
	}

	public int extraer(String V){
		return variables.get(V);
	}

	private Map<String,int> variables;
	private int indice;

}
