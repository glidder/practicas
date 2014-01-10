/**
* MC, Practica 8, ejercicio 4: Visualizador del conjunto de Mandelbrot
* @author Luis José Quintana Bolaño
**/

import javax.swing.*;
import java.awt.*;
import java.lang.Math;

public class mandelSet extends JFrame
{
    public mandelSet() {
    	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    	setLocationRelativeTo(null);
        setTitle("Conjunto de Mandelbrot");
        mPanel panel=new mPanel();
        add(panel);
        setVisible(true);
        pack();
        panel.repaint();//pintar();
    }
    
    public static void main( String[ ] args ) {
        new mandelSet();
    }
}

class mPanel extends JPanel
{
	public mPanel(){setPreferredSize(new Dimension(MAX_TAM,MAX_TAM));setDoubleBuffered(true);}

	public void paint(Graphics g) {
        super.paint(g);
        Color[] colores=new Color[MAX_COL+1];
    	int r=0,v=INI_V,a=0;
    	for (int c=0; c<MAX_COL; ++c ) {
    		colores[c]=new Color(r,v,a);
    		v+=Math.floor((MAX_RGB-INI_V)/MAX_COL);++r;++a;
    	}
    	colores[64]=Color.black;
    	
    	setBackground(Color.black);
    	
    	double x0=-2;
    	for (int i = 0; i < MAX_TAM; ++i){
    		x0+= TMP / MAX_TAM;
    		double y0=-1.25;
    		for (int j = 0; j < MAX_TAM; ++j) {
    			y0+= TMP / MAX_TAM;
    			double x=0.0, y=0.0;
    			int iter=0;
    			while (((x*x+y*y)<2*2) && iter < MAX_COL){
    				double aux=x*x-y*y+x0;
    				y=2*x*y+y0;
    				x=aux;
    				++iter;
    			}
    		g.setColor(colores[iter]);
    		g.fillRect(i, j, 1, 1);
    		}
    	}
    }
	public static final int MAX_TAM = 620;
	public static final int MAX_COL = 64;
	public static final int MAX_RGB = 255;
	public static final int INI_V = 50;
	public static final double TMP = 2.5;
}
