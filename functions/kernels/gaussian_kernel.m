function [K] = gaussian_kernel(X,sigma) %kernel matrix associated with the gaussian kernel K n-by-n
	n=size(X,2);
	for i=1:n
		for j=1:i
			K(i,j)=expo(X(:,i),X(:,j),sigma);
		end
	end
	K=K+K'-diag(diag(K));
end

function [y] = expo(x,y,sigma)
	y = exp(-norm((x-y))^2/(2*sigma^2));
end
