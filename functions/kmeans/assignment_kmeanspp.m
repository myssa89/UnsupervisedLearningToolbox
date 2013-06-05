function [D2,mind2,argmind2] = assignment_kmeanspp(X,M,j,D2,argmind2,mind2) %D2 ~(j-1,n) : distance X to j-1 first means; argmind2~(n,1) contains the assignments to the j-1 first means, mind2 is the best distances for the j-1 first means ( mind2(i)=d(x_i,m_{C(i)})  )
	%j is the number of means currently available
	n=size(X,2);
	X_j=bsxfun(@minus, X, M(:,j)); 
	d_j = sum(X_j.^2, 1);
	D2(j,:) = d_j;
	ind = find(d_j < mind2);  % for each point, you only need to compare the distance to the new mean with the best distance at the previous step
	argmind2(ind) = j;  % we change the assignments only for the points that are closer to the new mean
	mind2(ind)=d_j(ind);
end


