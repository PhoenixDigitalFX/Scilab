// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Sabine Gaüzere
// Copyright (C) 2010-2011 - DIGITEO - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->

function [x,y] = histcompute(n,data)
   //
   // Computes the histogram of a data.
   //
   // Parameters
   // n : a 1-by-1 matrix of floating point integers, the number of classes.
   // data : a matrix of doubles, the data
   // x : 1-by-n+1 matrix of doubles, the classes of the histogram
   // y : 1-by-n+1 matrix of doubles, the empirical probability that one value in data which fall in each class
   x = linspace(min(data), max(data), n+1);
   [ind , y] = dsearch(data, x)
   y = y./length(data)
endfunction

function checkLaw0arg ( name , cdffun , N , NC , rtol )
  //
  // Check the random number generator for a continuous distribution function.
  //
  // Parameters
  // name: a 1-by-1 string, the name of the distribution function
  // cdffun : a function, the Cumulated Distribution Function
  // NC : a 1-by-1 matrix of floating point integers, the number of classes
  // N : a 1-by-1 matrix of floating point integers, the number of random values to test
  // rtol : a 1-by-1 matrix of doubles, the relative tolerance
  //
  // Description
  //  Compare the empirical histogram with the theoretical histogram.

  R = grand(1,N,name);
  [X,EmpiricalPDF] = histcompute(NC,R);
  CDF = cdffun(X)
  TheoricPDF = diff(CDF);
  assert_checktrue( abs(EmpiricalPDF-TheoricPDF) < rtol );
    if ( %f ) then
      plot(X(1:$-1),EmpiricalPDF,"bo-"); // Empirical Histogram
      plot(X(1:$-1),TheoricPDF,"rox-"); // Theoretical Histogram
    end
endfunction

function checkLaw1arg ( name , cdffun , N , NC , A , rtol )
  //
  // Check the random number generator for a continuous distribution function.
  //
  // Parameters
  // name: a 1-by-1 string, the name of the distribution function
  // cdffun : a function, the Cumulated Distribution Function
  // NC : a 1-by-1 matrix of floating point integers, the number of classes
  // N : a 1-by-1 matrix of floating point integers, the number of random values to test
  // A : a 1-by-1 matrix of doubles, the value of the parameter
  // rtol : a 1-by-1 matrix of doubles, the relative tolerance
  //
  // Description
  //  Compare the empirical histogram with the theoretical histogram.

  R = grand(1,N,name,A);
  [X,EmpiricalPDF] = histcompute(NC,R);
  CDF = cdffun(X,A)
  TheoricPDF = diff(CDF);
  assert_checktrue( abs(EmpiricalPDF-TheoricPDF) < rtol );
    if ( %f ) then
      plot(X(1:$-1),EmpiricalPDF,"bo-"); // Empirical Histogram
      plot(X(1:$-1),TheoricPDF,"rox-"); // Theoretical Histogram
    end
endfunction

function checkLaw2arg ( name , cdffun , N , NC , A , B , rtol )
  //
  // Check the random number generator for a continuous distribution function.
  //
  // Parameters
  // name: a 1-by-1 string, the name of the distribution function
  // cdffun : a function, the Cumulated Distribution Function
  // NC : a 1-by-1 matrix of floating point integers, the number of classes
  // N : a 1-by-1 matrix of floating point integers, the number of random values to test
  // A : a 1-by-1 matrix of doubles, the value of the 1st parameter
  // B : a 1-by-1 matrix of doubles, the value of the 2nd parameter
  // rtol : a 1-by-1 matrix of doubles, the relative tolerance
  //
  // Description
  //  Compare the empirical histogram with the theoretical histogram.

  R = grand(1,N,name,A,B);
  [X,EmpiricalPDF] = histcompute(NC,R);
  CDF = cdffun(X,A,B)
  TheoricPDF = diff(CDF);
  assert_checktrue( abs(EmpiricalPDF-TheoricPDF) < rtol );
    if ( %f ) then
      plot(X(1:$-1),EmpiricalPDF,"bo-"); // Empirical Histogram
      plot(X(1:$-1),TheoricPDF,"rox-"); // Theoretical Histogram
    end
endfunction

function checkLaw3arg ( name , cdffun , N , NC , A , B , C , rtol )
  //
  // Check the random number generator for a continuous distribution function.
  //
  // Parameters
  // name: a 1-by-1 string, the name of the distribution function
  // cdffun : a function, the Cumulated Distribution Function
  // NC : a 1-by-1 matrix of floating point integers, the number of classes
  // N : a 1-by-1 matrix of floating point integers, the number of random values to test
  // A : a 1-by-1 matrix of doubles, the value of the 1st parameter
  // B : a 1-by-1 matrix of doubles, the value of the 2nd parameter
  // C : a 1-by-1 matrix of doubles, the value of the 3d parameter
  // rtol : a 1-by-1 matrix of doubles, the relative tolerance
  //
  // Description
  //  Compare the empirical histogram with the theoretical histogram.

  R = grand(1,N,name,A,B,C);
  [X,EmpiricalPDF] = histcompute(NC,R);
  CDF = cdffun(X,A,B,C)
  TheoricPDF = diff(CDF);
  assert_checktrue( abs(EmpiricalPDF-TheoricPDF) < rtol );
    if ( %f ) then
      plot(X(1:$-1),EmpiricalPDF,"bo-"); // Empirical Histogram
      plot(X(1:$-1),TheoricPDF,"rox-"); // Theoretical Histogram
    end
endfunction

function checkPieceLaw1arg ( name , cdffun , N , NC , A , rtol )
  //
  // Check the random number generator for a piecewise distribution function.
  //
  // Parameters
  // name: a 1-by-1 string, the name of the distribution function
  // cdffun : a function, the Cumulated Distribution Function
  // NC : a 1-by-1 matrix of floating point integers, the number of classes
  // N : a 1-by-1 matrix of floating point integers, the number of random values to test
  // A : a 1-by-1 matrix of doubles, the value of the parameter
  // rtol : a 1-by-1 matrix of doubles, the relative tolerance
  //
  // Description
  //  Compare the empirical histogram with the theoretical histogram.
  //  The classes of the histogram are computed from the random samples, 
  //  from which the unique entries are extracted.

  R=grand(N,1,name,A);
  X = unique(R);
  for k = 1 : size(X,"*")
    EmpiricalPDF(k) = length(find(R==X(k)));
  end
  EmpiricalPDF = EmpiricalPDF./N;
  CDF = cdffun(X,A)
  TheoricPDF=[CDF(1);diff(CDF)];
  assert_checktrue( abs(EmpiricalPDF-TheoricPDF) < rtol );
  if ( %f ) then
    plot(X,EmpiricalPDF,"bo-"); // Empirical Histogram
    plot(X,TheoricPDF,"rox-"); // Theoretical Histogram
  end
endfunction

function checkPieceLaw2arg ( name , cdffun , N , NC , A , B , rtol )
  //
  // Check the random number generator for a piecewise distribution function.
  //
  // Parameters
  // name: a 1-by-1 string, the name of the distribution function
  // cdffun : a function, the Cumulated Distribution Function
  // NC : a 1-by-1 matrix of floating point integers, the number of classes
  // N : a 1-by-1 matrix of floating point integers, the number of random values to test
  // A : a 1-by-1 matrix of doubles, the value of the parameter
  // rtol : a 1-by-1 matrix of doubles, the relative tolerance
  //
  // Description
  //  Compare the empirical histogram with the theoretical histogram.
  //  The classes of the histogram are computed from the random samples, 
  //  from which the unique entries are extracted.

  R=grand(N,1,name,A,B);
  X = unique(R);
  for k = 1 : size(X,"*")
    EmpiricalPDF(k) = length(find(R==X(k)));
  end
  EmpiricalPDF = EmpiricalPDF./N;
  CDF = cdffun(X,A,B)
  TheoricPDF=[CDF(1);diff(CDF)];
  assert_checktrue( abs(EmpiricalPDF-TheoricPDF) < rtol );
  if ( %f ) then
    plot(X,EmpiricalPDF,"bo-"); // Empirical Histogram
    plot(X,TheoricPDF,"rox-"); // Theoretical Histogram
  end
endfunction

function checkMeanVariance0arg ( m , n , name , mu , va , rtol )
  // Check the mean and variance of random numbers.
  //
  // Parameters
  // m : a 1-by-1 matrix of floating point integers, the number of rows
  // n : a 1-by-1 matrix of floating point integers, the number of columns
  // name: a 1-by-1 string, the name of the distribution function
  // mu : a 1-by-1 matrix of doubles, the expected mean
  // va : a 1-by-1 matrix of doubles, the expected variance. If va==[], then the variance is not checked.
  // rtol : a 1-by-1 matrix of doubles, the relative tolerance
  
  R=grand(m,n,name);
  assert_checkequal ( size(R) , [m,n] );
  assert_checkequal ( typeof(R) , "constant" );
  assert_checkalmostequal ( mean(R) , mu , rtol );
  if ( va<>[] ) then
    assert_checkalmostequal ( variance(R) , va , rtol );
  end
endfunction


function checkMeanVariance1arg ( m , n , name , A , mu , va , rtol )
  // Check the mean and variance of random numbers.
  //
  // Parameters
  // m : a 1-by-1 matrix of floating point integers, the number of rows
  // n : a 1-by-1 matrix of floating point integers, the number of columns
  // name: a 1-by-1 string, the name of the distribution function
  // A : a 1-by-1 matrix of doubles, the value of the parameter
  // mu : a 1-by-1 matrix of doubles, the expected mean
  // va : a 1-by-1 matrix of doubles, the expected variance. If va==[], then the variance is not checked.
  // rtol : a 1-by-1 matrix of doubles, the relative tolerance
  
  R=grand(m,n,name,A);
  assert_checkequal ( size(R) , [m,n] );
  assert_checkequal ( typeof(R) , "constant" );
  assert_checkalmostequal ( mean(R) , mu , rtol );
  if ( va<>[] ) then
    assert_checkalmostequal ( variance(R) , va , rtol );
  end
endfunction

function checkMeanVariance2arg ( m , n , name , A , B , mu , va , rtol )
  // Check the mean and variance of random numbers.
  //
  // Parameters
  // m : a 1-by-1 matrix of floating point integers, the number of rows
  // n : a 1-by-1 matrix of floating point integers, the number of columns
  // name: a 1-by-1 string, the name of the distribution function
  // A : a 1-by-1 matrix of doubles, the value of the 1st parameter
  // B : a 1-by-1 matrix of doubles, the value of the 2nd parameter
  // mu : a 1-by-1 matrix of doubles, the expected mean
  // va : a 1-by-1 matrix of doubles, the expected variance. If va==[], then the variance is not checked.
  // rtol : a 1-by-1 matrix of doubles, the relative tolerance
  
  R=grand(m,n,name,A,B);
  assert_checkequal ( size(R) , [m,n] );
  assert_checkequal ( typeof(R) , "constant" );
  assert_checkalmostequal ( mean(R) , mu , rtol );
  if ( va<>[] ) then
    assert_checkalmostequal ( variance(R) , va , rtol );
  end
endfunction
  

function checkMeanVariance3arg ( m , n , name , A , B , C , mu , va , rtol )
  // Check the mean and variance of random numbers.
  //
  // Parameters
  // m : a 1-by-1 matrix of floating point integers, the number of rows
  // n : a 1-by-1 matrix of floating point integers, the number of columns
  // name: a 1-by-1 string, the name of the distribution function
  // A : a 1-by-1 matrix of doubles, the value of the 1st parameter
  // B : a 1-by-1 matrix of doubles, the value of the 2nd parameter
  // C : a 1-by-1 matrix of doubles, the value of the 3d parameter
  // mu : a 1-by-1 matrix of doubles, the expected mean
  // va : a 1-by-1 matrix of doubles, the expected variance. If va==[], then the variance is not checked.
  // rtol : a 1-by-1 matrix of doubles, the relative tolerance
  
  R=grand(m,n,name,A,B,C);
  assert_checkequal ( size(R) , [m,n] );
  assert_checkequal ( typeof(R) , "constant" );
  assert_checkalmostequal ( mean(R) , mu , rtol );
  if ( va<>[] ) then
    assert_checkalmostequal ( variance(R) , va , rtol );
  end
endfunction

//
// Syntaxes
//
// Y=grand(m,n,'nor',Av,Sd)       : OK
// Y=grand(m,n,'poi',mu)          : OK
// Y=grand(m,n,'exp',Av)          : OK
// Y=grand(m,n,'bet',A,B)         : OK
// Y=grand(m,n,'bin',N,p)         : OK
// Y=grand(m,n,'gam',shape,scale) : OK
// Y=grand(m,n,'f',Dfn,Dfd)       : OK
// Y=grand(m,n,'chi', Df)         : OK
// Y=grand(m,n,'nbn',N,p)         : OK
// Y=grand(m,n,'nch',Df,Xnon)     : OK
// Y=grand(m,n,'nf',Dfn,Dfd,Xnon) : OK
// Y=grand(n,'mn',Mean,Cov)       : OK
// Y=grand(m,n,'geom', p)         : OK
// Y=grand(m,n,'def')             : OK
// Y=grand(m,n,'unf',Low,High)    : OK
// Y=grand(m,n,'uin',Low,High)    : OK
// Y=grand(n,'markov',P,x0)       : TODO
// Y=grand(n,'mul',nb,P)          : TODO
// Y=grand(n,'prm',vect)          : in grand_prm.tst
// Y=grand(m,n,'lgi')  : in grand_generators.tst
// S=grand('getgen')   : in grand_generators.tst
// grand('setgen',gen) : in grand_generators.tst
// S=grand('getsd')    : in grand_generators.tst
// grand('setsd',S)    : in grand_generators.tst

// For CLCG4 only:
// grand('setcgn',G)           : in grand_clcg4.tst
// S=grand('getcgn')           : TODO
// grand('initgn',I)           : in grand_clcg4.tst
// grand('setall',s1,s2,s3,s4) : in grand_clcg4.tst
// grand('advnst',K)           : TODO

//
// Rationale for the unit tests of random number generators.
//
// There are several ways to check the output of random number generators.
//
// 1. Uniform random number generators are based on deterministic integer sequences.
// These integers are then scaled into the [0,1[ interval.
// When we set the seed to a constant (e.g. seed = 0, or seed=123456),
// the doubles which are produced are always the same.
// This does not check the quality of the generator.
// But it does check that the generator under evaluation is, indeed, the 
// expected generator.
//
// 2. Non-uniform random numbers have a given mean and a variance which 
// can be predicted by there associated distribution function.
// The problem is there to set the relative tolerance. 
// The convergence of the sample mean to the expectation is driven by the
// law of large numbers. 
// The standard deviation of the sample mean is sigma/sqrt(n), 
// meaning that to reduce the shift by a factor 2, we have to use 4x more points. 
//
// 3. The quality of a random number generator can be assessed by 
// statistical tests. 
// The Kolmogorov-Smirnov test is based on the comparison between the 
// empirical CDF and the theoretical CDF. The difference between the two is 
// a random variable, which must evolve according to the Normal distribution function. 
// Then, the sum of the squares of the differences should evolve according to the 
// Chi-square distribution function. By inverting this last distribution, we can 
// compute the probability that the empirical distribution matches the theoretical distribution.
//
// 4. The empirical histogram must match the theoretical histogram. 
// The number of classes is NC.
// The classes XC are computed from NC and the actual output ; X has NC+1 entries.
// The empirical histogram is the probability that X is the intervals defined by X.
// The theoretical histogram is computed by differences 
// of the cumulated probability distribution function.
// The histograms can be graphically compared with the statements:
// plot(X(1:$-1),EmpiricalPDF,"bo-"); // Empirical Histogram
// plot(X(1:$-1),TheoricPDF,"rox-"); // Theoretical Histogram
//

//
// In this script, we check the non-uniform random numbers.
// We use the strategies #2 and #4.
// The strategy #3 should be used in a future version of the tests (it requires to 
// develop the kstest function).
//

rtol = 1.e-2;

// The number of classes in the histogram
// NC must be even.
NC = 2*12;
N=10000;

// Set the seed to always get the same random numbers
grand("setsd",0);

/////////////////////////////////////////////////////////////
//
// 'exp'
//

function p = mycdfexp(X,A)
  p = 1 - exp(-(1/A)*X);
endfunction

A = 20;
checkMeanVariance1arg ( 400 , 800 , 'exp' , A , A , A^2 , 2*rtol );
//
for A = linspace(0.1,50,10)
  checkLaw1arg ( "exp" , mycdfexp , N , NC , A , 2*rtol );
end


/////////////////////////////////////////////////////////////
//
// 'gam'
//

function p = mycdfgam (X,A,B)
  p = cdfgam("PQ",X,A*ones(X),B*ones(X));
endfunction

A = 5;
B = 3;
checkMeanVariance2arg ( 400 , 800 , 'gam' , A , B , A/B , A/(B^2) , rtol );
//
for A = linspace(1,15,4)
  for B = linspace(1,15,4)
    checkLaw2arg ( 'gam' , mycdfgam , N , NC , A , B , rtol );
  end
end
/////////////////////////////////////////////////////////////
//
// 'bet'
//

function p = mycdfbet (X,A,B)
  p = cdfbet("PQ",X,1-X,A*ones(X),B*ones(X));
endfunction

A=3;
B=10;
checkMeanVariance2arg ( 400 , 800 , 'bet' , A , B , A/(A+B) , (A*B)/((A+B)^2*(A+B+1)) , rtol );
//
for A = linspace(1,20,4)
  for B = linspace(1,20,4)
    checkLaw2arg ( 'bet' , mycdfbet , N , NC , A , B , 2*rtol );
  end
end

/////////////////////////////////////////////////////////////
//
// 'poi'
//
// Caution : this is a piecewise distribution

function p = mycdfpoi (X,A)
  p = cdfpoi("PQ",X,A*ones(X));
endfunction

A = 10;
checkMeanVariance1arg ( 400 , 800 , 'poi' , A , A , A , rtol );
//
for A = floor(linspace(50,70,10))
  checkPieceLaw1arg ( 'poi' , mycdfpoi , N , NC , A , rtol );
end

/////////////////////////////////////////////////////////////
//
// 'bin'
//
// Caution : this is a piecewise distribution

function p = mycdfbin (X,A,B)
  p = cdfbin("PQ",X,A*ones(X),B*ones(X),(1-B)*ones(X));
endfunction

A = 10;
B = 0.4;
checkMeanVariance2arg ( 400 , 800 , 'bin' , A , B , A*B , A*B*(1-B) , rtol );
//
for A = floor(linspace(10,50,4))
for B = linspace(0.1,0.9,4)
  checkPieceLaw2arg ( 'bin' , mycdfbin , N , NC , A , B , 2*rtol );
end
end

/////////////////////////////////////////////////////////////
//
// 'nor'
//

function p = mycdfnor (X,A,B)
  p = cdfnor("PQ",X,A*ones(X),B*ones(X));
endfunction

A = 7;
B = 12;
checkMeanVariance2arg ( 400 , 800 , 'nor' , A , B , A , B^2 , rtol );
//
//
for A = linspace(1,20,4)
  for B = linspace(1,20,4)
    checkLaw2arg ( 'nor' , mycdfnor , N , NC , A , B , rtol );
  end
end

/////////////////////////////////////////////////////////////
//
// 'f'
//

function p = mycdff (X,A,B)
  p = cdff("PQ",X,A*ones(X),B*ones(X));
endfunction

//
// Increase the tolerance for this test.
A = 7;
B = 12;
checkMeanVariance2arg ( 400 , 800 , 'f' , A , B , B/(B-2) , (2*B^2*(A+B-2))/(A*(B-2)^2*(B-4)) , 4*rtol );
//
for A = floor(linspace(1,20,4))
  for B = floor(linspace(5,20,4))
    checkLaw2arg ( 'f' , mycdff , N , NC , A , B , 2*rtol );
  end
end

/////////////////////////////////////////////////////////////
//
// 'chi'
//

function p = mycdfchi (X,A)
  p = cdfchi("PQ",X,A*ones(X));
endfunction

A = 7;
checkMeanVariance1arg ( 400 , 800 , 'chi' , A , A , 2*A , rtol );

// Increase the tolerance for this test.
for A = floor(linspace(1,20,10))
    checkLaw1arg ( 'chi' , mycdfchi , N , NC , A , 2*rtol );
end

/////////////////////////////////////////////////////////////
//
// 'nbn'
//
// This is a piecewise function.

function p = mycdfnbn (X,A,B)
  p = cdfnbn("PQ",X,A*ones(X),B*ones(X),(1-B)*ones(X));
endfunction

A = 7;
B = 0.1;
checkMeanVariance2arg ( 400 , 800 , 'nbn' , A , B , A*(1-B)/B , A*(1-B)/B^2 , rtol );

// Increase the tolerance for this test.
for A = floor(linspace(1,20,4))
for B = linspace(0.1,0.9,4)
    checkPieceLaw2arg ( 'nbn' , mycdfnbn , N , NC , A , B , 2*rtol );
end
end

/////////////////////////////////////////////////////////////
//
// 'nch'
//

function p = mycdfnch (X,A,B)
  p = cdfchn("PQ",X,A*ones(X),B*ones(X));
endfunction

A = 4;
B = 3;
checkMeanVariance2arg ( 400 , 800 , 'nch' , A , B , A+B , 2*(A+2*B) , rtol );

for A = floor(linspace(1,20,4))
for B = floor(linspace(1,20,4))
    checkLaw2arg ( 'nch' , mycdfnch , N , NC , A , B , 2*rtol );
end
end
/////////////////////////////////////////////////////////////
//
// 'nf'
// http://mathworld.wolfram.com/NoncentralF-Distribution.html
//

function p = mycdfnf (X,A,B,C)
  p = cdffnc("PQ",X,A*ones(X),B*ones(X),C*ones(X));
endfunction

A = 4;
B = 3;
C = 10;
checkMeanVariance3arg ( 400 , 800 , 'nf' , A , B , C , ((C+A)*B)/(A*(B-2)) , [] , 4*rtol );

for A = floor(linspace(1,20,4))
for B = floor(linspace(1,20,4))
for C = floor(linspace(1,20,4))
    checkLaw3arg ( 'nf' , mycdfnf , N , NC , A , B , C , 2*rtol );
end
end
end

/////////////////////////////////////////////////////////////
//
// "mn"
//

n = 2^16;
A = [1;2;3];
// The covariance matrix B is symetric, positive definite.
// Its diagonal entries are [4;6;5], the variances.
B = [4,2,3;2,6,4;3,4,5];
  R=grand(n,"mn",A,B);
  assert_checkequal ( size(R) , [3,n] );
  assert_checkequal ( typeof(R) , "constant" );
  assert_checkalmostequal ( mean(R,"c") , A , 2*rtol );
  assert_checkalmostequal ( variance(R,"c") , [4;6;5] , rtol );
//
// No CDF for this function => no histogram test. 

/////////////////////////////////////////////////////////////
//
// "geom"
// http://en.wikipedia.org/wiki/Geometric_distribution
//

A = 0.1;
checkMeanVariance1arg ( 400 , 800 , "geom" , A , 1/A , (1-A)/A^2 , rtol );

function p = mycdfgeom (X,A)
  p = 1 -(1-A)^X
endfunction
//
for A = linspace(0.1,0.9,10)
   checkPieceLaw1arg ( "geom" , mycdfgeom , N , NC , A , 2*rtol );
end

/////////////////////////////////////////////////////////////
//
// "unf"
// http://en.wikipedia.org/wiki/Uniform_distribution_(continuous)
//

A = 0.1;
B = 2.3;
checkMeanVariance2arg ( 400 , 800 , "unf" , A , B , (A+B)/2 , (B-A)^2/12 , rtol );

function p = mycdfunf (X,A,B)
  p = (X-A)/(B-A)
endfunction
//
for A = linspace(0.1,0.9,4)
for B = linspace(2.5,4.2,4)
   checkLaw2arg ( "unf" , mycdfunf , N , NC , A , B , rtol );
end
end

/////////////////////////////////////////////////////////////
//
// "uin"
// http://en.wikipedia.org/wiki/Uniform_distribution_(discrete)
//
// Piecewise.

A = 10;
B = 20;
checkMeanVariance2arg ( 400 , 800 , "uin" , A , B , (A+B)/2 , ((B-A+1)^2-1)/12 , rtol );

function p = mycdfuin (X,A,B)
  p = (floor(X)-A+1)/(B-A+1)
endfunction
//
for A = floor(linspace(10,20,4))
for B = floor(linspace(30,40,4))
   checkPieceLaw2arg ( "uin" , mycdfuin , N , NC , A , B , rtol );
end
end

/////////////////////////////////////////////////////////////
//
// "def"
// http://en.wikipedia.org/wiki/Uniform_distribution_(continuous)
//

checkMeanVariance0arg ( 400 , 800 , "def" , 1/2 , 1/12 , rtol );

function p = mycdfdef (X)
  p = X
endfunction
//
checkLaw0arg ( "def" , mycdfdef , N , NC , rtol );



