// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Charlotte HECQUET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 6466 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/6466
//
// <-- Short Description -->
//  Example with vectorized input added in help pages of mprintf and msprintf

assert_checkequal(msprintf('%e ', [1;2;3]), ["1.000000e+00 2.000000e+00 3.000000e+00 "]);
assert_checkequal(msprintf('%d %d\n', [1, 2; 3, 4]), ["1 2"; "3 4"]);
