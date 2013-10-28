function [A]=Nueva_Asignacion(B, i, j)
    A=B;
    A(i)=B(j);
    A(j)=B(i);
end
    