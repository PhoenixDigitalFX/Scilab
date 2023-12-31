// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - cedric Delamarre
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 13791 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14006
//
// <-- Short Description -->
//sident gives an unclear error when running example from the doc;
//

A = [ 0.5, 0.1,-0.1, 0.2;
0.1, 0,  -0.1,-0.1;
-0.4,-0.6,-0.7,-0.1;
0.8, 0,  -0.6,-0.6];
B = [0.8;0.1;1;-1];
C = [1 2 -1 0];
SYS=syslin(0.1,A,B,C);
nsmp=100;
U=prbs_a(nsmp,nsmp/5);
Y=(flts(U,SYS)+0.3*rand(1,nsmp,"normal"));

S = 15;
N = 3;
METH=1;
[R,N1] = findR(S,Y',U',METH);

// must not returns any error
[A,C,B,D,K] = sident(METH,1,S,N,1,R);

// Wrong number of output arguments
expectedError = msprintf(gettext("%s: Wrong number of output argument(s): %d expected.\n"), "sident", 5);
assert_checkerror("[A,C,B,D,K,BadOutput] = sident(METH,1,S,N,1,R);", expectedError);
