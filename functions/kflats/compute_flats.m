function [M,F] = compute_flats(X,C_,m,k) %M(:,j) contains a point by which the j-th flat goes (M is d-by-k)and F(:,:,j) the basis vectors of the flat (orthonormal basis)  (F is m-by-d-by-k) 
	for i=1:k 
		ind = find(C_==i);
		N=size(ind,1);
		M(:,i)=1/N*sum(X(:,ind),2);%first we update the mean of the cluster
		X_i=X(:,ind); % points of cluster i
		X_i=bsxfun(@minus, X_i, M(:,i)); %recenter data
		Cov = X_i*X_i'; %covariance matrix of points belonging to cluster i
		[v,lambda]=eig(Cov);	
		tot=size(v,2);
		F(:,:,i)=v(:,tot-m+1:tot)'; %eigen vectors associated with m smallest eigenvalues
	end
end
