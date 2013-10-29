%Practica 3, SI. NReinas y Backtracking
%autor: Luis José Quintana Bolaño
%
function sol= restricciones(t,i)
    sol=true;
    if((length(t)-sum(isnan(t)))>1)
        for j=1:(length(t)-sum(isnan(t)))
            if(i~=j)
                sol=sol*(t(i)~=t(j))*(abs(t(i)-t(j))~=abs(i-j));
            end
        end
    end
end
