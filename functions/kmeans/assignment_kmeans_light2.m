function [mind2,argmind2] = assignment_kmeans_light2(X,M,k) %D2 ~(k,n) : distance X to means; argmind2~(n,1)
	%j is the number of means currently available
	n=size(X,2);
	D2 = 1e10*ones(k,n); 
	for i=1:k
		X_i=bsxfun(@minus, X, M(:,i)); %at the i-th step, we compute x_j-m_i for j in 1:n
		D2(i,:) = sum(X_i.^2, 1); 
	end
	[mind2,argmind2] = min(D2,[],1);   %mind2(i) contains the distance between x_i and the closest mean, argmin(i) gives the cluster to which x_i belongs
end
