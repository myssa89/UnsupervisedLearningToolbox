function [C,mind2]=assignment_kkflats(k,C_,F,K) % C contains the assignments of the data points and mind2 = min_j d(phi(x_i),F_j)
	DC = distance_centers(C_,K,k);
	LP = length_proj(F,K,C_,k);
	D=DC-LP;
	[mind2,C] = min(D,[],1); 
	C=C';
end
