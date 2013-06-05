function [DC]=distance_centers_test(C_,K,k,Ktest,D) %DC is k*n and DC(i,j) contains the squared distance between x_j and m_i that is d(phi(x_j),m_i)
	ntest=size(Ktest,1);
	for i=1:k 
		ind = find(C_==i);
		N=size(ind,1);
		for j=1:ntest
			DC(i,j)=Ktest(j,j)-2/N.*sum(D(ind,j),1)+1/N^2 .*sum(sum(K(ind,ind))); % || f(x_j)-m_i ||^2
		end
	end
end
