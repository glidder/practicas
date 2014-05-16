function s1=hopval(w,e)
	s0=zeros(1,length(e));
	s1=e;
	while(s0~=s1)
		s0=s1;
		s1=e*w;
		s1=s1./abs(s1);
	end
end

