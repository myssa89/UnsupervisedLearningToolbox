**Author:** Sammy El Ghazzal  
**Date of creation:** April - August 2012   
**Date of first commit:** June 2013  

Please report any bug or send feedback to myssa89 (at) gmail (dot) com

## Purpose 
    
I wrote this toolbox when doing research at MIT in the Spring 2012. I included the technical report I wrote in the toolbox so that you can take a look if you are interested.

I used it to run simulations on various datasets (mainly simulated data). The goal was to study the influence of the free parameter k of k-means (similarly for k-flats) on the testing error (a.k.a. generalization error). In particular, I studied some non-trivial behavior (the error starts going up after a certain point) of the error when using high-dimensional data.     

## Contents
  
Basically the toolbox contains the following algorithms (see the report for basic explanations and/or further references): 
* k-means with different initializations (random, k-means++)
* global k-means
* kernel k-means
* k-flats
* kernel k-flats

The repo also contains the following files:
* technical\_report.pdf: this is the technical report I wrote at the end of my internship. It is focused on the mathematical aspects of the algorithms but gives a succint idea of how the implementation works.
* slides\_presentation: this is the set of slides I used for the oral presentation I gave at the Ecole Polytechnique. 

## Using the toolbox (quick and dirty)

  You may need to type  
      `>> addpath(genpath('functions'))`  
  before using the toolbox. 
 
  Just type   
      `>> learning`   
  in Matlab to get information on the input parameters required and the different outputs according to the algorithm chosen. Only 2 parameters are required, the others have default values that are specified between squared brackets. 

## Remarks

* I let kmeans\_stable in the toolbox because I just implemented "fast" kmeans so there may be some bugs and I prefer to provide a stable version in case. 
* Kernel k-flats is very sensitive to the values of the parameters. If you choose a dimension too big for the flat, it will not work (because the dimension of one of the cluster is too small to compute m eigenvectors).
* If you want to use the toolbox on your custom dataset (non-simulated for instance), you can see how to call the appropriate functions by looking at the file learning.m. 
