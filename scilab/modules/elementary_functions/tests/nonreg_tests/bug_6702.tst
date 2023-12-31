// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 6702 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6702
//
// <-- Short Description -->
//    When we compute the maximum of the last column of an hypermatrix, the
//    [m,k]=max() and [m,k] = min() syntax return a vector in k, instead of a scalar.
// =============================================================================

A = ones(9,9,9);
[m, k] = max(A(1,1,:));
assert_checkequal(k, 1);

[m, k] = min(A(1,1,:));
assert_checkequal(k, 1);

A(1,1,5) = 7;
[m,k] = max(A(1,1,:));
assert_checkequal(k, 5);

A(1,1,8) = -1;
[m,k] = min(A(1,1,:));
assert_checkequal(k, 8);

M = matrix(1:24, [2 3 2 2]);
[m k] = max(M(1,1,:));
assert_checkequal(k, 4);

[m k] = max(M(1,1,1,:));
assert_checkequal(k, 2);

M = matrix(1:24, [2 3 2 2]);
[m k] = min(M(1,1,:));
assert_checkequal(k, 1);

[m k] = min(M(1,1,1,:));
assert_checkequal(k, 1);
