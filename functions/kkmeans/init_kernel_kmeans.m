function [C_]=init_kernel_kmeans(n,k) % creates a vector with n components and each integer in 1:k appears at least once
	C_=-1*ones(n,1);
	for i=1:n
		j=mod(i,k)+1;
		p=randi(n,1,1);
		while (C_(p)~=-1)
			if(p==n)
				p=1;
			else
				p=p+1;
			end
		end
		C_(p)=j;
	end
end