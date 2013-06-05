function [e,M,argmind2] = kmeanspp_withoutL2(X,k)  %returns the means
	[d,n] = size(X);
	M=zeros(d,k);
	M(:,1) = X(:,randi(n,1));
	X_1=bsxfun(@minus, X, M(:,1)); 
	D2(1,:) = sum(X_1.^2, 1);
	argmind2 = ones(1,n);
	mind2=D2(1,:);
	
	for j = 2:k
		p=random_D2_sampling(mind2);
		M(:,j)=X(:,p);
		[D2,mind2,argmind2] = assignment_kmeanspp(X,M,j,D2,argmind2,mind2);
	end
	e=mean(mind2);
end



function [p]=random_D2_sampling(mind2)
	c = cumsum(mind2);
	p = find((c >= rand(1, 'double')*c(end)),1,'first');
end
