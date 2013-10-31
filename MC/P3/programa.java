/**
* @author Luis José Quintana Bolaño
* @version 0.01
**/

import java.util.*;
import java.io.*;

public class programa
{
	public static final int ZERO = 0;
	public static final int SUCC = 1;
	public static final int COPY = 2;
	public static final int LOOP = 3;
	public static final int LEND = 4;

	private class instruccion{
		public instruccion(int i, String v1, String v2){
			ID=i;V1=v1;V2=v2;
		}
		public int id (){return ID;}
		public String pV(){return V1;}
		public String sV(){return V2;}
		private int ID;
		private String V1, V2;
	}

	public programa(String[] x){
		conf=new configuracion();
		for(int i=0;i<x.length;++i)
			conf.añadir("X"+(i+1), Integer.parseInt(x[i]));
		instrucciones.add(new instruccion(0,"Y","0"));
	}

	public void añadir(int i, String V1, String V2)
	{
		instrucciones.add(new instruccion(i,V1,V2));
		if((i!=4) && (!conf.existe(V1))) conf.añadir(V1,0);
		if((V2!="0") && (!conf.existe(V2))) conf.añadir(V2,0);
	}

	public configuracion confActual(){return conf;}

	public configuracion computar(){
		instruccion actual=(instruccion)instrucciones.get(conf.extraer("i"));
		switch(actual.id()){
			case 0:
				conf.añadir(actual.pV(),0);
				conf.añadir("i",conf.extraer("i")+1);
				break;
			case 1:
				conf.añadir(actual.pV(),conf.extraer(actual.pV())+1);
				conf.añadir("i",conf.extraer("i")+1);
				break;
			case 2:
				conf.añadir(actual.pV(),conf.extraer(actual.sV()));
				conf.añadir("i",conf.extraer("i")+1);
				break;
			case 3:
				if(conf.extraer(actual.pV())>0){
					conf.añadir(actual.pV(),conf.extraer(actual.pV())-1);
					conf.añadir("i",conf.extraer("i")+1);
				} else {
					int k=conf.extraer("i");
					while(actual.id()!=4){
						actual=(instruccion)instrucciones.get(++k);
					}
					conf.añadir("i",k+1);
				}
				break;
			case 4:
				instruccion b=(instruccion)instrucciones.get(Integer.parseInt(actual.pV()));
				if(conf.extraer(b.pV())>0)
					conf.añadir("i",Integer.parseInt(actual.pV()));
				else
					conf.añadir("i",conf.extraer("i")+1);
				break;
		}
		return conf;
	}

	public boolean finalizado(){ return (conf.extraer("i")>=instrucciones.size());}

	ArrayList instrucciones=new ArrayList<instruccion>();
	private  configuracion conf;
}
