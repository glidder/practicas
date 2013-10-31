/**
* @author Luis José Quintana Bolaño
* @version 0.01
**/

import java.util.*;

public class configuracion
{
	public configuracion(){
		variables.put("i",1);
		variables.put("Y",0);
	}

	public void añadir(String V, int m){
		variables.put(V,m);
	}

	public boolean existe(String V){
		return variables.containsKey(V);
	}

	public int extraer(String V){
		return variables.get(V);
	}

	public String toString(){
		String cadena;
		cadena = "<"+variables.get("i")+", (";
		int i=1;
		while(variables.containsKey("X"+i)){
			cadena += "X"+i+"="+variables.get("X"+i)+", ";
			++i;
		}
		i=1;
		while(variables.containsKey("Z"+i)){
			cadena += "Z"+i+"="+variables.get("Z"+i)+", ";
			++i;
		}
		return cadena+"Y="+variables.get("Y")+")>";
	}
	private Map<String,Integer> variables=new HashMap();

}
