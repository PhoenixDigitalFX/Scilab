// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 7206 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7206
//
// <-- Short Description -->
//     If h is an hypermat, meanf(h,h) returned an error
// =============================================================================
v = matrix( [0.56 0.48 0.33 0.59 0.50 0.44 0.27 0.63], [2 2 2]);
expected = 0.5037895;
assert_checkalmostequal(meanf(v, v), expected, 1d-7);

expected = matrix( [0.5230769 0.4967391 0.4719149 0.522], [1 2 2]);
assert_checkalmostequal(meanf(v, v, 1), expected, 1d-7);
assert_checkalmostequal(meanf(v, v, "r"), expected, 1d-7);

expected = matrix( [0.4747191 0.5406542 0.4193506 0.5518692], [2 1 2]);
assert_checkalmostequal(meanf(v, v, 2), expected, 1d-6);
assert_checkalmostequal(meanf(v, v, "c"), expected, 1d-6);
