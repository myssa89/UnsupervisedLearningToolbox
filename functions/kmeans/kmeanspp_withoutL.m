function [e,M,argmind2] = kmeanspp_withoutL(X,k)  %returns the means of the initialization
	[d,n] = size(X);
	 M(:,1) = X(:,randi(n,1));
	for j = 2:k
		[D2,mind2,argmind2] = assignment_kmeans(X,M,j-1,k);
		p=random_D2_sampling(mind2);
		M(:,j)=X(:,p);
	end
	[D2,mind2,argmind2] = assignment_kmeans(X,M,k,k);
	e=sum(mind2);
end



function [p]=random_D2_sampling(mind2)
	c = cumsum(mind2);
	p = find((c >= rand(1, 'double')*c(end)),1,'first');
end
