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
		String[] aux = new String[args.length-1];
		System.arraycopy(args, 1, aux, 0, aux.length);
		programa p=new programa(aux);
		Pattern var = Pattern.compile("[XZ][0-9]*|Y");
		Pattern zero= Pattern.compile(" *("+var+") *[=] *0 *");
		Pattern succ= Pattern.compile(" *("+var+")[+][+] *");
		Pattern copy= Pattern.compile(" *("+var+") *[=] *("+var+") *");
		Pattern loop= Pattern.compile(" *LOOP *("+var+") *");
		Pattern lend= Pattern.compile(" *END *");
        try {
            Scanner scanner = new Scanner(file);
            Matcher m;
            String line;
            int i=0,bucle=0;
            while (scanner.hasNextLine()) {
            	line =scanner.nextLine();
            	if(!line.isEmpty()){
            	++i;
                m = zero.matcher(line);
                if(m.matches())
                	p.añadir(p.ZERO, m.group(1), "0");
                else{
                	m = succ.matcher(line);
                	if(m.matches())
                		p.añadir(p.SUCC, m.group(1), "0");
                	else{
                		m=copy.matcher(line);
                		if(m.matches())
                			p.añadir(p.COPY, m.group(1), m.group(2));
                		else{
                			m=loop.matcher(line);
                			if(m.matches()){
                				p.añadir(p.LOOP, m.group(1), "0");
                				bucle=i;
                			}else{
                				m=lend.matcher(line);
                				if(m.matches()){
                					if(bucle!=0)
                						p.añadir(p.LEND, ""+bucle, "0");
                				}
                				else
                					--i;
                			}
                		}
                	}
                }
                } 
            }
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
