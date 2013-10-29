%Practica 3, SI. NReinas y Backtracking
%autor: Luis José Quintana Bolaño
%
function solucion = actualizar( estado, Ractual )
    solucion = estado;
    Pactual = find( solucion.posibles( Ractual,: ), 1 );
    solucion.tablero( Ractual ) = Pactual;
    solucion.posibles( Ractual,: ) = 0;
    solucion.posibles( :,Pactual ) = 0;
    
    %Método muy largo para Diagonales.
    %Intentar simplificarlo con Diag()?
    max=length(estado.posibles(1,:));
    i=Ractual-Pactual+1;
    if(i<=0)i=1;end
    j=Pactual-Ractual+1;
    if(j<=0)j=1;end
    while((i<=max)*(j<=max))
    	solucion.posibles(i,j)=0;
    	i=i+1;
    	j=j+1;
    end
    i=Ractual+Pactual-1;
    if(i>max)i=max;end
    j=Pactual+Ractual-max;
    if(j<=0)j=1;end
    while((i>0)*(j<=max))
    	solucion.posibles(i,j)=0;
    	j=j+1;
    	i=i-1;
    end
end
