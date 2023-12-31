//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005-2008 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 2083 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2083
//
// <-- Short Description -->
//   the function trimmean (from the statistics module) has a bug and gives 
//   wrong results. from the help ,trimmean(X,0) should return the mean of 
//   X, and trimmean(X,100) should return the median. There is an actual 
 
X = [6,7,5,2,9;
     7,2,2,2,7];
if trimmean(X,100)<>median(X) then pause,end

if trimmean(X,0)<>mean(X) then pause,end

