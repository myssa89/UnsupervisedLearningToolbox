function [Y] = add_noise(X,sigma_noise)
	[d,n]=size(X);
	epsilon = zeros(d,n);
	epsilon= sigma_noise .* randn(d,n); 
	Y=X+epsilon;
end
