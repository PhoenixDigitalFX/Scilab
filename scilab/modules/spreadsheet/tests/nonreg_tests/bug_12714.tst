// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2014 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 12714 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/12714
//
// <-- Short Description -->
// csvDefault("decimal", ",") returned %f.

assert_checktrue(csvDefault("decimal", ","));
expected = ",";
res = csvDefault("decimal");
assert_checkequal(res, expected);

assert_checktrue(csvDefault("decimal", "."));
expected = ".";
res = csvDefault("decimal");
assert_checkequal(res, expected);

assert_checkfalse(csvDefault("decimal", "/"));
