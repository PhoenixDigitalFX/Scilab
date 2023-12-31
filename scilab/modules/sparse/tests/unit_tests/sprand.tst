// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010-2011 - DIGITEO - Michael Baudin
// Copyright (C) 2018 - Samuel GOUGEON
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

// Unitary tests of sprand()
// =========================

// Check default "typ" = "uniform"
grand("setsd",0);
nrows = 1000;
ncols = 2000;
density = 1/100;
s=sprand(nrows,ncols,density);
assert_checkequal ( size(s) , [nrows,ncols] );
nnzs=nnz(s);
[ij,values]=spget(s);
assert_checkequal ( min(values) >= 0 , %t );
assert_checkequal ( max(values) <= 1 , %t );
assert_checkalmostequal ( mean(values) , 0.5 , 1.e-2 );

// Get empty matrix
s=sprand(0,0,0.01);
assert_checkequal ( s , sparse([],[],[0,0]) );

// Test the scientific part
// In the following script, we check that the entries of the matrix have the expected distribution.
// We use the spget function in order to get the nonzero entries.
// Then we compute the min, mean and max of the entries and compare them with the limit values.

grand("setsd",0);
typ = "normal";
nrows = 1000;
ncols = 2000;
density = 1/100;
s=sprand(nrows,ncols,density,typ);
assert_checkequal ( size(s) , [nrows,ncols] );
nnzs=nnz(s);
[ij,values]=spget(s);
assert_checkequal ( nnzs > 10000 , %t );
assert_checkequal ( min(values) < -3 , %t );
assert_checkalmostequal ( mean(values) , 0 , [] , 1.e-2 );
assert_checkequal ( max(values) > 3 , %t );
assert_checkalmostequal ( variance(values) , 1 , 2.2e-2 );

grand("setsd",0);
typ = "uniform";
nrows = 1000;
ncols = 2000;
density = 1/100;
s=sprand(nrows,ncols,density,typ);
assert_checkequal ( size(s) , [nrows,ncols] );
nnzs=nnz(s);
[ij,values]=spget(s);
assert_checkequal ( nnzs > 10000 , %t );
assert_checkalmostequal ( min(values) , 0 , [] , 1.e-2 );
assert_checkalmostequal ( mean(values) , 0.5 , 1.e-2 );
assert_checkalmostequal ( max(values) , 1 , 1.e-2 );
assert_checkalmostequal ( variance(values) , 1/12 , 1.e-2 );

// In the following script, we check that the entry indices,
// which are also chosen at random, have the correct distribution.
// We generate kmax sparse random matrices with uniform distribution.
// For each matrix, we consider the indices of the nonzero entries
// which were generated, i.e. we see if the event Aij = {the entry (i,j) is nonzero}
// occurred for each i and j, for i=1,2,...,nrows and j=1,2,...,ncols.
// The matrix C(i,j) stores the number of times that the event Aij occurred.
// The matrix R(k) stores the actual density of the try number k, where k=1,2,...,kmax.

grand("setsd",0);
kmax = 1000;
ncols=100;
nrows=100;
density=0.01;
typ="uniform";
C=zeros(nrows,ncols);
R=[];
for k=1:kmax
  M=sprand(nrows,ncols,density,typ);
  NZ=find(M<>0);
  NZratio = size(NZ,"*")/(nrows*ncols);
  R=[R NZratio];
  C(NZ)=C(NZ)+1;
end
// Now that this algorithm has been performed (which may require some time),
// we can compute elementary statistics to check that the algorithm performed well.

// The average number should be close to the expectation.
assert_checkalmostequal ( density*kmax , mean(C) , 1.e-2 );
// The density should be close to expected density
assert_checkalmostequal ( density , mean(R) , 1.e-2 );

// More deeper tests should involve the particular distribution of
// C, which follows a binomial law.
// May be a chi-square test should be used for this.

// CHECK THE ACTUAL DENSITY
// ------------------------
clc
grand("setsd",0);
for n = [100 1000 1e4 1e5 1e6]
    for d = [1e-5 3e-5 1e-4 3e-4 1e-3 0.003 0.01 0.03 0.1 0.3 1]
        clear m
        for i = 1:min(5e6/n, 50)
            s = sprand(1,n,d);
            m(i) = nnz(s);
        end
        assert_checkalmostequal(mean(m), d*n, 1e-3, 2);
    end
end
