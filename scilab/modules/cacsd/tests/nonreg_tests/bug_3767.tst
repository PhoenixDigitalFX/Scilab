//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 3767 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3767
//
// <-- Short Description -->
//   Atlas library crashs scilab with this example

A=rand(3,3);
B=rand(3,2);
C=rand(3,3);
C=C*C';
R=rand(2,2);
R=R*R'+eye();

B=B*inv(R)*B';

X=ricc(A,B,C,'disc');

if or(size(X)<>[3 3]) then pause,end