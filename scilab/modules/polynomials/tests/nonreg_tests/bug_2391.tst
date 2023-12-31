// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 2391 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2391
//
// <-- Short Description -->
//     pol2str produces empty output (instead of '0') for null polynomials

p = poly([0,10,1+%i,1-%i],"x");
if stripblanks(pol2str(p))<>"-20*x+22*x^2-12*x^3+x^4" then pause,end
if pol2str(0*p)<>"0" then pause,end
