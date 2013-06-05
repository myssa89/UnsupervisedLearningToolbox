function [e,M,argmind2] = kmeanspp2(X,k) %e the training error at the end, argmind2 the assignment vector, M the means

	[d,n]=size(X);
	[e,M,argmind2_]=kmeanspp_withoutL(X,k);	%initialization
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
	
	
