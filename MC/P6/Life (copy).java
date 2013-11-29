/**
* @author Luis José Quintana Bolaño
* @version 0.01
**/

import java.util.*;
import java.io.*;


public class Life
{
	private int[][] board;
	private int population;
	static final int DEAD=0;
	static final int ALIVE=1;
	
	public Life (int bsize, int ncell)
	{
		board=new int[bsize+2][bsize+2];
		population=ncell;
		ArrayList<Integer> x=new ArrayList<Integer>(bsize);
		ArrayList<List<Integer>> y= new ArrayList<List<Integer>>(bsize);
		for (int i=1;i<=bsize;++i){
			x.add(i);
			ArrayList<Integer> row= new ArrayList<Integer>(bsize);
			for (int j=1;j<=bsize;++j){
				row.add(j);
			}
			y.add(row);
		}
		Random rand= new Random();
		for (int i=1;i<=ncell;++i){
			int aux=rand.nextInt(x.size());
			board[x.get(aux)][y.get(aux).remove(rand.nextInt(y.get(aux).size()))]=ALIVE;
			if(y.get(aux).isEmpty()){
				y.remove(aux);
				x.remove(aux);
			}
		}
			
	}
	
	public String toString()
	{
		String s= "";
		for(int i=1;i<board.length-1;++i){
			for(int j=1;j<board.length-1;++j){
				s+=((board[i][j]==1)?"0":" ")+" ";
			}
			s+="\n";
		}
		return s+="population: "+population;
	}
	
	public int sigGen()
	{
		population=0;
		int aux;
		for(int i=1;i<board.length-1;++i){
			for(int j=1;j<board.length-1;++j){
				aux=0;
				for(int ii=-1;ii<2;++ii)
					for(int jj=-1;jj<2;++jj)
						aux+=board[i+ii][j+jj];
				board[i][j]=(aux<2||aux>3)?DEAD:(aux==3)?ALIVE:board[i][j];
				if(board[i][j]==ALIVE)
					population++;
			}
		}
		return population;
	}
	
	public static void main(String[] args) {
		Scanner scan= new Scanner(System.in);
		Life game= new Life(Integer.parseInt(args[0]),Integer.parseInt(args[1]));
		do{
			System.out.println(game.toString());
			scan.nextLine();
		}while (game.sigGen()!=0);	
	}
}
