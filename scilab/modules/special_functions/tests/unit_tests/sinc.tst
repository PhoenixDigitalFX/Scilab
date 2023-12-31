// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Charlotte Hecquet
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// unit tests for sinc() function
// =============================================================================

// Singular values
assert_checkequal(sinc(0),1);
assert_checkequal(sinc(-0),1);
assert_checktrue(isnan(sinc(%inf))==%t);
assert_checktrue(isnan(sinc(%nan))==%t);
// Vector
x=linspace(1,%pi,100);
assert_checkalmostequal(sinc(x),sin(x)./x, [], 1e-12);
assert_checkalmostequal(sinc(-x),sinc(x), [], 1e-12);
// Hypermat
x2=rand(2,2,2,2);
assert_checkalmostequal(sinc(x2),sin(x2)./x2, [], 1e-12);
// Sparse
x2=sparse(x);
assert_checkalmostequal(sinc(x2),full(sin(x2)./x2), [], 1e-12);

// Error messages
error_msg = msprintf(gettext("Wrong number of input arguments.\n"));
assert_checkerror("sinc(1,2,3)",error_msg,999);
error_msg=msprintf(gettext("%s: Wrong number of input argument(s): %d expected.\n"),"sinc", 1);
assert_checkerror("sinc()",error_msg);
error_msg = msprintf(gettext("%s: Wrong type for input argument #%d: Real or complex, sparse or full matrix or hypermatrix expected.\n"),"sinc",1);
assert_checkerror("sinc(""test"")",error_msg);
assert_checkerror("sinc(list(1,2,3))",error_msg);
assert_checkerror("sinc(abs)",error_msg);
assert_checkerror("sinc(poly(0,''s''))",error_msg);
A=[0,1;0,0];B=[1;1];C=[1,1];
S1=syslin("c",A,B,C);
assert_checkerror("sinc(S1)",error_msg);
assert_checkerror("sinc(ss2tf(S1))",error_msg);
