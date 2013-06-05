function [X]= generatedata_sphere_inbigspace(d,D,npoints)  %X is D x n but only d components are non zero
	ind = different_int(d,D); % choose the axis on which the sphere will be
	X=zeros(D,npoints);
	Y = randn(d,npoints);
	for i = 1:npoints
		NO(i)=norm(Y(:,i));
		Y(:,i)=Y(:,i)./ NO(i);
	end
	for j=1:d
		X(ind(j),:)=Y(j,:);
	end
end
