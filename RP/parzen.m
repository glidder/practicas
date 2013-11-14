function h=parzen(A, B)
datos=shuffle([A B]);
desvstandard=0.5;
x=5:0.1:45;
h=zeros(1,length(x));
for i=1:length(datos),h = h + normpdf(x,datos(i), desvstandard);
%plot(x,h)
%title(num2str(datos(i)),'FontSize',14)
%drawnow
end
h = h / length(datos);
h2 = (normpdf(x,30,5) + normpdf(x,17,3))/2;
figure, plot(x,h,'r',x,h2,'b');
legend('calculada','exacta')
end
