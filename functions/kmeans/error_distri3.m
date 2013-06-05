function [e,Ct]= error_distri3(M,T) %% e = 1/size(T) sum(min_j ||x_i-m_j||²), Ct: assignment vector of the training set T
k=size(M,2);

e=0;
	for j=1:k
		T_j=bsxfun(@minus,T,M(:,j));
		D2(j,:)=sum((T_j).^2) ;
	end
	[mind2,Ct] = min(D2,[],1); 
	Ct=Ct';
	e=mean(mind2);
end
