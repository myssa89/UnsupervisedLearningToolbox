function [X] = generatedata_embedded_trefoil(n,d,ntot) %outputs X d-by-n data set / ntot is the number of points that generate the trefoil (do not take it too large)

	P=generatedata_sphere(d,ntot);
	P=P';
	V=generatedata_sphere(d,ntot);
	V=V';	
	s=randi(ntot,n,1);
	t=rand(n,1);
	X0=P(s,:);
	T0=V(s,:);
	s1=mod(s,ntot)+1;
	X3=P(s1,:);
	T3=V(s1,:);
	s2=s*ones(1,d);
	t2=t*ones(1,d);	
	X1=T0;
	X2=T3;
	X1=1/3.*X1+X0;
	X2=-1/3.*X2+X3;
	X0=X0.*((1-t2).^3);
	X1=X1.*3.*((1-t2).^2).*t2;
	X2=X2.*3.*(1-t2).*(t2.^2);
	X3=X3.*(t2.^3);
	X=(X0+X1+X2+X3)';
end	
