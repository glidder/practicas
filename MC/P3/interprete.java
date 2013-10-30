/**
* @author Luis José Quintana Bolaño
* @version 0.01
**/

import java.util.*;
import java.util.regex.*;
import java.io.*;


public class interprete
{
	public static programa procesarArchivo(String[] args) {
		File file = new File(args[0]);
		scanner 
		programa p=new programa();
		Pattern var = Pattern.compile("([XZ][0-9]*)|(Y)");
		Pattern zero= Pattern.compile(" *("+var+") *[=] *0 *");
		Pattern succ= Pattern.compile(" *("+var+")[+][+] *");
		Pattern copy= Pattern.compile(" *("+var+") *[=] *("+var+") *");
		Pattern loop= Pattern.compile(" *LOOP *("+var+") *");
		Pattern lend= Pattern.compile(" *END *");
 
        try {
            Scanner scanner = new Scanner(file);
            Matcher m;
            while (scanner.hasNextLine()) {
                m = zero.matcher(scanner.nextLine());
                if(m.matches()) p;
                
            }
            scanner.close();
        } catch (FileNotFoundException e) {
            System.err.println("Archivo no encontrado.");
        }
        return p;
	}
	
	public static void main(String[] args) {
		programa p = procesarArchivo(args);
			
		
	}
}
