function [D2,mind2,argmind2] = assignment_kmeans(X,M,j,k) %D2 ~(k,n) : distance X to means D2(j,i) = d(x_i,m_j); argmind2~(n,1)
	%j is the number of means currently available
	n=size(X,2);
	D2 = 1e10*ones(k,n); %initialization with big values
	for i=1:j
		X_i=bsxfun(@minus, X, M(:,i)); 
		D2(i,:) = sum(X_i.^2, 1); 
	end
	[mind2,argmind2] = min(D2,[],1);   %argmind2: assignment vector
end

