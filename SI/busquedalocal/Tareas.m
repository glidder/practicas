function [M, A, C]=Tareas(n, m)
    M = [12 43 15 7; 9 10 6 4; 5 13 29 2; 4 11 17 9]
    %M = [fix(rand(1,m)*100);fix(rand(1,30)*100)
    A = [1 2 3 4];
    C = Evaluacion(M, A)
end