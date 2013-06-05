function [output] = learning(n,d,ds,algo,ksteps,tf,nseeds,m,plotf,light,kernel,noise)

	addpath(genpath('functions'));
	if(nargin<2)
		explanations();
	end
	
	default_ds='sphere';
	default_algo='kmeans';
	default_ksteps=n;
	default_tf=10;
	default_nseeds=10;
	default_m=1;
	default_plotf='y';
	default_light='y';
	default_kernel='gaussian';
	default_noise=0;
	
	switch nargin
		case 2
			ds=default_ds;
			algo=default_algo;
			ksteps=default_ksteps;
			tf=default_tf;
			nseeds=default_nseeds;
			m=default_m;
			plotf=default_plotf;
			light=default_light;
			kernel=default_kernel;
			noise=default_noise;
		case 3
			algo=default_algo;
			ksteps=default_ksteps;
			tf=default_tf;
			nseeds=default_nseeds;
			m=default_m;
			plotf=default_plotf;
			light=default_light;
			kernel=default_kernel;
			noise=default_noise;
		case 4
			ksteps=default_ksteps;
			tf=default_tf;
			nseeds=default_nseeds;
			m=default_m;
			plotf=default_plotf;
			light=default_light;
			kernel=default_kernel;
			noise=default_noise;
		case 5
			tf=default_tf;
			nseeds=default_nseeds;
			m=default_m;
			plotf=default_plotf;
			light=default_light;
			kernel=default_kernel;
			noise=default_noise;
		case 6
			nseeds=default_nseeds;
			m=default_m;
			plotf=default_plotf;
			light=default_light;
			kernel=default_kernel;
			noise=default_noise;
		case 7
			m=default_m;
			plotf=default_plotf;
			light=default_light;
			kernel=default_kernel;
			noise=default_noise;
		case 8
			plotf=default_plotf;
			light=default_light;
			kernel=default_kernel;
			noise=default_noise;
		case 9
			light=default_light;
			kernel=default_kernel;
			noise=default_noise;
		case 10
			kernel=default_kernel;
			noise=default_noise;
		case 11
			noise=default_noise;
	end
	
	[kvect,X,T,dim] = construct_data(ds,tf,n,d,ksteps,noise);
	
	switch algo
		case 'kmeans'
	
			teste=1e10*ones(1,ksteps);
			traine=1e10*ones(1,ksteps);
			h=waitbar(0,'Processing');
			for i=1:ksteps
				k=kvect(i);
				M_=zeros(dim,k);
				C_=zeros(n,1);
				for j=1:nseeds
					%[e,M,C] = kmeanspp2(X,k);
					[e,M,C] = kmeanspp3(X,k);
					if(e<traine(i))
						traine(i)=e;
						M_=M;
						C_=C;
					end
				end
				[teste(i),Ct]=error_distri3(M_,T);
				waitbar(i/ksteps);
			end
			close(h);
			
			if((light=='n')&&(ksteps==1))
				output=struct('k',kvect,'train',traine,'test',teste,'Ctrain',C_,'Ctest',Ct,'M',M_,'T',T,'X',X);
			else
				output=struct('k',kvect,'train',traine,'test',teste);	
			end
			
			plot_result(output,plotf,algo,ds,d,n,tf,nseeds);
				
		case 'kmeans_stable'
	
			teste=1e10*ones(1,ksteps);
			traine=1e10*ones(1,ksteps);
			h=waitbar(0,'Processing');
			for i=1:ksteps
				k=kvect(i);
				M_=zeros(dim,k);
				C_=zeros(n,1);
				for j=1:nseeds
					[e,M,C] = kmeanspp2(X,k);
					%[e,M,C] = kmeanspp3(X,k);
					if(e<traine(i))
						traine(i)=e;
						M_=M;
						C_=C;
					end
				end
				[teste(i),Ct]=error_distri3(M_,T);
				waitbar(i/ksteps);
			end
			close(h);
			
			if((light=='n')&&(ksteps==1))
				output=struct('k',kvect,'train',traine,'test',teste,'Ctrain',C_,'Ctest',Ct,'M',M_,'T',T,'X',X);
			else
				output=struct('k',kvect,'train',traine,'test',teste);	
			end
			
			plot_result(output,plotf,algo,ds,d,n,tf,nseeds);
				
		case 'kkmeans'
		
			[K,Ktest,D]=kernel_stuff(kernel,X,T);
			teste=1e10*ones(1,ksteps);
			traine=1e10*ones(1,ksteps);
			h=waitbar(0,'Processing');
			for i=1:ksteps
				k=kvect(i);
				C_=zeros(n,1);
				for j=1:nseeds
					[C,D2,e] = kernel_kmeans2(K,k);
					if(e<traine(i))
						traine(i)=e;
						C_=C;
					end
				end
				[teste(i),Ct] = error_distri_kkmeans2(C_,T,X,Ktest,K,k,D);
				waitbar(i/ksteps);
			end
			close(h);
			
			if((light=='n')&&(ksteps==1))
				output=struct('k',kvect,'train',traine,'test',teste,'Ctrain',C_,'Ctest',Ct,'T',T,'X',X);
			else
				output=struct('k',kvect,'train',traine,'test',teste);	
			end
			
			plot_result(output,plotf,algo,ds,d,n,tf,nseeds);
			
		case 'kflats'
				
			teste=1e10*ones(1,ksteps);
			traine=1e10*ones(1,ksteps);
			h=waitbar(0,'Processing');
			for i=1:ksteps
				k=kvect(i);
				M_=zeros(dim,k);
				F_=zeros(m,dim,k);
				C_=zeros(n,1);
				for j=1:nseeds
					[M,F,C,e] = kflats(X,k,m);
					if(e<traine(i))
						traine(i)=e;
						M_=M;
						F_=F;
						C_=C;
					end
				end
				[teste(i),Ct]=test_error_kflats(T,F_,M_);
				waitbar(i/ksteps);
			end
			close(h);
			if((light=='n')&&(ksteps==1))
				output=struct('k',kvect,'train',traine,'test',teste,'Ctrain',C_,'Ctest',Ct,'F',F_,'M',M_,'T',T,'X',X);
			else
				output=struct('k',kvect,'train',traine,'test',teste);	
			end

			plot_result(output,plotf,algo,ds,d,n,tf,nseeds);		
		
		case 'kkflats'
		
			[K,Ktest,D]=kernel_stuff(kernel,X,T);
			teste=1e10*ones(1,ksteps);
			traine=1e10*ones(1,ksteps);
			h=waitbar(0,'Processing');
			for i=1:ksteps
				k=kvect(i);
				F_=zeros(m,dim,k);
				C_=zeros(n,1);
				for j=1:nseeds
					[F,C,e] = kkflats2(K,k,m); 
					if(e<traine(i))
						traine(i)=e;
						C_=C;
						F_=F;
					end
				end
				[teste(i),Ct] = test_error_kkflats(F_,Ktest,K,C_,k,D);
				waitbar(i/ksteps);
			end
			
			close(h);
			if((light=='n')&&(ksteps==1))
				output=struct('k',kvect,'train',traine,'test',teste,'Ctrain',C_,'Ctest',Ct,'T',T,'X',X);
			else
				output=struct('k',kvect,'train',traine,'test',teste);	
			end
			plot_result(output,plotf,algo,ds,d,n,tf,nseeds);	
			
		case 'global_kmeans'
			if(size(kvect,2)~=1)
				k=input('Please enter the value of k you desire [n] \n');
				if(isempty(k))
					k=n;
				end
			end
			kvect=linspace(1,k,k);
			M_=zeros(dim,k*(k+1)/2);
			C_=zeros(n,k);
			teste=1e10*ones(1,k);
			traine=1e10*ones(1,k);
			s_=1e10;
			h=waitbar(0,'Processing');
			for j=1:nseeds
				[M,Cfull,E] = global_kmeans(X,k);
				s=sum(E);
				if(s<s_)
					traine=E;
					C_=Cfull;
					s_=s;
					M_=M;
				end
				waitbar(j/nseeds);
			end
			close(h);
			for i=1:k
				M_i=M(:,i*(i-1)/2+1:i*(i+1)/2);
				[teste(i),Ct(:,i)]=error_distri3(M_i,T);
			end
			
			if(light=='n')
				output=struct('k',kvect,'train',traine,'test',teste,'Ctrain',C_,'Ctest',Ct,'T',T,'X',X,'M',M_);
			else
				output=struct('k',kvect,'train',traine,'test',teste);	
			end
			plot_result(output,plotf,algo,ds,d,n,tf,nseeds);
	end
	
	
end

function [] = plot_result(o,plotf,algo,ds,d,n,tf,nseeds)

	if(plotf=='y')
			figure;
			plot(o.k,o.train,'*');
			xlabel('k');
			ylabel('Training error');
			title([algo ' for ' ds ' with d=' num2str(d) ', ' 'n=' num2str(n) ', nseeds=' num2str(nseeds) ', and ' 'tf=',num2str(tf)]);
			
			figure;
			plot(o.k,o.test,'*');
			xlabel('k');
			ylabel('Testing error');
			title([algo ' for ' ds ' with d=' num2str(d) ', ' 'n=' num2str(n) ', nseeds=' num2str(nseeds) ', and ' 'tf=',num2str(tf)]);
			
			
	end

end

function [K,Ktest,D]=kernel_stuff(kernel,X,T)
	n=size(X,2);
	switch kernel
				case 'gaussian'
					sigma = input('Please provide a value of sigma for the gaussian kernel. (Put -1 to let the program choose) [0.1] \n');
					if(isempty(sigma))
						sigma=0.1;
					end
					if(sigma==-1)
						[minq,meanq,medq,maxq]= choose_sigma_vol(X,floor(n/10));
						sigma=medq;	
					end
					K=gaussian_kernel(X,sigma);
					Ktest=gaussian_kernel(T,sigma);
					D = distance_test_training_gaussian_kernel(X,T,sigma);
	end
end

function [x] = ask_axis(nb)
	x=input(['What size for the ' nb ' axis [1] ? \n']);
	if(isempty(x))
		x=1;
	end
end

function [kvect,X,T,dim] = construct_data(ds,tf,n,d,ksteps,noise)
	ntest=tf*n;
	
	switch ds
		case 'sphere'
			X=generatedata_sphere(d,n+ntest);
		case 'trefoil3d'
			X=generatedata_trefoil(n+ntest);
		case 'trefoil'
			ntot=input('How many points to generate the trefoil [10] ? \n');
			if(isempty(ntot))
				ntot=10;
			end
			X=generatedata_embedded_trefoil(n+ntest,d,ntot);
		case 'embedded_sphere'
			Dtot=input('How many dimensions in total [2n] ? \n');
			if(isempty(Dtot))
				Dtot=2*n;
			end
			generatedata_sphere_inbigspace(d,Dtot,n+ntest); 
		case 'ellipsoid'
			a=ask_axis('first');
			b=ask_axis('second');
			c=ask_axis('third');
			X=generate_ellipsoid(n+ntest,a,b,c);
	end
	
	if(noise~=0)
		X=add_noise(X,noise);
	end
	T=X(:,n+1:n+ntest);
	X=X(:,1:n);
	dim=size(X,1);
	
	kvect = zeros(1,ksteps);
	if(ksteps==1)
		kv=input('What value of k do you want [1] ? \n');
		if(isempty(kv))
			kvect=[1];
		else
			kvect=[kv];
		end
	else
		temp = 1+floor((n-1)/(ksteps-1))*linspace(1,ksteps-1,ksteps-1);
		kvect=[1,temp];
	end
end

function [] = explanations()
		disp('Arguments: n,d,ds,algo,ksteps,tf,nseeds,m,plotf,light,kernel,noise');
		disp('n: sample size ');
		disp('d: dimension of the data set ');
		disp('ds = {sphere,trefoil3d,trefoil,embedded_sphere,ellipsoid} [sphere]');
		disp('algo = {kmeans,kmeanspp,kflats,kkflats,global_kmeans,kmeans_stable} [kmeans]');
		disp('ksteps: number of values of k [n]');
		disp('m: dimension of the flats [1]');
		disp('plotf = {y,n}  [y]');
		disp('light = {y,n} [y]');
		disp('kernel = {gaussian} [gaussian]');
		disp('noise: width of the noise [0]');
		disp(' ');
		disp('Output light version: output = {k,train,test}');
		disp('Output kmeans/global_kmeans/kmeans_stable no-light version: output = {k,train,test,Ctrain,Ctest,X,T,M}');	
		disp('Output kkmeans no-light version: output = {k,train,test,Ctrain,Ctest,X,T}');	
		disp('Output kflats no-light version: output = {k,train,test,Ctrain,Ctest,X,T,M,F}');
		disp('Output kkflats no-light version: output = {k,train,test,Ctrain,Ctest,X,T}');
		disp(' ');
		disp('Legends:');
		disp('k: vector containing the values of k used');
		disp('train: training error');
		disp('test: testing error');
		disp('X: training set');
		disp('T: testing set');
		disp('Ctrain: assignment vector of the training set');
		disp('Ctest: assignment vector of the training set');
		disp('M: means of the clusters (k-means) or points through which the flats go (k-flats)');
		disp('F: directions of the flats');
		
end




