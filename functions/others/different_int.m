function [ind] = different_int(d,D) %generates a vector of size d with different values between 1 and D
	ind=zeros(d,1);
	ind(1)= randi(D,1);
	for j=2:d
		p=randi(d,1);
			while true
			q=randi(D,1);
				if(isempty( find( ind==q ) )) 
					while (ind(p)~=0)
						if(p==d)
							p=1;
						else
							p=p+1;
						end
					end
					ind(p)=q;
					break;
				end
			end
	end
		
end
