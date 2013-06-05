function [C,mind2] = assignment_kflats(X,C_,F,M) % for this we suppose that basis vectors in F are normalized
%F m x d x k is such that F(:,:,k) contains the basis vectors of the k-th flat
k=size(M,2);
	for j=1:k
		X_j=bsxfun(@minus, X, M(:,j));
		temp = F(:,:,j)*X_j; % matrix m x n , temp(i,k) contains the dot product of x_k and the i-th basis vector of F_j
		proj = F(:,:,j)'*temp; %matrix d x n containing the n projections of data points on F_j
		dist = X_j-proj;
		D(j,:)=sum(dist.^2,1);
	end
	[mind2,C] = min(D,[],1); 
	C=C';
end
