function sol= vuelta_atras_recursiva(asignacion,psr)
    i=1;
    fs=false;
    sol=asignacion;
    if sum(isnan(asignacion))==0;
        i=length(asignacion)+1;
        fs=true;
    end
    var=(length(asignacion)-sum(isnan(asignacion)))+1;
    while i<=length(asignacion)
        aux=asignacion;
        aux(var)=i;
        if restricciones(aux,var)
            asignacion(var)=i;
            sol=vuelta_atras_recursiva(asignacion,psr);
            if (all(sol~=0))
                fs=true;
                i=length(asignacion);
            end
        end
        i=i+1;
    end
    if(fs==false)
        sol=sol*0;
end