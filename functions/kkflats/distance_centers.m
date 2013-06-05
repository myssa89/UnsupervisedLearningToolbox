function [DC]=distance_centers(C_,K,k) %DC is k*n and DC(i,j) contains the squared distance between x_j and m_i that is d(phi(x_j),m_i)
	n=size(K,1);
	for i=1:k 
		ind = find(C_==i);
		N=size(ind,1);
		for j=1:n
			DC(i,j)=K(j,j)-2/N.*sum(K(j,ind),2)+1/N^2 .*sum(sum(K(ind,ind))); % || f(x_j)-m_i ||^2
		end
	end
end
