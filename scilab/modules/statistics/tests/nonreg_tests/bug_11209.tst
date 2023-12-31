// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 11209 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/11209
//
// <-- Short Description -->
//     variance returned wrong results for complex arguments.
// =============================================================================
a = [1,2,3,4,5];
b = a + a*%i;
assert_checkequal(variance(a),2.5);
assert_checkalmostequal(variance(b), 5);
assert_checkfalse(variance(b) == 5*%i);
