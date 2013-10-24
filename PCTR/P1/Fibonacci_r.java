/**Clase Fibonacci_r de la practica 1 de PCTR
  *@author Luis José Quintana Bolaño
  *@version 1.0
*/
import java.lang.Math;
public class Fibonacci_r
{
    /**Método recursivo para calcular un termino de la sucesión de Fibonacci.
    @param n Entero que designa la posición a calcular.
    @return long Termino en posición n de la sucesión.
    */
    public static long fibonacci(int n) {
        if (n<2) return n;
        else return fibonacci(n-1)+fibonacci(n-2);
    }
    /**Método que contiene el código ejecutable
    @param args Argumentos de la linea de comandos
    @return void
    */
    public static void main(String[] args)
    {
        
        double pi=Math.PI;
        double d=14.2,h=20.0;
        if(args.length<1){
            System.out.println("Uso: java Fibonaci_r numero_entero");
            System.exit(0);}
        int N=Integer.parseInt(args[0]);
        System.out.println("Termino "+N+" de Fibonacci: "+fibonacci(N));
        
    }
}
        
