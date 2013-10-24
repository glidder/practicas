/**Clase integralPI de la practica 1 de PCTR
  *@author Luis José Quintana Bolaño
  *@version 1.0
*/
import java.lang.Math;
public class integralPI
{
    private static double coeficiente;
    /**Método f
    @param x float.
    @return float Resultado de la función.
    */
    public static double f(double x)
    {
        return (4/(1+(x*x)));
    }
    /**Método recursivo para la suma de riemann
    @param n
    @return double Resultado de la suma de riemann
    */
    public static double riemann(double x) {
        if(x<=0) return 0;
        return (riemann(x-coeficiente)+f((x+x-coeficiente)/2)*(x-(x-coeficiente)));
        
    }
    /**Método que contiene el código ejecutable
    @param args Argumentos de la linea de comandos
    @return void
    */
    public static void main(String[] args)
    {
         if(args.length!=1){
            System.out.println("Uso: java integralPI cantidad_rectangulos.");
            System.exit(-1); //D'oh!
        }
        coeficiente=1/Double.parseDouble(args[0]);
        System.out.println("Pi= "+riemann(1));

    }
    
}
        
