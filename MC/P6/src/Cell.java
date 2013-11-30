/**Class Cell for a simple Java game.
*@author Luis Quintana
*@version 1.0
*/

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public enum States { dead, green, red }

public class Cell {

    private final static String celld = "../data/celld.png";
	private final static String cellg = "../data/cellg.png";
	private final static String cellr = "../data/cellr.png";
    private static ImageIcon [] ii = {
                        new ImageIcon(this.getClass().getResource(celld)),
                        new ImageIcon(this.getClass().getResource(cellg)),
                        new ImageIcon(this.getClass().getResource(cellr))}

    private States _state;

    public Cell(String type) {
        _state = States.valueOf(type);
    }

    public States getState() {
        return _state;
    }

    public void setState(States state) {
        _state=state;
    }
    
    public Image getImage() {
        return ii[state.ordinal()].getImage();
    }
}