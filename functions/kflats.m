function [M,F,C,e] = kflats(X,k,m) %returns M d-by-k, F m-by-d-by-k, the assignment vector C and the training error e. M(:,j) is a point through which goes F_j and F(l,:,j) contains the l-th basis vector of F_j
	[d,n]=size(X);
	F=zeros(m,d,k);
	M=zeros(d,k); %centers of mass of the different clusters
	C_=init_kernel_kmeans(n,k); % generates a vector n x 1 with at least once each i in 1..k
	
	
	while true	
		[M,F] = compute_flats(X,C_,m,k);
		[C,mind2]=assignment_kflats(X,C_,F,M);
		
		if(C==C_)
			break;
		end
		C_=C;
	end
	e=mean(mind2);
end



