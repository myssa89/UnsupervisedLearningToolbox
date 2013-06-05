function [minq,meanq,medq,maxq]= choose_sigma_vol(X,q) % provides several choices of sigma: meanq is the value of sigma such that the neighboorhood of a point contains in average q points


D=distances(X);
D=sort(D,2);
v=D(:,q+1); %contains the values of the radiuses such that B(x_i,v(i)) contains q points 
minq=min(v);
maxq=max(v);
meanq=mean(v);
medq=median(v);
end
