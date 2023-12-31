//<-- CLI SHELL MODE -->
// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - INRIA - Serge Steer
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 4806 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/4806
//
// <-- Short Description -->
// If A is a sparse matrix, A^0 returns A and not the identity matrix as expected.
A=sparse(matrix(1:9,3,3));
assert_checkequal(A^0,speye(A));
