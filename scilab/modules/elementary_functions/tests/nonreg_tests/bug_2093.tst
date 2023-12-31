// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2006-2008 - INRIA - Pierre MARECHAL <pierre.marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 2093 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/2093
//
// <-- Short Description -->
//    matrix(A,q) doesn't return a q*1 matrix when A is a 1*1*q matrix and q a scalar.
//    Instead, it returns a mlist.

A = rand(1,1,6);
B = matrix(A,6);
C = matrix(A,[6,1]);

if type(B) <> 1 then pause,end
if type(C) <> 1 then pause,end
