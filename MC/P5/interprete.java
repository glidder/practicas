/**
* @author Luis José Quintana Bolaño
* @version 0.01
**/

import java.util.*;
import java.util.Arrays.*;
import java.util.regex.*;
import java.io.*;


public class interprete
{
	public static programa procesarArchivo(String[] args) {
		File file = new File(args[0]);
		int[] ini=new int[args.length];
		for(int i=1;i<args.length;++i)
			ini[i]=Integer.parseInt(args[i]);
		programa p=new programa();
		
		Pattern num = Pattern.compile("[0-9]*");
		Pattern J= Pattern.compile(".*: *[J] *[(] *("+num+") *, *("+num+") *, *("+num+") *[)].*");
		Pattern S= Pattern.compile(".*: *[S] *[(] *("+num+") *[)].*");
		Pattern T= Pattern.compile(".*: *[T] *[(] *("+num+") *, *("+num+") *[)].*");
		Pattern Z= Pattern.compile(".*: *[Z] *[(] *("+num+") *[)].*");
		
        try {
            Scanner scanner = new Scanner(file);
            Matcher m;
            String line;
            int aux1,aux2,maxt=0;
            while (scanner.hasNextLine()) {
            	line =scanner.nextLine();
            	if(!line.isEmpty()){
                	m = J.matcher(line);
                	if(m.matches()){
                		aux1=Integer.parseInt(m.group(1));
                		aux2=Integer.parseInt(m.group(2));
                		maxt=(aux1>maxt)?aux1:maxt;
                		maxt=(aux2>maxt)?aux2:maxt;
                		p.añadir('J',aux1,aux2,Integer.parseInt(m.group(3)));
                	}else{
                		m = S.matcher(line);
                		if(m.matches()){
                			aux1=Integer.parseInt(m.group(1));
                			maxt=(aux1>maxt)?aux1:maxt;
                			p.añadir('S',aux1,0,0);
                		}else{
                			m=T.matcher(line);
                			if(m.matches()){
                				aux1=Integer.parseInt(m.group(1));
                				aux2=Integer.parseInt(m.group(2));
                				maxt=(aux1>maxt)?aux1:maxt;
                				maxt=(aux2>maxt)?aux2:maxt;
                				p.añadir('T',aux1,aux2,0);
                			}else{
                				m=Z.matcher(line);
                				if(m.matches()){
                					aux1=Integer.parseInt(m.group(1));
                					maxt=(aux1>maxt)?aux1:maxt;
                					p.añadir('Z',aux1,0,0);
                				}
                			}
                		}
                	}
                } 
            }
            ini[0]=maxt+1;
            p.iniciaConf(ini);
            scanner.close();
        } catch (FileNotFoundException e) {
            System.err.println("Archivo no encontrado.");
        }
        return p;
	}
	
	public static void main(String[] args) {
		programa p = procesarArchivo(args);
		System.out.println(p.confActual().toString());
		while(!p.finalizado()){
			System.out.println(p.computar().toString());
		}
		
	}
}
