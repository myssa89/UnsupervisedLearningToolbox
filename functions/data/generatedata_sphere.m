function [X]= generatedata_sphere(d,npoints)  %X is d x n
	X = randn(d,npoints);
	for i = 1:npoints
		NO(i)=norm(X(:,i));
		X(:,i)=X(:,i)./ NO(i);
	end
end