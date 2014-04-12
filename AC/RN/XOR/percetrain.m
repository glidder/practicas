function w= percetrain(x,y)
w=zeros(1,3);
rep=0;
while rep<length(y)
    rep=0;
    for i=1:length(y)
        aux=sgna(x(i,:)*w');
        err=y(i)-aux;
        waux=w+x(i,:)*err;
        if waux==w
            rep=rep+1;
        end
        w=waux;
    end
end

end

function a = sgna(n)
  if(n>=0);
      a=1;
  else
      a=-1;
  end;
end
