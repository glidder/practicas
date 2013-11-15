/**
* @author Luis José Quintana Bolaño
* @version 0.01
**/

import java.util.*;
import java.io.*;

public class programa
{

	private class instruccion{
		public instruccion(char i, int pr, int sr, int tr){
			id=i;r1=pr;r2=sr;r3=tr;
		}
		public char ID(){return id;}
		public int R1(){return r1;}
		public int R2(){return r2;}
		public int R3(){return r3;}
		private char id;
		private int r1, r2, r3;
	}

	public programa(){
		instrucciones.add(new instruccion('N',0,0,0));
	}
	
	public void iniciaConf(int[] ini){
		conf=new configuracion(ini[0]);
		for(int i=1;i<ini.length;++i)
			conf.actualizar(i,ini[i]);
	}

	public void añadir(char ID, int R1, int R2, int R3)
	{
		instrucciones.add(new instruccion(ID,R1,R2,R3));
	}

	public configuracion confActual(){return conf;}

	public configuracion computar(){
		instruccion actual=(instruccion)instrucciones.get(conf.extraer(0));
		switch(actual.ID()){
			case 'J':
				conf.actualizar(0,((conf.extraer(actual.R1())==conf.extraer(actual.R2()))?
									((actual.R3()>=instrucciones.size())?instrucciones.size():actual.R3()):
									conf.extraer(0)+1));
				break;
			case 'S':
				conf.actualizar(actual.R1(),conf.extraer(actual.R1())+1);
				conf.actualizar(0,conf.extraer(0)+1);
				break;
			case 'T':
				conf.actualizar(actual.R2(),conf.extraer(actual.R1()));
				conf.actualizar(0,conf.extraer(0)+1);
				break;
			case 'Z':
				conf.actualizar(actual.R1(),0);
				conf.actualizar(0,conf.extraer(0)+1);
				break;
		}
		return conf;
	}

	public boolean finalizado(){ return (conf.extraer(0)>=instrucciones.size()||conf.extraer(0)==0);}

	private ArrayList instrucciones=new ArrayList<instruccion>();
	private  configuracion conf;
}
