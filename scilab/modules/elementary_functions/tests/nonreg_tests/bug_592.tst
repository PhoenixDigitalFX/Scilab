// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2016 - Samuel GOUGEON
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug #592 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/592
//
// <-- Short Description -->
//    linspace(a, b, n<=0) returned b instead of []. Same problem with logspage
//    function.

assert_checkequal(linspace(1, 2, 0), []);
assert_checkequal(linspace(1, 2, -3), []);
assert_checkequal(linspace([1:3]', [4:6]', 0), []);

assert_checkequal(logspace(1, 2, 0), []);
assert_checkequal(logspace(1, 2, -3), []);
assert_checkequal(logspace([1:3]', [4:6]', 0), []);
