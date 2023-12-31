//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- Non-regression test for bug 3311 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3311
//
// <-- Short Description -->
// Loop with a "for" over a vector of complex polynomials.
computed=0;
p1=1.+2.*%i+3*%s;
p2=4.+5.*%i+6*%s;
myvector=[p1 p2];
for p=myvector
  computed=computed+p;
end
expected=5.+7*%i+9*%s;
if computed<>expected then pause,end

