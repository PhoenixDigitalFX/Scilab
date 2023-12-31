// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2010 - DIGITEO - Allan CORNET
// Copyright (C) 2014 - Scilab Enterprises - Anais AUBERT
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 7231 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/7231
//
// <-- Short Description -->
// mtlb_num2str did not manage second input argument

assert_checkequal(execstr("mtlb_num2str(2, ""%11.4f"")", "errcatch"), 0);
assert_checkequal(execstr("mtlb_num2str(2, ""%11.4f"", 3)", "errcatch"), 999);
assert_checkequal(execstr("mtlb_num2str(2, ""blabla"")", "errcatch"), 0);

if mtlb_num2str(2, "%11.4f") <> "     2.0000" then pause, end
if mtlb_num2str(2) <> "2" then pause, end
