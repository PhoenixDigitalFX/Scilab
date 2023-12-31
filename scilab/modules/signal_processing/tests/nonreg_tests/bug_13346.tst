// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Pierre-Aime Agnel
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

//<-- CLI SHELL MODE -->
// <-- Non-regression test for bug 13346 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13346
//
// <-- Short Description -->
// Filter did not work on a simple delay

X = [1, zeros(1,9)];
delayed_X = zeros(1,10); delayed_X(3) = 1;

A = 1;
B = [0 0 1];

res = filter(B, A, X);
assert_checkalmostequal(res, delayed_X);
