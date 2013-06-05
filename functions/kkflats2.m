function [F,C,e] = kkflats2(K,k,m) %F is m*n*k and (for a given k, a line contains the coefficients a_i so that u_i=sum(a_i*\phi(x_i)) )

%pay attention to the fact that if k and m are too large, the program will not work as the kernel matrix on each cluster is of size rougly (n/k) and you need m eigenvectors so m > size of each cluster !
	n=size(K,1);
	e=1e10;
	C_=init_kernel_kmeans(n,k); % generates a vector n x 1 with at least once each i in 1..k
	while true	
		[F] = compute_kkflats(C_,m,k,K);
		[C,mind2]=assignment_kkflats(k,C_,F,K);
		
		if(C==C_)
			break;
		end
		C_=C;
	end
	e=mean(mind2);
end



