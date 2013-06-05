function [ind] = find_first_empty_cluster(C_,k) %returns the indice of the first empty cluster and -1 if there is not any empty cluster
	ind=-1;
	for i = 1:k
		if(isempty(find(C_==i)))
			ind=i;
			break;
		end
	end
end