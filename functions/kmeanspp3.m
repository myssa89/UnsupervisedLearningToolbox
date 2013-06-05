function [e,M,argmind2] = kmeanspp3(X,k) 
	[d,n]=size(X);
	[e,M,argmind2_]=kmeanspp_withoutL2(X,k);	%initialization
	M=zeros(d,k);
	while true
		[M,argmind2,mind2]= Lloyd2(X,k,argmind2_); %run once the Lloyd algo
		if argmind2 == argmind2_                        % condition of convergence
			break;
		end;
	argmind2_ = argmind2;
	end
	e=mean(mind2);
	argmind2=argmind2';
end
	
	
