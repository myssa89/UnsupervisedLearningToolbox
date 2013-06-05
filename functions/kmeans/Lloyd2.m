function [M,C,mind2]= Lloyd2(X,k,C_) %one iteration of Lloyd's algo, that is mean update and assignment update
	[d,n]=size(X);
	M=zeros(d,k);
	for i=1:k
		ind = find(C_==i);
		N=size(ind,2);
		M(:,i)=sum(X(:,ind),2)./N;
	end			
	[mind2,C]=assignment_kmeans_light2(X,M,k); %update the assignments
end

