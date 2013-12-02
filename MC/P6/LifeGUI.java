/**
* @author Luis José Quintana Bolaño
* @version 0.01
**/

import java.util.*;
import java.io.*;
import javax.swing.*;
import java.awt.event.*;
import java.awt.*;


public class LifeGUI extends JFrame
{
	public LifeGUI(Game game){
        add(game);
        JButton button1 = new JButton();
        game.add(button1);
        addComponentListener(game);
        button1.addActionListener(game);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //setSize(640,520);
        setLocationRelativeTo(null);
        setTitle("Conway's Life Game");
        setResizable(true);
        setVisible(true);
        pack();
    }

    
	public static void main(String[] args) {

		Game game= new Game(new Life(Integer.parseInt(args[0]),Integer.parseInt(args[1])));
		new LifeGUI(game);
	}

	 
}

class Game extends JPanel implements ActionListener, ComponentListener
{
	private Life life;
	public Game(Life l) {
		life=l;
		setPreferredSize(new Dimension(480,480));
		setFocusable(true);
		setBackground(Color.BLACK);
		setDoubleBuffered(true);
	}
	
	public void actionPerformed(ActionEvent e) {
        life.sigGen();
        repaint();
    }

    public void paint(Graphics g) {
        super.paint(g);
        g.setColor(Color.GREEN);
        int[][] matrix=life.currentBoard();
        int SCALE=getSize().height/(matrix.length-2);
        for (int x=0; x<matrix.length-2; ++x) {
            for (int y=0; y<matrix.length-2; ++y) {
                if (matrix[x+1][y+1]==1) {
                    g.fillRect(x * SCALE, y * SCALE, SCALE, SCALE);
                }
            }
        }
        g.setColor(Color.RED);
        g.setFont(new Font(null, Font.PLAIN, 15));//(int)(getSize().height*0.1)));
        g.drawString("Population: "+life.currentPopulation(),5,20);//(int)(getSize().height*0.1+5));
    }

    public void componentResized(ComponentEvent evt) {
    		JFrame c=(JFrame)evt.getSource();
    		int w=c.getContentPane().getSize().width;
    		int h=c.getContentPane().getSize().height;
    		int s=((h<w)?h:w);
            setSize(s,s);
            //Component c = (Component)evt.getSource();
            //........
    }
    public void componentHidden(ComponentEvent evt) {}
    public void componentShown(ComponentEvent evt) {}
    public void componentMoved(ComponentEvent evt) {}
}