function [X] = generatedata_trefoil(n) % trefoil in 3d (one dimensional curve)

	t=rand(n,1)*2*pi;
	c=2+cos(3.*t);
	X(:,1)=c.*cos(2.*t);
	X(:,2)=c.*sin(2.*t);
	X(:,3)=sin(3.*t);
	X=X';

end

