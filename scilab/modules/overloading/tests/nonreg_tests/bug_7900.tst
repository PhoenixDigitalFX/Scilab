//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 7900 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7900
//
// <-- Short Description -->
// inserting a rational in a rational hymermatrix may generate invalid rationals entries (with zero denominators)

H(1,1,2)=1/%s;
H(2,1,2)=1/%s;
if or(H.den(:)==0) then pause,end
