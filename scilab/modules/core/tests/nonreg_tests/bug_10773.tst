// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2015 - Scilab Enterprises - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- Non-regression test for bug 10773 -->
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/10773
//
// <-- Short Description -->
// Wrong line reported in the error message

txt = ["function bug_10773()"
        "  if %t==%t then"
        "    error(msprintf(_(""%s: Wrong value for input argument #%d: existing file(s) expected.\n""), ""ilib_mex_build"", 3));"
        "  end"
        "endfunction"
        "bug_10773()"];

mputl(txt, TMPDIR + filesep() + "bug_10773.sci");

execstr("exec(TMPDIR + filesep() + ""bug_10773.sci"",-1)", "errcatch");

[a, b, c, d] = lasterror();
assert_checkequal(a, msprintf(_("%s: Wrong value for input argument #%d: existing file(s) expected.\n"), "ilib_mex_build", 3));
assert_checkequal(b, 10000);
assert_checkequal(c, 3);
assert_checkequal(d, "bug_10773");
