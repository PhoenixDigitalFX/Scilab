// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Yann COLLETTE <yann.collette@scilab.org>
// Copyright (C) 2012 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 6827 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6827
//
// <-- Short Description -->
// the function spchol was returning a wrong error message if X is complex

X=[3.,  0.,  0.,  2.,  0.,  0.,  2.,  0.,  2.,  0.,  0. ; ...
0.,  5.,  4.,  0.,  0.,  0.,  0.,  0.,  0.,  0.,  0. ; ...
0.,  4.,  5.,  0.,  0.,  0.,  0.,  0.,  0.,  0.,  0. ; ...
2.,  0.,  0.,  3.,  0.,  0.,  2.,  0.,  2.,  0.,  0. ; ...
0.,  0.,  0.,  0. , 5.,  0.,  0.,  0.,  0.,  0.,  4. ; ...
0.,  0.,  0.,  0.,  0.,  4.,  0.,  3.,  0.,  3.,  0. ; ...
2.,  0.,  0.,  2.,  0.,  0.,  3.,  0.,  2.,  0.,  0. ; ...
0.,  0.,  0.,  0.,  0.,  3.,  0.,  4.,  0.,  3.,  0. ; ...
2.,  0.,  0.,  2.,  0.,  0.,  2.,  0.,  3.,  0.,  0. ; ...
0.,  0.,  0.,  0.,  0.,  3.,  0.,  3.,  0.,  4.,  0. ; ...
0.,  0.,  0.,  0.,  4.,  0.,  0.,  0.,  0.,  0.,  5.];

X(1,1) = X(1,1) + %i;
X      = sparse(X);

msgerr = msprintf(gettext("%s: Wrong type for argument #%d: Real matrix expected.\n"), "spchol", 1);
assert_checkerror("[R,P] = spchol(X);", msgerr);

