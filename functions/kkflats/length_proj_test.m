function [LP] = length_proj_test(F,Ktest,C_,k,D)
	ntest=size(Ktest,2);
	m=size(F,1);
	for i = 1:k
		A=F(:,:,i);
		ind = find(C_==i);
		N=size(ind,1);
		O=ones(1,ntest);
		B=A*D;
		v=1/N.*sum(B(1:m,ind),2);
		T=B-v*O;
		LP(i,:)=sum(T.^2,1);
	end
end
