senal=record(2,4000);
senal2=zeros(1,length(senal));
j=0;
for i=1:length(senal)
	j=j+1;
	senal2(j)=senal(i);
	j=j+1;
	senal2(j)=senal(i);
end
playaudio(senal2,8000);
playaudio(senal2,2*8000);
