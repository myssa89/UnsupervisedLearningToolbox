function [LP] = length_proj(F,K,C_,k) %LP(j,i)= sum_l=1..m <phi(x_i)-m_j,g_l^j>^2 length of proj of phi(x_i) on F_j 
	n=size(K,2);
	m=size(F,1);
	for i = 1:k
		A=F(:,:,i);
		ind = find(C_==i);
		N=size(ind,1);
		O=ones(1,n);
		B=A*K;
		v=1/N.*sum(B(1:m,ind),2);
		T=B-v*O;
		LP(i,:)=sum(T.^2,1);
	end
end
