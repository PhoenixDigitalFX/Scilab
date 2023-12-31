// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005-2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 1084 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/1084
//
// <-- Short Description -->
//    Problem with resetting seed for rand 'normal' 
//    distribution.  As you can see from the attached code, I'm 
//    resetting the seed and generating a rand 'normal' 
//    distribution, however I only get the same results every 
//    other time.  This should produce the same results every 
//    time.  Note that the 'uniform' distribution does generate 
//    the same results every time.

rand('seed',0);
A = rand(1,3,'normal');
rand('seed',0);
B = rand(1,3,'normal');
rand('seed',0);
rand('seed',0);
C = rand(1,3,'normal');

if or(A<>B) then pause,end
if or(B<>C) then pause,end
if or(A<>C) then pause,end
