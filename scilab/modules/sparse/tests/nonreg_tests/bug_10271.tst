// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->
// <-- NO CHECK REF -->
//
// <-- Non-regression test for bug 10271 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10271
//
// <-- Short Description -->
// ordmmd now checks the consistency of the third input argument with the
// input matrix defined by the two first input arguments.

A = ReadHBSparse(SCI+"/modules/umfpack/demos/ex14.rua");

[xadj, iadj, val] = sp2adj(A);
n = floor(size(A, "r")/2);

refMsg = " The provided ""n"" does not correspond to the matrix defined by xadj and iadj";
assert_checkerror("[perm, invp, nofsub] = ordmmd(xadj, iadj, n);", refMsg);
