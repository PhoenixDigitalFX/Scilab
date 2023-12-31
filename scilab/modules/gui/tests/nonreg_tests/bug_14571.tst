// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Scilab Enterprises - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- TEST WITH GRAPHIC -->

// <-- Non-regression test for bug 14571 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14571
//
// <-- Short Description -->
// The type of input parameters of figure function was not checked.

str = "figure(%t)";
assert_checkfalse(execstr(str, "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: An integer value expected.\n"), "figure", 1);
assert_checkerror(str, refMsg);

str = "figure(%s)";
assert_checkfalse(execstr(str, "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: An integer value expected.\n"), "figure", 1);
assert_checkerror(str, refMsg);

str = "figure(scf())";
assert_checkfalse(execstr(str, "errcatch") == 0);
refMsg = msprintf(_("%s: Wrong type for input argument #%d: An integer value expected.\n"), "figure", 1);
assert_checkerror(str, refMsg);
