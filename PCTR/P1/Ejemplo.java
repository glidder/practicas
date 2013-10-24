/**Clase Circulo de la practica 1 de PCTR
  *@author Luis José Quintana Bolaño
  *@version 1.0
*/
public class Circulo
{
  /**Metodo que contiene el código ejecutable
  @param args Array de cadenas con los argumentos de la linea de comandos.
  @ nombre Nombre del titular
  */
  public Cuenta_Banca (int id, double disponible, String nombre) //constructor  
  { Codigo_Cuenta=id;
    Saldo_Cuenta=disponible;
    Titular=nombre;
  }
  /**Método observador que devuelve el saldo de la cuenta
  @return double Saldo actual
  */
  synchronized public double  Saldo() //observador
  {return (Saldo_Cuenta);}
  /**Método modificador para ingresar una cantidad en la cuenta.
  @param Cantidad Cantidad a ingresar
  @return void
  */
