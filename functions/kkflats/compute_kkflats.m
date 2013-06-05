function [F] = compute_kkflats(C_,m,k,K) %returns the F(i,p,j) is (a_i^j)p (cf report)
	n=size(K,1);
	F=zeros(m,n,k);
	G=zeros(m,n,k);
	for i=1:k 
		ind = find(C_==i);
		N=size(ind,1);
		U_i=1/N.*ones(N,N);
		K_i=K(ind,ind); % points of cluster i
		K_i=K_i-U_i*K_i-K_i*U_i+U_i*K_i*U_i; % recentering the data is equivalent to this tranformation
		K_i=1/2*(K_i+K_i'); %symmetrization to avoid rounding errors
		[v,lambda]=eig(K_i);	
		G(:,ind,i)=v(:,N-m+1:N)';  %eigen vectors associated with m biggest eigenvalues
		for j=1:m %normalization using the kernel
			l=G(j,:,i)*K*G(j,:,i)';
			F(j,:,i)=G(j,:,i)./sqrt(l);
		end
	end

end
