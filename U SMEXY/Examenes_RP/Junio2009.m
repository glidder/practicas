clc
clear all

S='LAS COORDENADAS DE LA GSBHBUB HAN SIDO FIJADAS EN FM NBS EF BMCPSBO FO MB QBSUF MAS OCCIDENTAL DEL MAR MEDITERRANEO TUPQ MB WFMPDJEBE DEL VIENTO ES DE UNOS VEINTE NUDOS Z MB QSPGVOEJEBE FT DE DOSCIENTOS METROS STOP';
r='111 11111111111 11 11 2222222 111 1111 1111111 11 22 222 22 2222222 22 22 22222 111 1111111111 111 111 111111111111 2222 22 222222222 111 111111 11 11 1111 111111 11111 2 22 22222222222 22 11 1111111111 111111 1111';
S1='LAS TROPAS SE ENCUENTRAN EN LA GSPOUFSB DPO FM FOFNJHP STOP SE RECOMIENDA DETENER LA PQFSBDJPO STOP MB HVFSSB IB UFSNJOBEP';

%V=S-'A'+1;
%V1=V(find(V~=-32));

sec1=S(find(S~=' '));
sec=sec1-'A'+1;

estado1=r(find(r~=' '));
estado=estado1-'0';

[aproxA,aproxB]=hmmestimate(sec,estado);
[A,B]=hmmtrain(sec,aproxA,aproxB);

ind = find(B==0);
B(ind) = 1e-4;
for i=1:size(B,1),
  B(i,:) = B(i,:)/sum(B(i,:));
end

%function mensaje=decodificar(S1,A,B)

indiceE=find(S1~=' ');
s1=S1(indiceE);
s=s1-'A'+1;

estados=hmmviterbi(s,A,B);

ind=find(estados==2);
s(ind)=char(s(ind)-1);

mensaje(indiceE)=char(s+'a'-1);


%end