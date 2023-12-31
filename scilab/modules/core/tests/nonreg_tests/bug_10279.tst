// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 10279 -->
//
// <-- CLI SHELL MODE -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10279
//
// <-- Short Description -->
// Execute a function with a comma between the last argument and the parenthese closed.

function bug_10279(a,b,c)
endfunction

assert_checkerror("bug_10279(1,2,3,)", msprintf(_("Wrong number of input arguments.\n")));
