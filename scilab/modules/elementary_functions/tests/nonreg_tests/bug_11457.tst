// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Antoine ELIAS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 11457 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/11457
//
// <-- Short Description -->
// gsort crashed when get string data from stack after big stacksize.

//thanks at Joe Seale for sample code to reproduce this bug

maxN = 16;                                                  // maximum polynomial order sought
x = poly(0,"x");                                            // starting polynomial to work with
LegPolys = [1,x];                                           // starting array of Legendre polynomials
for np1=2:maxN                                              // np1 = n+1, next poly order, start: 2
    n=np1-1;                                                // n: last poly order defined, start: 1
    polynp1 = ((2*n+1)*x*LegPolys(np1)-n*LegPolys(n))/np1;  // next polynomial by recursion
    LegPolys = [ LegPolys , polynp1 ] ;                     // add polynomial to array
end
GssLegX    = roots(polynp1)+1;                              // define Gauss-Legendre integration points + bias
GssLegX    = gsort(GssLegX,'g','i')-1;                      // sort in increasing order - bias

//if scilab does not scrash or does not throw exception, it is OK
