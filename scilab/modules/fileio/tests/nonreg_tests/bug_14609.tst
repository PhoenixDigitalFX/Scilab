// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2017 - Scilab Enterprises - Cedric Delamarre
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//
// <-- Non-regression test for bug 14609 -->
//
// <-- GitLab URL -->
// https://gitlab.com/scilab/scilab/-/issues/14609
//
// <-- Short Description -->
// "msscanf" crashes Scilab when 'niter' parameter is out of range

str = "D=msscanf(5,[""Alain 19"";""Pierre 15"";""Tom 12""],""%s %d"")";
assert_checkfalse(execstr(str   ,"errcatch") == 0);
refMsg = msprintf(_("%s: An error occurred: Not enough entries.\n"), "msscanf");
assert_checkerror(str, refMsg);
