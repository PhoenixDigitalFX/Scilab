// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2018 - ESI Group - Adeline CARNIS
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

// <-- Non-regression test for bug 15422 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/15422
//
// <-- Short Description -->
// strsubst("ab", "", "cd") crashed Scilab

res = strsubst("ab", "", "cd");
assert_checkequal(res, "ab");

assert_checkequal(strsubst("", "", "cd"), "cd");
