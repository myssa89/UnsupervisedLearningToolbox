function [X] = generate_ellipsoid(n,a,b,c)
	X=generatedata_sphere(3,n);
	X(1,:)=X(1,:)*a;
	X(2,:)=X(2,:)*b;
	X(3,:)=X(3,:)*c;
end