function Edistorsionado=distorsionarPatron(E,porcentajeRuido)
%ENTRADA: E              : matriz nxm de m patrones n-dimensionales (patrones por columnas)
%         porcentajeRuido: 0<=porcentaje<=1 de ruido a aplicar. Probabilidad (uniforme) de alterar un valor del patrón
%SALIDA : Edistorsionado : El resultado de distorsionar E

[ind]=find((rand(size(E))<=porcentajeRuido));      %añadimos ruido con probabilidad uniforme
Edistorsionado=E;Edistorsionado(ind)=E(ind).*(-1); %invertimos el valor de estos atributos -suponemos valores en {-1,+1}-
end
