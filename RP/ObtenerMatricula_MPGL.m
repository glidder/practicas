clear all
clc

cd fotos
A = imread(['Coche' num2str(31,'%03d') '.jpg']);
figure, imshow(A,[])
cd ..

B = rgb2gray(A);
%Operadores de Laplace
% h1 = [0 -1 0; -1 4 -1; 0 -1 0]/6;
% h2 = -1 * ones(3)/9;  h2(2,2) = 8/9;
% h3 = [-1 -2 -1; -2 12 -2; -1 -2 -1]/16;
h = butter(20,0.2,'high'); 
F = filter2(h, B);
figure, imshow(F,[])
sf = sum(F); 
sf = sf - min(sf); sf = sf / max(sf);
figure, plot(sf)

[sfo, sfoi] = sort(sf, 'descend')
mu_sf = mean(sfoi(3:6))
RF = B(:,mu_sf-100:mu_sf+100);
figure, imshow(RF, [])

SF = F(:,mu_sf-100:mu_sf+100);
sc = sum(SF');
sc = sc - min(sc); sc = sc / max(sc);
figure, plot(sc)

[sco, scoi] = sort(sc, 'descend');
mu_sc = mean(scoi(3:6))
RC = RF (mu_sc-25:mu_sc+25,:);
figure, imshow(RC,[])
