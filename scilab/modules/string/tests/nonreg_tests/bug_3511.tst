// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2008 - DIGITEO - Simon LIPP <simon.lipp@scilab.org>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 3500 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/3500
//
// Short description:
// strindex cannot return all occurrences in regexp mode

[k,w]=strindex('a aa aab aaa','/aa*/','r');
assert_checkequal(k, [1 3 6 10]);
assert_checkequal(w, [1 1 1 1]);

[k,w]=strindex('a aa aab aaa',['/aa*/' '/aa/'],'r');
assert_checkequal(k, [1 3 3 6 6 10 10]);
assert_checkequal(w, [1 1 2 1 2 1 2]);
