function [D] = distance_test_training_gaussian_kernel(X,T,sigma) %D is npoints x ntest and contains d(phi(x_i),phi(y_j)) where the x form the training set and y the testing set and phi is the map associated to the gaussian kernel
	n1 = size(X,2);
	n2 = size(T,2);
	for i = 1:n1
		for j = 1:n2
			D(i,j) = expo(X(:,i),T(:,j),sigma);
		end
	end

end

function [y] = expo(x,y,sigma)
	y = exp(-norm((x-y))^2/(2*sigma^2));
end
