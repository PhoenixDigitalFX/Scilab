// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 13111 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/13111
//
// <-- Short Description -->
// sqrt returned different results when imaginary part was -0 versus 0.

assert_checkequal(sqrt(-4-0*%i), 2*%i);
assert_checkequal(sqrt(-4-0*%i), sqrt(-4+0*%i));

assert_checkequal(sqrt(-%inf-0*%i), complex(0, %inf));
assert_checkequal(sqrt(-%inf-0*%i), sqrt(-%inf+0*%i));
