function [Cap,D2,mind2] = assignment_kkmeans(k,K,Cav) %using the old assignment vector Cav, the kernel matrix K, produces the new assignments Cap
	n=size(K,1);
	for i = 1:k
		ind = find(Cav==i); % contains the indices of points belonging to cluster i.
		N=size(ind,1);
		for j=1:n
			D2(i,j)=K(j,j)-2/N.*sum(K(j,ind),2)+1/N^2 .*sum(sum(K(ind,ind))); % || f(x_j)-m_i ||^2
		end
	[mind2,Cap] = min(D2,[],1); 
	Cap=Cap';
end
