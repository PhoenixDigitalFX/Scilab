// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2017 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 14278 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14278
//
// <-- Short Description -->
// ltitr returned an incorrect xf output value.
//

A=eye(2,2);B=[1;1];
x0=[-1;-2];
u=[1,2,3,4,5];
[xf,x]=ltitr(A,B,u,x0);
assert_checkequal(xf, [14;13]);
