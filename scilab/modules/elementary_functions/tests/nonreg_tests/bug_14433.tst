// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Cedric Delamarre
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 14433 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14433
//
// <-- Short Description -->
//    acoth (which call atanh) crash scilab

// default ieee is 0
x=-30:0.1:30;
x(abs(x)<=1)=%nan;
acoth(x);

ieee(2);
x=-30:0.1:30;
x(abs(x)<=1)=%nan;
acoth(x);
