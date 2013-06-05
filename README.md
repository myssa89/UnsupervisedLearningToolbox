To use the toolbox:

You may need to type
>> addpath(genpath('functions')) 
before using the toolbox. 

Just type 
>> learning 
in Matlab to get information on the input parameters required and the different outputs according to the algorithm chosen. Only 2 parameters are required, the others have default values that are specified between squared brackets. 


Remarks:

I let kmeans_stable because I just implemented "fast" kmeans so there may be some bugs and I prefer to provide a stable version in case. 

Kernel k-flats is very sensitive to the values of the parameters. If you choose a dimension too big for the flat, it will not work (because the dimension of one of the cluster is too small to compute m eigenvectors).
