function [D] = distances(X) %D(i,j)=d(x_i,x_j)
	n=size(X,2);
	D=zeros(n,n);
	for i=1:n
		for j=1:i-1
			D(i,j)=norm(X(:,i)-X(:,j));
		end
	end
	D=D+D';
end 
