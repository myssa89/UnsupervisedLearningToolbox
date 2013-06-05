function [e,Ct] = test_error_kflats(T,F,M) %returns the testing error e and the assignment vector of the testing set T
	k=size(M,2);
	for j=1:k
		T_j=bsxfun(@minus, T, M(:,j));
		temp = F(:,:,j)*T_j; % matrix m x n , temp(i,k) contains the dot product of x_k and the i-th basis vector of F_j
		proj = F(:,:,j)'*temp; %matrix d x n containing the n projections of data points on F_j
		dist = T_j-proj;
		D(j,:)=sum(dist.^2,1);
	end
	[mind2,Ct] = min(D,[],1); 
	Ct=Ct';
	e=mean(mind2);
end
