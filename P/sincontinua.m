function[t,y] = sincontinua(N, A, F, Fase)
t = 0:1e-6:N;
y = A*sin(2*pi*F*t+Fase);
end
