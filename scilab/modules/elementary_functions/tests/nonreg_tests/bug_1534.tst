// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) ????-2008 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 1534 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1534
//
// <-- Short Description -->
// the function nextpow2 is not compatible with the values %inf and %nan.   

n=[1 %eps %inf 3 %nan 4];

N=nextpow2(n);
if or(N(~isnan(N))<>[0 -52 %inf 2 2]) then pause,end
