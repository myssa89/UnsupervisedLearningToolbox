function [C,D2,e] = kernel_kmeans2(K,k) %returns the assignment vector and the training vector using the kernel matrix K
	[n]= size(K,2);
	C_=init_kernel_kmeans(n,k);
	
	while true
		[C,D2,mind2]=assignment_kkmeans(k,K,C_);
		
		% if we want to have exactly k clusters at the convergence, we must test if each i in 1..k appears once in the vector
		ind = find_first_empty_cluster(C,k);
		if(ind~=-1) % we have less than k clusters
			[ma,imax]=max(mind2);
			C(imax)=ind;
		else
			if(C==C_)
				break;
			end
		end
				
		C_=C;
	end	
	
	e=mean(mind2);
end
