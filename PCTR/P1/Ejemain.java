/**Clase clienteAdivina de la practica 11 de PCTR
  *Obtiene la dirección del servidor desde la linea de comandos. Si no recive argumento, por defecto usa localhost.
  *@author Luis José Quintana Bolaño
  *@version 1.0
*/
import java.rmi.*;
import java.rmi.registry.*;
import java.util.*;
public class clienteAdivina
{
    /**Método que contiene el código ejecutable
    @param args Argumentos de la linea de comandos
    @return void
    */
    public static void main(String[] args) throws Exception
    {
        int hint;
        Scanner leer= new Scanner(System.in);
        intAdivina Or=(intAdivina) Naming.lookup("//"+((args.length!=0)?args[0]:"localhost")+"/Servidor_Remoto");
        Or.InicioRemoto();
        do {
            System.out.println("Introduzca el número: ");
            hint=Or.Jugar(leer.nextInt());
            if (hint<0) System.out.println("Demasiado bajo.");
            else if (hint>0) System.out.println("Demasiado alto.");
        } while (hint!=0);
        System.out.println("Acierto.");
    }
}
        
